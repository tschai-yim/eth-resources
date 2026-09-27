## Was beschreibt die Metrik **\\( T_1 \\)** (Work) in einem Task Graphen?

- Der **Gesamtarbeitsaufwand**
- Entspricht der Ausführungszeit auf **1 Thread**
- Summe aller Knoten im Graphen

## Was beschreibt die Metrik **\\( T_p \\)** (Parallel Time) in einem Task Graphen?

- Die Ausführungszeit auf **\\( p \\) Threads**
- Ist abhängig von der eingesetzten **Hardware** und dem **Scheduler**

## Was beschreibt die Metrik **\\( T_\infty \\)** (Span / Critical Path) in einem Task Graphen?

- Den **längsten sequenziellen Pfad** durch den Graphen
- Entspricht der theoretischen Laufzeit bei **unendlich vielen Kernen**

## Woraus besteht das **Directed Acyclic Graph (DAG)** Modell für parallele Ausführungen?

- Es ist ein dynamisches **Laufzeit-Modell**
- **Nodes** (Knoten): Einzelne Arbeitseinheiten (Tasks)
- **Edges** (Kanten): Gerichtete Abhängigkeiten (Quell-Task muss zwingend vor Ziel-Task beendet sein)

## Wie berechnet sich der maximal mögliche **Parallelismus** eines Task Graphen?

- Formel: \\( T_1 / T_\infty \\)
- (Work geteilt durch Span)

## Welchen Einfluss hat die **Form** des Task Graphen (breit vs. tief) auf das Speedup?

- **Breiter Graph**: Hoher Parallelismus (kurzer \\( T_\infty \\))
- **Tiefer Graph**: Viele sequenzielle Abhängigkeiten, langer \\( T_\infty \\) \\( \rightarrow \\) **geringes Speedup**

## Was besagt das **Work Law** bezüglich der theoretischen Ausführungszeit \\( T_p \\)?

- Formel: \\( T_p \ge T_1 / p \\)
- Die Gesamtarbeit lässt sich **maximal durch \\( p \\)** (Anzahl Threads) teilen

## Was besagt das **Span Law** bezüglich der theoretischen Ausführungszeit \\( T_p \\)?

- Formel: \\( T_p \ge T_\infty \\)
- Die Laufzeit ist zwingend limitiert durch den **längsten sequenziellen Pfad**

## Wie lautet die **absolute Untergrenze** für die parallele Ausführungszeit \\( T_p \\) für jeden Scheduler?

- Formel: \\( T_p \ge \max(T_1 / p, T_\infty) \\)

## Wie teilen sich **Framework** und **Programmierer** die Zuständigkeiten für Laufzeit-Optimierungen auf?

- **Framework** (z.B. ForkJoin):
    - Effiziente Thread-Zuweisung
    - Minimiert Leerlauf (hält \\( T_p \\) nahe am Optimum)
- **Programmierer**:
    - Minimierung von **\\( T_\infty \\)** beim Algorithmus-Design
    - Darf dabei den Gesamtaufwand (\\( T_1 \\)) nicht explodieren lassen

## Was macht das **Reductions** (Reduktion) Entwurfsmuster?

- Verdichtet eine Datensammlung auf ein **Einzelresultat**
- *Beispiele*: Summe, Maximum
- **Paralleler Span**: \\( O(\log n) \\)

## Welche zwingende Eigenschaft muss der Operator bei einer parallelen **Reduktion** aufweisen und warum?

- Operator muss **assoziativ** sein
- **Gefahr**: Nicht-assoziative Operatoren (z.B. Subtraktion, Median) führen zu falschen Resultaten oder erzwingen eine langsame Synchronisierung

## Was macht das **Map** Entwurfsmuster?

- Wendet eine Funktion **1:1 pro Element** an
- Die Output-Grösse ist exakt gleich der Input-Grösse

## Was macht das **Zip Map** Entwurfsmuster?

- Eine Map-Operation mit **mehreren Inputs**
- *Beispiel*: Vektor-Addition

## Was macht das **Stencil** Entwurfsmuster?

- Der Output eines Elements ist abhängig von seiner **Input-Nachbarschaft**
- *Beispiele*: Glättungsfilter oder Kantenerkennung in der Bildverarbeitung

## Warum sind **Arrays** und **Linked Lists** unterschiedlich gut für parallele Entwurfsmuster geeignet?

- **Arrays / Balancierte Bäume**:
    - Erlauben ein schnelles, paralleles Aufteilen (Zugriff in \\( O(\log n) \\))
- **Linked Lists**:
    - Erzwingen ein **sequenzielles Durchschliessen** (Zugriff in \\( O(n) \\))
    - Vernichten die Parallelisierbarkeit (Amdahl's Law Flaschenhals)

## Was ist das Ziel des **Prefix-Sum Problems**?

- Generierung eines Arrays mit **fortlaufenden Summen**
- \\[output[i] = \sum_{k=0}^i input[k]\\]

## Warum ist ein naiver Ansatz für das **Prefix-Sum Problem** ungeeignet?

- Erfordert eine **sequenzielle Schleife**
- Führt zu Work \\( O(n) \\) und Span \\( O(n) \\)
- **Resultat**: Kein paralleles Speedup möglich

## Was geschieht im ersten Schritt (**Up-Pass / Bottom-up**) des parallelen Prefix-Sum Algorithmus?

- Aufbau eines **rekursiven Binärbaums**
- Die Knoten speichern fortlaufend die **Bereichssummen** ihrer Kinder
- Die Blätter entsprechen den originalen Array-Werten

## Was geschieht im zweiten Schritt (**Down-Pass / Top-down**) des parallelen Prefix-Sum Algorithmus?

- Baum-Traversierung von oben nach unten zur Weitergabe eines Korrekturwerts (**`fromLeft`**, Startwert bei Root = \\( 0 \\))
- **Linkes Kind**: Erhält unverändert das `fromLeft` des Parents
- **Rechtes Kind**: Erhält `fromLeft` des Parents **+** Bereichssumme des linken Geschwisters (aus dem Up-Pass)
- **Blattebene**: Schreibt das finale Resultat (\\( output[i] = fromLeft + input[i] \\))

## Was ist das Ziel des **Pack** (Filter) Algorithmus?

- Extraktion aller Elemente aus einer Menge, welche eine **spezifische Bedingung** erfüllen

## Aus welchen drei parallelen Schritten besteht der **Pack** (Filter) Algorithmus?

1. **Parallel Map**: Erstellt einen Bit-Vektor (\\( 1 \\) bei erfüllter Bedingung, sonst \\( 0 \\))
2. **Parallel Prefix-Sum**: Wird auf den Bit-Vektor angewandt, um die **exakten Ziel-Indizes** für das neue Array zu berechnen
3. **Parallel Map**: Prüft den Bit-Vektor an Stelle \\( i \\). Falls \\( 1 \\), schreibe das Input-Element an die berechnete Position (`PrefixSum[i] - 1`)

## Warum skaliert der klassische **Standard-Quicksort** schlecht in parallelen Umgebungen?

- Die rekursiven Aufrufe (Teilbäume) sind zwar parallelisierbar, aber das **Partitionieren** (Aufteilung am Pivot) ist **sequenziell**
- Dies limitiert den Span auf \\( O(n) \\)

## Wie funktioniert das **parallele Partitionieren** im modifizierten Quicksort?

- Nutzt ein **doppeltes Pack-Pattern**:
    - Ein Pack-Durchlauf für Elemente **\\( < \\) Pivot**
    - Ein Pack-Durchlauf für Elemente **\\( > \\) Pivot**
- Erfordert **Zusatzspeicher** (ist nicht mehr *in-place*)
- Reduziert den Partitionierungs-Span drastisch auf \\( O(\log n) \\)

## Welche Laufzeit-Resultate liefert der **Parallel Quicksort** durch das parallele Partitionieren?

- Totaler Span sinkt auf **\\( O(\log^2 n) \\)**
- Massiv höherer Parallelismus (\\( O(n / \log n) \\))
- Eignet sich ideal für riesige Datensätze
