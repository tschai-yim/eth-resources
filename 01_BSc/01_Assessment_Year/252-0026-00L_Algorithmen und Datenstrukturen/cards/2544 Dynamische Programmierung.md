## Was ist das **Maximum Subarray Sum** Problem und dessen Komplexität?

- **Problem**: Finde zusammenhängendes Teilarray \\(A[i..j]\\) mit maximaler Summe (Zahlen können negativ sein).
    - *Definition*: Gegeben Array \\(A[1..n]\\). Gesucht ist \\(A[i..j]\\) (\\(1 \le i \le j \le n\\)), sodass \\(S_{i,j} := \sum_{k=i}^{j} A[k]\\) maximal ist (leeres Array mit \\(S=0\\) zugelassen).
- **Optimalität**: Laufzeit \\(\Theta(n)\\) ist optimal, da jeder Eintrag gelesen werden muss.

## Wie funktioniert der **Randmaximum-Ansatz (Kadane's Algorithm)** für Maximum Subarray Sum?

- **Teilproblem**: \\(R_j\\) = Maximale Summe eines Teilarrays, das exakt am Index \\(j\\) endet.
- **Basisfall**: \\(R_1 = A[1]\\).
- **Rekursion**: \\(R_j = \max \{ A[j], R_{j-1} + A[j] \}\\).
- **Lösung**: \\(S^* = \max \{ \max_{1 \le j \le n} R_j, 0 \}\\) (0 falls leeres Array erlaubt).
- **Laufzeit**: \\(\Theta(n)\\).
- **Speicher**: \\(\Theta(1)\\) (nur aktuelles Randmaximum und globales Maximum nötig).

## Was ist das **Jump Game** Problem und dessen Komplexität?

- **Problem**: Minimale Anzahl Sprünge von Position 1 zu \\(n\\), wobei \\(A[i]\\) die maximale Sprungweite ist.
    - *Definition*: Start bei 1. Von \\(i\\) Sprung auf beliebiges Ziel zwischen \\(i+1\\) und \\(i+A[i]\\). Gesucht: Min. Sprünge bis \\(n\\).
- **Optimalität**: \\(\Theta(n)\\) ist optimal (jeder Eintrag muss potenziell gelesen werden).

## Wie funktioniert der **Ansatz "Reichweite pro Sprungzahl"** für das Jump Game?

- **Idee**: Statt *Min Sprünge bis \\(i\\)* berechnen wir *Max Reichweite mit \\(k\\) Sprüngen*.
- **Teilproblem**: \\(M[k]\\) = Maximaler Index, der mit genau \\(k\\) Sprüngen erreicht werden kann.
- **Basisfall**: \\(M[0] = 1\\).
- **Rekursion**: \\(M[k] = \max \{ i + A[i] \mid M[k-2] < i \le M[k-1] \}\\).
    - *Hinweis*: Wir betrachten nur Indizes \\(i\\), die neu mit dem \\((k-1)\\)-ten Sprung erreicht wurden.
- **Lösung**: Kleinstes \\(k\\), für das \\(M[k] \ge n\\).
- **Laufzeit**: \\(O(n)\\) (Jeder Index \\(i\\) wird nur einmal betrachtet).
- **Speicher**: \\(O(1)\\) (nur letzte zwei Werte von \\(M\\) nötig).

## Was ist das **Längste Gemeinsame Teilfolge (LGT/LCS)** Problem?

- **Problem**: Finde Länge der längsten Sequenz, die in beiden Strings \\(A\\) und \\(B\\) als Teilfolge vorkommt (nicht konsekutiv).
    - *Definition*: Teilfolge behält relative Reihenfolge der Indizes bei (\\(1 \le i_1 < \dots < i_k \le n\\)).
- **Anwendung**: Diff-Tools (Vergleich von Textversionen), Bioinformatik (DNA-Vergleich).
- **Optimalität**: Kein Algorithmus mit Laufzeit \\(O((nm)^{1-\epsilon})\\) bekannt.

## Wie funktioniert der **2D-Tabellen-Ansatz** für LGT/LCS?

- **Teilproblem**: \\(L[i, j]\\) = Länge der LGT der Präfixe \\(A[1..i]\\) und \\(B[1..j]\\).
- **Basisfälle**: \\(L[i, 0] = 0\\) und \\(L[0, j] = 0\\).
- **Rekursion**:
    - Falls \\(A[i] = B[j]\\): \\(L[i, j] = 1 + L[i-1, j-1]\\).
    - Falls \\(A[i] \neq B[j]\\): \\(L[i, j] = \max \{ L[i-1, j], L[i, j-1] \}\\).
- **Lösung**: \\(L[n, m]\\).
- **Laufzeit**: \\(\Theta(n \cdot m)\\).
- **Speicher**: \\(\Theta(n \cdot m)\\) (oder \\(\Theta(\min(n,m))\\) wenn nur Länge gesucht).

## Was ist das **Editierdistanz (Levenshtein)** Problem?

- **Problem**: Minimale Anzahl Operationen (Einfügen, Löschen, Ersetzen), um String \\(A\\) in \\(B\\) umzuwandeln.
- **Anwendung**: Rechtschreibprüfung, Ähnlichkeitssuche.

## Wie funktioniert der **2D-Tabellen-Ansatz** für die Editierdistanz?

- **Teilproblem**: \\(ED[i, j]\\) = Editierdistanz zwischen \\(A[1..i]\\) und \\(B[1..j]\\).
- **Basisfälle**: \\(ED[i, 0] = i\\) (alles löschen), \\(ED[0, j] = j\\) (alles einfügen).
- **Rekursion**:
    \\[ED[i, j] = \min \begin{cases} ED[i-1, j] + 1 & \text{(Löschen)} \\ ED[i, j-1] + 1 & \text{(Einfügen)} \\ ED[i-1, j-1] + \mathbb{I}(A[i] \neq B[j]) & \text{(Ersetzen/Match)} \end{cases}\\]
    - *Hinweis*: \\(\mathbb{I}\\) ist 1 falls ungleich, sonst 0.
- **Lösung**: \\(ED[n, m]\\).
- **Laufzeit**: \\(\Theta(n \cdot m)\\).
- **Speicher**: \\(\Theta(n \cdot m)\\) (reduzierbar auf \\(\Theta(\min(n,m))\\) für nur Distanz).

## Was ist das **Teilsummenproblem (Subset Sum)** und dessen Komplexität?

- **Problem**: Gibt es eine Teilmenge \\(I \subseteq \{1, \dots, n\}\\), sodass \\(\sum_{i \in I} A[i] = b\\)?
- **Optimalität**: NP-vollständig (kein rein polynomieller Algorithmus bekannt).
    - *Theorem*: Wenn in polynomieller Zeit lösbar, so ist P = NP.

## Wie funktioniert der **Erreichbarkeit von Summen-Ansatz** für Subset Sum?

- **Teilproblem**: \\(T(i, s)\\) = Wahrheitswert (1/0), ob Summe \\(s\\) mit den ersten \\(i\\) Zahlen bildbar ist.
- **Basisfälle**: \\(T(0, 0) = 1\\), \\(T(0, s) = 0\\) für \\(s > 0\\).
- **Rekursion**: \\(T(i, s) = T(i-1, s) \lor T(i-1, s - A[i])\\) (falls \\(s \ge A[i]\\)).
- **Lösung**: \\(T(n, b)\\).
- **Laufzeit**: \\(O(n \cdot b)\\) (Pseudo-polynomiell).
- **Speicher**: \\(O(n \cdot b)\\) (reduzierbar auf \\(O(b)\\)).

## Was ist das **Rucksackproblem (Knapsack)** und dessen Komplexität?

- **Problem**: Wähle Gegenstände (Gewicht \\(w_i\\), Profit \\(p_i\\)) aus, um Gesamtprofit zu maximieren, ohne Limit \\(W\\) zu überschreiten.
    - *Definition*: Suche \\(I \subseteq \{1, \dots, n\}\\), sodass \\(\sum_{i \in I} w_i \le W\\) und \\(\sum_{i \in I} p_i\\) maximal.
- **Optimalität**: NP-vollständig (Theorem: Wenn in Poly-Zeit lösbar, dann P = NP).

## Wie funktioniert der **gewichts-abhängige Ansatz (Standard)** für das Rucksackproblem?

- **Teilproblem**: \\(P(i, w)\\) = Max Profit mit ersten \\(i\\) Items und Gewichtslimit \\(w\\).
- **Basisfälle**: \\(P(0, w) = 0\\).
- **Rekursion**: \\(P(i, w) = \max \{ P(i-1, w), p_i + P(i-1, w - w_i) \}\\) (falls \\(w \ge w_i\\)).
- **Lösung**: \\(P(n, W)\\).
- **Laufzeit**: \\(\Theta(n \cdot W)\\) (Pseudo-polynomiell).
- **Speicher**: \\(\Theta(n \cdot W)\\).

## Wie funktioniert der **profit-abhängige Ansatz (Alternativ)** für das Rucksackproblem?

- **Idee**: Sinnvoll wenn Profit \\(P\\) klein, aber Gewicht \\(W\\) riesig.
- **Teilproblem**: \\(G(i, p)\\) = Min Gewicht, um mit ersten \\(i\\) Items Profit \\(p\\) zu erreichen.
- **Basisfälle**: \\(G(0, 0) = 0\\), \\(G(0, p) = \infty\\) für \\(p > 0\\).
- **Rekursion**: \\(G(i, p) = \min \{ G(i-1, p), w_i + G(i-1, p - p_i) \}\\).
- **Lösung**: Grösstes \\(p\\), sodass \\(G(n, p) \le W\\).
- **Laufzeit**: \\(\Theta(n \cdot \sum p_i)\\).
- **Speicher**: \\(\Theta(n \cdot \sum p_i)\\).

## Wie funktioniert das **FPTAS (Approximation)** für das Rucksackproblem?

- **Problem**: Finde "genügend gute" Lösung in polynomieller Zeit (Trade-off Genauigkeit vs. Zeit).
- **Idee**: Profite skalieren und runden, um den Zustandsraum des profit-abhängigen Ansatzes zu verkleinern.
- **Vorgehen**:
    1. Setze Skalierungsfaktor \\(K = \varepsilon \cdot p_{\max} / n\\).
    2. Rechne mit gerundeten Profiten \\(\bar{p}_i = \lfloor p_i / K \rfloor\\).
    3. Löse DP mit profit-abhängigem Ansatz.
- **Ergebnis**: \\((1-\varepsilon)\\)-Approximation.
- **Laufzeit**: \\(O(n^3 / \varepsilon)\\) (Polynomiell in \\(n\\) und \\(1/\varepsilon\\)).

## Was ist das **Längste Aufsteigende Teilfolge (LAT/LIS)** Problem und dessen Komplexität?

- **Problem**: Finde Länge der längsten Teilfolge in \\(A\\), die streng aufsteigend sortiert ist.
- **Optimalität**: \\(O(n \log n)\\) ist optimal für vergleichsbasierte Verfahren.

## Wie funktioniert der **Ansatz "Kleinste Endwerte mit 2D-Tabelle"** für LAT/LIS?

- **Idee**: Einfachere Implementierung ohne Binäre Suche. Speichere für jede Länge die bestmögliche Endung.
- **Teilproblem**: \\(M(i, l)\\) = kleinstmögliche Endung einer aufsteigenden Teilfolge der Länge \\(l\\) im Bereich \\(A[1..i]\\).
- **Rekursion**:
    - \\(M(i, l) = \min \{ M(i-1, l), A[i] \}\\)
    - Update nur, wenn \\(A[i]\\) eine Teilfolge der Länge \\(l-1\\) verlängern kann (d.h. \\(M(i-1, l-1) < A[i]\\)).
- **Lösung**: Grösstes \\(l\\), für das \\(M(n, l) < \infty\\).
- **Laufzeit**: \\(O(n^2)\\).
- **Speicher**: \\(O(n^2)\\) (reduzierbar auf \\(O(n)\\)).

## Wie funktioniert der **Ansatz "Kleinste Endwerte mit Binärer Suche"** für LAT/LIS?

- **Idee**: Die Zeilen der DP-Tabelle sind sortiert. Nutze Array \\(T\\), das im Schritt \\(i\\) die optimalen Endungen repräsentiert.
- **Teilproblem**: \\(T[l]\\) = Kleinster Endwert einer aufsteigenden Teilfolge der Länge \\(l\\) (im bisher betrachteten Präfix).
- **Basisfälle**: \\(T\\) initialisiert mit \\(\infty\\).
- **Rekursion (Iterativ)**:
    - Für jedes \\(A[i]\\): Finde Index \\(l\\) in \\(T\\) mittels **binärer Suche**, sodass \\(T[l-1] < A[i] \le T[l]\\).
    - Update: \\(T[l] \leftarrow A[i]\\).
- **Lösung**: Grösster Index \\(l\\), für den \\(T[l] < \infty\\).
- **Laufzeit**: \\(O(n \log n)\\).
- **Speicher**: \\(O(n)\\) für Array \\(T\\).

## Was ist das **Matrixkettenmultiplikation** Problem?

- **Problem**: Minimiere skalare Multiplikationen für Matrixprodukt \\(A_1 \cdot A_2 \cdots A_n\\) durch optimale Klammerung.
- **Optimalität**: Anzahl Klammerungen wächst exponentiell (Catalan-Zahlen), DP nötig.

## Wie funktioniert der **Intervall-DP Ansatz** für Matrixkettenmultiplikation?

- **Teilproblem**: \\(M(i, j)\\) = Min Operationen für Teilprodukt \\(A_i \cdots A_j\\).
- **Basisfälle**: \\(M(i, i) = 0\\) (eine Matrix kostet nichts).
- **Rekursion**: \\(M(i, j) = \min_{i \le s < j} \{ M(i, s) + M(s+1, j) + k_{i-1} k_s k_j \}\\).
    - *Hinweis*: \\(s\\) ist der Split-Punkt; Dimensionen sind \\(k_{i-1} \times k_i\\).
- **Lösung**: \\(M(1, n)\\).
- **Laufzeit**: \\(O(n^3)\\) (Drei verschachtelte Schleifen: Länge, Startpunkt, Splitpunkt).
- **Speicher**: \\(O(n^2)\\).
