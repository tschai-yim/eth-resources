## Welche drei zwingenden Bedingungen gelten für **Critical Sections (CS)**?

- **Mutual Exclusion** (Wechselseitiger Ausschluss): Maximal \\(1\\) Thread darf sich in der CS befinden.
- **Freedom from Deadlock** (Deadlock-Freiheit): Mindestens \\(1\\) wartender Thread betritt die CS irgendwann.
- **Freedom from Starvation** (Starvation-Freiheit): Jeder wartende Thread betritt die CS irgendwann.

## Wie ist **Fairness** bei Algorithmen für Nebenläufigkeit definiert?

- **Protokoll-Aufteilung**:
    - **Doorway**: Interesse anmelden (in endlichen Schritten).
    - **Waiting**: Das eigentliche Blockieren/Warten.
- **First-Come-First-Served**:
    - Wenn Thread A das Doorway vor Thread B beendet (\\(D_A \rightarrow D_B\\)).
    - Dann erzwingt dies den CS-Eintritt von A vor B (\\(CS_A \rightarrow CS_B\\)).

## Welche vier **theoretischen Annahmen** gelten für formelle Beweise von Nebenläufigkeits-Algorithmen?

- Lese- und Schreibzugriffe auf primitive Typen sind **atomar** (in Java durch **Natural Alignment**).
- Es gibt **kein Memory Reordering** (simuliert durch durchgehendes `volatile`).
- Threads **verlassen die CS garantiert** (kein Absturz oder Endlosschleife innerhalb der CS).
- Es gibt **keine Fortschritts-Garantie** ausserhalb der CS.

## Wie funktioniert **Versuch 1 (Warten, dann Flag)** zur Mutual Exclusion für 2 Threads und woran scheitert er?

- **Code**:

    ```java
    while(wantq);
    wantp = true;
    // Critical Section
    wantp = false;
    ```

- **Fehler**: **No Mutual Exclusion**.
    - Gleichzeitiges Lesen von `false` ist möglich \\(\rightarrow\\) beide Threads betreten die CS.

## Was ist ein **Zustandsdiagramm (State Space Diagram)** und wofür wird es genutzt?

- Modelliert **Zustandspfade** (X-Achse: Thread P, Y-Achse: Thread Q).
- Visualisiert **Traces** und beweist fehlerhafte **Interleavings** formell.
- **Optimierung**: Unwichtige Zustände werden zusammengefasst, um die **Zustandsraum-Explosion** zu reduzieren.

## Wie funktioniert **Versuch 2 (Flag, dann Warten)** zur Mutual Exclusion für 2 Threads und woran scheitert er?

- **Code**:

    ```java
    wantp = true;
    while(wantq);
    // Critical Section
    wantp = false;
    ```

- **Fehler**: **Deadlock**.
    - Beide setzen ihr Flag gleichzeitig \\(\rightarrow\\) endloses Warten aufeinander.

## Wie funktioniert **Versuch 3 (Staffelstab / Turn)** zur Mutual Exclusion für 2 Threads und woran scheitert er?

- **Code**:

    ```java
    while(turn != 1);
    // Critical Section
    turn = 2;
    ```

- **Fehler**: **Starvation**.
    - Ein Absturz eines Threads ausserhalb der CS blockiert die `turn`-Übergabe permanent für den anderen Thread.

## Wie funktioniert **Decker's Algorithm** für 2 Threads konzeptionell und im Code?

- **Konzept**: Kombination aus Versuch 2 & 3. Der Verlierer zieht sein Flag bei einem Konflikt temporär zurück. (Eigener Vorrang ist nicht erzwingbar, nur eigene Niederlage erkennbar).
- **Code**:

    ```java
    wantp = true;
    while (wantq) {
        if (turn == 2) { // Prüfung auf Vorrang
            wantp = false;
            while (turn != 1);
            wantp = true;
        }
    }
    // Critical Section
    turn = 2;
    wantp = false;
    ```

## Wie funktioniert der **Peterson Lock** für 2 Threads konzeptionell und im Code?

- **Konzept**: Der letzte Schreiber deklariert sich selbst als **Victim** (Opfer) und muss warten. (Kompakter als Decker).
- **Code**:

    ```java
    flag[P] = true;
    victim = P;
    while (flag[Q] && victim == P);
    // Critical Section
    flag[P] = false;
    ```

## Welches Problem birgt ein **`volatile boolean[]`** in Java für Algorithmen wie Peterson und was ist die Lösung?

- **Problem**: `volatile` schützt hier **nur die Array-Referenz**, nicht aber die einzelnen Array-Inhalte. Dies führt zu lautlosen Bugs.
- **Lösung**: Zwingend die Klasse **`AtomicIntegerArray`** (oder ähnliche atomare Klassen) nutzen.

## Wie definiert sich die **Intervall-Notation** und **Ordnung** bei der Analyse von Speicherzugriffen?

- **Befehls-Dauer**: Das Intervall zwischen Start und Antwort eines Befehls.
- **Ordnung (Precedence)**: \\(I_A \rightarrow I_B\\) bedeutet, Intervall A endet vor dem Start von B.
- **Concurrent**: Überlappende Intervalle.
- **Atomic Register**: Der Lese-/Schreib-Effekt geschieht exakt zu einem unteilbaren Zeitpunkt \\(\tau(J)\\).

## Wie beweist man **Mutual Exclusion** beim **Peterson Lock** durch Widerspruch?

- **Annahme**: Beide Threads (P & Q) befinden sich in der CS.
- **Deduktion**: P schrieb zuletzt (\\(W_Q \rightarrow W_P\\)) \\(\rightarrow\\) liest zwingend `victim = P`.
- P muss `flag[Q] == false` für den CS-Eintritt gelesen haben.
- **Widerspruch**: Q hat `flag[Q] = true` wegen der zeitlichen Abfolge längst gesetzt.

## Wie beweist man **Starvation Freedom** beim **Peterson Lock**?

- Geschieht durch **Exhaustive Contradiction** (vollständiger Widerspruch).
- **Annahme**: P steckt endlos in der `while`-Schleife fest.
- Alle möglichen Q-Zustände (Non-CS, endlos iterierend, ebenfalls in `while` blockiert) führen logisch zwingend zu P's Weiterkommen.
- \\(\rightarrow\\) **Widerspruch** zur Annahme.

## Wie funktioniert der **Filter Lock** für \\(n\\) Threads und welche Probleme hat er?

- **Konzept**: Erweitert den Peterson Lock auf \\(n-1\\) Level. (Maximal \\(1\\) Thread pro Level blockiert).
- **Code**:

    ```java
    for (int i = 1; i < n; ++i) {
        level[me] = i;
        victim[i] = me;
        while (∃k ≠ me: level[k] >= i && victim[i] == me);
    }
    // Critical Section
    level[me] = 0;
    ```

- **Probleme**:
    - **Nicht fair**: Überholen auf höheren Leveln ist möglich.
    - **Schlechte Skalierung** (\\(\mathcal{O}(n)\\)): Alle Level müssen zwingend durchlaufen werden, auch ohne Konkurrenz (**Contention**).

## Wie funktioniert der **Bakery Algorithm** für \\(n\\) Threads und wie löst er Konflikte?

- **Konzept**: Ticket-System, bei dem die kleinste Nummer (`label`) gewinnt. Garantiert Fairness (First-Come-First-Served).
- **Symmetry Breaking (Tie-Breaker)**: Bei gleicher Ticketnummer gewinnt die kleinere Thread-ID (lexikografische Ordnung \\(<_l\\)).
- **Code**:

    ```java
    flag[me] = true;
    label[me] = max(label[0], ..., label[n-1]) + 1;
    while (∃k ≠ me: flag[k] && (label[k], k) <_l (label[me], me));
    // Critical Section
    flag[me] = false;
    ```

## Welche technischen Nachteile hat der **Bakery Algorithm** in der Praxis?

- **Integer-Overflow Gefahr**: Die Ticketnummern (`label`) wachsen stetig an.
- **Schlechte Skalierung** (\\(\mathcal{O}(n)\\)): Erfordert teure Array-Scans, um das Maximum zu finden.

## Was besagt das Theorem von **Lynch & Burns** bezüglich Registern?

- Software-Systeme, die nur auf simplen Lese- und Schreibzugriffen basieren, benötigen für \\(n\\) Prozesse **zwingend \\(\ge n\\) Variablen**.

## Was ist die **Beweis-Intuition** hinter dem Theorem von **Lynch & Burns**?

- Ein Lesezugriff offenbart **nur den letzten Schreibvorgang**.
- Verdeckte Zwischenzustände von anderen Threads werden dadurch **spurlos überschrieben** und gehen verloren.

## Welches **Fazit für die Praxis** ergibt sich aus den Limitierungen reiner Software-Locks?

- Reine Software-Locks (wie Bakery oder Filter) sind in Bezug auf Laufzeit und Speicherplatz **zu ineffizient**.
- Spezielle **Hardware-Erweiterungen** (wie atomare CPU-Befehle) sind für Nebenläufigkeit **zwingend notwendig**.
