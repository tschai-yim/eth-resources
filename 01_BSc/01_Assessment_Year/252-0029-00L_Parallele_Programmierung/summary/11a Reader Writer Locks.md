## Motivation und Konzept

- Herkömmliche Locks blockieren gleichzeitiges Lesen (**unnötig konservativ**).
- **Multiple concurrent reads** (gleichzeitiges Lesen) auf demselben Speicher sind unproblematisch.
    - Beispiel **Wikipedia**: Extrem lese-lastig (z.B. $0.12\%$ Write-Rate). Ein einziges globales Lock würde System lahmlegen.

## Zustände und Operationen

- **Zustände eines Reader/Writer Locks**:
    - **Not held** (nicht gehalten).
    - **Held for writing** (Schreib-Lock, exklusiv durch maximal $1$ Thread).
    - **Held for reading** (Lese-Lock, geteilt durch $\ge 1$ Threads).
- Mathematische **Invariante** des Locks: $writers \cdot readers == 0$.
- **Operationen**:
    - **`acquire_read`**: Blockiert bei aktivem Schreib-Lock. Sonst: Lese-Lock gewährt, Reader-Zähler inkrementiert.
    - **`acquire_write`**: Blockiert bei aktivem Lese- oder Schreib-Lock. Sonst: Schreib-Lock gewährt, Writer-Zähler inkrementiert.
    - **`release_read`**: Dekrementiert Reader-Zähler. Bei $0 \rightarrow$ Zustand "Not held".
    - **`release_write`**: Freigabe des Schreib-Locks $\rightarrow$ Zustand "Not held".

## Priorität und Fairness (Starvation)

- **Einfache Implementierung (Implizite Reader Priority)**:
    - Normales Standard-Verhalten begünstigt Leser implizit, da diese nur auf aktive (nicht wartende) Schreiber achten.
    - Neue Leser verlängern den Leseprozess endlos $\rightarrow$ Schreiber **verhungern** (**Starvation**).

    ```java
    // acquire_read
    while (writers > 0) wait();
    // acquire_write
    while (writers > 0 || readers > 0) wait();
    ```

- **Writer Priority**:
    - Leser blockieren sofort, sobald ein Schreiber Interesse anmeldet (`writersWaiting`).
    - In der Praxis (bei wenigen Schreibern) oft die bevorzugte Variante.
    - Gefahr hier: Leser können verhungern.

    ```java
    // acquire_read
    while (writers > 0 || writersWaiting > 0) wait();
    // acquire_write
    writersWaiting++;
    while (writers > 0 || readers > 0) wait();
    writersWaiting--;
    ```

- **Fairness-Modell (FIFO-Fairness)**:
    - Verhindert Starvation beider Seiten durch begrenzte Kontingente.
    - Schreiber-Ende: Eine fixe Nummer $k$ an bereits wartenden Lesern darf passieren.
    - Nächster Schreiber muss auf genau diese $k$ Leser warten (`writersWait`).

    ```java
    // acquire_read
	readersWaiting++;
	while (writers > 0 || (writersWaiting > 0 && writersWait <= 0)) wait();
	readersWaiting--;
	writersWait--; // Baut Kontingent für den nächsten Schreiber ab
	readers++;
	
	// release_write
	writers--;
	writersWait = readersWaiting; // Snapshot: Setzt Quote für wartende Schreiber
	notifyAll();
	
	// acquire_write
	writersWaiting++;
	while (writers > 0 || readers > 0 || writersWait > 0) wait();
	writersWaiting--;
	writers++;
    ```

## Java-Spezifika & Implementierung

- **Monitor-basierte Implementierung (`wait`/`notify`)**:
    - Zwingend **`notifyAll()`** statt `notify()` bei Freigaben nutzen.
    - Grund: Verhindert Deadlocks durch Aufwecken falscher Thread-Typen (z.B. Leser weckt Leser, obwohl alle auf Schreiber warten).
- **Natives Java (`synchronized`)**:
    - Ist immer ein strikt exklusives Schreib-Lock.
    - Unterstützt kein paralleles Lesen.
- **Standardbibliothek**:
    - **`java.util.concurrent.locks.ReentrantReadWriteLock`** nutzen.
    - **Re-entrant**: Lock durch denselben Thread gefahrlos mehrfach (verschachtelt) anforderbar.
- **Upgrading** (Häufiges Pattern):
    - Lese-Lock anfordern (z.B. für Element-Suche).
    - Bei Bedarf (z.B. Einfügen) Lese-Lock zu Schreib-Lock "upgraden".
    - *Achtung*: Javas `ReentrantReadWriteLock` unterstützt dieses automatische Upgrading **nicht** (immer Dokumentation prüfen).
