## Grundlagen

- **Konzept:** Funktion $f$ an Stelle $x_0$ **stetig** (continuous), falls Grenzwert existiert und **exakt Funktionswert $f(x_0)$ entspricht** [^def4.22].
    - Verschmelzung zweier Bedingungen: Definiertheit an $x_0$ UND Grenzwert strebt dorthin.
    - Geometrisch: Toleranz-Rechteck um Graph schrumpft lückenlos auf Punkt zusammen.
- **Spezialfälle & Varianten:**
    - **Stetige Fortsetzung:** Bei Definitionslücke an $x_0$ mit beidseitig gleichem Grenzwert $L$: "Heilung" durch neue Definition $\tilde{f}(x_0) = L$.
    - **Einseitige Stetigkeit:** Annäherung nur von einer Seite ($x \ge x_0$ für rechtsstetig, $x \le x_0$ für linksstetig) [^def4.24].
- **Folgenstetigkeit (Sequential Continuity):**
    - Äquivalente Definition: Für *jede* konvergente Folge $x_n \to x_0$ gilt zwingend $f(x_n) \to f(x_0)$ [^sat4.25].
    - Vorteil: Beweisführung oft einfacher (Suche nach spezifischem $\delta$ für $\epsilon$ entfällt).
- **Topologische Definition:**
    - Global stetig $\iff$ **Urbilder offener Mengen** sind wieder **offen**.
    - **Vorstellung:** Offene Menge = Intervall ohne Rand. "Reisst" der Graph nicht (keine Sprünge), projiziert ein randloses Zielintervall (y-Achse) stets auf ein randloses Intervall der x-Achse. Ein Sprung würde im Urbild plötzliche harte Ränder erzeugen.

## Rechenregeln für stetige Funktionen

- **Arithmetik:** Addition, Subtraktion, Multiplikation, Skalierung, Division ($Nenner \neq 0$) stetiger Funktionen ergeben stetige Funktionen [^sat4.26].
- **Verknüpfung (Composition):** $f$ (innere Funktion), $g$ (äussere Funktion) stetig $\Rightarrow g \circ f$ stetig [^sat4.26].
    - **Zentrale Eigenschaft:** Limes darf ins Innere gezogen werden: $\lim g(f(x)) = g(\lim f(x))$.
    - *Beweisidee:* Rückwärts von aussen nach innen arbeiten (äussere Toleranz $\eta$ wird innere Zielvorgabe $\epsilon$).
- **Stetigkeit der Umkehrfunktion:**
    - Funktion auf Intervall stetig und **bijektiv** $\Rightarrow$ Umkehrfunktion stetig [^sat4.28].
    - Wichtig: Definitionsbereiche (z.B. Wurzelfunktionen) vor Gleichungslösungen zwingend auf Bijektivität prüfen.

## Zwischenwertsatz

- **Zwischenwertsatz (Intermediate Value Theorem - ZWS):**
    - Stetige Funktion auf Intervall $[a,b]$ nimmt jeden Wert (Niveau $c$) zwischen $f(a)$ und $f(b)$ mindestens einmal an [^sat4.29].
    - Geometrisch: Zusammenhängende Kurve (ohne Stiftabsetzen zeichenbar).
    - **Absolut kritisch:** **Stetigkeit bis auf den Rand** essentiell. Bei Sprung am Rand verfehlt der Graph das Niveau $c$.
- **Nullstellensatz von Bolzano:**
    - Spezialfall ZWS: Verschiedene Vorzeichen an Rändern ($f(a) < 0$, $f(b) > 0$) $\Rightarrow$ mindestens eine Nullstelle dazwischen.
- **Beweisidee ZWS (via Supremum):**
    - Annahme oBdA $f(a) < f(b)$, Niveau $c$ dazwischen.
    - Menge $X = \{x \in [a,b] \mid f(x) \le c\}$. Nicht leer, beschränkt $\Rightarrow$ Supremum $x := \sup(X)$ existiert.
    - **Folgenstetigkeit** liefert $f(x) \le c$.
    - **Widerspruchsbeweis:** Annahme $f(x) < c \Rightarrow$ Wegen $\epsilon$-$\delta$-Stetigkeit existiert Intervall rechts von $x$ mit Werten $<c$. Verletzt Eigenschaft von $x$ als obere Schranke (Supremum). Fazit: $f(x) = c$.

## Kompaktheit & Extrema

- **Kompaktes Intervall (Compact Interval):**
    - Intervall ist **beschränkt und abgeschlossen** (z.B. $[a,b]$) [^def4.30].
    - **Folgenkompaktheit:** Jede Folge in kompaktem Intervall besitzt konvergente Teilfolge mit Grenzwert im Intervall [^lem4.31].
- **Satz vom Maximum/Minimum:**
    - Stetige Funktion auf kompaktem Intervall ist **beschränkt** (und hat ein kompaktes Bild).
    - Globales **Maximum und Minimum zwingend angenommen** [^sat4.32].
    - Achtung: Gilt nicht für offene (z.B. $(0,1)$) oder unbeschränkte ($\mathbb{R}$) Mengen.

## Spezielle Stetigkeitsbegriffe

- **Gleichmässige Stetigkeit (Uniform Continuity):**
    - Gefundenes $\delta$ hängt **nur von $\epsilon$ ab**, nicht vom Ort $x$ [^def4.33].
    - Toleranzfenster der Breite $\delta$ global über Graph verschiebbar (ohne vertikalen Austritt).
    - **Satz:** Stetige Funktion auf **kompaktem Intervall** automatisch gleichmässig stetig [^sat4.35].
- **Lipschitz-Stetigkeit (Lipschitz Continuity):**
    - Stärkere Bedingung: Steigung zwischen zwei beliebigen Punkten durch feste Konstante $L$ begrenzt ($|f(x) - f(y)| \le L|x - y|$) [^def4.36].
    - Jede Lipschitz-stetige Funktion ist gleichmässig stetig ($\delta = \epsilon/L$).

## Funktionenfolgen (Sequence of Functions)

Folgen $(f_n)$, bei denen jedes Glied eine Funktion ist:

- **Punktweise Konvergenz (Pointwise Convergence):**
    - Für jedes fixierte $x$ konvergiert Zahlenfolge $f_n(x)$ gegen Wert $f(x)$ [^def4.37].
- **Gleichmässige Konvergenz (Uniform Convergence):**
    - Für gesamte Funktion existiert ab Index $N$ maximaler Fehler $\epsilon$, **unabhängig von $x$** [^def4.38].
    - *Irrtum Punktweise vs. Gleichmässig:* Bei punktweiser Konvergenz hängt das benötigte $N_x$ von $x$ ab. Da ein Intervall unendlich viele $x$-Werte hat, kann das geforderte $N_x$ unendlich gross werden. Ein globales Maximum $N$ für *alle* $x$ ist dann nicht findbar. Gleichmässige Konvergenz garantiert jedoch genau dieses globale $N$.
    - **Zentrale Eigenschaft:** Gleichmässig konvergente Folge von *stetigen* Funktionen erzwingt **wieder stetige Grenzfunktion $f$** [^sat4.39]. (Bei punktweiser Konvergenz geht Stetigkeit oft verloren).

## Exponentialfunktion & Logarithmus

- **Exponentialfunktion ($\exp(x)$):**
    - Limes-Definition: $\exp(x) = e^x := \lim_{n \to \infty} (1 + \frac{x}{n})^n$ [^def4.40].
    - Eigenschaften: **bijektiv, streng monoton wachsend, stetig** ($\mathbb{R} \to \mathbb{R}^+$) [^sat4.42].
    - Rechenregeln: $\exp(0) = 1$, $\exp(-x) = (\exp(x))^{-1}$, $\exp(x+y) = \exp(x)\exp(y)$ [^sat4.42].
    - **Zentrale Abschätzung (Lemma):** $\exp(x) \ge (1 + \frac{x}{n})^n$ für $x > -n$ [^lem4.41].
    - Wichtigste allgemeine Identität: **$\exp(x) \ge 1+x$** (für alle $x \in \mathbb{R}$).
- **Natürlicher Logarithmus ($\log(x)$ oder $\ln(x)$):**
    - Eindeutige Umkehrfunktion (Inverse) der Exponentialfunktion [^def4.43].
    - Eigenschaften: **bijektiv, streng monoton wachsend, stetig** [^sat4.44].
    - Rechenregeln: $\log(1) = 0$, $\log(x^{-1}) = -\log(x)$, $\log(x \cdot y) = \log(x) + \log(y)$ [^sat4.44].

[^def4.22]: Definition 4.22. Eine Funktion $f : \mathbb{D} \to \mathbb{R}$ heisst an der Stelle $x_0$ stetig (englisch continuous at $x_0$), falls gilt $\forall \varepsilon > 0 \exists \delta > 0 \text{ s.d. } \forall x \in \mathbb{D} \left(|x - x_0| < \delta \Rightarrow |f(x) - f(x_0)| < \varepsilon \right)$
	Die Funktion nennen wir stetig (englisch continuous), falls sie in jedem Punkt des Definitionsbereichs stetig ist.
[^def4.24]: Definition 4.24. Es sei $f : \mathbb{D}(f) \to \mathbb{R}$, und es es $x_0 \in \mathbb{D}$.
	Falls gilt 	$\lim_{x \ge x_0, x \to x_0} f(x) = f(x_0)$ 	nennen wir den Punkt $x_0$ rechtsstetig (englisch continuous from the right).
	Linksstetigkeit ist analog definiert.
[^sat4.25]: Satz 4.25. (Charakterisierung der Stetigkeit durch Folgenstetigkeit)
	Es sein $f : D \subset \mathbb{D}(f) \subset \mathbb{R}$ eine Funktion und $x_0 \in D$.
	Dann ist $f$ an der Stelle $x_0$ genau dann stetig, wenn für jede Folge $(x_n)_{n \in \mathbb{N}_0}$ mit $x_n \to x_0$ die Folge $(f(x_n))_{n \in \mathbb{N}_0}$ gegen $f(x_0)$ konvergiert.
[^sat4.26]: Satz 4.26. Wir gehen von zwei stetigen Funktionen $f, g : D \subset \mathbb{R} \to \mathbb{R}$ aus. Dann gilt:
	i) $f + g$ ist stetig
	ii) $f - g$ ist stetig
	iii) $c \cdot f$, respektive $c \cdot g$, ist für jede beliebige Konstante $c \in \mathbb{R}$ stetig
	iv) $f \cdot g$ ist stetig
	v) $\frac{f}{g}$ ist stetig, sofern $g \neq 0$
	vi) Ausserdem ist die Verknüpfung stetiger Funktionen wiederum stetig.
	Genauer: Es seien $f : I \subset \mathbb{R} \to image(f)$ und $g : image(f) \to image(g)$ zwei stetige Funktionen.
	Dann ist die Verknüpfung $g(f(x)) = g \circ f(x)$ ebenfalls stetig und es gilt $\lim_{x \to x_0} g(f(x)) = g(\lim_{x \to x_0} (f(x_0))$
[^sat4.28]: Satz 4.28. (Stetigkeit der Umkehrfunktion)
	Es sei $I$ ein Intervall und es sei $f : I \to J$ eine stetige und bijektive Funktion. Dann ist auch $J$ ein Intervall und die Umkehrfunktion $f^{-1} : J \to I$ ist stetig.
[^sat4.29]: Satz 4.29. (Zwischenwertsatz (englisch intermediate value theorem))
	Es sei $f : [a, b] \to \mathbb{R}$ eine stetige Funktion und es sei $c$ eine Zahl zwischen $f(a)$ und $f(b)$.
	Dann gibt es ein $x \in [a, b]$ mit $f(x) = c$.
	Spezialfall (Nullstellensatz von Bolzano)
	Es sei $f : I \subset \mathbb{R} \to \mathbb{R}$ eine stetige Funktion, und es seinen $a, b \in I$ mit $f(a) < 0$ und $f(b) > 0$.
	Dann hat $f$ mindestens eine Nullstelle zwischen $a$ und $b$.
[^def4.30]: Definition 4.30. Ein beschränktes und abgeschlossenes Intervall nennt man kompakt (englisch compact).
[^lem4.31]: Lemma 4.31. (optionaler Zusatz) Es sei $[a, b]$ ein kompaktes Intervall, und es sei $(x_n)_{n \in \mathbb{N}_0}$ in $[a, b]$.
	Dann existiert eine Teilfolge $(x_{n_k})_{k \in \mathbb{N}_0}$ mit $\lim_{k \to \infty} x_{n_k} = x_0 \text{ mit } x_0 \in [a, b]$
[^sat4.32]: Satz 4.32. (Stetige Funktion auf kompaktem Intervall)
	Es sei $f : I \subset \mathbb{R} \to \mathbb{R}$ eine stetige Funktion und $I$ kompakt.
	Dann ist $f$ beschränkt und $f$ nimmt sein Maximum und Minimum auf $I$ an, d.h. es gibt ein $x_{min} \in I$ und ein $x_{max} \in I$ mit der Eigenschaft $\forall x \in I : f(x_{min}) \le f(x) \le f(x_{max})$.
[^def4.33]: Definition 4.33. Es sei $f : D \subset \mathbb{R} \to \mathbb{R}$. Dann heisst $f$ gleichmässig stetig (englisch uniformly continuous), falls $\forall \varepsilon > 0 \exists \delta > 0 \text{ s.d. } \forall x, y \in D \left(|x - y| < \delta \Rightarrow |f(x) - f(y)| < \varepsilon\right)$
[^sat4.35]: Satz 4.35. Es sei $[a, b]$ ein kompaktes Intervall und $f : [a, b] \to \mathbb{R}$ eine stetige Funktion. Dann ist $f$ gleichmässig stetig.
[^def4.36]: Definition 4.36. Es sei $f : D \subset \mathbb{R} \to \mathbb{R}$. Dann heisst $f$ Lipschitz stetig (englisch Lipschitz continuous), falls $\exists L \ge 0 \text{ s.d. } \forall x, y \in D : |f(x) - f(y)| \le L|x - y|$
[^def4.37]: Definition 4.37. Es sei $D \subset \mathbb{R}$, $(f_n)_{n \in \mathbb{N}_0}$ eine Folge von Funktionen $f_n : D \subset \mathbb{R} \to \mathbb{R}$ und $f : D \subset \mathbb{R} \to \mathbb{R}$ eine weitere Funktion.
	Dann konvergiert die Folge $(f_n)_{n \in \mathbb{N}_0}$ punktweise gegen (englisch pointwise convergence) $f$, falls für jedes $x \in D$ die reelle Folge $(f_n(x))_{n \in \mathbb{N}_0}$ gegen $f(x)$ konvergiert.
	$f$ heisst dann auch punktweiser Grenzwert (englisch pointwise limit) der Folge $(f_n)_{n \in \mathbb{N}_0}$.
[^def4.38]: Definition 4.38. Es sei $D \subset \mathbb{R}$, $(f_n)_{n \in \mathbb{N}_0}$ eine Folge von Funktionen $f_n : D \subset \mathbb{R} \to \mathbb{R}$ und $f : D \subset \mathbb{R} \to \mathbb{R}$ eine weitere Funktion.
	Dann konvergiert die Folge $(f_n)_{n \in \mathbb{N}_0}$ gleichmässig gegen (englisch uniform convergence) $f$, falls für jedes $\varepsilon > 0$ ein Index $N$ existiert, sodass für alle $n \ge N$ und für alle $x \in D$ gilt $|f_n(x) - f(x)| < \varepsilon$
[^sat4.39]: Satz 4.39. Es sei $D \subset \mathbb{R}$ und $(f_n)_{n \in \mathbb{N}_0}$ eine Folge stetiger Funktionen $f_n : D \subset \mathbb{R} \to \mathbb{R}$, welche gleichmässig gegen $f : D \subset \mathbb{R} \to \mathbb{R}$ konvergiert. Dann ist $f$ stetig.
[^def4.40]: Definition 4.40. Die Exponentialfunktion (englisch exponential function) $\exp : \mathbb{R} \to \mathbb{R}^+$ ist gegeben durch
$\exp(x) = e^x := \lim_{n \to \infty} \left(1 + \frac{x}{n}\right)^n$
[^sat4.42]: Satz 4.42. Die Exponentialfunktion $\exp : \mathbb{R} \to \mathbb{R}^+$ ist bijektiv, streng monoton wachsend und stetig. Ausserdem gilt
	$\exp(0) = 1$
	$\exp(-x) = (\exp(x))^{-1} \quad \forall x \in \mathbb{R}$
	$\exp(x + y) = \exp(x) \exp(y) \quad \forall x, y \in \mathbb{R}$
[^lem4.41]: Lemma 4.41. Für $n \in \mathbb{N}$ mit $n > 1$ gilt
$\exp(x) \ge \left(1 + \frac{x}{n}\right)^n \quad \forall x > -n$
[^def4.43]: Definition 4.43. Die eindeutige Inverse zur Exponentialfunktion heisst (natürlicher) Logarithmus (englisch (natural) logarithm) $\log(x) : \mathbb{R}^+ \to \mathbb{R}$
[^sat4.44]: Satz 4.44. Der Logarithmus $\log : \mathbb{R}^+ \to \mathbb{R}$ ist bijektiv, streng monoton wachsend und stetig.
	Ausserdem gilt
	$\log(1) = 0$
	$\log(x^{-1}) = -\log(x) \quad \forall x \in \mathbb{R}^+$
	$\log(xy) = \log(x) + \log(y) \quad \forall x, y \in \mathbb{R}^+$
