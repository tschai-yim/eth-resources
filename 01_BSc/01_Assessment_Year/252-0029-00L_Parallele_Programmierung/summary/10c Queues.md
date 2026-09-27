## Producer-Consumer Pattern & Bounded Queues

- **Producer-Consumer Pattern**: Fundamentales Design-Pattern für parallele Programmierung.
    - Häufig in **Pipelines** oder **Data-Flow**-Programmen genutzt.
    - Unterstützt **Multiple Producers and Consumers** (Verzweigungen).
    - **Synchronisation des Datenelements**: Nicht nötig (Element immer strikt bei max. einem Thread). Nur Übergabemechanismus (Queue) zwingend schützen.
- **Bounded FIFO (Circular Buffer)**:
    - Implementierung als Array mit fixer Grösse.
    - Logik via Indizes: `in` (nächster freier Platz), `out` (ältestes Element).
    - **Wrap around semantics**: Via Modulo-Rechnung: $next(i) = (i + 1) \pmod{size}$.
- **Das Voll/Leer-Problem**:
    - Naiver Ansatz: Volle und leere Queue ununterscheidbar (beide `in == out`).
    - **Lösung**: Ein Array-Element **absichtlich leer lassen** (verschwenden).
        - **Queue leer**: `in == out`.
        - **Queue voll**: $(in + 1) \pmod{size} == out$.

## Warteschlangen-Implementierung (Probleme & Semaphoren)

- **Ansatz 1: `synchronized` mit Busy-Waiting**:
    - Führt zwingend zum **Deadlock**.
    - **Regel**: Niemals mit gehaltenem Lock "schlafen" oder endlos warten (Consumer blockiert permanent).

    ```java
    public synchronized void enqueue(long item) {
        while (isFull()) ; // wait (Deadlock!)
        doEnqueue(item);
    }
    ```

- **Ansatz 2: `Thread.sleep(timeout)` (ohne Lock)**:
    - **Ineffizient**: Sinnloses Schlafen verschwendet Zeit, unpassendes Timeout birgt **Live-Lock-Gefahr**.

    ```java
    public void enqueue(long item) throws InterruptedException {
        while (true) {
            synchronized(this) {
                if (!isFull()) {
                    doEnqueue(item); 
                    return;
                }
            }
            Thread.sleep(timeout); // sleep without lock
        }
    }
    ```

- **Ansatz 3: Semaphoren**:
    - Drei Semaphoren: `manipulation` (Mutex), `nonEmpty` (zählt Elemente), `nonFull` (zählt freie Plätze).
    - **Reihenfolge extrem wichtig**: Zuerst Zähl-Semaphore (`nonFull`), **danach** Mutex (`manipulation`).
    - Falsche Reihenfolge (erst Mutex, dann Zähler) bricht Symmetrie nicht $\rightarrow$ **Deadlock**.
    - **Nachteil**: Unstrukturiert, erfordert extreme Disziplin beim Programmieren.

    ```java
    void enqueue(long x) {
        try {
            nonFull.acquire();       // 1. Zähler anfordern
            manipulation.acquire();  // 2. Mutex anfordern
            // ... Queue-Logik (z z.B. array[in] = x) ...
        } finally {
            manipulation.release();
            nonEmpty.release();
        }
    }
    ```

## Sleeping Barber Variante (Optimierung)

- **Problem der Standard-Locks**: **Immer** Signal gesendet, auch ohne wartende Threads. Ständiges OS-Aufwecken erzeugt massiven **System-Overhead** (sehr langsam).
- **Lösung (Sleeping Barber nach Dijkstra)**:
    - Zusätzliche Zähler für wartende Threads ($m$ für Producer, $n$ für Consumer).
    - **Bedarfsgerechtes Signal**: `signal()` nur bei Zähler $\le 0$ (jemand wartet effektiv).
    - **Kein verschwendetes Array-Element**: Kapazität zu 100% nutzbar (Zähler lösen Voll/Leer-Problem).
    - **Sicherheit**: Zugriff auf drei Variablen sicher (strikt innerhalb gelockter Region).

    ```java
    void enqueue(long x) {
        lock.lock();
        m--; // m: Logische freie Plätze / wartende Producer
        if (m < 0) {
            while (isFull())
                try { notFull.await(); } catch(InterruptedException e){}
        }
        doEnqueue(x);
        n++; // n: Logische Elemente / wartende Consumer
        if (n <= 0) notEmpty.signal(); // Signal nur bei wartenden Consumern
        lock.unlock();
    }
    ```

## Java Monitore, Locks und Conditions

- **Monitor**: Abstrakte Datenstruktur mit eingebautem **Mutual Exclusion** (Hoare & Brinch Hansen).
    - **Funktion**: Temporäres Aufgeben des Locks bei Warten auf Bedingung.
    - **In Java**: **Jedes Objekt** ist implizit ein Monitor (nutzbar via `synchronized`, `wait()`, `notifyAll()`).
    - **Limitierungen von `synchronized`**: Nur ein implizites Lock pro Objekt, strikt blockgebunden, unflexibel.
- **`Lock` Interface** (z.B. `ReentrantLock`):
    - Explizites Anfordern (`lock.lock()`).
    - **Absolute Pflicht**: Lock-Freigabe **immer** im `finally`-Block manuell (`lock.unlock()`).
- **`Condition` Interface**:
    - Erzeugung aus Lock (`lock.newCondition()`).
    - Erlaubt **mehrere, fein-granulare Wartebedingungen** pro Lock (z.B. je eine für Producer/Consumer).
    - **`await()`**: Analog zu `wait()`. Gibt Lock **implizit ab** und wartet.
    - **`signal()` / `signalAll()`**: Analog zu `notify()`.
    - **Vorteil**: Spezifische Conditions (z.B. `notEmpty`) erlauben simples `.signal()` (weckt garantiert den richtigen Thread-Typ).
- **Guidelines für Nebenläufigkeit & Praxis**:
    - **Guideline 1**: Immer ein **Condition-Prädikat** (Zustandsprüfung, z.B. `isFull()`) verwenden.
    - **Guideline 2**: Prädikat **vor und nach** dem Warten testen.
    - **Guideline 3**: `wait()` oder `await()` **zwingend in einer `while`-Schleife** aufrufen (schützt u.a. vor *Spurious Wakeups*).
    - **Guideline 4**: Geprüfter Zustand zwingend durch entsprechendes Lock geschützt.
