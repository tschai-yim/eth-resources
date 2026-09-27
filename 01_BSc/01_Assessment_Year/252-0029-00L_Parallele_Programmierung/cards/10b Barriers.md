## Was ist eine **Barriere (Barrier)** in der Nebenläufigkeit?

- Ein **Sammelpunkt** für Threads.
- Alle \\(n\\) Threads müssen zwingend ankommen, bevor einer weiterläuft.

## Warum skalieren klassische **Semaphoren** bei der Umsetzung von Barrieren für sehr viele Threads (z.B. auf einer GPU) schlecht?

- Der lineare Verwaltungsaufwand (Overhead) der Semaphoren skaliert schlecht bei hohen Thread-Anzahlen.

## Was beschreibt das **Bulk-Synchronous Parallel (BSP) Model**?

- Ein Ausführungsmodell für parallele Systeme.
- Das System iteriert phasenweise in **exakten Schritten** (Lock-step).

## Warum verursacht ein naiver Barrieren-Ansatz mit einem einfachen `count++` eine **Race Condition**?

- `count++` ist hardwareseitig **ungeschützt**.
- Es besteht aus \\(3\\) Instruktionen (Load, ALU, Store).
- Bei parallelem Zugriff wird der **Zählerstand korrumpiert**.

## Warum führt das einmalige Aufrufen von `release(barrier)` durch den letzten ankommenden Thread bei einer naiven Barriere zu einem **Deadlock**?

- Das einmalige `release()` weckt nur **genau einen** wartenden Thread auf.
- Die restlichen \\(n-1\\) Threads bleiben für immer blockiert (es fehlt eine Kettenreaktion).

## Wie funktioniert eine korrekte **Basis-Barriere** mittels Semaphoren und was ist die Aufgabe des Turnstiles?

- Nutzt einen **Mutex**, um die Variable `count` zu schützen.
- Nutzt ein **Turnstile** (Drehkreuz), um eine Kettenreaktion auszulösen (weckt alle wartenden Threads nacheinander auf).

```java
// init: barrier = 0, mutex = 1, count = 0
acquire(mutex);
count++;
release(mutex);

if (count == n) release(barrier);

acquire(barrier);
release(barrier); // Turnstile: weckt nächsten Thread
```

## Warum ist eine einfache Basis-Barriere innerhalb einer **Schleife** unbrauchbar?

- Der Zählerstand überschreitet das Limit (\\(count > n\\)).
- Die Semaphore bleibt permanent auf \\(1\\).
- Ein **Reset** (Zurücksetzen) ist für die Wiederverwendbarkeit zwingend nötig.

## Welches Problem entsteht beim Versuch, eine wiederverwendbare Barriere simpel durch anschliessendes Rückwärtszählen (`count--`) zurückzusetzen?

- Die Threads kommen blockweise an (**Scheduling Scenarios**).
- Dies führt zu einem Mischen von Inkrementieren und Dekrementieren.
- Zerstört die **Invarianten** der Barriere komplett.

## Welches Problem entsteht bei einer Barriere, wenn die Reset-Logik zwar geschützt im Mutex liegt, aber schnelle Threads nicht gebremst werden (**Lapping**)?

- Ein schneller Thread eilt sofort in die nächste Iteration (**Lapping / Überholen**).
- Er passiert die Barriere sofort wieder, **bevor** langsame Threads diese überhaupt verlassen konnten.

## Wie löst die **Two-Phase Barrier** das Problem des Überholens (Lapping) bei Schleifen?

- Nutzt **zwei gegenläufig geschaltete Turnstiles** (`barrier1` und `barrier2`).
- Zwingt alle Threads, Phase 1 komplett abzuschliessen, bevor Phase 2 (die nächste Iteration) geöffnet wird.
- Verhindert das **Lapping** (Überholen) effektiv.

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
