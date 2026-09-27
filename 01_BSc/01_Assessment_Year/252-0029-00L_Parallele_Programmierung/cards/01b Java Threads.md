## Was passiert bezüglich Prozessen und Threads beim Start eines Java-Programms?

- Erzeugt einen **JVM Prozess**.
- Besitzt mindestens einen **Main Thread**.

## Wie ist die Speicheraufteilung für Threads in Java geregelt?

- **Heap**: Von allen Threads geteilt (Objekte, statische Variablen).
- **Stack**: Eigener Stack pro Thread (lokale Variablen, Methodenaufrufe, Instruction Stream).

## Wie erstellt man in Java einen Thread durch Vererbung?

- **`extends Thread`**:
    - Erbt von `java.lang.Thread`.
    - Überschreibt die Methode `run()`.

## Wie erstellt man in Java einen Thread über ein Interface (bevorzugte Methode)?

- **`implements Runnable`**.

## Warum ist die Implementierung von `Runnable` die bevorzugte Art der Thread-Erstellung in Java?

- Klare Trennung von Aufgabe (**Task**) und Ausführendem (**Executor**).
- Erlaubt Teilen desselben Task-Objekts unter mehreren Threads.

## Wann terminiert ein laufendes Java-Programm?

- Erst nach Beendigung **aller (Nicht-Daemon) Threads**.

## Warum muss ein neuer Java-Thread zwingend mit `start()` und niemals direkt mit `run()` aufgerufen werden?

- **`start()`**: Weist JVM an, einen neuen Call-Stack zu erstellen (startet tatsächlichen Thread).
- **`run()` direkt**: Startet keinen neuen Thread, sondern wird sequenziell im aktuellen Thread ausgeführt.

## Welche vier Haupt-Lebenszyklus-Zustände (Lifecycle) hat ein Java-Thread?

- **New**: Erstellt (`new Thread()`), noch nicht gestartet.
- **Runnable**: Aktiv nach `start()` (beinhaltet "wartet auf CPU" und "läuft auf CPU").
- **Blocked / Waiting / Timed Waiting**: Inaktiv (wartet auf Lock, Notification oder `sleep`).
- **Terminated**: `run()`-Methode beendet.

## Welche vier Haupt-Attribute besitzt ein Java-Thread und wie können sie manipuliert/abgefragt werden?

- **ID**: Eindeutig, abfragbar (`getId()`), unveränderlich.
- **Name**: Veränderbar (`setName()`).
- **Priority**: Priorität (\\( 1 \\) bis \\( 10 \\)), setzen via `setPriority()`.
- **Status**: Abfragbar (`getState()`).

## Bietet das Setzen der Thread-Priorität in Java eine Garantie für die Ausführungsreihenfolge?

- Nein.
- Es ist **nur ein Wunsch** an den OS-Scheduler (**keine Ausführungsgarantie**).

## Wie unterscheiden sich Busy Waiting und `join()` beim Warten auf einen anderen Thread?

- **Busy Waiting**: Endlose Status-Abfrage via Schleife (**ineffizient**, blockiert CPU).
- **`join()`**: Aufrufender Thread blockiert (**Waiting**), bis Ziel-Thread terminiert (minimaler Context-Switch-Overhead).

## In welcher Reihenfolge sollten bei mehreren Threads `start()` und `join()` aufgerufen werden?

- Zuerst **alle** Threads starten.
- Danach alle joinen.
- Grund: Verhindert eine ineffiziente, rein sequenzielle Ausführung.

## Welche Auswirkung hat eine unbehandelte Exception in einem Worker-Thread auf den Main-Thread in Java?

- Unbehandelte Exception beendet den Worker-Thread.
- Der **Main-Thread läuft unbeeinflusst weiter** (bemerkt Abbruch nicht).

## Wie fängt man in Java Exceptions ab, die einen Thread unerwartet beenden?

- **UncaughtExceptionHandler** implementieren.
- Fängt Exceptions pro Thread, Gruppe oder global ab.

## Wie können Java-Threads von aussen sicher beendet werden?

- Threads **können nicht von aussen beendet werden** (kein "Kill").
- Der Abbruch funktioniert nur **kooperativ**.

## Wie funktioniert der kooperative Abbruch eines Java-Threads via Interrupts?

- **`thread.interrupt()`** aufrufen (setzt das **Interrupt Flag**).
- Blockierter Thread muss reagieren:
    - `sleep()` oder `wait()` werfen bei gesetztem Flag eine **InterruptedException** und wecken den Thread.
