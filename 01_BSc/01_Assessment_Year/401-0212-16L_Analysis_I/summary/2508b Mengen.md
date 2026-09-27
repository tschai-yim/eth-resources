## Definitionen und Beziehungen

- **Menge:** Zusammenfassung unterscheidbarer Elemente [^def6].
    - Notation (Auflistung): $M = \{1, 2, 3\}$
    - Notation (Eigenschaft): $M = \{x \mid \text{Eigenschaft}(x)\}$
- **Leere Menge** ($\emptyset$): Menge ohne Elemente.
- **Teilmenge** ($X \subset Y$): Jedes Element von $X$ liegt auch in $Y$ [^def7].
- **Echte Teilmenge** ($X \subsetneq Y$): $X \subset Y$, aber $X \neq Y$.
- **Komplement** ($X^c$): $\{y \mid y \in Y \land y \notin X\}$ (Elemente der Grundmenge, nicht in $X$) [^def7].

## Operationen

- Elementare Verknüpfungen [^def8]:
    - **Vereinigung** ($X \cup Y$): $\{x \mid x \in X \lor x \in Y\}$ (Logisches Oder).
    - **Durchschnitt** ($X \cap Y$): $\{x \mid x \in X \land x \in Y\}$ (Logisches Und).
    - **Differenz** ($X \setminus Y$): $\{x \mid x \in X \land x \notin Y\}$ (X ohne Y).
    - **Cartesisches Produkt** ($X \times Y$): $\{(x, y) \mid x \in X \land y \in Y\}$ (Menge aller Paare).

## Zahlen und Intervalle

### Zahlmengen

- Hierarchie [^def9]:
    - $\mathbb{N}$: Natürliche Zahlen $\{1, 2, \dots\}$ (opt. $\mathbb{N}_0$).
    - $\mathbb{Z}$: Ganze Zahlen (inkl. Negative).
    - $\mathbb{Q}$: Rationale Zahlen (Brüche $\frac{p}{q}$).
    - $\mathbb{R}$: Reelle Zahlen (inkl. Irrationale).

### Intervalle in $\mathbb{R}$

- Teilmengen definiert durch Ränder $a, b$ [^def10]:
    - **Offen** $(a, b)$: $\{x \in \mathbb{R} \mid a < x < b\}$ (Ränder exklusive).
    - **Abgeschlossen** $[a, b]$: $\{x \in \mathbb{R} \mid a \le x \le b\}$ (Ränder inklusive).
    - **Halboffen** $[a, b)$: $\{x \in \mathbb{R} \mid a \le x < b\}$ (einseitig inklusive).
- **Beschränkt:** $a, b$ endlich.
- **Kompakt:** Beschränktes *und* abgeschlossenes Intervall.
- **Unendlichkeit:** $\infty$ als Symbol für Unbeschränktheit (z.B. $(-\infty, \infty) = \mathbb{R}$).

## Kenngrössen von Mengen (Topologie)

### Schranken

- Für Teilmenge $X \subset \mathbb{R}$ [^def11]:
    - **Obere Schranke:** $y \in \mathbb{R}$ mit $\forall x \in X: x \le y$.
    - **Untere Schranke:** $y \in \mathbb{R}$ mit $\forall x \in X: x \ge y$.

### Extrema (Max/Min vs. Sup/Inf)

- **Maximum** ($max(X)$): Grösstes Element **in** der Menge ($\in X$) [^def12].
    - Existenz nicht garantiert (z.B. offenes Intervall). Eindeutig falls existent [^satz2].
- **Minimum** ($min(X)$): Kleinstes Element **in** der Menge ($\in X$).
    - Existenz nicht garantiert. Eindeutig falls existent.
- **Supremum** ($sup(X)$): Kleinste obere Schranke.
    - Existiert in $\mathbb{R}$ immer, wenn Menge nicht leer und nach **oben** beschränkt (Ordnungsvollständigkeit).
    - Falls $max(X)$ existiert $\Rightarrow max(X) = sup(X)$.
- **Infimum** ($inf(X)$): Grösste untere Schranke.
    - Existiert in $\mathbb{R}$ immer, wenn Menge nicht leer und nach **unten** beschränkt.
    - Falls $min(X)$ existiert $\Rightarrow min(X) = inf(X)$.

### $\epsilon$-Charakterisierung

- Analytische Definition für Beweise [^satz2]:
    - **Supremum** $S$: $S$ ist obere Schranke **und** $\forall \epsilon > 0 \, \exists x \in X: x > S - \epsilon$.
    - **Infimum** $I$: $I$ ist untere Schranke **und** $\forall \epsilon > 0 \, \exists x \in X: x < I + \epsilon$.
    - *Interpretation:* Man kann die Schranke nicht um $\epsilon$ verschieben, ohne in die Menge einzutauchen.

[^def6]: **Einführung Slide 8**: Eine **Menge** ist eine Ansammlung/Zusammenfassung von (endlich oder unendlich vielen) **Elementen**, die entweder aufgelistet werden oder durch bestimmte Eigenschaften charakterisiert sind. <br> Eine spezielle Menge ist die **leere Menge**, $\emptyset$: die Menge ohne Element. <br> Falls ein Element $x$ in der Menge $M$ liegt, schreiben wir $x \in M$, andernfalls $x \notin M$.
[^def7]: **Einführung Slide 9**: Für **Teilmenge** führen wir die folgenden Schreibweisen ein: Dazu seinen $X$ und $Y$ zwei Mengen. <br> i) **Teilmenge** $X \subset Y$ (oder auch $X \subseteq Y$) <br> $\forall x \in X : x \in X \Rightarrow x \in Y$ <br> Falls $X$ keine Teilmenge von $Y$ ist, schreiben wir auch $X \not\subset Y$ <br> ii) **echte Teilmenge** $X \subsetneq Y$ <br> $(X \subset Y ) \land (X \neq Y)$ <br> iii) **Komplement** <br> Falls gilt $X \subset Y$ ist das Komplement $X^c$ gegeben als <br> $X^c := \{y \mid y \in Y \land y \notin X\}$
[^def8]: **Einführung Slide 10**: Mit Menge können wir folgende **Operationen** ausführen: <br> i) $\cup$ **Vereinigung** <br> $X \cup Y = \{x \mid x \in X \lor x \in Y \}$ <br> ii) $\cap$ **Durchschnitt** <br> $X \cap Y = \{x \mid x \in X \land x \in Y \}$ <br> iii) $\setminus$ **Differenz** <br> $X \setminus Y = \{x \mid x \in X \land x \notin Y \}$ <br> iv) $X \times Y$ **cartesisches (euklidisches) Produkt** <br> $X \times Y = \{(x, y) \mid x \in X \land y \in Y \}$
[^def9]: **Einführung Slide 11**: Die folgenden Zahlmengen werden wir oft verwenden <br> $\mathbb{N}$ die Menge der natürlichen Zahlen, $\mathbb{N} = \{1, 2, 3, \dots \}$. <br> $\mathbb{Z}$ die Menge der ganzen Zahlen, $\mathbb{Z} = \{\dots , -3, -2, -1, 0, 1, 2, 3, \dots \}$. <br> $\mathbb{Q}$ die Menge der rationalen Zahlen, $\mathbb{Q} = \{x = \frac{p}{q} \mid p, q \in \mathbb{Z} \}$. <br> $\mathbb{R}$ die Menge der reellen Zahlen.
[^def10]: **Einführung Slide 13**: Die wichtigsten Teilmengen von $\mathbb{R}$ sind **Intervalle**, $I \subset \mathbb{R}$. <br> **offenes Intervall** <br> $(a, b) = \{x \in \mathbb{R} \mid a < x < b\}$ <br> **abgeschlossenes Intervall** <br> $[a, b] = \{x \in \mathbb{R} \mid a \le x \le b\}$ <br> **halboffene Intervalle** <br> $[a, b) = \{x \in \mathbb{R} \mid a \le x < b\}$ <br> oder <br> $(a, b] = \{x \in \mathbb{R} \mid a < x \le b\}$
[^def11]: **Einführung Slide 16**: Eine **obere Schranke** einer Teilmenge $X \subset \mathbb{R}$ ist ein Element $y \in \mathbb{R}$ mit der folgenden Eigenschaft <br> $\forall x \in X : x \le y$ <br> Entsprechend ist eine **untere Schranke** einer Teilmenge $X \subset \mathbb{R}$ ein Element $y \in \mathbb{R}$ mit der folgenden Eigenschaft <br> $\forall x \in X : x \ge y$
[^def12]: **Einführung Slide 17**: Das **Maximum** von $X$, geschrieben $max(X)$, ist ein Element $x_0 \in X$ mit der folgenden Eigenschaft <br> $\forall x \in X : x \le x_0$ <br> Das **Minimum** von $X$, geschrieben $min(X)$, ist ein Element $x_0 \in X$ mit der folgenden Eigenschaft <br> $\forall x \in X : x \ge x_0$ <br> Die kleinste obere Schranke von $X$ nennt man **Supremum** von $X$, geschrieben $sup(X)$. <br> Die grösste untere Schranke von $X$ nennt man **Infimum** von $X$, geschrieben $inf (X)$.
[^satz2]: **Einführung Slide 18**: Es gelten die folgenden Tatsachen <br> i) Maximum und Minimum sind eindeutig bestimmte Kenngrössen einer Menge - sofern sie existieren. <br> ii) Jede nicht leere, nach unten (oben) beschränkte Teilmenge besitzt ein eindeutiges Infimum (Supremum). <br> iii) Das Supremum $S = \sup(X)$ einer Menge $X$ kann dadurch charakterisiert werden, dass gilt <br> $(\forall x \in X : x \le S) \land (\forall \varepsilon > 0 \exists x \in X : x > S - \varepsilon)$ <br> iv) Das Infimum $I = \inf(X)$ einer Menge $X$ kann dadurch charakterisiert werden, dass gilt <br> $(\forall x \in X : x \ge I) \land (\forall \varepsilon > 0 \exists x \in X : x < I + \varepsilon)$
