## Das Auswahlproblem (Selection Problem)

Ziel: Finden eines Elements nach Rang in unsortierter Liste ohne komplettes Sortieren.

- **Problemstellung**: Gegeben Array $A$ und Index $i$, finde das $i$-kleinste Element.[^1]
    - **Median**: Spezialfall mit $i = \lceil (n+1)/2 \rceil$.
- **Motivation**: Optimierung von **QuickSort**.
    - Orakel für Median in $O(n)$ ermöglicht deterministisches QuickSort in $O(n \log n)$ (garantierte Halbierung).
- **Naive Lösungsansätze**:
    - **Sortieren**: Rückgabe $A[i]$ nach Sortierung. Laufzeit $O(n \log n)$ (zu langsam).
    - **Min-Heap**: Heap bauen ($O(n)$) und $i$-mal `extractMin`. Worst Case (Median): $O(n \log n)$.

## Quickselect

**Divide and Conquer** Verfahren zur Lösung des Auswahlproblems (verwandt mit QuickSort).

- **Prinzip**:
    1. Wähle **Pivot-Element** $p$.
    2. **Partitionierung**: Teile Array in $L$ ($<p$), $p$ und $R$ ($>p$). Sei $k$ der Index (absoluter Rang) von $p$.
    3. **Fallunterscheidung** (Vergleich gesuchter Rang $i$ mit Pivot-Position $k$):
        - $i = k$: $p$ ist gesuchtes Element.
        - $i < k$: Rekursion auf $L$ mit Index $i$.
        - $i > k$: Rekursion auf $R$ mit Index $i-k$ (Indizes im Teilarray verschieben sich).
- **Laufzeitanalyse**:
    - Unterschied zu QuickSort: Rekursion nur **einseitig**.
    - **Worst Case**: Pivot ist Min/Max. $T(n) = T(n-1) + cn \implies O(n^2)$.
    - **Best Case**: Pivot ist Median. $T(n) = T(n/2) + cn \implies O(n)$ (Geometrische Reihe).
    - **Good Case**: Pivot teilt mind. im Verhältnis $\epsilon : (1-\epsilon) \implies O(n)$.
    - **Randomized Quickselect**: Zufälliges Pivot $\implies$ erwartetes $O(n)$.

## Median der Mediane (Median of Medians)

Algorithmus zur **deterministischen** Wahl eines guten Pivots für garantierten $O(n)$ Worst Case.

- **Algorithmus (Blum, Floyd, Pratt, Rivest, Tarjan)**:
    Ersetzt zufällige Pivot-Wahl in Quickselect:
    1. **Gruppierung**: $A$ in **5er-Gruppen** teilen.
    2. **Gruppen-Mediane**: Median jeder Gruppe bestimmen ($O(1)$ pro Gruppe $\to$ total $O(n)$).
    3. **Rekursion 1**: Median $p$ des Arrays $A'$ der Gruppen-Mediane bestimmen.
    4. **Partitionierung**: $p$ als Pivot für $A$ nutzen.
    5. **Rekursion 2**: Quickselect auf relevantem Teilarray.
- **Struktur**: **Doppelte Rekursion** (Pivot-Wahl + eigentliche Suche).

## Theoretische Analyse der Laufzeit

Beweis, dass Mehraufwand für Pivot-Suche klein genug für lineare Gesamtlaufzeit ist.

- **Qualität des Pivots**:
    - $p =$ Median der Gruppen-Mediane ($|A'| = n/5$).
    - $\ge 50\%$ von $A'$ ($\approx n/10$ Elemente) sind $\le p$.
    - Pro Gruppe mit Median $< p$: 2 weitere Elemente $< p$.
    - **Garantie**: $\ge 3 \cdot (n/10) = 3n/10$ Elemente garantiert kleiner als $p$ (analog für grösser).
    - **Konsequenz**: Rekursion auf max. $7n/10$ Elementen.
- **Wahl der Gruppengrösse 5**:
    - 3er-Gruppen: Garantie zu schwach ($1/3$ weg, $2/3$ bleiben).
    - Summe Rekursionsterme: $1/3 + 2/3 = 1 \implies O(n \log n)$.
- **Rekurrenzgleichung**:
    $$T(n) \le T\left(\frac{n}{5}\right) + T\left(\frac{7n}{10}\right) + cn$$
    - $T(n/5)$: Kosten Pivot-Bestimmung.
    - $T(7n/10)$: Max. Kosten eigentliche Suche.
    - $cn$: Partitionierung & Gruppen-Mediane.
- **Lösung**:
    - $\frac{1}{5} + \frac{7}{10} = 0.9 < 1 \implies$ Arbeit nimmt pro Rekursionsebene ab.
    - Dominanz der obersten Ebene (Geometrische Reihe).
    - **Ergebnis**: $T(n) \in O(n)$ (Beweis via Induktion).

[^1]: **Definition 1.1 (Auswahlproblem)**. Gegeben sei ein Array A\[1..n] mit n verschiedenen Zahlen und ein Index i ∈ {1, . . . , n}. Gesucht ist das i-kleinste Element in A, also das Element, für das es genau i − 1 kleinere Zahlen im Array gibt.
