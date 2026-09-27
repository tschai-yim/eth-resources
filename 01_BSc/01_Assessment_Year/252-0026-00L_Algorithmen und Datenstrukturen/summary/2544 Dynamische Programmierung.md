## Allgemeine Theorie

### Grundlagen

- **Kernidee**: Problemzerlegung in kleinere, überlappende **Teilprobleme**; Wiederverwendung der Lösungen.
- **Zwei Hauptansätze**:
    - **Top-Down mit Memoization**:
        - Direkte, rekursive Implementierung.
        - Speichern berechneter Werte in einem Memo (z.B. Array).
        - Vor jedem rekursiven Aufruf: Prüfung, ob Wert bereits im Memo existiert.
        - **Vorteil**: Berechnet nur tatsächlich benötigte Werte.
        - **Nachteil**: Risiko eines **Stack Overflow** bei grosser Rekursionstiefe.
    - **Bottom-Up (iterativ/induktiv)**:
        - Lösen der Teilprobleme in expliziter Reihenfolge (von klein nach gross).
        - Speichern der Ergebnisse in einer **DP-Tabelle**.
        - **Vorteil**: Kein Risiko eines Stack Overflow, oft übersichtlicherer Code.
        - **Nachteil**: Erfordert explizite Festlegung der Berechnungsreihenfolge; berechnet oft unnötige Werte.
- **Allgemeiner Ablauf**:
    1. Geeignetes **Teilproblem** definieren (oft der schwierigste Schritt).
    2. **Rekursionsgleichung** für das Teilproblem aufstellen.
    3. Lösungen der Teilprobleme berechnen (Bottom-Up oder Top-Down).
    4. Lösung des Gesamtproblems aus Teillösungen zusammensetzen.
    5. Laufzeit und Speicherbedarf analysieren.

### Komplexitätstheorie & DP

- **Pseudo-polynomielle Laufzeit**:
    - Laufzeit ist polynomiell in den numerischen Werten der Eingabe (z.B. $O(n \cdot b)$), aber **exponentiell** in der *Länge* der Eingabe (Anzahl Bits, z.B. $\log b$).
    - Betrifft Probleme wie **Teilsummenproblem** und **Rucksackproblem**.
- **P vs. NP**:
    - **Klasse P**: Probleme, lösbar in **polynomieller Zeit**.
    - **Klasse NP**: Probleme, bei denen eine gegebene Lösung in **polynomieller Zeit verifizierbar** ist.
    - Es gilt $P \subseteq NP$. Die gängige Vermutung ist **$P \neq NP$**.
- **NP-Vollständigkeit**:
    - Die "schwersten" Probleme in NP.
    - Ein polynomieller Algorithmus für ein einziges NP-vollständiges Problem würde $P=NP$ beweisen.
    - Das **Teilsummenproblem** und das **Rucksackproblem** sind NP-vollständig.[^thr2.9][^thr2.10]

## Probleme & Lösungsansätze

### Maximum Subarray Sum

- **Problem**: Finde zusammenhängendes Teilarray $A[i..j]$ mit maximaler Summe (Zahlen können negativ sein).[^def1.1]
- **Optimalität**: Laufzeit $\Theta(n)$ ist optimal, da jeder Eintrag gelesen werden muss.
- **Ansatz: Randmaximum (Kadane's Algorithm)**
    - **Teilproblem**: $R_j$ = Maximale Summe eines Teilarrays, das exakt am Index $j$ endet.
    - **Basisfall**: $R_1 = A[1]$.
    - **Rekursion**: $R_j = \max \{ A[j], R_{j-1} + A[j] \}$.
    - **Lösung**: $S^* = \max \{ \max_{1 \le j \le n} R_j, 0 \}$ (0 falls leeres Array erlaubt).
    - **Laufzeit**: $\Theta(n)$.
    - **Speicher**: $\Theta(1)$ (nur aktuelles Randmaximum und globales Maximum nötig).

### Jump Game

- **Problem**: Minimale Anzahl Sprünge von Position 1 zu $n$, wobei $A[i]$ die maximale Sprungweite ist.[^def2.1]
- **Optimalität**: $\Theta(n)$ ist optimal (jeder Eintrag muss potenziell gelesen werden).
- **Ansatz: Reichweite pro Sprungzahl**
    - **Idee**: Statt *Min Sprünge bis $i$* (Ansatz 1) berechnen wir *Max Reichweite mit $k$ Sprüngen* (Ansatz 2).
    - **Teilproblem**: $M[k]$ = Maximaler Index, der mit genau $k$ Sprüngen erreicht werden kann.
    - **Basisfall**: $M[0] = 1$.
    - **Rekursion**: $M[k] = \max \{ i + A[i] \mid M[k-2] < i \le M[k-1] \}$.
        - *Hinweis*: Wir betrachten nur Indizes $i$, die neu mit dem $(k-1)$-ten Sprung erreicht wurden.
    - **Lösung**: Kleinstes $k$, für das $M[k] \ge n$.
    - **Laufzeit**: $O(n)$ (Jeder Index $i$ wird nur einmal betrachtet).
    - **Speicher**: $O(1)$ (nur letzte zwei Werte von $M$ nötig).

### Längste Gemeinsame Teilfolge (LGT/LCS)

- **Problem**: Finde Länge der längsten Sequenz, die in beiden Strings $A$ und $B$ als Teilfolge vorkommt (nicht konsekutiv).[^def2.2]
- **Anwendung**: Diff-Tools (Vergleich von Textversionen), Bioinformatik (DNA-Vergleich).
- **Optimalität**: Kein Algorithmus mit Laufzeit $O((nm)^{1-\epsilon})$ bekannt (unter bestimmten theoretischen Annahmen).
- **Ansatz: 2D-Tabelle**
    - **Teilproblem**: $L[i, j]$ = Länge der LGT der Präfixe $A[1..i]$ und $B[1..j]$.
    - **Basisfälle**: $L[i, 0] = 0$ und $L[0, j] = 0$.
    - **Rekursion**:
        - Falls $A[i] = B[j]$: $L[i, j] = 1 + L[i-1, j-1]$.
        - Falls $A[i] \neq B[j]$: $L[i, j] = \max \{ L[i-1, j], L[i, j-1] \}$.
    - **Lösung**: $L[n, m]$.
    - **Laufzeit**: $\Theta(n \cdot m)$.
    - **Speicher**: $\Theta(n \cdot m)$ (oder $\Theta(\min(n,m))$ wenn nur Länge gesucht).

### Editierdistanz (Levenshtein)

- **Problem**: Minimale Anzahl Operationen (Einfügen, Löschen, Ersetzen), um String $A$ in $B$ umzuwandeln.[^def2.3]
- **Anwendung**: Rechtschreibprüfung, Ähnlichkeitssuche.
- **Ansatz: 2D-Tabelle**
    - **Teilproblem**: $ED[i, j]$ = Editierdistanz zwischen $A[1..i]$ und $B[1..j]$.
    - **Basisfälle**: $ED[i, 0] = i$ (alles löschen), $ED[0, j] = j$ (alles einfügen).
    - **Rekursion**:
        - $ED[i, j] = \min \begin{cases} ED[i-1, j] + 1 & \text{(Löschen)} \\ ED[i, j-1] + 1 & \text{(Einfügen)} \\ ED[i-1, j-1] + \mathbb{I}(A[i] \neq B[j]) & \text{(Ersetzen/Match)} \end{cases}$
        - *Hinweis*: $\mathbb{I}$ ist 1 falls ungleich, sonst 0.
    - **Lösung**: $ED[n, m]$.
    - **Laufzeit**: $\Theta(n \cdot m)$.
    - **Speicher**: $\Theta(n \cdot m)$ (reduzierbar auf $\Theta(\min(n,m))$ für nur Distanz).

### Teilsummenproblem (Subset Sum)

- **Problem**: Gibt es eine Teilmenge von $A$, deren Summe genau $b$ ergibt?[^def2.4]
- **Optimalität**: NP-vollständig (kein rein polynomieller Algorithmus bekannt).
- **Ansatz: Erreichbarkeit von Summen**
    - **Teilproblem**: $T(i, s)$ = Wahrheitswert (1/0), ob Summe $s$ mit den ersten $i$ Zahlen bildbar ist.[^def2.5]
    - **Basisfälle**: $T(0, 0) = 1$, $T(0, s) = 0$ für $s > 0$.
    - **Rekursion**: $T(i, s) = T(i-1, s) \lor T(i-1, s - A[i])$ (falls $s \ge A[i]$).
    - **Lösung**: $T(n, b)$.
    - **Laufzeit**: $O(n \cdot b)$ (Pseudo-polynomiell).
    - **Speicher**: $O(n \cdot b)$ (reduzierbar auf $O(b)$).

### Das Rucksackproblem (Knapsack)

- **Problem**: Wähle Gegenstände (Gewicht $w_i$, Profit $p_i$) aus, um Gesamtprofit zu maximieren, ohne Limit $W$ zu überschreiten.[^def2.6]
- **Optimalität**: NP-vollständig.
- **Ansatz 1: Abhängig vom Gewicht (Standard)**
    - **Teilproblem**: $P(i, w)$ = Max Profit mit ersten $i$ Items und Gewichtslimit $w$.[^def2.7]
    - **Basisfälle**: $P(0, w) = 0$.
    - **Rekursion**: $P(i, w) = \max \{ P(i-1, w), p_i + P(i-1, w - w_i) \}$ (falls $w \ge w_i$).
    - **Lösung**: $P(n, W)$.
    - **Laufzeit**: $\Theta(n \cdot W)$ (Pseudo-polynomiell).
    - **Speicher**: $\Theta(n \cdot W)$.
- **Ansatz 2: Abhängig vom Profit (Alternativ)**
    - **Idee**: Sinnvoll wenn Profit $P$ klein, aber Gewicht $W$ riesig.
    - **Teilproblem**: $G(i, p)$ = Min Gewicht, um mit ersten $i$ Items Profit $p$ zu erreichen.[^def2.8]
    - **Basisfälle**: $G(0, 0) = 0$, $G(0, p) = \infty$ für $p > 0$.
    - **Rekursion**: $G(i, p) = \min \{ G(i-1, p), w_i + G(i-1, p - p_i) \}$.
    - **Lösung**: Grösstes $p$, sodass $G(n, p) \le W$.
    - **Laufzeit**: $\Theta(n \cdot \sum p_i)$.
    - **Speicher**: $\Theta(n \cdot \sum p_i)$.

### Rucksackproblem Approximation

- **Problem**: Finde "genügend gute" Lösung in polynomieller Zeit (Trade-off Genauigkeit vs. Zeit).
- **Ansatz: FPTAS (Fully Polynomial-Time Approximation Scheme)**
    - **Idee**: Profite skalieren und runden, um den Zustandsraum von Ansatz 2 (Abhängig vom Profit) zu verkleinern.
    - **Vorgehen**:
        1. Setze Skalierungsfaktor $K = \varepsilon \cdot p_{\max} / n$.
        2. Rechne mit gerundeten Profiten $\bar{p}_i = \lfloor p_i / K \rfloor$.
        3. Löse DP mit Ansatz 2.
    - **Ergebnis**: $(1-\varepsilon)$-Approximation.
    - **Laufzeit**: $O(n^3 / \varepsilon)$ (Polynomiell in $n$ und $1/\varepsilon$).

### Längste Aufsteigende Teilfolge (LAT/LIS)

- **Problem**: Finde Länge der längsten Teilfolge in $A$, die streng aufsteigend sortiert ist.[^def2.11]
- **Optimalität**: $O(n \log n)$ ist optimal für vergleichsbasierte Verfahren.
- **Ansatz 1: Kleinste Endwerte mit 2D-Tabelle ($O(n^2)$)**
    - **Idee**: Einfachere Implementierung ohne Binäre Suche. Wir speichern für jede Länge die bestmögliche Endung.
    - **Teilproblem**: $M(i, l)$ = kleinstmögliche Endung einer aufsteigenden Teilfolge der Länge $l$ im Bereich $A[1..i]$.[^def2.14]
    - **Rekursion**:
        - Falls $A[i]$ eine Teilfolge der Länge $l-1$ verlängern kann (d.h. $M(i-1, l-1) < A[i]$), ist $A[i]$ ein potenzieller neuer Endwert für Länge $l$.
        - $M(i, l) = \min \{ M(i-1, l), A[i] \}$.
    - **Lösung**: Grösstes $l$, für das $M(n, l) < \infty$.
    - **Laufzeit**: $O(n^2)$.
    - **Speicher**: $O(n^2)$ (reduzierbar auf $O(n)$ durch Überschreiben).
- **Ansatz 2: Kleinste Endwerte mit Binärer Suche ($O(n \log n)$)**
    - **Idee**: Die Zeilen der DP-Tabelle sind sortiert. Wir brauchen nur ein Array $T$, das im Schritt $i$ die optimalen Endungen repräsentiert.
    - **Teilproblem**: $T[l]$ = Kleinster Endwert einer aufsteigenden Teilfolge der Länge $l$ (im bisher betrachteten Präfix).
    - **Basisfälle**: $T$ initialisiert mit $\infty$.
    - **Rekursion (Iterativ)**:
        - Für jedes $A[i]$: Finde Index $l$ in $T$ mittels **binärer Suche**, sodass $T[l-1] < A[i] \le T[l]$.
        - Update: $T[l] \leftarrow A[i]$.
    - **Lösung**: Grösster Index $l$, für den $T[l] < \infty$.
    - **Laufzeit**: $O(n \log n)$ ($n$ Iterationen $\times \log n$ Suche).
    - **Speicher**: $O(n)$ für Array $T$.

### Matrixkettenmultiplikation

- **Problem**: Minimiere skalare Multiplikationen für Matrixprodukt $A_1 \cdot A_2 \cdots A_n$ durch optimale Klammerung.
- **Optimalität**: Anzahl Klammerungen wächst exponentiell (Catalan-Zahlen), DP nötig.
- **Ansatz: Intervall-DP**
    - **Teilproblem**: $M(i, j)$ = Min Operationen für Teilprodukt $A_i \cdots A_j$.[^def2.15]
    - **Basisfälle**: $M(i, i) = 0$ (eine Matrix kostet nichts).
    - **Rekursion**: $M(i, j) = \min_{i \le s < j} \{ M(i, s) + M(s+1, j) + k_{i-1} k_s k_j \}$.
        - *Hinweis*: $s$ ist der Split-Punkt; Dimensionen sind $k_{i-1} \times k_i$.
    - **Lösung**: $M(1, n)$.
    - **Laufzeit**: $O(n^3)$ (Drei verschachtelte Schleifen: Länge, Startpunkt, Splitpunkt).
    - **Speicher**: $O(n^2)$.

[^thr2.9]: **Theorem 2.9**. Wenn sich das Teilsummenproblem in polynomieller Zeit lösen lässt, so ist P = NP.
[^thr2.10]: **Theorem 2.10**. Wenn sich das Rucksackproblem in polynomieller Zeit lösen lässt, so ist P = NP.
[^def1.1]: **Definition 1.1** (Maximum Subarray Sum). Gegeben sei ein Array A\[1..n] mit n ganzen Zahlen, die auch negativ sein dürfen. Gesucht ist ein Teilarray A\[i..j] mit 1 ≤ i ≤ j ≤ n, so dass die Summe $S_{i,j} := \sum_{k=i}^{j} A[k]$ maximal ist, wobei das leere Teilarray mit S = 0 ebenfalls zugelassen ist.
[^def2.1]: **Definition 2.1** (Jump Game). Gegeben sei ein Array A\[1..n] mit n positiven ganzen Zahlen. Wir starten an Position 1 im Array. Von Position i dürfen wir auf eine beliebige Position zwischen i + 1 und i + A\[i] springen. Gesucht ist die minimale Anzahl von Sprüngen, mit denen man die Position n erreichen kann.
[^def2.2]: **Definition 2.2** (Längste gemeinsame Teilfolge (LGT)). Gegeben seien zwei Strings A = (a1, . . . , an) und B = (b1, . . . , bm). Eine Teilfolge von A ist eine Folge (ai1, ai2, . . . , aik), sodass 1 ≤ i1 < i2 < . . . < ik ≤ n gilt. Eine gemeinsame Teilfolge von A und B ist eine Zeichenfolge, die sowohl Teilfolge von A als auch von B ist. Gesucht ist die Länge einer längsten gemeinsamen Teilfolge (LGT) von A und B.
[^def2.3]: **Definition 2.3** (Editierdistanz). Die Editierdistanz ED(A, B) zweier Zeichenfolgen (Strings) A und B ist die minimale Anzahl von Editieroperationen, die notwendig sind, um A in B zu überführen. Dabei sind die folgenden Editieroperationen erlaubt: Einfügen, Löschen, Ersetzen.
[^def2.4]: **Definition 2.4** (Teilsummenproblem (Subset Sum)). Gegeben seien n Zahlen A, . . . , A\[n] und eine weitere Zahl b. Alle diese Zahlen seien natürliche Zahlen. Gesucht ist eine Teilmenge I ⊆ {1, . . . , n}, sodass $\sum_{i \in I} A[i] = b$.
[^def2.5]: **Definition 2.5** (Teilproblem). Für jedes i ∈ {0, 1, . . . , n} und jedes s ∈ N sei T(i, s) definiert als die Antwort auf die Frage, ob s eine Teilsumme von A\[1..i] ist. Formal: $T(i, s) = \begin{cases} 1 & \text{falls es eine Teilmenge } I \subseteq \{1, .., i\} \text{ gibt mit } \sum_{j \in I} A[j] = s \\ 0 & \text{sonst} \end{cases}$
[^def2.6]: **Definition 2.6** (Rucksackproblem (Knapsack)). Gegeben seien ein Gewichtslimit W und n Gegenstände mit Gewicht $w_i \in N$ und Profit $p_i \in N$ für i = 1, . . . , n. Gesucht ist eine Teilmenge I ⊆ {1, . . . , n}, sodass $\sum_{i \in I} w_i \leq W$, und $\sum_{i \in I} p_i$ maximal unter dieser Bedingung ist.
[^def2.7]: **Definition 2.7** (Teilproblem). Für jedes i ∈ {0, 1, . . . , n} und jedes w ∈ N sei P(i, w) definiert als der maximale Profit, den man mit Gewichtslimit w mit den ersten i Gegenständen erreichen kann.
[^def2.8]: **Definition 2.8** (Alternatives Teilproblem). Für jedes 0 ≤ i ≤ n und jedes 0 ≤ p ≤ P sei G(i, p) definiert als das minimale Gewicht, das man benötigt, um mit den ersten i Gegenständen den Profit p zu erreichen oder zu überschreiten.
[^def2.11]: **Definition 2.11** (Längste aufsteigende Teilfolge). Gegeben sei ein Array A\[1..n] von n verschiedenen ganzen Zahlen. Gesucht ist die Länge einer längsten aufsteigenden Teilfolge von A.
[^def2.14]: **Definition 2.14** (Teilproblem (Versuch 4)). Für jedes i ∈ {1, . . . , n} und jedes l ∈ {1, . . . , n} sei M(i, l) definiert als die kleinstmögliche Endung einer aufsteigenden Teilfolge der Länge l im Bereich A\[1..i]. Falls es keine solche Teilfolge gibt, so sei M(i, l) = ∞.
[^def2.15]: **Definition 2.15** (Teilproblem). Für 1 ≤ i ≤ j ≤ n sei M(i, j) die minimale Anzahl an Operationen, die man benötigt, um das Produkt $A_i \cdot A_{i+1} \cdots A_j$ zu berechnen.
