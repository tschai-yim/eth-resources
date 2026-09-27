## Konzept der Ableitung

- **Mittlere Änderungsrate** (**Differenzenquotient**, *difference quotient*): Steigung der **Sekante** durch $(a, f(a))$ und $(a+h, f(a+h))$ [^def5.1].
    - Formel: $\frac{\Delta y}{\Delta x} = \frac{f(a+h) - f(a)}{h}$
- **Ableitung** (**Differentialquotient**, *derivative*): Grenzwert des Differenzenquotienten für $h \to 0$ [^def5.2].
    - Formel: $f'(a) = \lim_{h \to 0} \frac{f(a+h) - f(a)}{h}$
    - **Geometrisch:** Steigung der **Tangente** in $a$ (lokale lineare Approximation).
    - **Physikalisch:** Momentane Änderungsrate (z.B. Geschwindigkeit).
    - **Vorzeichen:** $f'(a) > 0 \Rightarrow$ Zunahme; $f'(a) < 0 \Rightarrow$ Abnahme.
- **Ableitungsfunktion** (*derivative function*): Zuordnung $x \mapsto f'(x)$ [^def5.3].
    - Definitionsbereich maximal gleich gross wie bei der Ursprungsfunktion ($D(f) \supset D(f')$).

## Differenzierbarkeit & Stetigkeit

- **Differenzierbarkeit** (*differentiability*): Existenz eines endlichen Ableitungs-Grenzwerts an Stelle $x$ (oder global) [^def5.4].
- **Ausschlusskriterien:**
    - **Definitionslücken**: kein Limes möglich.
    - **Unstetigkeitsstellen** (z.B. Sprungstellen): Limes divergiert.
    - **Knickstellen** (z.B. $f(x) = |x|$ bei $x=0$): Links- und rechtsseitige Ableitungen existieren, sind aber ungleich.
- **Einseitige Ableitungen:** Limes-Annäherung nur von rechts ($h > 0$, *right-sided derivative*) oder links ($h < 0$) [^def5.6].
    - Bei Ungleichheit beider Grenzwerte: Nicht differenzierbar (Knick).
- **Zusammenhang Stetigkeit:** Jede differenzierbare Funktion ist zwingend **stetig** (Umkehrung gilt nicht!) [^lem5.5].
    - *Beweistrick:* Zeige $\lim_{h \to 0} f(x_0+h) = f(x_0)$ via "geschickter Null" und $\cdot 1$.
    - Umformung: $f(x_0+h) = \frac{f(x_0+h)-f(x_0)}{h} \cdot h + f(x_0)$.
    - Im Limes $h \to 0$: Bruch wird $f'(x_0)$, eliminiert durch $\cdot 0$, Resultat $f(x_0)$.

## Höhere Ableitungen

- **Definition:** Iteratives Ableiten, Notation $f^{(n)}$ (Klammern zwingend zur Abgrenzung von Potenzen!) [^def5.7].
- **Glatte Funktionen** (*smooth functions*): Unendlich oft ableitbar, Menge $C^\infty(D)$.
    - Beispiele: Polynome (werden Null-Funktionen), $e^x$, $\sin(x)$, $\cos(x)$.
- **Mengennotation:** $C^n(D)$ = Menge aller $n$-fach **stetig** differenzierbaren Funktionen [^def5.7].

## Ableitungsregeln

- **Summenregel:** Ableitungen von Addition/Subtraktion einzeln bildbar [^prop5.8].
- **Produktregel (Leibniz-Regel):** Höhere Ableitungen $(f \cdot g)^{(n)}$ via Binomialkoeffizienten $\binom{n}{k}$ (analog Pascalsches Dreieck) [^prop5.8].
    - Formel: $(f \cdot g)^{(n)} = \sum_{k=0}^n \binom{n}{k} f^{(k)}g^{(n-k)}$.
    - *Beweistrick ($n=1$):* Im Zähler des Differenzenquotienten geschickt $f(x+h)g(x)$ addieren und subtrahieren.
- **Kettenregel:** $(g \circ f)' = g'(f(x)) \cdot f'(x)$ ("Äussere mal innere Ableitung") [^prop5.9].
    - *Beweisidee:* Lineare Approximation $g(y) \approx g(y_0) + g'(y_0)(y-y_0)$. Einsetzen von $y = f(x)$ liefert beim Limes des Differenzenquotienten den Faktor $\frac{f(x)-f(x_0)}{x-x_0} \to f'(x_0)$.
- **Quotientenregel:** $\left(\frac{f}{g}\right)'(x_0) = \frac{f'(x_0)g(x_0) - f(x_0)g'(x_0)}{g(x_0)^2}$
	- Abgeleitet aus Ketten- und Produktregel ($\frac{f}{g} = f \cdot g^{-1}$) [^prop5.10].
    - Reihenfolge im Zähler (Minuszeichen!) und Nenner-Quadrat beachten.
- **Umkehrfunktion:** $(f^{-1})'(y_0) = \frac{1}{f'(x_0)}$ [^prop5.11].
    - *Geometrisch:* Spiegelung an Winkelhalbierender $y=x$ (Steigung invertiert sich).
    - *Bedingung:* $f$ stetig, bijektiv und $f'(x_0) \neq 0$ (verhindert undefinierte vertikale Tangente nach Spiegelung).

### Übersicht elementarer Ableitungen [^prop5.26]

- **Trigonometrie-Falle:** Argument muss zwingend im **Bogenmass** vorliegen!
- **Potenz:** $x^p \Rightarrow p \cdot x^{p-1}$
- **Exponential:** $a^x \Rightarrow \ln(a) \cdot a^x$ (Spezialfall: $(e^x)' = e^x$)
    - *Beweis 1 via Reihen:* $e^x = \sum \frac{x^k}{k!}$. Termweises Ableiten kürzt $k$, Indexverschiebung reproduziert Reihe.
    - *Beweis 2 via Limes:* Potenzgesetz ausklammern $\Rightarrow e^x \cdot \lim \frac{e^h-1}{h}$. Taylorreihe für $e^h$ einsetzen, Limes $\to 1$.
- **Logarithmus:** $\log_a(x) \Rightarrow \frac{1}{x \cdot \ln(a)}$ (Spezialfall: $\ln(x) \Rightarrow \frac{1}{x}$)
- **Trigonometrisch:** $\sin(x) \Rightarrow \cos(x)$; $\cos(x) \Rightarrow -\sin(x)$; $\tan(x) \Rightarrow \frac{1}{\cos^2(x)} = 1 + \tan^2(x)$
- **Hyperbolisch:** $\sinh(x) \Rightarrow \cosh(x)$; $\cosh(x) \Rightarrow \sinh(x)$ (Kein Vorzeichenwechsel!)
- **Arcus-Funktionen:**
    - $\arcsin(x) \Rightarrow \frac{1}{\sqrt{1-x^2}}$
    - $\arccos(x) \Rightarrow \frac{-1}{\sqrt{1-x^2}}$
    - $\arctan(x) \Rightarrow \frac{1}{1+x^2}$

## Lokale Extrema

- **Definition Extrema:** **Lokales Maximum/Minimum** bei höchstem/tiefstem Wert $f(x_0)$ in lokaler $\delta$-Umgebung [^def5.12].
    - **Isoliert** (*isolated*): Striktes Ungleichheitszeichen ($<$ oder $>$).
- **Kritische Punkte (Kandidatensuche):** Bei differenzierbarer Extremalstelle im Intervallinneren gilt zwingend **$f'(x_0) = 0$** (horizontale Tangente) [^prop5.13].
    - **Achtung:** Notwendig, aber nicht hinreichend! (Bsp. $f(x) = x^3$ hat $f'(0)=0$, ist aber ein Sattel-/Terrassenpunkt).
- **Orte für Extremalstellen** auf Intervallen [^prop5.14]:
    - Randpunkte.
    - Stellen ohne Differenzierbarkeit (Knicke).
    - Kritische Punkte ($f'(x_0) = 0$).

## Mittelwertsätze

- **Satz von Rolle:** Gilt $f(a) = f(b)$, existiert mindestens ein $\xi$ dazwischen mit horizontaler Tangente ($f'(\xi) = 0$) [^satz5.15].
    - *Beweisidee:* Min/Max einer stetigen Funktion auf kompaktem Intervall. Im Inneren $\Rightarrow f'=0$. Am Rand $\Rightarrow$ Funktion konstant $\Rightarrow f'=0$.
- **Mittelwertsatz (MWS, Lagrange):** Existenz eines Punktes $\xi$ mit **Tangentensteigung = Sekantensteigung** ($f'(\xi) = \frac{f(b)-f(a)}{b-a}$) [^satz5.16].
    - *Beweisidee:* Hilfsfunktion $g(x)$ als Differenz zwischen Funktion und Sekante definieren. Darauf Satz von Rolle anwenden.
- **Cauchy-Mittelwertsatz:** Setzt Sekantensteigungen zweier Funktionen $f, g$ ins Verhältnis zu ihren lokalen Tangentensteigungen [^satz5.17].
    - Formel: $\frac{f(b)-f(a)}{g(b)-g(a)} = \frac{f'(\xi)}{g'(\xi)}$
- *Hinweis:* Sätze beweisen reine **Existenz** von $\xi$, keine Garantie für analytische Berechenbarkeit!

## Regel von Bernoulli-l'Hospital

- **Zweck:** Berechnung unbestimmter Grenzwerte via separates Ableiten von Zähler und Nenner.
- **Bedingung (Absoluter Zwang!):** Nur anwendbar bei den Formen **$0/0$** oder **$\infty/\infty$** (zwingend vorab prüfen!).
- **Regel:** $\lim \frac{f(x)}{g(x)} = \lim \frac{f'(x)}{g'(x)}$ [^satz5.18] [^satz5.19].
- **Gültigkeit:** Für endliche Stellen $x \to a$ und für $x \to \infty$ (via Substitution $x \mapsto 1/x$) [^satz5.20].
    - *Beispiel:* $\lim_{x \to \infty} \frac{\ln x}{x} = \lim \frac{1/x}{1} = 0$ (Identität wächst schneller als Logarithmus).
- **Anwendungstipps:**
    - **Mehrfachanwendung:** Erlaubt, falls erste Ableitung erneut $0/0$ oder $\infty/\infty$ liefert (z.B. $\frac{\cos x - 1}{x^2}$).
    - **Trick (Definition nutzen):** Oft schneller als l'Hospital oder Taylorreihen.
        - *Bsp:* $\lim_{x\to 0} \frac{\sin x}{x} \equiv \lim_{x\to 0} \frac{\sin(0+x) - \sin(0)}{x}$. Dies entspricht der Definition von $\sin'(0) = \cos(0) = 1$.

## Monotonie, Konstanz & Konvexität

- **Monotonie:** $f' \ge 0 \iff f$ wachsend (Plateaus erlaubt, nicht zwingend streng wachsend) [^prop5.21].
- **Konstanz:** $f'(x) = 0$ überall $\iff f$ konstant [^prop5.22].
    - *Beweisidee:* $f'=0 \ge 0 \Rightarrow$ wachsend. Ableitung von $-f$ ist $0 \ge 0 \Rightarrow$ fallend. Wachsend + Fallend = Konstant.
- **Konvexität** (*convexity*): Graph verläuft "wie ein Smiley", stets **unterhalb** der Sekante durch zwei beliebige Punkte [^def5.23].
    - **Via 1. Ableitung:** $f$ konvex $\iff f'$ wachsend [^prop5.24].
    - **Via 2. Ableitung:** $f$ konvex $\iff f'' \ge 0$ [^kor5.25].
    - *Gegenbeispiel:* $x^3$ bei $x=1$ konvex ($f'' = 6 \ge 0$), aber bei $x=-1$ konkav ($f'' = -6 < 0$) $\Rightarrow$ nicht global konvex.

[^def5.1]: Definition 5.1. Wir beginnen mit einer Funktion $f : D \to \mathbb{R}, x \mapsto y = f(x)$. Und wir nehmen an, dass $D$ nicht leer ist und keine isolierten Punkte enthält, d.h. jedes Element $x \in D$ ist ein Häufungspunkt von $D \setminus \{x\}$
	Eine erste einfache Kenngrösse ist die **mittlere (durchschnittliche) Änderungsrate** (englisch average rate of change) von $f$ im Definitionsbereich zwischen $a$ und $a + h$:
	$\frac{\Delta y}{\Delta x} = \frac{f(a + h) - f(a)}{h}$
	Diese Grösse wird auch **Differenzenquotient** (englisch diffrence quotient) genannt.
[^def5.2]: Definition 5.2. Aus dem Differenzenquotient wird die **Ableitung** (auch **Differentialquotient** genannt) (englisch derivative).
	Die Ableitung einer Funktion $y = f(x)$ **an der Stelle** $a$ ist gegeben durch (sofern der Grenzwert existiert)
	$\lim_{h\to 0} \frac{f(a + h) - f(a)}{h} = \lim_{b\to a} \frac{f(b) - f(a)}{b - a} = \left. \frac{dy}{dx} \right|_{x=a} = \left. \frac{df}{dx} \right|_{x=a} = f'(a)$
[^def5.3]: Definition 5.3. Ausgehend von einer gegebenen Funktion $f : \text{domain}(f) \to \mathbb{R}, x \mapsto y = f(x)$ können wir mit Hilfe des Konzepts der Ableitung eine neue Funktion definieren,
	die **Ableitungsfunktion** (englisch derivative (function))
	$a \mapsto f'(a) = \left. \frac{dy}{dx} \right|_{x=a}$
[^def5.4]: Definition 5.4. Falls für eine gegebene Funktion $f$ die Ableitung $f'(x)$ an der Stelle $x$ existiert, nennen wir $f$ **an der Stelle** $x$ **differenzierbar** (englisch differentialble at the point $x$).
	Falls $f$ für alle Argumente $x$ des Definitionsbereichs differenzierbar ist, nennen wir $f$ **differenzierbar** (englisch differentiable).
[^def5.6]: Definition 5.6. Falls der Grenzwert
	$\lim_{h>0, h\to 0} \frac{f(a + h) - f(a)}{h}$
	existiert, nennt man diesen die **rechsseitige Ableitung** (englisch right- sided derivative), respektive $f$ an der Stelle $a$ **von rechts differenzierbar** (englisch differentiable fro the right hand side).
	Analog ist die Ableitung von links definiert.
[^lem5.5]: Lemma 5.5. Ist $f$ an der Stelle $x_0$ differenzierbar, so ist $f$ an dieser Stelle insbesondere stetig.
[^def5.7]: Definition 5.7. Es sei $f : D \subset \mathbb{R} \to \mathbb{R}$ eine Funktion. Iterativ definieren wir die **höheren Ableitungen** (englisch higher derivatives) für $n \in \mathbb{N}_0$
	$f^{(0)} = f, \quad f^{(1)} = f', \quad f^{(2)} = f'', \quad f^{(n+1)} = (f^{(n)})'$
	Falls $f^{(n)}$ existiert, nennt man $f$ **n-fach differenzierbar** (englisch n times differentiable).
	Falls die n-ten Ableitungen auch noch stetige Funktionen sind, nenn wir $f$ **n-fach stetig differenzierbar** (englisch n times continuously differentiable).
	Die Menge aller n-fach stetig differenzierbarer Funktionen auf $D$ bezeichnen wir mit $C^n(D)$.
	Ausserdem setzten wir
	$C^\infty(D) := \cap_{n=0}^\infty C^n(D)$
	und nennen Funktionen in $C^\infty(D)$ **glatte Funktionen** (englisch smooth function).
	Mit $C^0(D)$ wir ausserdem die Menge aller auf $D$ stetiger Funktionen bezeichnet.
[^prop5.8]: Proposition 5.8. Es seien $f, g : D \to \mathbb{R}$ zwei an der Stelle $x_0$ n-fach differenzierbare Funktionen.
	Dann ist $f + g$ und $f \cdot g$ an der Stelle $x_0$ ebenfalls n-fach differenzierbar, und es gilt
	$(f + g)^{(n)}(x_0) = f^{(n)}(x_0) + g^{(n)}(x_0)$
	und
	$(f \cdot g)^{(n)}(x_0) = \sum_{k=0}^n \binom{n}{k} f^{(k)}(x_0)g^{(n-k)}(x_0)$
[^prop5.9]: Proposition 5.9. (Kettenregel)
	Es sei $f : D \to E$ differenzierbar an der Stelle $x_0$ und es sei $g : E \to \mathbb{R}$ differenzierbar an der Stelle $y_0 = f(x_0)$.
	Dann ist $g \circ f : D \to \mathbb{R}$ an der Stelle $x_0$ differenzierbar und es gilt
	$(g \circ f)'(x_0) = g'(f(x_0))f'(x_0)$
[^prop5.10]: Proposition 5.10. (Quotientenregel)
	Es seien $f, g : D \to \mathbb{R}$ differenzierbar an der Stelle $x_0$. Falls $g(x_0) \neq 0$, ist auch $\frac{f}{g}$ differenzierbar an der Stelle $x_0$ und es gilt
	$\left(\frac{f}{g}\right)'(x_0) = \frac{f'(x_0)g(x_0) - f(x_0)g'(x_0)}{g(x_0)^2}$
[^prop5.11]: Proposition 5.11. (Ableitung der Umkehrfunktion)
	Es sei $f : D \to E \subset \mathbb{R}$ eine stetige, bijektive Funktion, deren Umkehrfunktion $f^{-1} : E \to D$ ebenfalls stetig ist. Ausserdem sei $x_0 \in D$ ein Häufungspunkt von $D \setminus \{x_0\}$, und sei $f$ an der Stelle $x_0$ differenzierbar mit $f'(x_0) \neq 0$.
	Dann ist $f^{-1}$ an der Stelle $y_0 = f(x_0)$ differenzierbar, und es gilt
	$(f^{-1})'(y_0) = \frac{1}{f'(x_0)}$
[^prop5.26]: Proposition 5.26.
	- Für eine Potenzfunktion $f(x) = ax^p$ gilt $f'(x) = a \cdot p \cdot x^{p-1} \quad p \neq 0$
	- Für Exponentialfunktionen $f(x) = a^x \ (a > 0)$ gilt $f'(x) = \ln(a) \cdot a^x$
	- Für trigonometrische Funktionen gilt (im Bogenmass):
	  $\sin'(x) = \cos(x)$
	  $\cos'(x) = -\sin(x)$
	  $\tan'(x) = \frac{1}{\cos^2(x)} = 1 + \tan^2(x)$
	- Für hyperbolische Funktionen:
	  $\sinh'(x) = \cosh(x)$
	  $\cosh'(x) = \sinh(x)$
	- Für Umkehrfunktionen:
	  $\ln'(x) = \frac{1}{x}$
	  $\arcsin'(x) = \frac{1}{\sqrt{1-x^2}}$
	  $\arccos'(x) = \frac{-1}{\sqrt{1-x^2}}$
	  $\arctan'(x) = \frac{1}{1+x^2}$
[^def5.12]: Definition 5.12. Es sei $f : D \subset \mathbb{R} \to \mathbb{R}$ eine Funktion und $x_0 \in D$.
	- Falls für $x_0 \in D$ ein $\delta > 0$ existiert, sodass gilt $f(x_0) \ge f(x)$ für alle $x \in (x_0 - \delta, x_0 + \delta) \cap D$, liegt an der Stelle $x_0$ ein **lokales Maximum** (englisch local maximum) vor.
	Falls die Ungleichung strikt ist, falls also gilt $f(x_0) > f(x)$ für alle $x \in (x_0 - \delta, x_0 + \delta) \cap D$ liegt an der Stelle $x_0$ ein **isoliertes lokales Minimum** \[Anm.: Text sagt Minimum, meint aber offensichtlich Maximum] (englisch isolated local maximum) vor.
	Der Funktionswert $f(x_0)$ wird **lokaler Maximalwert** (englisch locally maximal value) genannt.
	- Falls für $x_0 \in D$ ein $\delta > 0$ existiert, sodass gilt $f(x_0) \le f(x)$ für alle $x \in (x_0 - \delta, x_0 + \delta) \cap D$, liegt an der Stelle $x_0$ ein **lokales Minimum** (englisch local minimum) vor.
	Falls die Ungleichung strikt ist, falls also gilt $f(x_0) < f(x)$ für alle $x \in (x_0 - \delta, x_0 + \delta) \cap D$ liegt an der Stelle $x_0$ ein **isoliertes lokales Maximum** \[Anm.: Text sagt Maximum, meint aber Minimum] (englisch isolated local minimum) vor.
	Der Funktionswert $f(x_0)$ wird **lokaler Minimalwert** (englisch locally minimal value) genannt.
	- $x_0$ nennt man eine **lokale Extremalstelle, lokales Extremum** (englisch local extrema) von $f$ und $f(x_0)$ wird **lokaler Extremwert** (englisch locally extremal value) genannt, falls $f$ an der Stelle $x_0$ ein lokales Minimum oder ein lokales Maximum besitzt.
[^prop5.13]: Proposition 5.13. (Lokale Extremalstellen auf einem Intervall)
	Es sei $f : D \subset \mathbb{R} \to \mathbb{R}$, $f$ sei an der lokalen Extremalstelle $x_0 \in D$ differenzierbar, und $x_0$ sei sowohl ein Häufungspunkt von $D \cap (x_0, \infty)$ als auch von $D \cap (-\infty, x_0)$.
	Dann gilt $f'(x_0) = 0$.
[^prop5.14]: Proposition 5.14. (Lokale Extremalstellen auf einem Intervall)
	Es sei $I \subset \mathbb{R}$ ein Intervall, $f : I \to \mathbb{R}$, und es sei $x_0$ eine lokale Extremalstelle von $f$. Dann ist mindestens eine der folgenden Tatsachen zutreffend:
	i) $x_0 \in I$ ist ein Endpunkt der Intervalls $I$
	ii) $f$ ist an der Stelle $x_0$ nicht differenzierbar
	iii) $f$ ist an der Stelle $x_0$ differenzierbar und es gilt $f'(x_0) = 0$
[^satz5.15]: Satz 5.15. (Satz von Rolle)
	Es sei $a < b, f : [a, b] \to \mathbb{R}$ eine auf ganz $[a, b]$ stetige und auf $(a, b)$ differenzierbare Funktion.
	Falls gilt $f(a) = f(b)$, dann gibt es ein $\xi \in (a, b)$ mit $f'(\xi) = 0$.
[^satz5.16]: Satz 5.16. (Mittelwertsatz) (englisch mean value theorem)
	Es sei $a < b, f : [a, b] \to \mathbb{R}$ eine auf ganz $[a, b]$ stetige und auf $(a, b)$ differenzierbare Funktion.
	Dann gibt es ein $\xi \in (a, b)$ mit
	$f'(\xi) = \frac{f(b) - f(a)}{b - a}$
[^satz5.17]: Satz 5.17. (Cauchy-Mittelwertatz / erweiterter Mittelwertsatz)
	Es sei $a < b, f, g : [a, b] \to \mathbb{R}$ zwei auf ganz $[a, b]$ stetige und auf $(a, b)$ differenzierbare Funktionen.
	Dann gibt es ein $\xi \in (a, b)$ mit
	$g'(\xi)(f(b) - f(a)) = f'(\xi)(g(b) - g(a))$
	Falls zusätzlich gilt $g'(x) \neq 0 \ \forall x \in (a, b)$, dann ist auch $g(b) \neq g(a)$ und damit auch
	$\frac{f(\xi)}{g'(\xi)} = \frac{f(b) - f(a)}{g(b) - g(a)}$
[^satz5.18]: Satz 5.18. (Regel von Bernoulli-l'Hospital, Version 1)
	Es sei $a < b$ und $f, g : (a, b) \to \mathbb{R}$ zwei differenzierbare Funktionen. Ausserdem sei
	i) $g(x) \neq 0$ und $g'(x) \neq 0$ für alle $x \in (a, b)$
	ii) $\lim_{x>a, x\to a} f(x) = \lim_{x>a, x\to a} g(x) = 0$
	iii) Der Grenzwert
	$L = \lim_{x>a, x\to a} \frac{f'(x)}{g'(x)}$
	existiert.
	Dann existiert auch der Grenzwert
	$\lim_{x>a, x\to a} \frac{f(x)}{g(x)}$
	und ist gleich $L$.
[^satz5.19]: Satz 5.19. (Regel von Bernoulli-l'Hospital, Version 2)
	Es sei $a < b$ und $f, g : (a, b) \to \mathbb{R}$ zwei differenzierbare Funktionen. Ausserdem sei
	i) $g(x) \neq 0$ und $g'(x) \neq 0$ für alle $x \in (a, b)$
	ii) $\lim_{x>a, x\to a} |f(x)| = \lim_{x>a, x\to a} |g(x)| = \infty$
	iii) Der Grenzwert
	$L = \lim_{x>a, x\to a} \frac{f'(x)}{g'(x)}$
	existiert.
	Dann existiert auch der Grenzwert
	$\lim_{x>a, x\to a} \frac{f(x)}{g(x)}$
	und ist gleich $L$.
[^satz5.20]: Satz 5.20. (Regel von Bernoulli-l'Hospital, Version 3)
	Es sei $R > 0$ und $f, g : (R, \infty) \to \mathbb{R}$ zwei differenzierbare Funktionen. Ausserdem sei
	i) $g(x) \neq 0$ und $g'(x) \neq 0$ für alle $x \in (R, \infty)$
	ii) entweder
	$\lim_{x\to\infty} f(x) = \lim_{x\to\infty} g(x) = 0$
	oder
	$\lim_{x\to\infty} |f(x)| = \lim_{x\to\infty} |g(x)| = \infty$
	iii) Der Grenzwert
	$L = \lim_{x\to\infty} \frac{f'(x)}{g'(x)}$
	existiert.
	Dann existiert auch der Grenzwert
	$\lim_{x\to\infty} \frac{f(x)}{g(x)}$
	und ist gleich $L$.
[^prop5.21]: Proposition 5.21. Es sei $I \subset \mathbb{R}$ ein Intervall und $f : I \to \mathbb{R}$ eine differenzierbare Funktion.
	Dann gilt
	$f' \ge 0 \iff f \text{ ist wachsend}$
[^prop5.22]: Proposition 5.22. Es sei $I \subset \mathbb{R}$ ein Intervall und $f : I \to \mathbb{R}$ eine Funktion.
	Dann ist $f$ genau dann konstant, wenn $f$ differenzierbar ist und $f'(x) = 0 \ \forall x \in I$.
[^def5.23]: Definition 5.23. Eine Funktion nennt man auf dem Intervall konvex, falls ihr Graph auf diesem Intervall stets unterhalb der Verbindungsgerade durch zwei Punkte auf dem Graphen verläuft.
	Fomal: Falls für alle $a, b \in I$ mit $a < b$ und $t \in (0, 1)$ gilt
	$f((1 - t)a + bt) \le (1 - t)f(a) + tf(b)$
	Falls die obige Umgleichung sogar strikt ist, nennt man $f$ **strikt konvex** (englisch stricly convex).
	$g$ ist analog (**strikt**) **konkav** (englisch striclty concave), falls $-g$ (strikt) konvex ist.
[^prop5.24]: Proposition 5.24. Es sei $I \subset \mathbb{R}$ ein Intervall und $f : I \to \mathbb{R}$ eine differenzierbare Funktion.
	Dann ist $f$ auf $I$ genau dann konvex, wenn $f'$ auf $I$ wachsend ist.
[^kor5.25]: Korollar 5.25. Es sei $I \subset \mathbb{R}$ ein Intervall und $f : I \to \mathbb{R}$ eine zweifach differenzierbare Funktion.
	Dann ist $f$ auf $I$ genau dann konvex, wenn auf $I$ gilt $f'' \ge 0$.
