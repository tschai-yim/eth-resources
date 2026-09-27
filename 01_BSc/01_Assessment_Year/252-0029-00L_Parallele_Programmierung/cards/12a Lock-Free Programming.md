## Warum besteht in sicherheitskritischen Systemen (z.B. **ABS-Bremsen**, Flugzeuge, **Tesla**) ein striktes **Lock-Verbot**?

- **Blocking Semantics**: Ein Thread-Tod im Lock führt zum kompletten Systemstillstand (**Resilienz Null**).
- **Interrupt-Handler**: Die Nutzung von Locks ist hier strikt verboten (führt zu einem sofortigen **Deadlock**).
- **Priority Inversion**: Lock-induzierte Ausfälle sind möglich (bekanntes Beispiel: Absturz des **Mars Rovers**).

## Warum ist die OS-Abhängigkeit bei der Nutzung von Standard-Locks (z.B. `wait()`) problematisch?

- OS-Funktionen nutzen intern oft **eigene Locks** ("Turtles all the way down").
- Die API-Dokumentation des Betriebssystems muss zwingend geprüft werden, um versteckte Blockaden zu vermeiden.

## Welche drei primären **Performance-Probleme** entstehen durch die Nutzung von **Locks**?

- **Spinlocks**: Massive Ressourcenverschwendung (erzeugt hohe CPU-Last, blockiert Energiesparmodus) und besitzen keine **FIFO-Fairness**.
- **Scheduled Locks**: Erzeugen eine hohe Aufwach-Latenz (ein Context Switch kostet ca. \( 5-6 \) Mikrosekunden).
- **Amdahl's Law Limitation**: Erzeugen einen fixen Flaschenhals (z.B. \( 20\% \) Lock-Zeit limitiert den Speedup auf max. \( 5x \), unabhängig von der Hardware).

## Wie funktioniert **Competitive Spinning** zur Lösung von Aufwach-Latenzen bei Locks?

- Es ist ein **hybrides Modell**.
- Nutzt zuerst einen sehr kurzen **Spinlock**.
- Wechselt erst danach in den **OS-Schlafmodus** (via `rescheduling`).

## Wie sind **Deadlock**, **Livelock** und **Starvation** im Kontext der **blockierenden Synchronisation** definiert?

- **Deadlock**: \( \ge 2 \) Prozesse blockieren sich gegenseitig endlos.
- **Livelock**: Es findet eine ständige Zustandsänderung statt, aber **ohne echten Fortschritt**.
- **Starvation**: Ein einzelner Prozess verhungert beim Zugriff auf eine Ressource (Unfairness).

## Was ist die zwingende Grundregel für **nicht-blockierende Algorithmen** (Non-Blocking)?

- Ein Thread-Ausfall oder eine Pause darf **niemals** das gesamte System oder andere Threads blockieren.

## Was garantiert ein **Lock-free** Algorithmus und welche Probleme werden (nicht) ausgeschlossen?

- Mindestens **ein** Thread im System macht zwingend Fortschritt.
- Garantiert **Deadlock-Freiheit** (deadlock-free).
- Schliesst **Starvation** (Verhungern einzelner Threads) **nicht** aus.

## Was garantiert ein **Wait-free** Algorithmus und wie unterscheidet er sich von Lock-free?

- **Alle** Threads machen nach einer limitierten Schrittzahl garantiert Fortschritt.
- Impliziert immer **Lock-freedom**.
- Schliesst sowohl **Deadlocks** als auch **Starvation** garantiert aus.
- Ist **echtzeitfähig**, aber in der Praxis extrem komplex zu implementieren.

## Was ist **Compare-And-Swap (CAS)** und welche Liveness-Eigenschaft besitzt es auf moderner Hardware?

- Eine **atomare CPU-Operation**.
- Vergleicht eine Zieladresse mit einem Erwartungswert und überschreibt diese **nur bei Übereinstimmung**.
- Auf moderner Hardware ist CAS echt **wait-free**.

## Was ist das **ABA-Problem** beim Compare-And-Swap (CAS)?

- Ein **Trugschluss der CAS-Exklusivität**.
- Ein erfolgreiches CAS garantiert **nicht**, dass zwischenzeitlich nicht doch geschrieben wurde.
- Wenn ein Wert von A nach B und wieder zurück auf A geändert wird, bleibt dieser Austausch für das CAS **unbemerkt**.

## Welches Performance-Problem hat **Compare-And-Swap (CAS)** unter hoher Last (Contention) und wie wird es gelöst?

- **Problem**: Es wird oft massiv langsamer als herkömmliche Locks, da parallele Fehlschläge zu ständigen Neustarts in **Endlosschleifen** führen.
- **Lösung**: Nutzung von **Exponential Backoff** (ansteigende Pausen bei Fehlschlägen), was Lock-Free Code unter Last erst performant macht.

## Aus welchen vier mechanischen Schritten besteht der Hinzufügen-Vorgang (`push`) in einem **Lock-Free Stack**?

- Nutzt `AtomicReference<Node> top`.
1. Aktuellen Zustand merken (`head = top.get()`).
2. Zustand **lokal vorbereiten** (neuen Knoten lokal an `head` hängen).
3. **Atomares Update** der Referenz via CAS durchführen.
4. Bei Fehlschlag: Neustart des Prozesses in einer `do-while`-Schleife.

```java
public void push(Long item) {
    Node newi = new Node(item);
    Node head;
    do {
        head = top.get();
        newi.next = head; // Lokal vorbereiten
    } while (!top.compareAndSet(head, newi)); // Atomares Update
}
```

## Welches Problem entsteht beim ungeschützten Löschen in naiven **CAS-Listen**?

- Das gleichzeitige Löschen von **benachbarten Knoten** durch verschiedene Threads führt zu einem **lautlosen Elementverlust**.

## Wie löst Java in Lock-Free Listen das Fehlen eines Hardware-DCAS (Double-CAS) für das Mark-Bit?

- Nutzt die Klasse **`AtomicMarkableReference`** und einen **Bit-Klau Hack**.
- Ein 64-Bit Pointer nutzt real nur 48 Bit physischen Speicher.
- Die freien Bits werden als **Mark-Bit** missbraucht.
- Dadurch können die Speicherreferenz und das Flag in einem **einzigen atomaren 64-Bit CAS** aktualisiert werden.

## Aus welchen zwei zwingenden Schritten besteht der Löschvorgang (`remove`) in einem **Lock-Free List-Based Set**?

1. **Logical Delete**: Setzen des Mark-Bits auf dem Next-Pointer des Zielknotens.
2. **Physical Delete**: Den Pointer des Vorgängers atomar via CAS umhängen, um den Zielknoten aus der Liste zu entfernen.

```java
public boolean remove(T item) {
    while (true) {
        Window window = find(key);
        if (curr.key != key) return false;
        Node succ = curr.next.getReference();
        
        // 1. Logical Delete (Mark Bit setzen)
        boolean snip = curr.next.attemptMark(succ, true);
        if (!snip) continue; // Bei Konflikt Neustart
        
        // 2. Physical Delete (Vorgänger umhängen)
        pred.next.compareAndSet(curr, succ, false, false);
        return true;
    }
}
```

## Was ist das **Helper-Prinzip ("Helping")** in Lock-Free Datenstrukturen und welcher Vorteil entsteht?

- Ein iterierender Thread, der auf einen **logisch gelöschten** Knoten trifft (Mark-Bit gesetzt), löscht diesen **sofort physisch**.
- **Vorteil**: Repariert Inkonsistenzen sofort; niemand muss auf andere Threads warten.
    - *(Praxis-Tipp: Probabilistisches Helfen, z.B. bei \( 50\% \) der Konflikte, verhindert Datenstau).*

```java
public Window find(int key) {
    // Iteriert durch Liste. Falls Knoten mit Mark-Bit gefunden wird:
    // HILFT SOFORT (Physical Delete durchführen):
    pred.next.compareAndSet(curr, succ, false, false);
    // ...
}
```

## Wie funktioniert die `contains()`-Methode in einem **Lock-Free List-Based Set** und welche Eigenschaft hat sie?

- Iteriert komplett **sequenziell** (ohne jegliches Lock oder CAS).
- Prüft beim Zielknoten lediglich auf ein fehlendes Mark-Bit.
- Ist dadurch algorithmisch **wait-free**.

## Warum ist der Einsatz von **Lock-Free Algorithmen** im OS-Kernel besonders stark motiviert?

- Das OS agiert als **Ressourcen-Scheduler** (verarbeitet ständig Zustandswechsel wie `run`, `ready`, `wait`).
- Es gilt das **KISS-Prinzip**: Kernel-Code muss zwingend simpel und robust sein.
- Alte globale Locks verursachten massive Skalierungsprobleme.

## Welches strukturelle Problem haben simple **Lock-Free Queues** bei einer leeren Schlange und wie wird es gelöst?

- **Problem**: Bei einer leeren Queue zeigen `head` (Dequeue) und `tail` (Enqueue) auf dasselbe Element (überlappen). Ein ungestörtes Simultan-Update ist unmöglich.
- **Lösung**: Einsatz eines **Sentinel-Knotens** (persistenter Dummy-Knoten) an der Front.
- **Resultat**: `head` und `tail` sind nie `null`, die Operationen sind komplett entkoppelt.

## Wie funktioniert der Enqueue-Vorgang und das **Helping** bei einer **Lock-Free Unbounded Queue**?

- **Ablauf**: Berechnet den Knoten lokal und nutzt CAS auf `last.next`.
- **Gefahr**: Ein Thread stürzt ab, nachdem `last.next` erfolgreich war, aber **bevor** er das globale `tail` updaten konnte.
- **Helping**: Ein nachfolgender Thread bemerkt das unfertige Anhängsel (`next != null`) und schiebt das globale `tail` vorwärts, bevor er selbst weiterarbeitet.

```java
public void enqueue(T item) {
    Node node = new Node(item);
    while (true) {
        Node last = tail.get();
        Node next = last.next.get();
        if (next == null) {
            // Versuche an letztes Element anzuhängen
            if (last.next.compareAndSet(null, node)) {
                tail.compareAndSet(last, node); // Tail updaten
                return;
            }
        } else {
            // Helping: Jemand war langsamer, schiebe Tail vorwärts
            tail.compareAndSet(last, next);
        }
    }
}
```

## Wie funktioniert der Dequeue-Vorgang (Entnehmen) in einer **Lock-Free Unbounded Queue** bezüglich des **Sentinel-Knotens**?

- Liest den echten Wert **nach** dem Sentinel aus.
- Rückt den `head` via CAS vor.
- Der **entnommene Knoten** wird dadurch zum **neuen Sentinel**.
- Der alte Sentinel wird vom Garbage Collector entsorgt.

```java
public T dequeue() {
    while (true) {
        Node first = head.get(); // Sentinel
        Node last = tail.get();
        Node next = first.next.get(); // Echtes Element
        
        if (first == last) {
            if (next == null) return null; // Queue echt leer
            tail.compareAndSet(last, next); // Helping: Tail hing zurück
        } else {
            T value = next.item;
            // Sentinel entfernen, next wird neuer Sentinel
            if (head.compareAndSet(first, next)) return value;
        }
    }
}
```
