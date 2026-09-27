## Wofür wird das **Producer-Consumer Pattern** primär genutzt und wie behandelt es die **Synchronisation von Datenelementen**?

- Es ist ein fundamentales Design-Pattern, das oft in **Pipelines** oder **Data-Flow**-Programmen genutzt wird.
- Erlaubt Verzweigungen durch **Multiple Producers and Consumers**.
- **Synchronisation des Datenelements**: Ist nicht nötig (ein Element ist immer strikt bei maximal einem Thread).
- Nur der Übergabemechanismus (**Queue**) muss zwingend geschützt werden.

## Wie ist ein **Bounded FIFO** (Circular Buffer) aufgebaut und wie funktioniert die **Wrap around semantics**?

- Implementiert als **Array mit fixer Grösse**.
- Nutzt Indizes für die Logik:
    - **`in`**: Nächster freier Platz.
    - **`out`**: Ältestes Element.
- Die **Wrap around semantics** (Ringschluss) erfolgt via Modulo-Rechnung:
    - \\(next(i) = (i + 1) \pmod{size}\\)

## Was ist das **Voll/Leer-Problem** bei einem Bounded FIFO und wie wird es klassischerweise gelöst?

- **Problem**: Ein naives Array kann eine volle und leere Queue nicht unterscheiden (bei beiden gilt `in == out`).
- **Lösung**: Ein Array-Element wird **absichtlich leer gelassen** (verschwendet).
    - **Queue leer**: `in == out`
    - **Queue voll**: \\((in + 1) \pmod{size} == out\\)

## Warum führt eine Bounded Queue Implementierung mit **`synchronized` und Busy-Waiting** (z.B. `while(isFull());`) zu einem Systemfehler?

- Führt zwingend zu einem **Deadlock**.
- Der Consumer blockiert permanent, da der Producer das Lock während der endlosen `while`-Schleife niemals freigibt.
- **Regel**: Niemals mit einem gehaltenen Lock "schlafen" oder endlos warten.

```java
public synchronized void enqueue(long item) {
    while (isFull()) ; // wait (Deadlock!)
    doEnqueue(item);
}
```

## Welche Nachteile hat eine Bounded Queue Implementierung, die auf **`Thread.sleep(timeout)` (ohne Lock)** basiert?

- **Ineffizient**: Das sinnlose Schlafen verschwendet CPU-Zeit.
- Ein unpassendes Timeout birgt die grosse Gefahr eines **Live-Locks**.

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

## Wie wird eine Bounded Queue mit **Semaphoren** implementiert und warum ist die **Aufruf-Reihenfolge** essenziell?

- Nutzt drei Semaphoren:
    - `manipulation` (**Mutex**).
    - `nonEmpty` (zählt Elemente).
    - `nonFull` (zählt freie Plätze).
- **Reihenfolge extrem wichtig**: Zuerst die Zähl-Semaphore anfordern, **danach** den Mutex.
- Eine falsche Reihenfolge (erst Mutex, dann Zähler) bricht die Symmetrie nicht und führt unweigerlich zum **Deadlock**.
- **Nachteil**: Der Ansatz ist unstrukturiert und erfordert extreme Disziplin beim Programmieren.

```java
void enqueue(long x) {
    try {
        nonFull.acquire();       // 1. Zähler anfordern
        manipulation.acquire();  // 2. Mutex anfordern
        // ... Queue-Logik (z.B. array[in] = x) ...
    } finally {
        manipulation.release();
        nonEmpty.release();
    }
}
```

## Welches Performance-Problem entsteht bei **Standard-Locks** bezüglich des Signalierens in Warteschlangen?

- Es wird **immer** ein Signal gesendet, auch wenn aktuell gar keine Threads auf ein Signal warten.
- Dieses ständige OS-Aufwecken erzeugt einen massiven **System-Overhead** und macht das System sehr langsam.

## Wie löst die **Sleeping Barber Variante** (nach Dijkstra) das Performance-Problem von Standard-Locks in einer Queue?

- Nutzt zusätzliche **Zähler für wartende Threads** (z.B. \\(m\\) für Producer, \\(n\\) für Consumer).
- **Bedarfsgerechtes Signal**: `signal()` wird nur aufgerufen, wenn der Zähler \\(\le 0\\) ist (es wartet effektiv jemand).
- Erlaubt **100% Kapazitätsnutzung** (kein verschwendetes Array-Element nötig, da die Zähler das Voll/Leer-Problem lösen).
- Der Variablen-Zugriff ist sicher, da er strikt innerhalb der gelockten Region stattfindet.

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

## Was ist ein **Monitor** in der Nebenläufigkeit und wie ist dieses Konzept in **Java** integriert?

- Eine abstrakte Datenstruktur mit eingebautem **Mutual Exclusion** (Hoare & Brinch Hansen).
- **Funktion**: Erlaubt das temporäre Aufgeben des Locks beim Warten auf eine definierte Bedingung.
- **Java-Integration**: **Jedes Objekt** ist implizit ein Monitor (nutzbar via `synchronized`, `wait()`, `notifyAll()`).
- **Limitierung in Java**: Bietet nur **ein implizites Lock** pro Objekt (strikt blockgebunden und dadurch unflexibel).

## Wie funktioniert das explizite **`Lock` Interface** (z.B. `ReentrantLock`) in Java und welche **Sicherheitspflicht** besteht bei der Nutzung?

- Das Lock muss explizit angefordert werden (z.B. `lock.lock()`).
- **Absolute Pflicht**: Die Freigabe (`lock.unlock()`) muss **immer** manuell in einem **`finally`-Block** erfolgen, um permanente Blockaden bei auftretenden Exceptions sicher zu verhindern.

## Wozu dient das **`Condition` Interface** in Java und welche Vorteile bietet es gegenüber klassischen Monitoren?

- Wird aus einem bestehenden Lock erzeugt (`lock.newCondition()`).
- Erlaubt **mehrere, fein-granulare Wartebedingungen** für dasselbe Lock (z.B. getrennt für Producer und Consumer).
- Nutzt **`await()`** (gibt Lock implizit ab und wartet) und **`signal()` / `signalAll()`** zum Wecken.
- **Vorteil**: Spezifische Conditions (z.B. `notEmpty`) erlauben ein simples `.signal()`, das garantiert den exakt richtigen Thread-Typ weckt.

## Welche vier **Guidelines für Nebenläufigkeit** (spezifisch für Conditions und Warten) sollten in der Praxis zwingend befolgt werden?

- **Guideline 1**: Immer ein **Condition-Prädikat** (Zustandsprüfung, z.B. `isFull()`) verwenden.
- **Guideline 2**: Das Prädikat **vor und nach** dem Warten testen.
- **Guideline 3**: `wait()` oder `await()` **zwingend in einer `while`-Schleife** aufrufen (Schutz vor *Spurious Wakeups*).
- **Guideline 4**: Der geprüfte Zustand muss zwingend durch ein entsprechendes Lock **geschützt** sein.
