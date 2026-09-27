## Was bedeutet **Interleaving** (Verschränkung) bei der Ausführung von Threads?

- Die gemischte Ausführung von Thread-Instruktionen durch den Scheduler.

## Was versteht man unter **Non-determinism** bei der Thread-Ausführung?

- Die zufällige, unvorhersehbare Ausführungsreihenfolge bei jedem Programmstart.

## Warum entsteht bei simplen Operationen wie `a += b` das **Bytecode-Problem**?

- Die Operationen sind intern **mehrstufig** (Lesen \\( \rightarrow \\) Ändern \\( \rightarrow \\) Speichern).
- Eine Unterbrechung durch den Scheduler ist jederzeit zwischen diesen Stufen möglich.

## Was ist ein **Data Race** und wie sieht ein Beispiel dafür aus?

- Ein ungeschützter, gleichzeitiger Speicherzugriff, bei dem mindestens einer ein **Schreibzugriff** ist.
- *Beispiel*: Zwei Threads erhöhen Variable `x` exakt gleichzeitig. Ein Schreibvorgang wird dabei überschrieben, der finale Zählerstand ist zu tief.

## Was ist ein **Bad Interleaving** und wie sieht ein Beispiel dafür aus?

- Ein logischer Programmfehler, der durch eine ungünstige Ausführungsreihenfolge entsteht (trotz vorhandenem Speicherschutz).
- *Beispiel*: Consumer prüft `isEmpty() == false` \\( \rightarrow \\) Scheduler unterbricht \\( \rightarrow \\) anderer Thread leert Buffer \\( \rightarrow \\) Consumer führt `remove()` aus \\( \rightarrow \\) Crash.

## Was ist eine **Critical Section** und wie sollte diese dimensioniert sein?

- Ein Code-Block, der für **nur einen Thread gleichzeitig** zugänglich ist.
- Sollte immer **so klein wie möglich** gehalten werden (verhindert unnötige Parallelitäts-Blockaden).

## Welche drei Arten von **Hazards** (Gefahren) existieren bei der Nebenläufigkeit?

- **Safety Hazard**: Verletzung der Korrektheit (es entstehen falsche Resultate).
- **Liveness Hazard**: Mangelnder Fortschritt (z.B. **Deadlocks**, Endlosschleifen).
- **Performance Hazard**: Verlangsamung des Systems (z.B. durch zu viele Context Switches oder Lock-Overhead).

## Über welches Element zur Synchronisation verfügt jedes Java-Objekt standardmässig?

- Ein internes Lock (**Intrinsic Lock** / **Monitor Lock**).

## Was bewirkt ein **`synchronized` Block** (`synchronized(obj) { ... }`)?

- Er erzwingt **Mutual Exclusion** (wechselseitigen Ausschluss) auf das Objekt `obj`.
- Er blockiert alle anderen anfragenden Threads bei besetztem Lock (Zustand: **Blocked**).

## Was ist eine **`synchronized` Method** in Java konzeptionell?

- Syntaktischer Zucker für `synchronized(this) { ... }`, der den gesamten Methodenrumpf umschliesst.

## Worauf lockt die **statische Synchronisation** (`public static synchronized`) in Java?

- Auf das **Class-Objekt** (z.B. `MyClass.class`), nicht auf die konkrete Objekt-Instanz.

## Was bedeutet es, dass Java-Locks **rekursiv** (Reentrant Locks) sind?

- Mehrfaches Anfordern desselben Locks durch denselben Thread ist problemlos möglich (z.B. bei verschachtelten `synchronized` Methoden).

## Wie erhöht man die Parallelität durch **Different Locks** (Lock Granularity)?

- Durch die Nutzung separater Dummy-Objekte (`lock1`, `lock2`) für unabhängige Variablen.
- Dies erlaubt mehr Parallelität durch **disjoint** (getrennte) Locks.

## Warum dürfen **Wrapper-Klassen** (`Integer`, `Boolean`) niemals als Lock-Objekte verwendet werden?

- Internes Caching der JVM verändert deren Locking-Verhalten unvorhersehbar.

## Was passiert mit dem Lock und den Daten, wenn eine Exception in einem **`synchronized` Block** auftritt?

- Das Lock wird **sofort freigegeben**.
- **Gefahr**: Es existiert **kein Rollback** in Java! Partielle Datenänderungen vor der Exception bleiben bestehen, was zu Inkonsistenz führt.

## Warum besteht beim **Producer-Consumer-Problem** eine Deadlock-Gefahr durch aktives Warten (`while`-Schleife)?

- Wenn aktives Warten innerhalb eines `synchronized`-Blocks stattfindet, wird das Lock nie freigegeben.
- Der wartende Thread sperrt den anderen Thread dadurch für immer aus.

## Was ist die zwingende Voraussetzung für den Aufruf der Methoden `wait()`, `notify()` und `notifyAll()`?

- Der Aufruf ist nur innerhalb eines **`synchronized`-Blocks** erlaubt (der aufrufende Thread muss das Lock halten).

## Was bewirkt die Methode **`wait()`** in Java?

- Der Thread schläft (Zustand: **Waiting**).
- Er **gibt das Lock temporär frei**.

## Wie unterscheiden sich **`notify()`** und **`notifyAll()`** und wann ist Letzteres zwingend?

- **`notify()`**: Weckt einen **zufälligen** wartenden Thread auf.
- **`notifyAll()`**: Weckt **alle** wartenden Threads auf (diese kämpfen danach erneut um das Lock).
    - *Usecase*: Verhindert Deadlocks durch "verpasste" Signale (wenn das Signal zufällig den falschen Thread weckt). Generell die sicherere Wahl.

## Was sind **Spurious Wake-ups** und welche Programmier-Regel folgt zwingend daraus?

- "Grundloses" Aufwecken von Threads ohne expliziten `notify`-Aufruf (bedingt durch OS-Scheduler-Design).
- **Zwingende Regel**: `wait()` **immer** in einer `while`-Schleife aufrufen (z.B. `while(buffer.isEmpty()) wait();`), niemals in einem `if`.
- Die Re-Evaluierung der Bedingung nach dem Aufwachen ist essenziell.

## Was ist das **Nested Lockout Problem** und wie lässt es sich verhindern?

- Ein Deadlock-Risiko bei verschachtelten `synchronized`-Blöcken auf verschiedene Objekte.
- `wait()` gibt **nur das Lock des direkt aufgerufenen Objekts frei**. Die äusseren Locks bleiben bestehen.
- **Lösung**: Verschachtelte `synchronized`-Blöcke vermeiden.
