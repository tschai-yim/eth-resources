## Grundlagen & Modellierung

- **Unit-cost Random Access Machine (RAM) Model**:
    - Abstraktes Computermodell (Prozessor + Speicher).
    - **Random Access**: Zugriff auf beliebige Speicherzelle in konstanter Zeit.
    - **Unit Cost**: Jede **elementare Operation** kostet genau 1 Zeiteinheit.
    - **Elementare Operationen**: Arithmetik ($+, -, *, /$), Datenbewegung (Load, Store, Copy), Logik/Vergleiche (If, $<, >$).
- **Laufzeitmessung**:
    - Anzahl elementarer Operationen in Abhängigkeit von Input $n$.
    - Ignorieren hardware-spezifischer Konstanten (Fokus auf Skalierbarkeit).

## Asymptotische Notation (Theorie)

- **Konzept**: Klassifizierung von Funktionen nach Wachstumsverhalten für $n \to \infty$.
- **O-Notation (Obere Schranke / Upper Bound)**:
    - $f(n) \le O(g(n)) \implies$ $f$ wächst **höchstens** so schnell wie $g$.
    - **Formal**: $\exists C > 0, \forall n \in \mathbb{N}: f(n) \le C \cdot g(n)$ .[^ex2_def1]
    - Anwendung: **Worst-Case** Analysen.
- **$\Omega$-Notation (Untere Schranke / Lower Bound)**:
    - $g(n) \ge \Omega(f(n)) \implies$ $g$ wächst **mindestens** so schnell wie $f$ (äquivalent zu $f \le O(g)$).
    - **Formal**: $\exists C > 0, \forall n \in N: g(n) \ge C \cdot f(n)$ .[^ex3_def1]
    - Anwendung: Aussagen über Mindestaufwand, Best-Case Analysen.
- **$\Theta$-Notation (Scharfe Schranke / Tight Bound)**:
    - $g(n) = \Theta(f(n)) \implies$ $g$ wächst **genauso** schnell wie $f$.
    - Gilt, falls $g \le O(f)$ UND $g \ge \Omega(f)$.
    - **Formal**: $\exists C_1, C_2 > 0, \forall n \in N: C_1 \cdot f(n) \le g(n) \le C_2 \cdot f(n)$ .[^ex3_def2]
    - Anwendung: Exaktes asymptotisches Verhalten.

### Analyse mittels Grenzwerten (Limits)

- Bestimmung der Beziehung zweier Funktionen $f, g$ via Grenzwert des Quotienten [^ex0_def1] :[^ex3_thm1]
    - $\lim_{n \to \infty} \frac{f(n)}{g(n)} = 0 \implies f \le O(g)$ und $f \neq \Theta(g)$ (strikt langsamer).
    - $\lim_{n \to \infty} \frac{f(n)}{g(n)} = C > 0 \implies f = \Theta(g)$ (gleiches Wachstum).
    - $\lim_{n \to \infty} \frac{f(n)}{g(n)} = \infty \implies f \ge \Omega(g)$ und $f \neq \Theta(g)$ (strikt schneller).
    - **Existenz**: Erster Punkt hinreichend, aber nicht notwendig (Limes muss nicht existieren).

### Rechenregeln

- **Konstante Faktoren**: Ignorierbar ($c \cdot f \le O(f)$) .[^ex2_thm2]
- **Summen**: Dominante Funktion (stärkeres Wachstum) bestimmt Summe ($f + g \le O(\max(f, g))$) .[^ex2_thm2]
- **Transitivität**: $f \le O(g) \land g \le O(h) \implies f \le O(h)$.

## Wachstumsverhalten von Funktionen

### Hierarchie (langsam nach schnell)

1. **Konstant**: $O(1)$
2. **Logarithmisch**: $O(\log n)$
    - Basis in $O$-Notation egal ($\log_a n = \Theta(\log_b n)$ für $a,b > 1$).
    - **Wichtig**: Basis im Exponenten relevant ($n^{\log_2 n} \neq n^{\ln n}$).
3. **Polylogarithmisch**: $O((\log n)^k)$
4. **Wurzel**: $O(\sqrt{n}) = O(n^{0.5})$
5. **Linear**: $O(n)$
6. **Linear-Logarithmisch**: $O(n \log n)$ (typisch für Sortieralgorithmen).
7. **Polynomiell**: $O(n^k)$ (z.B. $n^2, n^3$). Höherer Grad wächst strikt schneller.
8. **Pseudopolynomiell**:
    - Laufzeit abhängig von **Wert** $N$, nicht **Bitlänge** $\log N$ (z.B. $O(N)$).
    - Exponentiell zur Inputgrösse (Bits).
9. **Exponentiell**: $O(c^n)$ mit $c > 1$. Wächst schneller als jedes Polynom ($n^k \le O(c^n)$).
10. **Fakultät**: $O(n!)$.
    - Identität: $\log(n!) = \Theta(n \log n)$ (Stirling-Approximation).
    - Schranken: $n! \le n^n$ und $(n/2)^{n/2} \le n!$.

### L'Hôpital Regel (Supertool für Limits)

- Berechnung von Grenzwerten bei unbestimmten Ausdrücken ($\frac{\infty}{\infty}$ oder $\frac{0}{0}$).
- **Regel**: $\lim_{x \to \infty} \frac{f(x)}{g(x)} = \lim_{x \to \infty} \frac{f'(x)}{g'(x)}$, falls differenzierbar und Nenner-Ableitung $\neq 0$ [^ex2_lhopital].[^ex3_lhopital]
- **Anwendung**: Mehrfache Anwendung möglich bis Grenzwert bestimmbar.

### Wichtige Summen & Ungleichungen

- **Gaußsche Summenformel**: $\sum_{i=1}^n i = \frac{n(n+1)}{2} = \Theta(n^2)$.
- **Summe von Kubikzahlen**: $\sum_{i=1}^n i^3 = \frac{n^2(n+1)^2}{4} = \Theta(n^4)$.
- **Geometrische Reihe**: $\sum_{i=0}^n q^i = \frac{q^{n+1}-1}{q-1}$.
    - $q > 1$: Wächst wie grösster Term $\Theta(q^n)$.
    - $q < 1$: Konvergiert gegen Konstante $\Theta(1)$.
- **Harmonische Reihe**: $\sum_{i=1}^n \frac{1}{i} = \Theta(\log n)$ (sehr langsames Wachstum).

## Beweismethoden

### Teleskopieren (Repeated Substitution)

- Lösen von Rekurrenzgleichungen (z.B. $T(n) = T(n-1) + n$).
- Methode: Wiederholtes Einsetzen in sich selbst bis Muster (geschlossene Form) erkennbar.
- **Wichtig**: Liefert nur **Vermutung** (Hypothese). Formaler Beweis via Induktion nötig.

### Vollständige Induktion (Mathematical Induction)

- Beweis einer Aussage $A(n)$ für alle $n \ge n_0$.
1. **Induktionsanfang (Base Case)**: Zeige $A(n_0)$ ist wahr.
2. **Induktionshypothese (Induction Hypothesis)**: Annahme, dass $A(k)$ für beliebiges $k \ge n_0$ wahr.
3. **Induktionsschritt (Inductive Step)**: Zeige $A(k+1)$ wahr unter Verwendung der Hypothese.
- **Anwendung**: Verifikation geschlossener Formeln für Summen oder Rekurrenzen.

## Analyse von Divide-and-Conquer (Master Theorem)

- Laufzeitanalyse rekursiver Algorithmen.
- Rekurrenz-Form: $T(n) \le a \cdot T(n/b) + C \cdot n^k$ [^ex4_master]
    - Für $T(n) \ge \dots$ gelten $\Omega$-Schranken.
    - Für $T(n) = \dots$ gelten $\Theta$-Schranken.
    - $a$: Anzahl Unterprobleme.
    - $b$: Verkleinerungsfaktor Input.
    - $n^k$: Lokale Kosten (Aufteilung + Zusammenfügen).
    - Annahme $n = 2^k$ oft zur Vereinfachung (ändert Asymptotik nicht).
- **Die 3 Fälle (Vergleich lokale Arbeit $n^k$ vs. Anzahl Blätter $n^{\log_b a}$)** :[^ex4_master]
    1. **$k > \log_b a$** (Lokale Arbeit dominiert):
        - Arbeit an Wurzel dominant.
        - Laufzeit: $T(n) = \Theta(n^k)$.
    2. **$k = \log_b a$** (Gleichgewicht):
        - Arbeit auf allen Ebenen gleich verteilt.
        - Laufzeit: $T(n) = \Theta(n^{\log_b a} \cdot \log n) = \Theta(n^k \log n)$.
    3. **$k < \log_b a$** (Blätter dominieren):
        - Anzahl der Basis-Fälle dominiert Kosten.
        - Laufzeit: $T(n) = \Theta(n^{\log_b a})$.
- **Beispiele**:
    - **Binäre Suche**: $T(n) = T(n/2) + O(1) \to a=1, b=2, k=0$.
        - $\log_2 1 = 0 = k$ (Fall 2) $\implies \Theta(\log n)$.
    - **Karatsuba**: $T(n) = 3T(n/2) + O(n) \to a=3, b=2, k=1$.
        - $\log_2 3 \approx 1.58 > 1$ (Fall 3) $\implies \Theta(n^{\log_2 3}) \approx \Theta(n^{1.58})$.
    - **Mergesort**: $T(n) = 2T(n/2) + O(n) \to a=2, b=2, k=1$.
        - $\log_2 2 = 1 = k$ (Fall 2) $\implies \Theta(n \log n)$.

[^ex2_def1]: **Definition 1** (O-Notation, Exercise sheet 2). For $f : \mathbb{N} \to \mathbb{R}^+$, $O(f) := \{g : \mathbb{N} \to \mathbb{R}^+ \mid \exists C > 0\forall n \in \mathbb{N} \ g(n) \le C \cdot f(n)\}$. We write $f \le O(g)$ to denote $f \in O(g)$. Some textbooks use here the notation $f = O(g)$.
[^ex3_def1]: **Definition 1** (Ω-Notation, Exercise sheet 3). For $f : N \to \mathbb{R}^+$, $\Omega(f) := \{g : N \to \mathbb{R}^+ \mid f \le O(g)\} = \{g : N \to \mathbb{R}^+ \mid \exists C > 0 \forall n \in N g(n) \ge C \cdot f(n)\}$. We write $g \ge \Omega(f)$ instead of $g \in \Omega(f)$.
[^ex3_def2]: **Definition 2** (Θ-Notation, Exercise sheet 3). For $f : N \to \mathbb{R}^+$, $\Theta(f) := \{g : N \to \mathbb{R}^+ \mid g \le O(f) \text{ and } f \le O(g)\} = \{g : N \to \mathbb{R}^+ \mid \exists C_1, C_2 > 0 \forall n \in N (C_1 \cdot f(n) \le g(n) \le C_2 \cdot f(n))\}$. We write $g = \Theta(f)$ instead of $g \in \Theta(f)$.
[^ex0_def1]: **Definition 1** (Asymptotic Growth, Exercise sheet 0). Let $f, g : \mathbb{N} \to \mathbb{R}^+$ be two functions. We say that $f$ grows asymptotically faster than $g$ if $\lim_{n \to \infty} \frac{g(n)}{f(n)} = 0$.
[^ex3_thm1]: **Theorem 1** (Restated Limits, Exercise sheet 3). Let $N$ be an infinite subset of $\mathbb{N}$ and $f : N \to \mathbb{R}^+$ and $g : N \to \mathbb{R}^+$.
    - If $\lim_{n \to \infty} \frac{f(n)}{g(n)} = 0$, then $f \le O(g)$, but $f \ne \Theta(g)$.
    - If $\lim_{n \to \infty} \frac{f(n)}{g(n)} = C \in \mathbb{R}^+$, then $f = \Theta(g)$.
    - If $\lim_{n \to \infty} \frac{f(n)}{g(n)} = \infty$, then $f \ge \Omega(g)$, but $f \ne \Theta(g)$.
[^ex2_thm2]: **Theorem 2** (O-Calculus, Exercise sheet 2). Let $f, g, h : \mathbb{N} \to \mathbb{R}^+$. If $f \le O(h)$ and $g \le O(h)$, then
    1. For every constant $c > 0, c \cdot f \le O(h)$.
    2. $f + g \le O(h)$.
[^ex2_lhopital]: **Theorem 1** (L'Hôpital's rule, Exercise sheet 2). Assume that functions $f : \mathbb{R}^+ \to \mathbb{R}^+$ and $g : \mathbb{R}^+ \to \mathbb{R}^+$ are differentiable, $\lim_{x\to\infty} f(x) = \lim_{x\to\infty} g(x) = \infty$ and for all $x \in \mathbb{R}^+, g'(x) \ne 0$. If $\lim_{x\to\infty} \frac{f'(x)}{g'(x)} = C \in \mathbb{R}_0^+$ or $\lim_{x\to\infty} \frac{f'(x)}{g'(x)} = \infty$, then $\lim_{x\to\infty} \frac{f(x)}{g(x)} = \lim_{x\to\infty} \frac{f'(x)}{g'(x)}$.
[^ex3_lhopital]: **Theorem 2** (L'Hôpital's rule (going to 0), Exercise sheet 3). Assume that functions $f : \mathbb{R}^+ \to \mathbb{R}$ and $g : \mathbb{R}^+ \to \mathbb{R}$ are differentiable, $\lim_{x\to\infty} f(x) = \lim_{x\to\infty} g(x) = 0$ and for all $x \in \mathbb{R}^+, g'(x) \ne 0$. If $\lim_{x\to\infty} \frac{f'(x)}{g'(x)} = C \in \mathbb{R}$ or $\lim_{x\to\infty} \frac{f'(x)}{g'(x)} = \infty$, then $\lim_{x\to\infty} \frac{f(x)}{g(x)} = \lim_{x\to\infty} \frac{f'(x)}{g'(x)}$.
[^ex4_master]: **Theorem 1** (Master theorem, Exercise sheet 4). Let $a, C > 0$ and $b \ge 0$ be constants and $T : \mathbb{N} \to \mathbb{R}^+$ a function such that for all even $n \in \mathbb{N}$, $T(n) \le aT(n/2) + Cn^b$. (1)
    Then for all $n = 2^k, k \in \mathbb{N}$, the following statements hold
    (i) If $b > \log_2 a, T(n) \le O(n^b)$.
    (ii) If $b = \log_2 a, T(n) \le O(n^{\log_2 a} \cdot \log n)$.
    (iii) If $b < \log_2 a, T(n) \le O(n^{\log_2 a})$.
    If the function $T$ is increasing, then the condition $n = 2^k$ can be dropped. If we instead have $T(n) \ge aT(n/2) + C'n^b$, (2) then we can conclude that $T(n) \ge \Omega(n^b), T(n) \ge \Omega(n^{\log_2 a} \cdot \log n)$, and $T(n) \ge \Omega(n^{\log_2 a})$ in cases (i), (ii), and (iii), respectively. Furthermore if (1) and (2) both hold (with possibly different constants $C \ne C'$), then similarly $T(n) = \Theta(n^b), T(n) = \Theta(n^{\log_2 a} \cdot \log n)$, and $T(n) = \Theta(n^{\log_2 a})$ in cases (i), (ii), and (iii), respectively.
