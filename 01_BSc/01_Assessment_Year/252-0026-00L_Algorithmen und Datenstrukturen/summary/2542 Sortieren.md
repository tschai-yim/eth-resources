## Grundlagen des Sortierens

- **Problemstellung**: Finde für ein Array A eine Permutation (Umordnung) A', sodass A' aufsteigend geordnet ist. [^2]
- **Elementare Operationen**:
    - **Vergleiche**: z.B. $A[i] > A[j]$.
    - **Vertauschungen / Bewegungen**: z.B. `swap(A[i], A[j])`.
- **Inplace-Algorithmus**: Benötigt keinen wesentlichen zusätzlichen Speicher ($O(1)$ Extraplatz).

## Entwurfsprinzip: Invariante

- **Invariante**: Eine Eigenschaft, die während der Algorithmus-Ausführung (z.B. nach jeder Schleifen-Iteration) wahr bleibt.
- **Nutzen**:
    - **Algorithmus-Entwurf**: Invariante als "Bauplan" für den schrittweisen Lösungsaufbau.
    - **Korrektheitsbeweis**: Formale Verifikation der Korrektheit mittels vollständiger Induktion.

## Quadratische Sortieralgorithmen ($O(n^2)$)

- **Motivation**: Einfache, auf Invarianten basierende Algorithmen; ineffizient für grosse $n$.

### Bubble Sort

- **Idee**: Durchlaufe Array; tausche benachbarte Elemente bei falscher Ordnung. Wiederhole $n-1$ Mal.
- **Invariante**: Nach $j$ äusseren Schleifendurchläufen sind die **letzten $j$ Elemente** an ihrer finalen Position.
- **Laufzeit**:
    - Vergleiche: $\Theta(n^2)$.
    - Vertauschungen: $O(n^2)$.

### Selection Sort

- **Idee**: Erweitere sortierten Bereich, indem das grösste Element im unsortierten Teil gefunden und an die korrekte Position getauscht wird.
- **Laufzeit**:
    - Vergleiche: $\Theta(n^2)$ (für Maximumsuche).
    - Vertauschungen: $O(n)$ (nur eine pro äusserem Durchlauf).

### Insertion Sort

- **Idee**: Baue sortierten Bereich von links auf.
- **Invariante**: Die **ersten $j$ Elemente** sind untereinander sortiert (nicht zwingend final).
- **Fortschritt**: Füge nächstes Element ($A[j+1]$) an korrekter Stelle im sortierten vorderen Teil ein.
- **Laufzeit**:
    - **Vergleiche**: $O(n \log n)$ (mittels binärer Suche).
    - **Bewegungen**: $O(n^2)$ (durch Verschieben im Worst-Case).
    - **Gesamtlaufzeit**: Dominiert durch Bewegungen: $O(n^2)$.

## Effiziente Sortieralgorithmen ($O(n \log n)$)

### Merge Sort

- **Paradigma**: **Divide and Conquer**.
- **Prinzip**:
    1. **Divide**: Array in zwei Hälften teilen.
    2. **Conquer**: Beide Hälften rekursiv sortieren.
    3. **Combine**: Zwei sortierte Hälften zu einem Array mischen (**Merge**).
- **Eigenschaften**:
    - **Laufzeit**: $T(n) = 2T(n/2) + O(n) \implies O(n \log n)$.
    - **Nicht inplace**: Benötigt $O(n)$ Extra-Speicher.

### Quicksort

- **Paradigma**: **Divide and Conquer** (Hauptarbeit im Aufteilen).
- **Prinzip**:
    1. **Divide**: **Pivotelement** wählen. Array partitionieren: kleinere Elemente nach links, grössere nach rechts. Pivot ist an finaler Position.
    2. **Conquer**: Teil-Arrays links und rechts vom Pivot rekursiv sortieren.
    3. **Combine**: Nicht nötig.
- **Laufzeit**: Abhängig von Pivot-Wahl.
    - **Best Case**: Pivot teilt mittig $\implies T(n) = 2T(n/2) + O(n) \implies O(n \log n)$.
    - **Worst Case**: Pivot ist kleinstes/grösstes Element $\implies T(n) = T(n-1) + O(n) \implies O(n^2)$.
- **Verbesserung**: **Randomisierung** (zufälliges Pivot) führt zu erwarteter $O(n \log n)$ Laufzeit.

### Heapsort

- **Idee**: Beschleunigtes Selection Sort durch effizientere Maximumsuche.
- **Datenstruktur**: **Max-Heap**.
    - Ein als Array gespeicherter, **vollständiger Binärbaum**.
    - **Heap-Bedingung**: Jeder Knoten $\ge$ seine Kinder.
    - **Folgerung**: Maximum ist immer an der Wurzel (Index 1), Zugriff in $O(1)$.
    - **Array-Speicherung**: Kinder von Knoten $k$ bei $2k$ und $2k+1$.
- **Algorithmus**:
    1. **Build-Heap**: Array in Max-Heap umwandeln ($O(n)$).
    2. **Sortierphase**: $n-1$ Mal:
        - Tausche Maximum (Wurzel) ans Ende des aktiven Heaps.
        - Verkleinere Heap.
        - Repariere Heap-Bedingung durch "Versickern" (**Sift-Down**) ($O(\log n)$).
- **Eigenschaften**:
    - **Laufzeit**: $O(n \log n)$ im Worst-Case.
    - **Inplace**: $O(1)$ Extraplatz.
    - **Schlechte Lokalität**: Speicherzugriffe ( $k \to 2k$ ) sind Sprünge, oft langsam in der Praxis.

## Untere Schranke für vergleichsbasiertes Sortieren

- **Theorem**: Jeder vergleichsbasierte Sortieralgorithmus benötigt im **Worst Case** mindestens $\Omega(n \log n)$ Vergleiche.
- **Beweisidee (Entscheidungsbaum / Decision Tree)**:
    - Algorithmus als Binärbaum: Knoten = Vergleiche, Blätter = Permutationen.
    - Benötigt mind. $n!$ Blätter für alle möglichen Permutationen der Eingabe.
    - Baumhöhe $h$ (Worst-Case Laufzeit) bei max. $2^h$ Blättern $\implies 2^h \ge n! \implies h \ge \log(n!)$.
- **Nützliche Formel**: $\log(n!) = \Theta(n \log n)$.
- **Schlussfolgerung**: $O(n \log n)$ Algorithmen sind **asymptotisch optimal**.

[^2]: **Definition 2.1 (Sortieren)**. Gegeben sei ein Array A mit n Zahlen. Gesucht ist eine Permutation (Umordnung) von A, die aufsteigend sortiert ist: A[i] ≤ A[j] für alle 1 ≤ i < j ≤ n.
