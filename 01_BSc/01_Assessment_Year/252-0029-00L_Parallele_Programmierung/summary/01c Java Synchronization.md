## Shared Resources und Race Conditions

- **Ausführung & Non-Determinismus**
    - **Interleaving (Verschränkung)**: Gemischte Ausführung von Thread-Instruktionen durch den Scheduler.
    - **Non-determinism**: Zufällige, unvorhersehbare Ausführungsreihenfolge bei jedem Programmstart.
    - **Bytecode-Problem**: Simple Operationen (`a += b`) sind mehrstufig (Lesen $\rightarrow$ Ändern $\rightarrow$ Speichern) $\rightarrow$ Unterbrechung jederzeit möglich.
- **Race Conditions (Fehlerarten)**
    - **Data Race (Low-level Race Condition)**: Ungeschützter, gleichzeitiger Speicherzugriff (mind. ein Schreibzugriff).
        - *Beispiel*: Zwei Threads erhöhen Variable `x` exakt gleichzeitig $\rightarrow$ Ein Schreibvorgang wird überschrieben, Zählerstand am Ende zu tief.
    - **Bad Interleaving (High-level Race Condition)**: Logischer Programmfehler durch ungünstige Reihenfolge (trotz Speicherschutz).
        - *Beispiel*: Consumer prüft `isEmpty() == false` $\rightarrow$ Scheduler unterbricht $\rightarrow$ anderer Thread leert Buffer $\rightarrow$ Consumer führt `remove()` aus $\rightarrow$ Crash.
- **Konzepte & Gefahren**
    - **Critical Section**: Code-Block für **nur einen Thread gleichzeitig**. Immer **so klein wie möglich** halten (verhindert unnötige Parallelitäts-Blockaden).
    - **Hazards (Gefahren)**:
        - **Safety Hazard**: Verletzung der Korrektheit (falsche Resultate).
        - **Liveness Hazard**: Mangelnder Fortschritt (z.B. **Deadlocks**, Endlosschleifen).
        - **Performance Hazard**: Verlangsamung (zu viele Context Switches, Lock-Overhead).

## Synchronisation (synchronized)

- Jedes Java-Objekt besitzt ein internes Lock (**Intrinsic Lock / Monitor Lock**).
- **Arten der Synchronisierung**:
	- **`synchronized` Block**: `synchronized(obj) { ... }`
	    - Erzwingt **Mutual Exclusion** (wechselseitiger Ausschluss) auf Objekt `obj`.
	    - Blockiert alle anderen anfragenden Threads bei besetztem Lock (**Blocked**).
	- **`synchronized` Method**:
	    - Syntaktischer Zucker für `synchronized(this) { ... }` um gesamten Methodenrumpf.
	- **Statische Synchronisation**: `public static synchronized`
	    - Lockt auf das **Class-Objekt** (z.B. `MyClass.class`), nicht auf die Instanz.
- **Rekursive/Reentrant Locks**:
    - Mehrfaches Anfordern desselben Locks durch denselben Thread problemlos möglich (z.B. verschachtelte `synchronized` Methoden).
- **Different Locks (Lock Granularity)**:
    - Nutzung separater Dummy-Objekte (`lock1`, `lock2`) für unabhängige Variablen $\rightarrow$ Erlaubt mehr Parallelität (**disjoint / getrennte** Locks).
    - **WICHTIG:** **Niemals Wrapper-Klassen** (`Integer`, `Boolean`) als Lock-Objekte verwenden (internes Caching verändert Locking-Verhalten).
- **Exceptions in `synchronized`**:
    - Bei Fehler im Block: Lock wird **sofort freigegeben**.
    - **Gefahr:** **Kein Rollback** in Java! Partielle Datenänderungen vor Exception bleiben bestehen (Inkonsistenz).

## Koordination: Wait und Notify (Producer-Consumer)

<img src="media/01c_Producer-Consumer.png" alt="01c Producer-Consumer" width="600">

- **Producer-Consumer-Problem**: Producer füllt Puffer, Consumer leert ihn. Lese-Verbot bei leerem Puffer.
- **Deadlock-Gefahr**: Aktives Warten in `while`-Schleife innerhalb `synchronized`-Block $\rightarrow$ Lock wird nie freigegeben $\rightarrow$ Producer für immer ausgesperrt.
- **Lösung: `wait()` und `notify()`** (Methoden von `Object`):
    - **Zwingende Voraussetzung**: Aufruf nur innerhalb `synchronized`-Block erlaubt (Thread muss Lock halten).
    - **`wait()`**: Thread schläft (**Waiting**) und **gibt Lock temporär frei**.
    - **`notify()`**: Weckt einen **zufälligen** wartenden Thread auf.
    - **`notifyAll()`**: Weckt **alle** wartenden Threads auf (erneuter Kampf um Lock).
        - *Usecase*: Verhindert Deadlocks durch "verpasste" Signale, wenn ein Signal zufällig den falschen Thread weckt (z.B. wenn mehrere Threads auf unterschiedliche Bedingungen warten). Generell die sicherere Wahl als `notify()`.
- **Spurious Wake-ups & `while`-Loop Pflicht**:
    - **Spurious Wake-up**: "Grundloses" Aufwecken von Threads ohne `notify`-Aufruf (Passiert aus Performance- und internen Designgründen des OS-Schedulers).
    - **Zwingende Regel:** `wait()` **immer** in `while`-Schleife (z.B. `while(buffer.isEmpty()) wait();`), niemals in `if`. Re-Evaluierung der Bedingung nach Aufwachen ist essenziell.
- **Nested Lockout Problem**:
    - Risiko bei verschachtelten `synchronized`-Blöcken auf verschiedene Objekte.
    - `wait()` gibt **nur Lock des direkt aufgerufenen Objekts frei**.
    - Äussere Locks bleiben bestehen $\rightarrow$ hohes **Deadlock**-Risiko.
    - Lösung: Verschachtelte `synchronized`-Blöcke vermeiden.
