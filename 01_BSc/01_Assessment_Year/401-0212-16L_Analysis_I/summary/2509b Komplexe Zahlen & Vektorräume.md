## Vektorraum $\mathbb{R}^n$ (Euklidischer Raum)

- $\mathbb{R}^n$: Raum der $n$-dimensionalen Vektoren; Addition, Subtraktion, Skalierung möglich.
- **Standard-Skalarprodukt** (Standard Inner Product): $\langle x, y \rangle = \sum_i x_i y_i$ [^def_rn_ops].
- **Euklidische Norm** (Euclidean Norm): Vektorlänge, $\|x\| = \sqrt{\langle x, x \rangle}$ [^def_rn_ops].
- **Euklidischer Abstand** (Euclidean Distance): Abstand zweier Vektoren, $d(x, y) = \|x-y\|$ [^def_rn_ops].
- **Wichtige Eigenschaften**:
    - **Dreiecksungleichung**: $\|x - z\| \le \|x - y\| + \|y - z\|$ [^prop_triangle_rn].
    - **Keine Anordnung**: Für $n > 1$ können Vektoren nicht der Grösse nach geordnet werden.

## Einführung der Komplexen Zahlen $\mathbb{C}$

- **Motivation**: Lösung von Gleichungen, die in $\mathbb{R}$ unlösbar sind (z.B. $x^2+1=0$), durch **Körpererweiterung**.
- **Imaginäre Einheit** (Imaginary Unit): Neue Grösse $i$ mit der Eigenschaft $i^2 = -1$ [^def_complex_parts].
    - **Notation**: $i \neq \sqrt{-1}$, um Konflikte mit der reellen Wurzeldefinition zu vermeiden.
- Menge der **komplexen Zahlen**: $\mathbb{C} = \{a + ib \mid a, b \in \mathbb{R}\}$ [^def_complex].
- **Normalform** (Cartesian Form): $z = a+ib$ [^def_complex_parts].
    - $a = \text{Re}(z)$: **Realteil**.
    - $b = \text{Im}(z)$: **Imaginärteil**.
    - **Wichtig**: $\text{Re}(z), \text{Im}(z) \in \mathbb{R}$.
    - $a=0, b \neq 0$: **rein imaginär**.
- **Verlust der Ordnung**: Die Anordnungsrelationen $(<, >)$ existieren in $\mathbb{C}$ nicht.

## Arithmetik in $\mathbb{C}$

- **Addition/Subtraktion**: Komponentenweise, analog zu Vektoren [^def_complex_arithmetic].
- **Multiplikation**: Ausmultiplizieren wie Binome, mit $i^2 = -1$ [^def_complex_arithmetic].
- **Division**: Durch Erweitern mit dem komplex Konjugierten des Nenners [^rules_division].
    - $\frac{z}{w} = \frac{z \cdot \bar{w}}{|w|^2}$
- **Komplex konjugierte Zahl** (Complex Conjugate): $\bar{z}$ zu $z = a+ib$ ist $\bar{z} = a-ib$ [^def_complex_conj]. Eigenschaften: [^satz_conj_props]
    - $z \cdot \bar{z} = a^2+b^2 = |z|^2$ (Ergebnis ist reell, $\ge 0$).
    - $z + \bar{z} = 2\text{Re}(z)$
    - $z - \bar{z} = 2i\text{Im}(z)$
    - $\overline{z+w} = \bar{z}+\bar{w}$ und $\overline{z \cdot w} = \bar{z} \cdot \bar{w}$.

## Kenngrössen

- **Betrag** (Absolute Value / Modulus) $|z|$: Vektorlänge (Pythagoras), $|z| = \sqrt{a^2+b^2}$ [^def_abs_dist].
    - Kompatibel mit reellem Absolutbetrag für $\text{Im}(z) = 0$.
- **Abstand** (Distance): Abstand von $z_1, z_2$ ist $d = |z_2 - z_1|$ [^def_abs_dist].
- **Dreiecksungleichung**: $|z+w| \le |z|+|w|$ [^satz_triangle_c].
    - Geometrisch: Länge einer Dreiecksseite $\le$ Summe der Längen der anderen beiden Seiten.

## Geometrische Darstellung

- **Gausssche Zahlenebene** (Complex Plane): 2D-Ebene mit horizontaler Realteil- und vertikaler Imaginärteil-Achse.
- Darstellung von $z=a+ib$ als **Punkt** $(a,b)$ oder **Ortsvektor**.

## Polarform und Eulersche Formel

- **Motivation**: Vereinfacht Potenzieren (z.B. $(1+i)^{175}$) im Vergleich zur Normalform.
- **Polarform** (Polar Form): $z = r e^{i\phi}$ beschreibt durch **Betrag** $r = |z|$ und **Winkel/Argument** $\phi$ zur pos. reellen Achse [^def_polar].
    - Konvention: $\phi \in (-\pi, \pi]$.
- **Eulersche Formel**: Verbindet Trigonometrie und Exponentialfunktionen [^formel_euler].
    - $e^{i\phi} = \cos(\phi) + i\sin(\phi)$
    - **Folgerungen**: $\cos(\phi) = \frac{e^{i\phi} + e^{-i\phi}}{2}$ und $\sin(\phi) = \frac{e^{i\phi} - e^{-i\phi}}{2i}$ [^folgerung_trig].
- **Umrechnung Normalform $\leftrightarrow$ Polarform** [^conv_polar_normal]:
    - **Polar $\to$ Normal**: $a = r \cos(\phi)$, $b = r \sin(\phi)$.
    - **Normal $\to$ Polar** ($z=a+ib$): $r = \sqrt{a^2+b^2}$, $\phi$ per Fallunterscheidung (z.B. mit $\arctan$).
- **Periodizität**: $e^z = e^{z+i2\pi k}$ für $k \in \mathbb{Z}$ [^rules_exp_c].

## Operationen in Polarform

- Operationen in Polarform sind oft einfacher [^rules_polar_ops]:
    - **Multiplikation**: $|z_1 z_2| = |z_1||z_2|$, $\arg(z_1 z_2) = \arg(z_1) + \arg(z_2)$.
    - **Division**: $|z_1/z_2| = |z_1|/|z_2|$, $\arg(z_1/z_2) = \arg(z_1) - \arg(z_2)$.
    - **Potenzieren** (Satz von De Moivre): $|z^n| = |z|^n$, $\arg(z^n) = n \cdot \arg(z)$.
- **Geometrische Interpretation der Multiplikation**: **Drehstreckung** (Drehung um $\arg(z)$, Streckung um $|z|$).

## Wurzelziehen in $\mathbb{C}$

- **Problem**: Lösen von $z^n = w$ für $w = re^{i\phi}$.
- **Lösungsformel**: Genau $n$ Lösungen [^formel_roots].
    - $z_k = r^{1/n} e^{i(\frac{\phi}{n} + \frac{2\pi k}{n})}$ für $k = 0, 1, \dots, n-1$.
- **Geometrische Interpretation**: Die $n$ Lösungen bilden ein **regelmässiges $n$-Eck** auf einem Kreis mit Radius $r^{1/n}$.

## Fundamentalsatz der Algebra und Polynome

- **Fundamentalsatz der Algebra**: Jedes Polynom vom Grad $n \ge 1$ hat in $\mathbb{C}$ genau $n$ Nullstellen (mit **Vielfachheit** (Multiplicity) gezählt) [^thm_funda_algebra].
    - Folge: Jedes Polynom kann in $n$ **Linearfaktoren** zerlegt werden: $p(z) = a_n(z - z_1) \dots (z - z_n)$.
- **Polynome mit reellen Koeffizienten**: Nicht-reelle Nullstellen treten als **komplex konjugierte Paare** auf [^merkregel_real_coeff].
- **Anwendungen**:
    - **Quadratische Gleichungen**: Mitternachtsformel gilt auch für $a,b,c \in \mathbb{C}$ [^formel_quadratic]. $\pm\sqrt{\dots}$ steht für die beiden komplexen Wurzeln.
    - **Gleichungen höheren Grades**:
        1. **Nullstelle raten** (z.B. $x=1$).
        2. **Polynomdivision** durch $(x - \text{Nullstelle})$.
        3. Wiederholen bis quadratisches Restpolynom, dann Mitternachtsformel.H
- **Verbindung zu Differentialgleichungen**: Nullstellen $a \pm ib$ des charakteristischen Polynoms einer ODE führen zu reellen Schwingungslösungen der Form $e^{ax}\cos(bx)$ und $e^{ax}\sin(bx)$.

[^def_rn_ops]: **I Logik, Mengen und Zahlen Teil 3 Slide 2**: Definition <br> Für $x, y \in \mathbb{R}^n$ ist das **(Standard-)Skalarprodukt** gegeben durch <br> $x \cdot y = <x, y> = [x, y] := \sum_{i=1}^n x_i y_i$ <br> die **Euklidische Norm** ist gegeben durch <br> $\|x\| := \sqrt{\sum_{i=1}^n x_i^2}$ <br> und der **Euklidische Abstand** zwischen $x$ und $y$ ist gegeben durch <br> $d(x, y) := \sqrt{\sum_{i=1}^n (x_i - y_i)^2}$
[^prop_triangle_rn]: **I Logik, Mengen und Zahlen Teil 3 Slide 3**: Proposition (Dreiecksungleichung) <br> Für alle $x, y, z \in \mathbb{R}^n$ gilt <br> $\|x - z\| \le \|x - y\| + \|y - z\|$
[^def_complex_parts]: **I Logik, Mengen und Zahlen Teil 3 Slide 5**: Die Darstellung $z = a + ib$ einer komplexen Zahl nennt man **Normalform (arithmetische Form, kartesische Form)**. <br> $a$ heisst **Realteil**, geschrieben $a = \text{Re}(z)$. <br> $b$ heisst **Imaginärteil**, geschrieben $b = \text{Im}(z)$. <br> $i$ ist die **imaginäre/komplexe Einheit** mit der Eigenschaft <br> $i^2 = -1$. <br> Ist $a=0$, so nennt man $z=ib$ **rein imaginär**.
[^def_complex]: **I Logik, Mengen und Zahlen Teil 3 Slide 4**: Definition <br> Die **komplexen Zahlen** sind diejenigen Zahlen, die wir schreiben können als <br> $z = a + ib = a + bi$ wobei $a, b \in \mathbb{R}$ <br> Die Menge aller komplexen Zahlen bezeichnen wir mit $\mathbb{C}$. <br> Also <br> $\mathbb{C} = \{a + ib \mid a, b \in \mathbb{R}\}$
[^def_complex_arithmetic]: **I Logik, Mengen und Zahlen Teil 3 Slide 6**: Arithmetik der komplexen Zahlen (Rechenregeln) <br> **Addition und Subtraktion** <br> Für zwei komplexe Zahlen $z_1 = x_1 + iy_1$ und $z_2 = x_2 + iy_2$ gilt <br> $z_1 + z_2 = (x_1 + x_2) + i(y_1 + y_2)$ <br> sowie <br> $z_1 - z_2 = (x_1 - x_2) + i(y_1 - y_2)$ <br> **Multiplikation** <br> Für zwei komplexe Zahlen $z_1 = x_1 + iy_1$ und $z_2 = x_2 + iy_2$ gilt <br> $z_1 \cdot z_2 = x_1x_2 - y_1y_2 + i(x_1y_2 + y_1x_2)$
[^rules_division]: **I Logik, Mengen und Zahlen Teil 3 Slide 7**: Die Division zweier komplexer Zahlen erhalten wir, indem wir mit der komplex konjugierten Zahl des Nenners erweitern und dann wie gewohnt rechnen. <br> Damit gelten dann auch die folgenden Regeln: <br> $z/w = \frac{z \cdot \bar{w}}{w \cdot \bar{w}} = \frac{z \cdot \bar{w}}{|w|^2}, \quad z, w \in \mathbb{C}$ <br> $\overline{z/w} = \bar{z}/\bar{w}, \quad z, w \in \mathbb{C}$
[^def_complex_conj]: **I Logik, Mengen und Zahlen Teil 3 Slide 7**: Definition <br> Für eine komplexe Zahl $z = x + iy$ ist die zu $z$ **komplex konjugierte Zahl** gegeben durch <br> $\bar{z} = \overline{x + iy} = x - iy$
[^satz_conj_props]: **I Logik, Mengen und Zahlen Teil 3 Slide 8**: Satz (Eigenschaften der komplex konjugierten Zahl) <br> Es gilt: <br> • $z \cdot \bar{z} = |z|^2$ <br> • $z + \bar{z} = 2\text{Re}(z)$ und $z - \bar{z} = 2i\text{Im}(z)$ <br> • $\bar{\bar{z}} = z$ <br> • $\overline{z \pm w} = \bar{z} \pm \bar{w}, \quad z, w \in \mathbb{C}$ <br> • $\overline{z \cdot w} = \bar{z} \cdot \bar{w}, \quad z, w \in \mathbb{C}$ <br> • $z = \bar{z}$, falls $z \in \mathbb{R}$ <br> • $\bar{z} = -z$, falls $z$ rein imaginär
[^def_abs_dist]: **I Logik, Mengen und Zahlen Teil 3 Slide 11**: Definition <br> Der **Betrag** $|z|$ einer komplexen Zahl $z = a + ib$ ist die Länge des dazugehörigen Vektors <br> $|z| = \sqrt{a^2 + b^2}$, <br> respektive der Abstand vom Ursprung. <br> Der **Abstand** zweier komplexer Zahlen $z_1$ und $z_2$ ist <br> $d = |z_2 - z_1| = |z_1 - z_2|$
[^satz_triangle_c]: **I Logik, Mengen und Zahlen Teil 3 Slide 11**: Satz (Dreiecksungleichung) <br> Es gilt für $z, w \in \mathbb{C}$ <br> $|z + w| \le |z| + |w|$
[^def_polar]: **I Logik, Mengen und Zahlen Teil 3 Slide 15**: Definition <br> Eine komplexe Zahl kann auch durch Angabe des Abstandes zum Ursprung und durch Angabe eines geeigneten Winkels beschrieben werden (**Polarform**): <br> $z = r \cdot e^{i\phi}$ <br> Dabei gilt <br> $|z| = r \ge 0$ <br> $\phi \in (-\pi, \pi]$ **Polarwinkel (Argument)** <br> Und wir schreiben $\phi = \text{arg}(z) = \text{arc}(z)$
[^formel_euler]: **I Logik, Mengen und Zahlen Teil 3 Slide 12**: Setzen wir in dieser Formel $x = it$ ein, erhalten wir die **Eulersche Formel** <br> $e^{it} = \cos(t) + i\sin(t), \quad t \in \mathbb{R}$
[^folgerung_trig]: **I Logik, Mengen und Zahlen Teil 3 Slide 13**: Folgerung <br> Wir können $\sin(t)$ und $\cos(t)$ mit Hilfe von komplexen Exponentialfunktionen schreiben <br> $\cos(t) = \frac{e^{it} + e^{-it}}{2}$ <br> und <br> $\sin(t) = \frac{e^{it} - e^{-it}}{2i}$
[^conv_polar_normal]: **I Logik, Mengen und Zahlen Teil 3 Slide 16**: Umrechnung zwischen Polar- und Normalform <br> **Polar- in Normalform**: $z = re^{i\phi} \to z=x+iy$ <br> $x = r \cos(\phi)$ <br> $y = r \sin(\phi)$ <br> **Normal- in Polarform**: $z = x+iy \to z = re^{i\phi}$ <br> $r = |z| = \sqrt{x^2+y^2}$ <br> $\phi = \arctan(y/x)$ falls $x > 0$ <br> $\phi = \arctan(y/x) + \pi$ falls $x < 0$ und $y \ge 0$ <br> $\phi = \arctan(y/x) - \pi$ falls $x < 0$ und $y < 0$ <br> Konvention für $x=0, y \neq 0$: $\text{arg}(iy) = \pi/2$ für $y>0$ und $-\pi/2$ für $y<0$.
[^rules_exp_c]: **I Logik, Mengen und Zahlen Teil 3 Slide 14**: Exponentialfunktion mit komplexen Argumenten <br> Wir können für die Exponentialfunktion auch komplexe Argumente zulassen. <br> Dann gelten die folgenden **Regeln** <br> $e^{z+w} = e^z \cdot e^w$ <br> $e^z = e^{a+ib} = e^a(\cos(b) + i\sin(b))$ <br> $e^{z+i2\pi} = e^z$
[^rules_polar_ops]: **I Logik, Mengen und Zahlen Teil 3 Slide 17**: Potenzen komplexer Zahlen <br> Es sind die folgenden **Regeln** zu beachten: <br> i) $z_1 \cdot z_2 = r_1e^{i\phi_1} \cdot r_2e^{i\phi_2} = r_1r_2e^{i(\phi_1+\phi_2)}$ <br> ii) $z_1/z_2 = r_1e^{i\phi_1} / r_2e^{i\phi_2} = \frac{r_1}{r_2}e^{i(\phi_1-\phi_2)}$ <br> iii) $z^n = r^n e^{in\phi}$
[^formel_roots]: **I Logik, Mengen und Zahlen Teil 3 Slide 18**: Wurzeln aus komplexen Zahlen <br> Für $n \in \mathbb{N}$ sind die Lösungen der Gleichung <br> $z^n = re^{i\phi}$ <br> gegeben durch <br> $z_k = r^{1/n} e^{i(\frac{\phi}{n} + \frac{2\pi k}{n})}, \quad k = 0, \dots, n-1$
[^thm_funda_algebra]: **I Logik, Mengen und Zahlen Teil 3 Slide 20**: Theorem (Fundamentalsatz der Algebra) <br> Jedes Polynom <br> $p(z) = a_nz^n + a_{n-1}z^{n-1} \dots + a_1z + a_0 = \sum_{k=0}^n a_k z^k, \quad a_k \in \mathbb{C}$ <br> kann in $n$ **Linearfaktoren** faktorisiert werden, d.h. geschrieben werden als <br> $p(z) = a_n(z - z_1)(z - z_2) \dots (z - z_{n-1})(z - z_n)$. <br> Die Zahlen $z_k$ sind also gerade die Nullstellen von $p(z)$ (mit **Vielfachheit**).
[^merkregel_real_coeff]: **I Logik, Mengen und Zahlen Teil 3 Slide 21**: Allgemeine Merkregel <br> Die nicht-reellen Nullstellen eines Polynoms mit **reellen** Koeffizienten treten in komplex konjugierten Paaren auf.
[^formel_quadratic]: **I Logik, Mengen und Zahlen Teil 3 Slide 19**: Anwendung des Wurzelziehens: Lösen quadratischer Gleichungen <br> **Problem**: Gesucht sind die Lösungen der quadratischen Gleichung <br> $az^2 + bz + c = 0$, <br> wobei $a, b$ und $c$ komplexe Zahlen sind. <br> **Lösung: Formel** <br> $z_{1,2} = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$
