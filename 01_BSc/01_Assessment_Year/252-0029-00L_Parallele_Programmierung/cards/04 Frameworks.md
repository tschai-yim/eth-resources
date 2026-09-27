## Was sind die Schwächen einer manuellen, naiven Aufteilung von **Java Threads** (z.B. statisches Splitting in 4 Teile)?

- **Plattform-Abhängigkeit**: Fixe Thread-Anzahl ignoriert die tatsächlich verfügbare Hardware.
- **Statische Zuweisung**: Keine dynamische Anpassung an freie Cores zur Laufzeit.
- **Load Imbalance**: Unterschiedlich lange Tasks führen zu Leerlauf auf einzelnen Cores.

## Warum führt das Erstellen von sehr vielen kleinen manuellen **Java Threads** zu einem Absturz?

- Java-Threads sind **Heavyweight**.
- Es besteht ein **\\( 1:1 \\)-Mapping** zu OS-Threads.
- Der extreme Overhead führt unweigerlich zu einem **`OutOfMemoryError`**.

## Was ist das **Ziel-Paradigma** von modernen Parallelisierungs-Frameworks?

- Der Code definiert lediglich die **maximale Parallelität**.
- Das Framework übernimmt die **Work Distribution** und das **Scheduling** vollautomatisch.

## Wie ist ein Algorithmus nach dem **Divide and Conquer**-Prinzip strukturiert?

- **Konzept**: Rekursive Aufteilung in kleinere, unabhängige Teilprobleme.
- **Base Case**: Problem ist unteilbar \\( \rightarrow \\) Lösung direkt berechnen/retournieren.
- **Recursive Case**: Problem teilen (meist in Hälften), rekursiv lösen und Resultate kombinieren.

## Welche Laufzeit-Performance erreicht **Divide and Conquer** bei ausreichend Cores?

- Benötigt meist **assoziative Operationen** (z.B. Addition).
- Laufzeit verhält sich proportional zur Aufruf-Baumhöhe: **\\( O(\log n) \\)** (im Vergleich zu sequenziell \\( O(n) \\)).

## Was ist der **Executor Service** und welche **Task-Typen** unterstützt er?

- **Konzept**: Trennt Aufgabe (**Task**) vom Ausführenden (beinhaltet Task-Queue und **Thread Pool**).
- **`Runnable`**: Methode `run()`, liefert **kein Resultat**.
- **`Callable<T>`**: Methode `call()`, liefert ein **Resultat vom Typ \\( T \\)** (essenziell für Divide & Conquer).

## Wie ist der Ablauf beim Einreichen und Abrufen von Tasks im **Executor Service** im Code?

```java
ExecutorService pool = Executors.newFixedThreadPool(4);

// 1. Task einreichen, liefert asynchronen Platzhalter
Future<Integer> future = pool.submit(myCallableTask);

// 2. Resultat abrufen (blockiert den aufrufenden Thread, bis Resultat da ist)
Integer result = future.get();

// 3. Beenden (nimmt keine neuen Tasks an, arbeitet Rest-Queue ab)
pool.shutdown();
```

## Warum darf der **Executor Service** niemals für rekursive Probleme genutzt werden?

- Führt zum **Rekursions-Deadlock** (Starvation).
- Threads blockieren bei `get()` komplett, während sie auf Sub-Tasks warten.
- Diese Sub-Tasks landen in der globalen Queue, finden aber keine freien Threads mehr.
- **Regel**: Nur für **flache Strukturen** nutzen (z.B. Web-Requests).

## Wie ist die **Queue-Architektur** des **Fork/Join Frameworks** aufgebaut?

- Besitzt eine **globale Queue** für initiale Tasks.
- Jeder Worker-Thread besitzt zusätzlich eine **eigene, lokale Double-Ended Queue (Deque)**.

## Wie funktioniert das **Work Stealing** im Fork/Join Framework bezüglich LIFO und FIFO?

- **LIFO (eigene Tasks)**: Thread legt Sub-Tasks oben auf eigenen Stack und arbeitet von oben ab (maximiert **Cache-Lokalität**).
- **FIFO (Work Stealing)**: Bei Leerlauf stiehlt ein Thread von **unten** aus einer fremden Deque.
- **Vorteil**: Erwischt die ältesten Tasks (grosser verbleibender Teilbaum) \\( \rightarrow \\) minimaler Overhead, perfektes **Load Balancing**.

## Warum führt `join()` im **Fork/Join Framework** nicht zu einem Rekursions-Deadlock?

- `join()` blockiert den zugrundeliegenden OS-Thread **nicht** untätig.
- Der Thread arbeitet während der Wartezeit intern **andere Tasks aus der lokalen Queue** ab.

## Was bewirkt die Optimierung **Sequential Cutoff** im Fork/Join Framework?

- Kleinst-Tasks erzeugen mehr **Verwaltungs-Overhead** als Rechennutzen.
- Basis-Tasks müssen **ausreichend gross** gewählt werden (ca. \\( 100 \\) bis \\( 10'000 \\) Operationen).
- Diese Basis-Aufgaben werden am Ende **sequenziell** (z.B. per `for`-Loop) berechnet.

## Wie wird eine Task-Klasse mit Rückgabewert im **Fork/Join Framework** im Code definiert?

```java
// 1. Klasse erbt von RecursiveTask<V> (für Tasks mit Resultat)
public class MyTask extends RecursiveTask<Integer> {
    
    // 2. Kernlogik durch Überschreiben von compute() implementieren
    @Override
    protected Integer compute() {
        // Base Case & Recursive Case Logik
        return 42; 
    }
}
```

- *(Hinweis: Für Tasks ohne Rückgabewert erbt man stattdessen von `RecursiveAction`)*.

## Wie wird ein Task im **Fork/Join Framework** vom Main-Thread aus (ausserhalb des Frameworks) initialisiert und gestartet?

```java
// 1. Thread-Pool für das Framework erstellen
ForkJoinPool pool = new ForkJoinPool();

// 2. Initialen Task (Gesamtproblem) instanziieren
MyTask rootTask = new MyTask(gesamtesArray);

// 3. Task starten und auf Resultat warten (blockiert Main-Thread)
Integer result = pool.invoke(rootTask);
```

## Wie sieht die optimale Code-Reihenfolge aus, um den **Thread-Overhead** bei zwei Teilaufgaben im Fork/Join Framework zu halbieren?

```java
MyTask left = new MyTask(ersteHaelfte);
MyTask right = new MyTask(zweiteHaelfte);

// 1. Erste Hälfte asynchron in die eigene Deque legen
left.fork();

// 2. Zweite Hälfte direkt synchron im SELBEN Thread berechnen
Integer r = right.compute();

// 3. Aktiv auf das Resultat der ersten Hälfte warten
Integer l = left.join();

return l + r;
```

- **Wichtig**: `compute()` muss zwingend **vor** `join()` aufgerufen werden, da der Thread sonst blockiert, bevor er die zweite Hälfte berechnen kann.
