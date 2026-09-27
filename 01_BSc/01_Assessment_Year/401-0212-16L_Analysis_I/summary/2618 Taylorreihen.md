## Lokale Approximation (Taylorpolynome)

- **Konzept der Approximation:** Annäherung von $f(x)$ durch Polynome nahe eines **Referenzpunktes** (Entwicklungspunkt) $x_0$.
    - **Vorteil:** Hohe Recheneffizienz (nur Addition/Multiplikation vs. komplexe Funktionen wie Wurzeln/Trigonometrie).
- **Lineare Approximation** (*1. Taylorpolynom*, Tangentenapproximation) [^def_lin_approx]:
    - Annäherung durch Tangente: $f(x) \approx f(x_0) + f'(x_0)(x - x_0) = P_1(x)$.
    - Schreibweise in der Physik (für kleine Abweichungen): $df = f'(x_0) \cdot dx$.
- **Quadratische Approximation** (*2. Taylorpolynom*):
    - Berücksichtigung des **Krümmungsverhaltens**.
    - Ansatz: Polynom 2. Grades $P_2(x) = A(x-x_0)^2 + B(x-x_0) + C$.
    - **Herleitung der Koeffizienten** (Bedingungen an $x_0$):
        - Gleicher Punkt: $P_2(x_0) = f(x_0) \Rightarrow C = f(x_0)$.
        - Gleiche Steigung: $P_2'(x_0) = f'(x_0) \Rightarrow B = f'(x_0)$.
        - Gleiche Krümmung: $P_2''(x_0) = f''(x_0) \Rightarrow 2A = f''(x_0) \Rightarrow A = \frac{1}{2}f''(x_0)$.
    - Resultat: $P_2(x) = f(x_0) + f'(x_0)(x - x_0) + \frac{1}{2}f''(x_0)(x - x_0)^2$.
    - Distanz-Gewichtung: Fehlerterm $(x-x_0)^2$ schrumpft quadratisch nahe $x_0$.
- **Satz von Taylor** [^satz_taylor]:
    - Exakte Funktionsdarstellung via $n$-tes **Taylorpolynom** $P_n(x)$ plus **Restterm** $R_n(x)$ (Fehler).
    - Formel: $f(x) = \sum_{k=0}^{n} \frac{f^{(k)}(x_0)}{k!} (x - x_0)^k + R_n(x)$.
    - Restterm-Abschätzung: $R_n(x) = \frac{f^{(n+1)}(c)}{(n+1)!}(x - x_0)^{n+1}$ (mit $c$ zwischen $x_0$ und $x$). Abschätzbar via Max/Min der $(n+1)$-ten Ableitung (Prinzip **Mittelwertsatz**).
    - *Eigenschaft:* Für Polynome vom Grad $m$ ist das $m$-te Taylorpolynom exakt die Funktion ($R_m(x) = 0$).
- **Praktische Tipps & Anwendung:**
    - **Wahl von $x_0$:** Zwingend nahen Punkt mit einfacher Auswertbarkeit wählen (Vermeidung von Definitionslücken wie $\sqrt{<0}$).
    - **Gleichungen approximativ lösen:** Statt $f(x) = y$ (oft unlösbar) einfache Polynomgleichung lösen: $P_1(x) = y$ (linear) oder $P_2(x) = y$ (Mitternachtsformel).

## Taylorreihen (Taylor Series)

- **Definition** [^def_taylorreihe]:
    - Limes des Taylorpolynoms ($n \to \infty$) liefert unendliche **Taylorreihe** / **Taylorentwicklung**: $\sum_{k=0}^{\infty} \frac{f^{(k)}(a)}{k!} (x-a)^k$.
    - Formell ein Spezialfall der Potenzreihe.
- **Bedingung für Gleichheit:**
    - Formale Aufstellung garantiert **weder** Konvergenz **noch** Übereinstimmung mit Funktion!
    - $f(x)$ entspricht Taylorreihe $\iff \lim_{n \to \infty} R_n(x) = 0$.
    - **Wichtige Unterscheidung:** Konvergenz der Reihe impliziert **nicht** zwingend $R_n \to 0$. Eine Reihe kann konvergieren, aber gegen einen völlig falschen Wert streben.
    - *Klassisches Gegenbeispiel:* $f(x) = e^{-1/x^2}$ ist bei $x_0=0$ extrem "flach" (alle Ableitungen sind $0$). Die Taylorreihe ist $0+0+0\dots$ und konvergiert perfekt gegen $0$. Sie entspricht für $x \neq 0$ aber nicht der Funktion, da der Restterm dort nicht gegen $0$ geht.

## Wichtige Standard-Taylorreihen

Mit Entwicklungspunkt $x_0 = 0$:

- **Überall konvergent** ($R = \infty$, für alle $x \in \mathbb{R}$) [^fakt_reihen_inf]:
    - **Sinus** (ungerade, alternierend): $\sin(x) = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \dots = \sum_{n=0}^{\infty} (-1)^n \frac{x^{2n+1}}{(2n+1)!}$
    - **Cosinus** (gerade, alternierend): $\cos(x) = 1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \dots = \sum_{n=0}^{\infty} (-1)^n \frac{x^{2n}}{(2n)!}$
    - **Exponentialfunktion**: $e^x = 1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + \dots = \sum_{n=0}^{\infty} \frac{x^n}{n!}$
- **Beschränkt konvergent** (für $-1 < x < 1$, Konvergenzradius $R=1$) [^fakt_reihen_beschraenkt]:
    - **Geometrische Reihe**: $\frac{1}{1-x} = 1 + x + x^2 + x^3 + \dots = \sum_{n=0}^{\infty} x^n$
    - **Logarithmus**: $\ln(1+x) = x - \frac{x^2}{2} + \frac{x^3}{3} - \frac{x^4}{4} + \dots = \sum_{n=1}^{\infty} (-1)^{n-1} \frac{x^n}{n}$ (Achtung: Keine Fakultät im Nenner!)
    - **(Verallgemeinerte) Binomialreihe**: $(1+x)^p = 1 + px + \frac{p(p-1)}{2!}x^2 + \dots = \sum_{n=0}^{\infty} \binom{p}{n} x^n$
        - $p$ als beliebige reelle Zahl möglich ($p \in \mathbb{R}$).
        - **Verallgemeinerter Binomialkoeffizient**: $\binom{p}{n} = \frac{p(p-1)\dots(p-n+1)}{n!}$ (mit $\binom{p}{0} = 1$).

## Rechenregeln für Taylorreihen

Finden neuer Reihen ohne mühsames Ableiten. Voraussetzung: $x$ im Konvergenzintervall.

- **Substitution (Einsetzen):** Argument in bekannte Reihe einsetzen (z.B. $\sin(2x)$, $e^{-x^2}$).
- **Multiplikation von Reihen** [^satz_mult_reihen]:
    - Cauchy-Produkt: $f(x) \cdot g(x) = \sum_{n=0}^{\infty} \left(\sum_{k=0}^{n} a_k b_{n-k}\right) x^n$.
    - *Intuition:* Systematisches Ausmultiplizieren. Innere Summe sammelt exakt alle Koeffizienten-Paare, deren Exponenten zusammen $n$ ergeben (z.B. für $x^2$: $a_0b_2 + a_1b_1 + a_2b_0$).
- **Termweises Ableiten** [^satz_abl_reihen]:
    - Vertauschung von Ableitung und Summenzeichen $\Rightarrow$ Summanden einzeln ableiten: $f'(x) = \sum_{n=1}^{\infty} n a_n x^{n-1}$.
    - *Beispiel:* Ableitung der $\sin(x)$-Reihe liefert $\cos(x)$-Reihe.
- **Termweises Integrieren** [^satz_int_reihen]:
    - Vertauschung von Integral und Summenzeichen: $\int f(x) dx = \sum_{n=0}^{\infty} \int a_n x^n dx$.
- **Trick zur Effizienzsteigerung:**
    - Statt mühsamer Binomialreihe für $1/(1-x)^2$: Ableitung der geometrischen Reihe nutzen.
    - Wegen $\frac{d}{dx} (\frac{1}{1-x}) = \frac{1}{(1-x)^2}$ einfach $\sum x^n$ ableiten $\Rightarrow \sum_{n=0}^{\infty} \frac{d}{dx} x^n = \sum_{m=0}^{\infty} (m+1)x^m$.

## Gleichmässige Konvergenz (Uniform Convergence)

- **Problem:** Rechtfertigung der Vertauschung von Operatoren (Limes, Ableitung, Integral) mit unendlichen Summen (bei reiner punktweiser Konvergenz oft unzulässig).
- **Lösung:** Taylorreihen konvergieren **gleichmässig** im Intervall $(-R, R)$ (Konvergenzradius $R$).
- **Beweisidee & Konsequenzen:**
    - Betrachtung eines kleineren Intervalls $|x| < r$ mit $r < s < R$.
    - Abschätzung des Fehlers zwischen Funktion und Partialsumme $P_n(x)$.
    - Erweiterung mit $\frac{s^k}{s^k}$ liefert globalen Faktor $(\frac{r}{s})^n$.
    - Da $\frac{r}{s} < 1$, strebt Fehler für $n \to \infty$ **global und $x$-unabhängig** gegen $0$.
    - *Fazit:* Wegen gleichmässiger Konvergenz vererbt sich die Stetigkeit der Polynome $P_n(x)$ zwingend auf die unendliche Taylorreihe. Dies rechtfertigt formell alle angewendeten Rechenregeln.

[^def_lin_approx]: **Lokale Approximation durch Polynome (Slide 6a)**: Falls die betrachtete Funktion $f$ an der Stelle $x_0$ differenzierbar ist, so gilt die lineare Approximation / Tangentenapproximation / 1. Taylor Approximation $f(x) \approx f(x_0) + f'(x_0)(x - x_0) = P_1(x)$. Der Ausdruck $f(x_0) + f'(x_0)(x - x_0)$ wird auch Linearisierung oder 1. Taylorpolynom von $f$ an der Stelle $x_0$ genannt.
[^satz_taylor]: **Satz von Taylor (Slide 9a)**: Wir nehmen an, dass die betrachtete Funktion $f$ auf dem offenen Intervall $I$ (mit $x_0 \in I$) Ableitungen beliebig hoher Ordnung besitzt. Dann gilt für jedes beliebige Argument $x \in I$: $f(x) = f(x_0) + f'(x_0)(x - x_0) + \dots + \frac{1}{n!}f^{(n)}(x_0)(x - x_0)^n + \frac{1}{(n+1)!}f^{(n+1)}(c)(x - x_0)^{n+1} = \sum_{k=0}^{n} f^{(k)}(x_0) \frac{1}{k!} (x - x_0)^k + \frac{1}{(n+1)!}f^{(n+1)}(c)(x - x_0)^{n+1} = P_n(x) + R_n(x)$ für ein $c$ zwischen $x_0$ und $x$. $P_n$ hiesst n.-tes Taylorpolynom.
[^def_taylorreihe]: **Definition (Slide 15a)**: Für eine gegebene Funktion $f$ heisst die Reihe $f(a) + f'(a)(x-a) + \frac{1}{2}f''(a)(x-a)^2 + \dots = \sum_{k=0}^{\infty} f^{(k)}(a)\frac{1}{k!}(x-a)^k$ Taylorreihe / Taylorentwicklung der Funktion $f$ (um den Punkt $a$).
[^fakt_reihen_inf]: **Beispiele (Slide 17a)**: Die folgenden Reihen konvergieren für alle $x$: $\sin(x) = \sum_{n=0}^{\infty} (-1)^n \frac{1}{(2n+1)!}x^{2n+1} = x - \frac{1}{3!}x^3 + \frac{1}{5!}x^5 - \dots$, $\cos(x) = \sum_{n=0}^{\infty} (-1)^n \frac{1}{(2n)!}x^{2n} = 1 - \frac{1}{2!}x^2 + \frac{1}{4!}x^4 - \dots$, $e^x = \sum_{n=0}^{\infty} \frac{1}{n!}x^n = 1 + x + \frac{1}{2!}x^2 + \frac{1}{3!}x^3 + \dots$
[^fakt_reihen_beschraenkt]: **Weitere wichtige Reihen (Slide 18a)**: Die folgenden Reihen konvergieren nur für $-1 < x < 1$: $\ln(1+x) = \sum_{n=1}^{\infty} (-1)^{n-1} \frac{1}{n}x^n = x - \frac{1}{2}x^2 + \frac{1}{3}x^3 - \frac{1}{4}x^4 + \dots$, $\frac{1}{1-x} = \sum_{n=0}^{\infty} x^n = 1 + x + x^2 + x^3 + x^4 + \dots$, $(1+x)^p = \sum_{n=0}^{\infty} \binom{p}{n}x^n = 1 + px + \frac{p(p-1)}{2!}x^2 + \dots$
[^satz_mult_reihen]: **Satz (Multiplikation von Reihen) (Slide 9b)**: Wir betrachten zwei Potenzreihen $f(x) = \sum_{n=0}^{\infty} a_nx^n , g(x) = \sum_{n=0}^{\infty} b_nx^n$, wobei $x$ im Konvergenzintervall beider Reihen ist. Dann gilt $f(x) \cdot g(x) = \sum_{n=0}^{\infty} (\sum_{k=0}^{n} a_kb_{n-k}) x^n$.
[^satz_abl_reihen]: **Satz (Termweises Ableiten) (Slide 10b)**: Wir beginnen mit der Darstellung einer Funktion durch eine Potenzreihe $f(x) = \sum_{n=0}^{\infty} a_nx^n$, dabei ist wiederum $x$ im Konvergenzintervall $I$. Dann ist $f$ differenzierbar, und es gilt $f'(x) = \sum_{n=1}^{\infty} na_nx^{n-1}$.
[^satz_int_reihen]: **Satz (Termweises Integrieren) (Slide 11b)**: Wir beginnen mit der Darstellung einer Funktion durch eine Potenzreihe $f(x) = \sum_{n=0}^{\infty} a_nx^n$, dabei ist wiederum $x$ im Konvergenzintervall $I$. Dann ist $f$ auf dem Intervall $[a, b] \subset I$ integrierbar, und es gilt $\int_a^b f(x) dx = \sum_{n=0}^{\infty} \int_a^b a_nx^n dx$.
