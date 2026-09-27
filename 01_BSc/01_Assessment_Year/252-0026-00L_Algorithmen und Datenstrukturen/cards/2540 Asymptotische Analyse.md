## Welche asymptotische Beziehung gilt, falls \\(\lim_{n \to \infty} \frac{f(n)}{g(n)} = 0\\)?

- Daraus folgt: \\(f \le O(g)\\).
- Es gilt zudem: \\(f \neq \Theta(g)\\) (da \\(f\\) strikt langsamer wächst).

## Welche asymptotische Beziehung gilt, falls \\(\lim_{n \to \infty} \frac{f(n)}{g(n)} = C > 0\\)?

- Daraus folgt: \\(f = \Theta(g)\\) (gleiches Wachstum).

## Welche asymptotische Beziehung gilt, falls \\(\lim_{n \to \infty} \frac{f(n)}{g(n)} = \infty\\)?

- Daraus folgt: \\(f \ge \Omega(g)\\).
- Es gilt zudem: \\(f \neq \Theta(g)\\) (da \\(f\\) strikt schneller wächst).

## Was besagt die Regel von L'Hôpital für Grenzwerte?

Sie dient der Berechnung von Grenzwerten bei unbestimmten Ausdrücken (\\(\frac{\infty}{\infty}\\) oder \\(\frac{0}{0}\\)).

Die **Regel** lautet:

\\[\lim_{x \to \infty} \frac{f(x)}{g(x)} = \lim_{x \to \infty} \frac{f'(x)}{g'(x)}\\]

Dies gilt unter der Voraussetzung, dass die Funktionen differenzierbar sind und die Ableitung des Nenners ungleich 0 ist.

## Welche Voraussetzungen müssen für die Anwendung von L'Hôpital erfüllt sein?

Gegeben seien differenzierbare Funktionen \\(f, g\\).

1. **Grenzverhalten**: \\(\lim_{x\to\infty} f(x) = \lim_{x\to\infty} g(x) = \infty\\) (oder beide gehen gegen 0).
2. **Ableitung Nenner**: Für alle \\(x \in \mathbb{R}^+\\) gilt \\(g'(x) \ne 0\\).
3. **Existenz Ableitungs-Limes**: \\(\lim_{x\to\infty} \frac{f'(x)}{g'(x)}\\) ist eine Konstante \\(C\\) oder \\(\infty\\).

## Was wächst schneller: Polylogarithmisch \\(O((\log n)^k)\\) oder Wurzel \\(O(\sqrt{n})\\)?

Die **Wurzel** wächst schneller.

\\[O((\log n)^k) \le O(\sqrt{n})\\]

## Was wächst schneller: \\(n^{\log_2 n}\\) oder \\(n^{\ln n}\\)?

\\(n^{\ln n}\\) wächst schneller (da \\(e > 2\\)).

Die Basis im Exponenten ist **relevant**:

\\[n^{\log_2 n} \neq n^{\ln n}\\]

(In der normalen \\(O\\)-Notation \\(O(\log n)\\) wäre die Basis hingegen egal).

## Was charakterisiert pseudopolynomielles Wachstum?

- Die Laufzeit ist abhängig vom **Wert** \\(N\\) des Inputs, nicht von der **Bitlänge** \\(\log N\\) (z.B. \\(O(N)\\)).
- Bezogen auf die Inputgrösse (Bits) ist das Wachstum **exponentiell**.

## Wie verhält sich exponentielles Wachstum im Vergleich zu polynomiellem Wachstum?

Exponentielles Wachstum (\\(O(c^n)\\) mit \\(c > 1\\)) wächst **schneller als jedes Polynom**.

Es gilt: \\(n^k \le O(c^n)\\).

## Wie lässt sich die Fakultät \\(n!\\) asymptotisch annähern und beschränken?

- **Identität (Stirling-Approximation)**:
    \\(\log(n!) = \Theta(n \log n)\\).
- **Schranken**:
    \\(n! \le n^n\\) und \\((n/2)^{n/2} \le n!\\).

## Wie lautet die Gaußsche Summenformel und ihre Asymptotik?

\\[\sum_{i=1}^n i = \frac{n(n+1)}{2} = \Theta(n^2)\\]

## Wie lautet die Summenformel für Kubikzahlen und ihre Asymptotik?

\\[\sum_{i=1}^n i^3 = \frac{n^2(n+1)^2}{4} = \Theta(n^4)\\]

## Wie verhält sich die Geometrische Reihe \\(\sum_{i=0}^n q^i\\) asymptotisch?

Die Summe ist \\(\frac{q^{n+1}-1}{q-1}\\).

- Falls **\\(q > 1\\)**: Wächst wie der grösste Term \\(\Theta(q^n)\\).
- Falls **\\(q < 1\\)**: Konvergiert gegen eine Konstante \\(\Theta(1)\\).

## Wie verhält sich die Harmonische Reihe asymptotisch?

\\[\sum_{i=1}^n \frac{1}{i} = \Theta(\log n)\\]

Das Wachstum ist sehr langsam.

## Welche Form muss eine Rekurrenz haben, um das Master Theorem anzuwenden?

\\[T(n) \le a \cdot T(n/b) + C \cdot n^k\\]

- **\\(a\\)**: Anzahl Unterprobleme.
- **\\(b\\)**: Verkleinerungsfaktor Input.
- **\\(n^k\\)**: Lokale Kosten (Aufteilung + Zusammenfügen).
- (Annahme \\(n = 2^k\\) oft zur Vereinfachung).

Für \\(T(n) \ge \dots\\) gelten \\(\Omega\\)-Schranken, für \\(T(n) = \dots\\) gelten \\(\Theta\\)-Schranken.

## Welche drei Fälle unterscheidet das Master Theorem (Vergleichskriterium)?

Man vergleicht die **lokale Arbeit** \\(n^k\\) mit der **Anzahl der Blätter** \\(n^{\log_b a}\\):

1. \\(k > \log_b a\\) (Lokale Arbeit dominiert).
2. \\(k = \log_b a\\) (Gleichgewicht).
3. \\(k < \log_b a\\) (Blätter dominieren).

## Was gilt beim Master Theorem im Fall \\(k > \log_b a\\)?

- **Situation**: Lokale Arbeit dominiert (Arbeit an der Wurzel ist dominant).
- **Laufzeit**:
    \\[T(n) = \Theta(n^k)\\]

## Was gilt beim Master Theorem im Fall \\(k = \log_b a\\)?

- **Situation**: Gleichgewicht (Arbeit auf allen Ebenen gleich verteilt).
- **Laufzeit**:
    \\[T(n) = \Theta(n^{\log_b a} \cdot \log n) = \Theta(n^k \log n)\\]

- *Beispiele*:
    - **Binäre Suche** (\\(a=1, b=2, k=0\\)) \\(\implies \Theta(\log n)\\).
    - **Mergesort** (\\(a=2, b=2, k=1\\)) \\(\implies \Theta(n \log n)\\).

## Was gilt beim Master Theorem im Fall \\(k < \log_b a\\)?

- **Situation**: Blätter dominieren (Anzahl der Basis-Fälle dominiert Kosten).
- **Laufzeit**:
    \\[T(n) = \Theta(n^{\log_b a})\\]

- *Beispiel*:
    - **Karatsuba** (\\(a=3, b=2, k=1\\)) \\(\implies \Theta(n^{\log_2 3}) \approx \Theta(n^{1.58})\\).
