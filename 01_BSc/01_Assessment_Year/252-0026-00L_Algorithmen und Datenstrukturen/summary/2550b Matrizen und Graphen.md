## Grundlagen: Adjazenzmatrix & Wege

- **Adjazenzmatrix ($A_G$)**: $n \times n$ Matrix; $A_{i,j}=1$ falls Kante $(i,j)\in E$, sonst $0$.
- **Theorem (Wegeanzahl)**: Der Eintrag $(i, j)$ in der Potenz $A_G^k$ entspricht exakt der **Anzahl der Wege** von $i$ nach $j$ mit Länge $k$ .[^thm2.1]
    - **Beweis**: Vollständige Induktion über $k$; Matrixmultiplikation summiert Kombinationen über Zwischenknoten.

## Verallgemeinerung: Algebraische Strukturen (Halbringe)

Generalisierung der Pfadprobleme durch Variation der Operatoren im **Halbring** (*Semiring*). Nutzung der Assoziativität & Distributivität für effiziente Berechnung.

### Die drei Grundprobleme

Analog zur Matrixmultiplikation (Zeile $\times$ Spalte), aber mit anderen Operatoren für "Summe" und "Produkt".

1. **Anzahl der Wege ($N^{(k)}$)**:
    - Operatoren: **Summe** ($+$) und **Produkt** ($\cdot$).
    - Entspricht klassischer Matrixmultiplikation über $\mathbb{R}$.
    - $N^{(k)} = N^{(k-1)} \cdot A_G$.

2. **Existenz eines Weges ($L^{(k)}$)** - *Reachability*:
    - Operatoren: **Logisches ODER** ($\lor$) und **Logisches UND** ($\land$).
    - **Boolescher Halbring**.
    - $L^{(k)}_{i,j} = \bigvee_s (L^{(k-1)}_{i,s} \land A_{s,j})$.

3. **Minimale Kosten ($M^{(k)}$)** - *Shortest Path*:
    - Operatoren: **Minimum** ($\min$) und **Summe** ($+$).
    - **Tropischer Halbring** (*Min-Plus Semiring*).
    - $M^{(k)}_{i,j} = \min_s \{ M^{(k-1)}_{i,s} + c(s, j) \}$.
    - Basis $M^{(1)}$: Kantengewichte (bzw. $\infty$).

## Anwendungen der Matrixpotenzierung

Analyse struktureller Eigenschaften mittels $A_G^k$.

- **Anzahl der Dreiecke**:
    - Dreieck $\hat{=}$ Zyklus der Länge 3.
    - $(A_G^3)_{i,i} \hat{=}$ Anzahl Wege $i \to i$ der Länge 3.
    - Korrektur (jeder Knoten zählt, Startpunkt egal): $\text{Anzahl} = \frac{1}{3} \text{Spur}(A_G^3)$.
- **Anzahl Kreise der Länge 4**:
    - Basis: $(A_G^4)_{i,i}$.
    - **Problem**: Zählt degenerierte Pfade $i \to u \to i \to u \to i$ (keine echten Kreise).
    - Korrektur: Abzug der "Hin-und-Her"-Pfade (entspricht $(A_G^2)_{i,i}$ im Quadrat).
    - Formel: $\frac{1}{4} \left( \text{Spur}(A_G^4) - \sum_{i=1}^n ((A_G^2)_{i,i})^2 \right)$.
- **Erreichbarkeit (*All-Pairs Reachability*)**:
    - **Trick**: Hinzufügen von **Schleifen** (*Self-loops*) $(v, v)$ für alle Knoten ("Warten" möglich).
    - Pfad max. Länge $n-1$ wird zu Pfad exakt Länge $n-1$.
    - Berechnung: Matrix $R = (A_G + I)^{n-1}$. Eintrag $>0 \iff$ erreichbar.

## Algorithmen & Komplexität

Laufzeit abhängig von Matrixmultiplikation-Kosten $MM(n)$.

- **Naive Potenzierung ($A^n$)**:
    - $n$ Multiplikationen.
    - Laufzeit (naiv): $O(n^4)$.
- **Iteriertes Quadrieren (*Repeated Squaring*)**:
    - Berechnung $A^{2k} = A^k \cdot A^k$.
    - Nur $\lceil \log_2 n \rceil$ Multiplikationen nötig.
    - Laufzeit (naiv): $O(n^3 \log n)$.
- **Schnelle Matrixmultiplikation (Strassen-Algorithmus)**:
    - *Divide & Conquer*: Reduziert Multiplikationen pro Schritt (7 statt 8).
    - Komplexität: $O(n^{\log_2 7}) \approx O(n^{2.807})$.
    - Gesamt (mit iteriertem Quadrieren): $O(n^{2.807} \log n)$.
    - **Galaktische Algorithmen**: Theoretisch $O(n^{2.37})$, aber praktisch relevante Konstanten.

[^thm2.1]: **Theorem 2.1.** Sei $G = (V, E)$ ein Graph mit Adjazenzmatrix $A_G$. Dann ist der Eintrag $(i, j)$ in $A_G^k$ die Anzahl der Wege von $i$ nach $j$ in $G$ der Länge $k$.
