## Warum motiviert der Einsatzfall von Systemen wie Wikipedia die Nutzung von **Reader/Writer Locks** gegenüber normalen Locks?

- Herkömmliche Locks blockieren **gleichzeitiges Lesen** (sind unnötig konservativ).
- **Multiple concurrent reads** (gleichzeitiges Lesen) auf denselben Speicherplatz sind unproblematisch.
- Systeme wie Wikipedia sind extrem lese-lastig (z.B. \\( 0.12\% \\) Write-Rate).
- Ein **einziges globales Lock** würde solche Systeme komplett lahmlegen.

## Welche drei **Zustände** kann ein **Reader/Writer Lock** annehmen?

- **Not held** (nicht gehalten).
- **Held for writing** (Schreib-Lock): Exklusiv durch **maximal \\( 1 \\)** Thread gehalten.
- **Held for reading** (Lese-Lock): Geteilt durch **\\( \ge 1 \\)** Threads.

## Wie lautet die mathematische **Invariante** eines Reader/Writer Locks?

- \\( writers \cdot readers == 0 \\)

## Unter welchen Bedingungen blockieren die Operationen **`acquire_read`** und **`acquire_write`** bei einem Reader/Writer Lock?

- **`acquire_read`**:
    - Blockiert bei einem aktiven **Schreib-Lock**.
    - Sonst: Gewährt Lese-Lock und inkrementiert den Reader-Zähler.
- **`acquire_write`**:
    - Blockiert bei einem aktiven **Lese- oder Schreib-Lock**.
    - Sonst: Gewährt Schreib-Lock und inkrementiert den Writer-Zähler.

## Was bewirken die Freigabe-Operationen **`release_read`** und **`release_write`** bei einem Reader/Writer Lock?

- **`release_read`**:
    - Dekrementiert den Reader-Zähler.
    - Bei Erreichen von \\( 0 \rightarrow \\) Zustand wechselt zu **Not held**.
- **`release_write`**:
    - Gibt das Schreib-Lock frei \\( \rightarrow \\) Zustand wechselt sofort zu **Not held**.

## Warum führt eine einfache Implementierung eines Reader/Writer Locks (Implizite Reader Priority) zur **Starvation** (Verhungern) von Schreibern?

- Normales Standard-Verhalten begünstigt Leser implizit.
- Leser achten nur auf **aktive** Schreiber, nicht aber auf wartende.
- Neue Leser können den Leseprozess dadurch **endlos verlängern**, während Schreiber blockiert bleiben.

## Wie funktioniert die **Writer Priority** bei Reader/Writer Locks und welches Risiko birgt sie?

- Leser blockieren sofort, sobald ein Schreiber **Interesse anmeldet** (z.B. via Variable `writersWaiting`).
- Ist in der Praxis oft die bevorzugte Variante (da es meist viel weniger Schreiber gibt).
- **Gefahr**: Leser können verhungern (**Starvation**).

## Wie verhindert das **Fairness-Modell (FIFO-Fairness)** die Starvation bei Reader/Writer Locks?

- Nutzt begrenzte **Kontingente**, um Starvation auf beiden Seiten zu verhindern.
- **Schreiber-Ende**: Setzt als Snapshot eine fixe Nummer \\( k \\) der aktuell wartenden Leser.
- Diese \\( k \\) Leser dürfen noch passieren.
- Der nächste anfragende Schreiber muss auf **genau diese \\( k \\) Leser warten** (baut das Kontingent ab).

## Warum muss bei einer Monitor-basierten Implementierung von Reader/Writer Locks zwingend **`notifyAll()`** statt `notify()` genutzt werden?

- Verhindert **Deadlocks** durch das versehentliche Aufwecken eines falschen Thread-Typs.
- *Beispiel*: Ein abtretender Leser weckt per `notify()` nur einen weiteren Leser auf, obwohl das System eigentlich auf einen wartenden Schreiber wechseln sollte.

## Warum ist das native Java **`synchronized`** für das Reader/Writer-Problem ungeeignet?

- Es agiert immer als **strikt exklusives Schreib-Lock**.
- Es unterstützt **kein paralleles Lesen**.

## Welche Klasse der Standardbibliothek sollte in Java für Reader/Writer Locks genutzt werden und was bedeutet **Re-entrant**?

- **Klasse**: **`java.util.concurrent.locks.ReentrantReadWriteLock`**.
- **Re-entrant** (Rekursiv): Das Lock kann durch denselben Thread **gefahrlos mehrfach** (z.B. bei verschachtelten Methodenaufrufen) angefordert werden.

## Was ist das **Upgrading-Pattern** bei Reader/Writer Locks und wie geht Java damit um?

- **Konzept**:
    - Ein Thread fordert zuerst ein **Lese-Lock** an (z.B. um ein Element in einer Liste zu suchen).
    - Bei Bedarf (z.B. Element fehlt und muss eingefügt werden) wird das Lock zu einem **Schreib-Lock hochgestuft** (Upgrading).
- **Java-Support**:
    - Javas Standardklasse `ReentrantReadWriteLock` unterstützt dieses automatische Upgrading **nicht** (führt zu Deadlock).
