## Definition

- **Reihe** (Series): Unendliche Summe von Zahlen, Form $\sum_{i=0}^{\infty} a_i$ [^III_Reihen_Slide8].
    - Nutzen: Beschreibung von Langzeitverhalten (z.B. Sättigungs-Plateau bei Medikamentenabbau).
- **Glieder** (Terms): Einzelne Elemente $a_n$ (Summanden) [^III_Reihen_Slide8].
- **Teilsummen / Partialsummen** (Partial Sums) $s_n$: Endliche Summe bis Index $n$ ($s_n = \sum_{k=0}^n a_k$) [^III_Reihen_Slide8].

## Konvergenzarten und Umordnungen

- **Konvergenz** (Convergence): *Folge der Teilsummen* $(s_n)$ strebt gegen endlichen **Grenzwert** $L$ (**Wert** der Reihe) [^III_Reihen_Slide8].
	- **Divergenz** (Divergence): Keine Konvergenz [^III_Reihen_Slide8].
- **Notwendiges Kriterium**: Konvergenz erfordert zwingend **Nullfolge** der Glieder ($\lim_{n \to \infty} a_n = 0$) [^III_Reihen_Slide9].
    - Umkehrschluss **falsch**! Nullfolge $\nRightarrow$ Konvergenz.
        - *Gegenbeispiel:* **Harmonische Reihe** $\sum_{k=1}^\infty \frac{1}{k}$ divergiert trotz $1/k \to 0$.
- **Absolute Konvergenz** (Absolute Convergence): Betragsreihe $\sum |a_n|$ konvergiert [^III_Reihen_Slide14].
    - **Verallgemeinerte Dreiecksungleichung**: $|\sum a_n| \le \sum |a_n|$ [^III_Reihen_Slide19].
    - **Umordnungssatz**: Beliebige Umordnung ändert Resultat nicht [^III_Reihen_Slide16].
- **Bedingte Konvergenz** (Conditional Convergence): Originalreihe $\sum a_n$ konvergiert, aber Betragsreihe $\sum |a_n|$ divergiert [^III_Reihen_Slide14].
    - *Beispiel:* Alternierende harmonische Reihe ($\sum (-1)^{k+1} \frac{1}{k}$).
    - **Riemannscher Umordnungssatz (Warnsignal):** Umordnen kann Konvergenz gegen **jeden beliebigen Wert** erzeugen [^III_Reihen_Slide15].

## Rechenregeln

- **Linearität:** Gliedweise Addition und Skalarmultiplikation bei konvergenten Reihen erlaubt [^III_Reihen_Slide10].
    - $\sum (a_n + b_n) = \sum a_n + \sum b_n$.
    - $\sum (C \cdot a_n) = C \sum a_n$.
- **Restgliedbetrachtung** (Indexverschiebung): Abschneiden endlich vieler Start-Elemente ändert Konvergenzverhalten nicht [^III_Reihen_Slide11].
    - $\sum_{n=0}^\infty a_n$ konvergiert $\iff \sum_{n=N}^\infty a_n$ konvergiert.
- **Nicht-negative Elemente ($a_n \ge 0$):** Folge der Teilsummen zwingend monoton wachsend [^III_Reihen_Slide12].
    - Konvergenz $\iff$ Teilsummenfolge nach oben **beschränkt**.
- **Cauchy-Produkt:** Multiplikation zweier *absolut konvergenter* Reihen [^III_Reihen_Slide22].
    - Formel: $\left( \sum_{n=0}^{\infty} a_n \right) \left( \sum_{n=0}^{\infty} b_n \right) = \sum_{n=0}^{\infty} \left( \sum_{k=0}^{n} a_{n-k} b_k \right)$.
    - Produktreihe konvergiert zwingend absolut.

## Konvergenzkriterien für Reihen

- **Vergleichskriterium** (Comparison Test): Für nicht-negative Reihen ab Index $N$ mit $c_n \le b_n \le a_n$ [^III_Reihen_Slide13].
    - **Majorantenkriterium**: Konvergenz der *grösseren* $\sum a_n \Rightarrow$ Konvergenz der *kleineren* $\sum b_n$.
    - **Minorantenkriterium**: Divergenz der *kleineren* $\sum c_n \Rightarrow$ Divergenz der *grösseren* $\sum b_n$.
    - *Beispiel:* $\sum \frac{1}{n!} \le \sum \frac{1}{2^n}$ (geometrische Reihe) $\Rightarrow$ konvergiert absolut gegen Euler'sche Zahl $e$.
- **Cauchy Kriterium**: Analogie zu Cauchy-Folgen. Konvergenz $\iff$ Block-Abstand $|\sum_{k=m+1}^n a_k|$ wird ab Index $N$ beliebig klein ($< \varepsilon$) [^III_Reihen_Slide18].
- **Wurzel-Kriterium** (Root Test): Berechne $\rho = \limsup_{n \to \infty} \sqrt[n]{|a_n|}$ [^III_Reihen_Slide20].
    - $\rho < 1 \Rightarrow$ Absolute Konvergenz.
    - $\rho > 1 \Rightarrow$ Divergenz.
    - $\rho = 1 \Rightarrow$ **Keine Aussage** (anderer Test nötig).
    - *Beweisidee:* Abschätzung durch geometrische Reihe ($\alpha^n$ mit $\alpha < 1$).
- **Quotienten-Kriterium** (Ratio Test): Berechne $\rho = \lim_{n \to \infty} \left| \frac{a_{n+1}}{a_n} \right|$ (für $a_n \neq 0$) [^III_Reihen_Slide21].
    - Identische Konsequenzen wie Wurzel-Kriterium (misst %-Zuwachs pro Summand).
    - *Tipp:* Oft gleiches $\rho$ wie Wurzelkriterium. Algebraisch einfacheres wählen.
- **Leibnitz Kriterium** (Alternating Series Test): Prüft alternierende Reihen $\sum (-1)^n a_n$ [^III_Reihen_Slide17].
    - *Bedingungen:* Glieder $a_n$ bilden **monoton fallende Nullfolge**.
    - *Konsequenz:* Sichere Konvergenz.
    - *Fehlerabschätzung:* Wahrer Wert liegt stets zwischen zwei aufeinanderfolgenden Teilsummen (z.B. $s_{2m+1}$ und $s_{2m}$).

## Potenzreihen (Power Series)

- **Definition:** Reihe der Form $\sum_{k=0}^{\infty} c_k (x-a)^k$ [^III_Reihen_Slide23].
    - $a$: **Entwicklungspunkt** (Center).
    - $c_k$: **Koeffizienten** (Coefficients).
    - $x$: Variabel wählbares **Argument**.
- **Konvergenzverhalten:** Auswertung erfolgt für festes $x$ [^III_Reihen_Slide24].
- **Konvergenzradius** (Radius of Convergence) $R$ [^III_Reihen_Slide25]:
    - Absolute Konvergenz für alle $x$ mit $|x - a| < R$.
    - Divergenz für alle $x$ mit $|x - a| > R$.
    - Definiert offenes **Konvergenzintervall** $(a - R, a + R)$.
    - **Wichtig (Randpunkte):** Keine Aussage für exakte Ränder $|x - a| = R$. Manuelles Prüfen durch Einsetzen zwingend!
- **Berechnung von $R$** (Cauchy-Hadamard-Formel) [^III_Reihen_Slide25]:
    - $\rho = \limsup_{n \to \infty} |c_n|^{1/n}$.
    - $R = \rho^{-1}$ (Konventionen: $1/0 = \infty$, $1/\infty = 0$).
    - *Herleitung:* Direkte Anwendung des Wurzelkriteriums ($\limsup |c_n(x-a)^n|^{1/n} < 1$).
- **Beispiel / Lösungsschritte:** $\sum_{n=1}^{\infty} (-1)^{n+1} \frac{1}{n} x^n$.
    - *Identifikation:* $a = 0$, $c_n = (-1)^{n+1} \frac{1}{n}$.
    - *Radius berechnen:* $\rho = \lim \sqrt[n]{1/n} = 1 \Rightarrow R = 1/1 = 1$. Intervall: $(-1, 1)$.
    - *Rand $x = 1$ testen:* Ergibt $\sum (-1)^{n+1} \frac{1}{n}$ (alternierende harmonische Reihe) $\Rightarrow$ konvergiert.
    - *Rand $x = -1$ testen:* Ergibt $\sum -\frac{1}{n}$ (negative harmonische Reihe) $\Rightarrow$ divergiert.

[^III_Reihen_Slide8]: III Reihen Slide 8: **Definition** Einen (formalen) Ausdruck der Form $a_0 + a_1 + a_2 + \dots = \sum_{i=0}^{\infty} a_i$ nennt man eine **Reihe** und die $a_n$ heissen **Glieder**, **Elemente** oder **Summanden** der Reihe. Falls die Folge der **Teilsummen (Partialsummen)** $s_n := a_0 + a_1 + \dots + a_n = \sum_{k=0}^{n} a_k$ gegen einen Grenzwert $L < \infty$ konvergiert, so sagen wir, dass die Reihe **konvergiert** und schreiben $a_0 + a_1 + \dots = \lim_{n \to \infty} s_n = \sum_{k=0}^{\infty} a_k = L$. $L$ nennt man dann auch den **Wert** der Reihe. Eine Reihe, welche nicht konvergiert, nennt man **divergent**.
[^III_Reihen_Slide9]: III Reihen Slide 9: **Satz (Notwendiges Kriterium für Konvergenz)** Falls eine Reihe konvergiert, muss zwingend gelten $\lim_{n \to \infty} a_n = 0$, d.h. $(a_n)_{n \in \mathbb{N}_0}$ ist eine **Nullfolge**.
[^III_Reihen_Slide14]: III Reihen Slide 14: **Definition** Eine Reihe $\sum_{n=0}^{\infty} a_n$ nennt man **absolut konvergent**, falls $\sum_{n=0}^{\infty} |a_n|$ konvergiert. Eine Reihe $\sum_{n=0}^{\infty} a_n$ nennt man **bedingt konvergent**, falls $\sum_{n=0}^{\infty} a_n$ konvergiert, aber nicht absolut konvergiert.
[^III_Reihen_Slide19]: III Reihen Slide 19: **Satz** Jede absolut konvergente Reihe konvergiert und es gilt die **verallgemeinerte Dreiecksungleichung** $\left| \sum_{n=0}^{\infty} a_n \right| \le \sum_{n=0}^{\infty} |a_n|$.
[^III_Reihen_Slide16]: III Reihen Slide 16: **Satz (Umordnungssatz für absolut konvergente Reihen)** Es sei $\sum_{n=0}^{\infty} a_n$ eine absolut konvergente Reihe reeller Summanden, und es sei $\varphi : \mathbb{N}_0 \to \mathbb{N}_0$ eine Bijektion. Dann konvergiert $\sum_{n=0}^{\infty} a_{\varphi(n)}$ absolut, und es gilt $\sum_{n=0}^{\infty} a_n = \sum_{n=0}^{\infty} a_{\varphi(n)}$.
[^III_Reihen_Slide15]: III Reihen Slide 15: **Satz (Riemannscher Umordnungssatz)** Es sei $\sum_{n=0}^{\infty} a_n$ eine bedingt konvergente Reihe reeller Summanden, und es sei $L \in \mathbb{R}$. Dann gibt es eine bijektive Abbildung $\varphi : \mathbb{N}_0 \to \mathbb{N}_0$, so dass gilt $L = \sum_{n=0}^{\infty} a_{\varphi(n)}$.
[^III_Reihen_Slide10]: III Reihen Slide 10: **Lemma** Es seien $\sum_{n=0}^{\infty} a_n$ und $\sum_{n=0}^{\infty} b_n$ konvergente Reihen. Dann gilt $\sum_{n=0}^{\infty} (a_n + b_n) = \sum_{n=0}^{\infty} a_n + \sum_{n=0}^{\infty} b_n$ sowie $\sum_{n=0}^{\infty} C \cdot a_n = C \sum_{n=0}^{\infty} a_n, (C \in \mathbb{R})$.
[^III_Reihen_Slide11]: III Reihen Slide 11: **Lemma** Es sei $\sum_{n=0}^{\infty} a_n$ eine Reihe. Für $N \in \mathbb{N}_0$ ist $\sum_{n=N}^{\infty} a_n$ genau dann konvergent, wenn $\sum_{n=0}^{\infty} a_n$ konvergiert, und in diesem Fall gilt $\sum_{n=0}^{\infty} a_n = \sum_{n=0}^{N-1} a_n + \sum_{n=N}^{\infty} a_n$.
[^III_Reihen_Slide12]: III Reihen Slide 12: **Satz** Es sein $\sum_{n=0}^{\infty} a_n$ eine Reihe nicht-negativer Elemente $a_n \ge 0 \, \forall n \in \mathbb{N}_0$. Dann ist die Folge der Partialsummen $s_n = \sum_{k=0}^{n} a_k$ monoton wachsend. Falls die Folge $(s_n)_{n \in \mathbb{N}_0}$ beschränkt ist, konvergiert die Reihe $\sum_{n=0}^{\infty} a_n$, andernfalls divergiert sie.
[^III_Reihen_Slide22]: III Reihen Slide 22: **Satz (Cauchy-Produkt)** Es seien $\sum_{n=0}^{\infty} a_n$ und $\sum_{n=0}^{\infty} b_n$ zwei absolut konvergente Reihen, dann gilt $\left( \sum_{n=0}^{\infty} a_n \right) \left( \sum_{n=0}^{\infty} b_n \right) = \sum_{n=0}^{\infty} \left( \sum_{k=0}^{n} a_{n-k} b_k \right)$, und die Reihe auf der rechten Seite konvergiert absolut.
[^III_Reihen_Slide13]: III Reihen Slide 13: **Satz (Vergleichskriterium)** Wir betrachten Reihen $\sum_{n=0}^{\infty} a_n, \sum_{n=0}^{\infty} b_n$ und $\sum_{n=0}^{\infty} c_n$ mit nicht-negativen Gliedern und für eine natürliche Zahl $N \in \mathbb{N}$ gelte $c_n \le b_n \le a_n \, \forall n \ge N$. Dann gilt: Falls $\sum_{n=0}^{\infty} a_n$ konvergiert, konvergiert auch $\sum_{n=0}^{\infty} b_n$ (**Majorantenkriterium**). Falls $\sum_{n=0}^{\infty} c_n$ divergiert, divergiert auch $\sum_{n=0}^{\infty} b_n$ (**Minorantenkriterium**).
[^III_Reihen_Slide18]: III Reihen Slide 18: **Satz (Cauchy Kriterium)** Die Reihe $\sum_{n=0}^{\infty} a_n$ konvergiert genau dann, wenn für jedes $\varepsilon > 0$ ein Index $N \in \mathbb{N}_0$ existiert, so dass für $n \ge m \ge N$ gilt $\left| \sum_{k=m+1}^{n} a_k \right| \le \varepsilon$.
[^III_Reihen_Slide20]: III Reihen Slide 20: **Satz (Wurzel-Kriterium)** Es sei $(a_n)_{n \in \mathbb{N}_0}$ eine Folge reeller Zahlen, und es sei $\rho = \limsup_{n \to \infty} (|a_n|)^{1/n} \in \mathbb{R} \cup \{\infty\}$. Dann gilt: Falls $\rho < 1$, konvergiert $\sum_{n=0}^{\infty} a_n$ absolut. Falls $\rho > 1$, konvergiert $\sum_{n=0}^{\infty} a_n$ nicht.
[^III_Reihen_Slide21]: III Reihen Slide 21: **Satz (Quotienten-Kriterium)** Es sei $(a_n)_{n \in \mathbb{N}_0}$ eine Folge reeller Zahlen mit $a_n \neq 0 \, \forall n \in \mathbb{N}_0$, und es sei $\rho = \lim_{n \to \infty} \frac{|a_{n+1}|}{|a_n|}$. Dann gilt: Falls $\rho < 1$, konvergiert $\sum_{n=0}^{\infty} a_n$ absolut. Falls $\rho > 1$, konvergiert $\sum_{n=0}^{\infty} a_n$ nicht.
[^III_Reihen_Slide17]: III Reihen Slide 17: **Satz (Leibnitz Kriterium)** Es sei $(a_n)_{n \in \mathbb{N}_0}$ eine monoton fallende Folge nicht-negativer reeller Zahlen, welche gegen null konvergiert. Dann konvergiert die **alternierende Reihe** $\sum_{n=0}^{\infty} (-1)^n a_n$ und es gilt $\sum_{n=0}^{2m+1} (-1)^n a_n \le \sum_{n=0}^{\infty} (-1)^n a_n \le \sum_{n=0}^{2m} (-1)^n a_n \quad \forall m \in \mathbb{N}_0$.
[^III_Reihen_Slide23]: III Reihen Slide 23: **Definition** Eine Reihe der Form $c_0 + c_1(x-a) + c_2(x-a)^2 + \dots = \sum_{k=0}^{\infty} c_k (x-a)^k$ heisst **Potenzreihe** um den **Entwicklungspunkt** $a$ und mit **Koeffizienten** $c_0, c_1, c_2, \dots$ und **Argument** $x$.
[^III_Reihen_Slide24]: III Reihen Slide 24: **Definition** Falls für ein festes $x$ die Folge der Teilsummen (Partialsummen) $s_n(x) = c_0 + c_1(x-a) + c_2(x-a)^2 + \dots + c_n(x-a)^n = \sum_{k=0}^{n} c_k(x-a)^k$ konvergiert, so sagen wir, dass die Potenzreihe für das betrachtete Argument $x$ **konvergiert**.
[^III_Reihen_Slide25]: III Reihen Slide 25: **Satz** Es gelten die folgenden Tatsachen: i) Jede Potenzreihe besitzt einen **Konvergenzradius** $R$, so dass gilt: die Reihe konvergiert für $x$ mit $|x - a| < R$ und die Reihe divergiert für $x$ mit $|x - a| > R$. ii) Das Intervall $(a - R, a + R)$ heisst **Konvergenzintervall**. iii) Der Konvergenzradius $R$ lässt sich mit der folgenden Formel berechnen: Es sei $\rho = \limsup_{n \to \infty} |c_n|^{1/n}$. Dann ist $R$ gegeben durch $R = 0$, falls $\rho = \infty$; $R = \rho^{-1}$, falls $0 < \rho < \infty$; $R = \infty$, falls $\rho = 0$.
