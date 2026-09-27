## Grundkonzepte von Folgen

- **Folge** (Sequence): Unendliche, geordnete Liste von Zahlen [^II_Folgen_Slide3].
    - Auffassbar als **Abbildung (Funktion)** $f: \mathbb{N}_0 \to \mathbb{R}$.
    - Einzelne Einträge $a_n$ heissen **Glieder der Folge**.
- **Bildungsgesetz** (Vorschrift) in zwei Formen [^II_Folgen_Slide4]:
    - **Direkt (explizit):** Feste Formel abhängig von $n$ (z.B. $a_n = f(n)$).
    - **Rekursiv:** Berechnung aus vorangehenden Gliedern (z.B. $a_n = g(a_{n-1})$). Zwingend definierte Startwerte nötig.
- **Grafische Darstellung**:
    - **Auf dem Zahlenstrahl (1D):** Gut für Häufungen, **zeitliche Ordnung (Index)** geht jedoch verloren.
    - **In der Ebene (2D):** Punkte $(n, a_n)$. **Zeitverlauf** direkt sichtbar. Punkte zur Abgrenzung von kontinuierlichen Funktionen zwingend **isoliert** zeichnen (nicht verbinden).
- **Alternierende Folge:** Vorzeichenwechsel bei jedem Glied (z.B. $a_n = (-1)^n$).

## Konvergenz und Divergenz

- **Konvergenz:** Folge nähert sich festem **Grenzwert** (Limit) $L$ an (festes **Langzeitverhalten**) [^II_Folgen_Slide5].
    - **$\epsilon$-Schlauch Definition:** Für **jede beliebig kleine** Toleranz $\epsilon > 0$ existiert ein Index $N$, ab dem **alle** folgenden Glieder dauerhaft im Bereich $(L - \epsilon, L + \epsilon)$ bleiben.
    - Grenzwert stets **eindeutig** (Beweis via Dreiecksungleichung) [^II_Folgen_Slide7].
- **Divergenz:** Kein solcher Grenzwert existent (z.B. chaotische Oszillation) [^II_Folgen_Slide5].
    - **Bestimmte Divergenz (uneigentlicher Grenzwert):** Divergenz gegen $\infty$ oder $-\infty$ [^II_Folgen_Slide8].
    - **Definition $\infty$:** Für **jede** beliebig grosse Schranke $M > 0$ existiert ein Index $N$, ab dem alle folgenden Glieder die Schranke **dauerhaft übersteigen** ($a_n > M$). Analog für $-\infty$ ($a_n < -M$).

## Teilfolgen und Häufungspunkte

- **Teilfolge** (Subsequence): Auswahl von Gliedern mit streng monoton steigenden Indizes ($n_{k+1} > n_k$). Keine "Zeitsprünge" rückwärts [^II_Folgen_Slide9].
    - **Robustheits-Lemma:** Konvergiert die Ursprungsfolge gegen $L$, konvergiert zwingend **jede** Teilfolge gegen denselben Grenzwert $L$ [^II_Folgen_Slide9].
- **Häufungspunkt** (Accumulation Point) $A$: Wert, dem die Folge **immer wieder beliebig nahe** kommt (unendlich oft in jedem $\epsilon$-Intervall) [^II_Folgen_Slide10] [^II_Folgen_Slide13].
    - Im Gegensatz zum Grenzwert kein permanentes *Verbleiben* im Toleranzband nötig (Wegspringen und Zurückkehren erlaubt).
    - **Äquivalenz:** $A$ ist genau dann Häufungspunkt, wenn eine konvergente Teilfolge existiert, die gegen $A$ strebt [^II_Folgen_Slide11].
    - **Zusammenhang:** Konvergente Folgen besitzen **exakt einen** Häufungspunkt (identisch mit dem Grenzwert) [^II_Folgen_Slide12].

## Das Sandwich-Theorem

- **Formalismus:** Gilt $a_n \le b_n \le c_n$ (für alle $n \ge N_0$) und streben $(a_n), (c_n)$ gegen denselben Grenzwert $L$, so konvergiert zwingend auch $(b_n)$ gegen $L$ [^thm_sandwich].
- **Prüfungs-Tipp:** Nennung des Theorems allein ungenügend. **Abschätzungen nach oben und unten zwingend explizit notieren und berechnen**.
- **Beispielaufgabe:** $\lim_{n \to \infty} (2^n + 3^n)^{1/n}$
    - *Problem:* Potenz $n \to \infty$, Exponent $1/n \to 0$.
    - **Untere Schranke:** Weglassen des kleineren Terms.
        - $(2^n + 3^n)^{1/n} \ge (3^n)^{1/n} = 3$.
    - **Obere Schranke:** Ersetzen des kleineren durch den grösseren Term.
        - $(2^n + 3^n)^{1/n} \le (3^n + 3^n)^{1/n} = (2 \cdot 3^n)^{1/n} = 2^{1/n} \cdot 3$.
    - **Limes:** Spezialgrenzwert $2^{1/n} \to 1$. Obere Schranke strebt gegen $1 \cdot 3 = 3$.
    - *Fazit:* Beide Schranken $\to 3 \Rightarrow$ Gesuchter Grenzwert ist $3$.

## Rechenregeln und Wichtige Grenzwerte

- **Grenzwerte berechnen** ($\lim a_n = K, \lim b_n = L$ endlich) [^II_Folgen_Slide14]:
    - Direkte Anwendung von Addition, Subtraktion, Multiplikation und Skalierung auf die Limits $K$ und $L$.
    - Division $K/L$ erlaubt, sofern $L \neq 0$ und $b_n \neq 0$.
    - **Ordnungseigenschaften:** $a_n \le b_n$ überträgt sich ab Index $N$ auf die Grenzwerte $\Rightarrow K \le L$.
- **Wichtige Standardgrenzwerte** (Hierarchie des Wachstums) [^II_Folgen_Slide15]:
    - Logarithmus wächst extrem langsam: $\frac{\log n}{n} \to 0$.
    - Wurzelkonkurrenz (Exponent gewinnt): $n^{1/n} \to 1$ und $x^{1/n} \to 1$ (für $x > 0$).
    - Exponentialfunktions-Darstellung: $(1 + \frac{x}{n})^n \to e^x$.
    - Fakultät dominiert alles: $\frac{x^n}{n!} \to 0$.
- **Praktische Tipps & Tricks zur Grenzwertberechnung:**
    - Vor Grenzwertbildung **immer kürzen/umschreiben** zur Vermeidung unbestimmter Ausdrücke ("$\infty / \infty$", "$0 \cdot \infty$").
    - **Trick - Kürzen:** Bei rationalen Funktionen (Bruch mit Polynomen) **zwingend** durch die höchste Potenz des Nenners dividieren.
        - *Beispiel:* $\frac{3n^7 - n^8}{4n^8 + 3n^5}$ gekürzt mit $n^8$ ergibt $\frac{3/n - 1}{4 + 3/n^3} \to \frac{-1}{4}$.
    - **Trick - Konjugiert erweitern:** Bei Differenzen von Wurzeln (Problem "$\infty - \infty$") den Bruch mit dem konjugierten Ausdruck erweitern, um das Quadrat zu bilden (dritte binomische Formel).
        - *Form:* $(A - B) \cdot \frac{A + B}{A + B} = \frac{A^2 - B^2}{A + B}$
    - **Trick - Reihenentwicklung (Taylor):** Anwendung bei "$0 \cdot \infty$" durch trigonometrische Funktionen.
        - *Sinn:* Wenn $n \to \infty$, geht ein Argument wie $3/n$ gegen $0$. Taylor-Reihe um den Nullpunkt wandelt den Sinus/Cosinus in ein Polynom um, wodurch das dominierende $n$ gekürzt werden kann.
        - *Lösungsschritte:* Ansatz $\sin(x) \approx x - \frac{x^3}{3!} + \dots$
        - Für $a_n = n \cdot \sin(3/n)$ umgeformt: $n \cdot (\frac{3}{n} - \frac{27}{3! n^3} + \dots) = 3 - \frac{9}{2n^2} \dots$
        - Alle Terme ab dem zweiten verschwinden im Limes ($n$ im Nenner), Resultat ist $3$.

[^II_Folgen_Slide3]: **II Folgen Slide 3**: Das Konzept Folge <br> **Definition** <br> Eine **Folge** $(a_n)_{n \in \mathbb{N}_0}$ (auch geschrieben als $(a_n)_{n \ge 0}$ oder $(a_n)_{n=0}^\infty$) ist eine (unendliche) Liste von Zahlen, wobei jeder solche Eintrag ein **Glied der Folge** genannt wird. <br> Eine Folge kann auch als Abbildung <br> $f: \mathbb{N}_0 \to \mathbb{R} \quad (\text{oder } f: \mathbb{N} \to \mathbb{R})$ <br> aufgefasst werden. <br> Die **Bilder** $a(n) = a_n$ sind dann gerade die Elemente der Folge.
[^II_Folgen_Slide4]: **II Folgen Slide 4**: Möglichkeiten der Darstellung einer Folge <br> Eine Möglichkeit, eine solche Folge zu beschreiben, ist, dass wir **direkt** (explizit) angeben, wie ein beliebiges Folgenglied berechnet werden kann, also <br> $a_n = f(n)$ <br> Eine andere Möglichkeit ist, dass wir jedes neue Folgenglied aus den vorangehenden konstruieren, die Folge also **rekursiv** beschreiben, d.h. <br> $a_n = g(a_{n-1}, a_{n-2}, \dots)$ <br> $f$ und $g$ nennt man jeweils **Bildungsgesetz**.
[^II_Folgen_Slide5]: **II Folgen Slide 5**: Konvergenz und Divergenz einer Folge <br> **Definition** <br> Eine Folge $(a_n)_{n \in \mathbb{N}_0} \subset \mathbb{R}$ heisst **konvergent**, falls ein $L \in \mathbb{R}$ existiert, so dass <br> $\forall \varepsilon > 0 \, \exists N > 0 \text{ so dass } \forall n > N : |a_n - L| < \varepsilon$ <br> $L$ wird dann **Grenzwert** genannt, und man schreibt <br> $\lim_{n \to \infty} a_n = L$ <br> Falls kein $L$ mit obigen Eigenschaft existiert, nennt man die Folge **divergent**. <br> Anschaulich formuliert: Ein Folge $(a_n)_{n \in \mathbb{N}_0}$ konvergiert gegen $L$, falls für genügend grosse $n$ die Werte $a_n$ immer näher bei $L$ liegen.
[^II_Folgen_Slide7]: **II Folgen Slide 7**: Satz <br> Eine konvergente Folge besitzt genau einen eindeutigen Grenzwert.
[^II_Folgen_Slide8]: **II Folgen Slide 8**: Spezialfälle divergenter Folgen <br> - Falls für eine Folge $(a_n)_{n \in \mathbb{N}_0}$ gilt: <br> $\forall M > 0 \, \exists N > 0 \text{ so dass } \forall n > N : a_n > M$ <br> sagen wir, dass die Folge **gegen unendlich** divergiert und schreiben <br> $\lim_{n \to \infty} a_n = \infty$ <br> - Falls für eine Folge $(a_n)_{n \in \mathbb{N}_0}$ gilt: <br> $\forall M > 0 \, \exists N > 0 \text{ so dass } \forall n > N : a_n < -M$ <br> sagen wir, dass die Folge **gegen minus unendlich** divergiert und schreiben <br> $\lim_{n \to \infty} a_n = -\infty$
[^II_Folgen_Slide9]: **II Folgen Slide 9**: **Definition** <br> Es sei $(a_n)_{n \in \mathbb{N}_0}$ eine Folge in $\mathbb{R}$. Eine **Teilfolge** ist eine Folge der Form <br> $(a_{n_k})_{k \in \mathbb{N}_0}$, <br> wobei $(n_k)_{k \in \mathbb{N}_0}$ eine Folge nicht-negativer ganzer Zahlen ist mit $n_{k+1} > n_k$ für alle $k \in \mathbb{N}_0$. <br> **Lemma** <br> Es sei $(a_n)_{n \in \mathbb{N}_0}$ eine konvergente Folgt mit Grenzwert $L \in \mathbb{R}$. Dann konvergiert auch jede Teilfolge gegen den gleichen Grenzwert $L$.
[^II_Folgen_Slide10]: **II Folgen Slide 10**: **Definition** <br> Es sei $(a_n)_{n \in \mathbb{N}_0}$ eine Folge in $\mathbb{R}$. Ein **Häufungspunkt** $A \in \mathbb{R}$ dieser Folge, falls <br> $\forall \varepsilon > 0 \, \forall N \in \mathbb{N}_0 \, \exists n \ge N \text{ so dass } |a_n - A| < \varepsilon$ <br> Anschaulich formuliert: Jedes Intervall der Form $(A - \varepsilon, A + \varepsilon)$ enthält $a_n$ für unendlich viele Indizes $n$.
[^II_Folgen_Slide13]: **II Folgen Slide 13**: Korollar <br> Sei $A$ ein Häufungspunkt der Folge $(a_n)_{n \in \mathbb{N}_0}$. Dann gibt es für jedes $\varepsilon > 0$ unendlich viele Folgeglieder, welche im Intervall $(A - \varepsilon, A + \varepsilon)$ liegen.
[^II_Folgen_Slide11]: **II Folgen Slide 11**: Satz <br> Es sei $(a_n)_{n \in \mathbb{N}_0}$ eine Folge in $\mathbb{R}$. $A \in \mathbb{R}$ ist ein Häufungspunkt der betrachteten Folge genau dann, wenn eine konvergente Teilfolge $(a_{n_k})_{k \in \mathbb{N}_0}$ existiert mit <br> $\lim_{k \to \infty} a_{n_k} = A$.
[^II_Folgen_Slide12]: **II Folgen Slide 12**: Korollar <br> Jede konvergente Folge $(a_n)_{n \in \mathbb{N}_0}$ in $\mathbb{R}$ hat genau einen Häufungspunkte, welcher mit dem Grenzwert der betrachteten Folge übereinstimmt.
[^thm_sandwich]: 02b Folgen, Slide 2: **Satz (Sandwich-Theorem)** Es seien $(a_n)_{n \in \mathbb{N}_0}$ und $(c_n)_{n \in \mathbb{N}_0}$ zwei konvergente Folgen mit gleichem Grenzwert gegeben $\lim_{n \to \infty} a_n = L$ und $\lim_{n \to \infty} c_n = L$ sowie eine dritte Folge $(b_n)_{n \in \mathbb{N}_0}$ mit der Eigenschaft, dass ein $N_0 \in \mathbb{N}$ existiert, so dass gilt $a_n \le b_n \le c_n \quad \forall n \ge N_0$. Dann ist auch die Folge $(b_n)_{n \in \mathbb{N}_0}$ konvergent und es gilt $\lim_{n \to \infty} b_n = L$.
[^II_Folgen_Slide14]: **II Folgen Slide 14**: Einige wichtige Rechenregeln <br> **Satz** <br> Wir nehmen an, es gelte $\lim_{n \to \infty} a_n = K (\neq \pm \infty)$, $\lim_{n \to \infty} b_n = L (\neq \pm \infty)$ und $C$ sei eine beliebige feste Zahl. <br> Dann gilt: <br> i) $\lim_{n \to \infty} (a_n + b_n) = K + L$ <br> ii) $\lim_{n \to \infty} (a_n - b_n) = K - L$ <br> iii) $\lim_{n \to \infty} (a_n \cdot b_n) = K \cdot L$ <br> iv) $\lim_{n \to \infty} (C \cdot a_n) = C \cdot K$ <br> v) Falls $L \neq 0$ und $b_n \neq 0$, haben wir $\lim_{n \to \infty} (a_n/b_n) = K/L$ <br> vi) Falls gilt $K < L$, so gibt es ein $N \in \mathbb{N}$, so dass gilt $a_n < b_n$ für alle $n \ge N$. <br> vii) Falls es ein $N \in \mathbb{N}$ gibt, so dass gilt $a_n \le b_n$ für alle $n \ge N$, so gilt auch $K \le L$.
[^II_Folgen_Slide15]: **II Folgen Slide 15**: Wichtige Grenzwerte <br> **Satz** <br> i) $\lim_{n \to \infty} \frac{\log n}{n} = 0 = \lim_{n \to \infty} \frac{\ln n}{n}$ <br> ii) $\lim_{n \to \infty} n^{1/n} = 1$ <br> iii) $\lim_{n \to \infty} x^{1/n} = 1, x > 0$ <br> iv) $\forall x \in \mathbb{R} : \lim_{n \to \infty} \left(1 + \frac{x}{n}\right)^n = e^x$ <br> v) $\forall x \in \mathbb{R} : \lim_{n \to \infty} \frac{x^n}{n!} = 0$
