## Grundlagen der Semaphoren

- **Grenzen von Locks (Motivation)**:
    - Sichern **Atomizität** (Mutual Exclusion), erlauben aber keine **Kommunikation** über Zustandsänderungen.
    - Bieten keine **Reihenfolge** (Order). Zuerst ankommender Thread undefiniert.
- **Semaphore**: Ganzzahliger Datentyp $S$ mit Initialwert $S \ge 0$.
    - **`acquire(S)`**: Wartet zwingend, bis $S > 0$, dekrementiert $S$ um $1$ (historisch: $P$ / wait).
    - **`release(S)`**: Inkrementiert $S$ um $1$ (historisch: $V$ / signal).
- **Steuerung des Parallelismus**:
    - Initialwert bestimmt Anzahl gleichzeitig erlaubter Threads in der **Protected Section** (z.B. Init $10$ lässt $10$ Threads passieren).
- **Einsatz als Lock/Mutex**:
    - Initialwert $S = 1$.
    - `acquire()` = `lock()`. `release()` = `unlock()`.
- **Einsatz zur Synchronisation (Beispiel: Scaled Dot Product)**:
    - Ziel: Thread B wartet auf Teilresultat von Thread A.
    - Initialwert $S = 0$.
    - Thread A rechnet, fügt Resultat hinzu $\rightarrow$ `release(S)`.
    - Thread B macht lokales Setup, ruft `acquire(S)` auf (blockiert bis A fertig) und multipliziert das Gesamtergebnis.

## Synchronisation und Rendezvous

- **Rendezvous-Konzept**:
    - Zwei Prozesse (P und Q) warten an exakter Code-Stelle aufeinander.
- **Naiver Ansatz (Deadlock)**:
    - Semaphoren `P_Arrived`, `Q_Arrived` (Init $0$).
    - P: `acquire(Q_Arrived)` $\rightarrow$ `release(P_Arrived)`.
    - Q: `acquire(P_Arrived)` $\rightarrow$ `release(Q_Arrived)`.
    - **Zirkuläres Warten**: Beide blockieren beim ersten `acquire` endlos aufeinander.
- **Asymmetrische Lösung**:
    - Reihenfolge bei einem Prozess umdrehen (Kreis durchbrochen).
    - P: `release` $\rightarrow$ `acquire`. Q bleibt: `acquire` $\rightarrow$ `release`.
    - Funktioniert, aber unschön: Q blockiert bei P's Unterbrechung unnötig.
- **Symmetrische Lösung (Best Practice)**:
    - Beide machen **zuerst `release`**, **danach `acquire`**.
    - Robust, effizient, erlaubt optimale Überlappung der Berechnungen.

## Effiziente Semaphoren-Implementierung

- **Problem des Spinnings**:
    - Blockierte Threads in Endlosschleife verschwenden massiv CPU-Zyklen.
- **Lösung: OS Blocking Queues**:
    - Semaphore erhält interne Warteschlange $Q_S$.
    - **`acquire(S)`**: Wenn $S=0$, Thread in $Q_S$ einfügen $\rightarrow$ OS blockiert Thread (Schlafmodus).
    - **`release(S)`**: Bei wartenden Threads in $Q_S$ einen entnehmen $\rightarrow$ OS weckt Thread auf.
