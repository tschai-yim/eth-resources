## Barrieren (Barriers) und BSP-Modell

- **Konzept der Barriere (Barrier)**:
    - Sammelpunkt. Alle $n$ Threads müssen ankommen, bevor einer weiterläuft.
- **Limitierung von Semaphoren**:
    - Linearer Verwaltungsoverhead skaliert schlecht für viele Threads (z.B. GPU).
- **Bulk-Synchronous Parallel (BSP) Model**:
    - System iteriert phasenweise in exakten Schritten (Lock-step).
- **Naiver Ansatz (Fehlversuche)**:

    ```java
    // init: barrier = 0, count = 0
    count++;
    if (count == n) release(barrier);
    acquire(barrier);
    ```

    - **Fehler 1 (Race Condition)**: `count++` hardwareseitig ungeschützt ($3$ Instruktionen: Load, ALU, Store) $\rightarrow$ Zählerstand korrumpiert.
    - **Fehler 2 (Deadlock)**: Nur letzter Thread ruft `release()` einmal auf. Nur **ein** Thread wacht auf, restliche $n-1$ warten ewig.
- **Basis-Barriere (Funktionierend)**:
    - Schützt `count` via Mutex und nutzt **Turnstile** (Drehkreuz) für Kettenreaktion (weckt alle auf).

    ```java
    // init: barrier = 0, mutex = 1, count = 0
    acquire(mutex);
    count++;
    release(mutex);

    if (count == n) release(barrier);

    acquire(barrier);
    release(barrier); // Turnstile: weckt nächsten Thread
    ```

## Wiederverwendbare Barrieren (Reusable Barriers)

- **Problem**: Einfache Barriere in Schleife unbrauchbar ($count > n$, Semaphore bleibt $1$). Reset zwingend nötig.
- **Fehlschlag 1 (Simpler Reset-Versuch)**:
    - Idee: Nach Barriere rückwärts zählen.

    ```java
    // ... (Teil 1 der Barriere wie oben) ...
    acquire(mutex);
    count--;
    release(mutex);
    if (count == 0) acquire(barrier);
    ```

    - **Fehler (Scheduling Scenarios)**: Blockweises Ankommen der Threads. Mischen von Inkrement/Dekrement zerstört Invarianten.
- **Fehlschlag 2 (Reset im Mutex)**:
    - Idee: Dekrement-Logik sicher in den Mutex verschieben.

    ```java
    acquire(mutex);
    count++;
    if (count == n) release(barrier);
    release(mutex);

    acquire(barrier);
    release(barrier);

    acquire(mutex);
    count--;
    if (count == 0) acquire(barrier);
    release(mutex);
    ```

    - **Fehler (Lapping / Überholen)**: Schneller Thread eilt in nächste Iteration und passiert Barriere sofort wieder, bevor langsame Threads diese überhaupt verlassen.
- **Die korrekte Lösung: Two-Phase Barrier**:
    - **Konzept**: Zwei gegenläufig geschaltete Turnstiles (`barrier1` und `barrier2`). Zwingt alle Threads, Phase 1 komplett abzuschliessen, bevor Phase 2 (nächste Iteration) öffnet. Verhindert Lapping effektiv.
    - **Hinweis**: Beweis für Korrektheit extrem aufwendig (hier ausgelassen). Praxis nutzt Hardware-/OS-Barrieren.

    ```java
    // init: mutex=1, barrier1=0, barrier2=1, count=0
    
    // --- Phase 1 ---
    acquire(mutex);
    count++;
    if (count == n) {
        acquire(barrier2);
        release(barrier1);
    }
    release(mutex);

    acquire(barrier1);
    release(barrier1); // Turnstile 1
    
    // --- Phase 2 ---
    acquire(mutex);
    count--;
    if (count == 0) {
        acquire(barrier1);
        release(barrier2);
    }
    release(mutex);

    acquire(barrier2);
    release(barrier2); // Turnstile 2
    ```
