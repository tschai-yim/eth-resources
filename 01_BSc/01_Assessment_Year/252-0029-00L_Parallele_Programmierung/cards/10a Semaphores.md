## Welche zwei zentralen Grenzen haben herkömmliche **Locks**, die den Einsatz von **Semaphoren** motivieren?

- Sichern nur **Atomizität** (Mutual Exclusion), bieten aber keine **Kommunikation** über Zustandsänderungen.
- Bieten keine **Reihenfolge** (Order, der zuerst ankommende Thread ist undefiniert).

## Was ist ein **Semaphore** und wie funktionieren seine zwei Grundoperationen?

- Ein ganzzahliger Datentyp \\( S \\) mit Initialwert \\( S \ge 0 \\).
- **`acquire(S)`**:
    - Wartet zwingend, bis \\( S > 0 \\).
    - Dekrementiert \\( S \\) um \\( 1 \\).
    - *(Historisch: \\( P \\) / wait)*.
- **`release(S)`**:
    - Inkrementiert \\( S \\) um \\( 1 \\).
    - *(Historisch: \\( V \\) / signal)*.

## Wie steuert ein **Semaphore** den Grad des Parallelismus?

- Der Initialwert bestimmt die Anzahl gleichzeitig erlaubter Threads in der **Protected Section**.
    - *(Beispiel: Initialwert \\( 10 \\) lässt \\( 10 \\) Threads passieren).*

## Wie wird ein **Semaphore** als klassisches Lock (**Mutex**) eingesetzt?

- Initialwert: **\\( S = 1 \\)**.
- **`acquire()`** fungiert als `lock()`.
- **`release()`** fungiert als `unlock()`.

## Wie wird ein **Semaphore** zur simplen Synchronisation zweier Threads eingesetzt (z.B. B wartet auf A)?

- Initialwert: **\\( S = 0 \\)**.
- **Thread A** führt Berechnung durch, fügt Resultat hinzu \\( \rightarrow \\) ruft **`release(S)`** auf.
- **Thread B** ruft **`acquire(S)`** auf (blockiert, bis A fertig ist) und setzt danach seine Ausführung fort.

## Was versteht man unter dem **Rendezvous-Konzept** bei der Thread-Synchronisation?

- Zwei Prozesse (P und Q) warten an einer **exakten Code-Stelle** aufeinander, bevor sie gemeinsam weiterarbeiten.

## Warum führt der naive Ansatz mit zwei Semaphoren (Init \\( 0 \\)) beim **Rendezvous** zu einem Deadlock, wenn beide Prozesse zuerst `acquire` und dann `release` aufrufen?

- Es entsteht ein **zirkuläres Warten**.
- Beide Threads blockieren endlos beim ersten `acquire`, da der jeweils andere sein `release` noch nicht aufrufen konnte.

## Wie funktioniert die asymmetrische Lösung des **Rendezvous**-Problems und was ist ihr Nachteil?

- Die Reihenfolge der Aufrufe wird bei **einem Prozess umgedreht** (durchbricht das zirkuläre Warten).
    - Prozess P: `release` \\( \rightarrow \\) `acquire`.
    - Prozess Q: `acquire` \\( \rightarrow \\) `release`.
- **Nachteil**: Unschön, da Prozess Q bei einer Verzögerung/Unterbrechung von P unnötig blockiert.

## Wie funktioniert die symmetrische (Best Practice) Lösung für das **Rendezvous**-Problem?

- Beide Prozesse rufen **zuerst `release`**, **danach `acquire`** auf.
- Ist robust, effizient und erlaubt eine optimale Überlappung der Berechnungen beider Prozesse.

## Wie wird das Problem des ineffizienten Spinnings bei der Implementierung von **Semaphoren** gelöst?

- Durch die Nutzung von **OS Blocking Queues**.
- Der Semaphore erhält eine interne Warteschlange \\( Q_S \\).
- **`acquire(S)`**: Wenn \\( S=0 \\), wird der Thread in \\( Q_S \\) eingefügt \\( \rightarrow \\) OS blockiert den Thread (Schlafmodus).
- **`release(S)`**: Bei wartenden Threads in \\( Q_S \\) wird einer entnommen \\( \rightarrow \\) OS weckt diesen Thread auf.
