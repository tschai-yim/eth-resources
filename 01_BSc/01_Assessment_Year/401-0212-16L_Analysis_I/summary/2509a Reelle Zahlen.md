## Axiomatik der reellen Zahlen

- **Reelle Zahlen** $\mathbb{R}$: Eindeutig definiert als **geordneter, ordnungsvollständiger Körper** (Ordered and complete field) [^satz1].
    - **Körper** (Field): Algebraische Struktur. Definiert durch **Körperaxiome** (Addition/Multiplikation) & **Distributivgesetz** [^def1][^def2][^def3].
    - **Geordnet** (Ordered): Anordnung. Definiert durch **Ordnungsaxiome** (Reflexivität, Transitivität, Antisymmetrie, **Totalität**) & **Konsistenz** mit Körperoperationen [^def4][^def5].
    - **Ordnungsvollständig** (Order Complete): Garantiert Lückenlosigkeit (Kontinuum) [^def6].
- **Beweisnotwendigkeit**: "Banale" Fakten (z.B. $0x = 0$, $(-1)x = -x$, Eindeutigkeit von Inversen) folgen logisch aus Axiomen und erfordern rigorose Beweise [^satz2].

## Ordnungsvollständigkeit

- **Definition**: Zwei getrennte, nicht-leere Mengen $A, B \subset \mathbb{R}$ ($\forall a \in A, b \in B: a \le b$) besitzen stets ein **trennendes Element** $c \in \mathbb{R}$ mit $a \le c \le b$ [^def6].
    - **Rationales Analogon**: $\mathbb{Q}$ ist "löchrig" (unvollständig); besitzt kein allgemeines Trennelement $c \in \mathbb{Q}$ (z.B. bei $\sqrt{2}$).
- **Beweisbeispiel: Existenz von $\sqrt{2}$ in $\mathbb{R}$**:
    - *Mengen*: $A = \{a \in \mathbb{R} \mid 1 \le a \le 2, a^2 \le 2\}$, $B = \{b \in \mathbb{R} \mid 1 \le b \le 2, b^2 \ge 2\}$.
    - *Trennelement*: Existenz von $c$ durch Ordnungsvollständigkeit garantiert.
    - *Indirekter Beweis*: Annahme $c^2 \neq 2$.
    - *Widerspruch ($c^2 < 2$)*: Konstruktion $c + \frac{1}{n} \in A$ mittels **Archimedischem Prinzip**, sodass $(c + \frac{1}{n})^2 < 2$. Verletzt Eigenschaft von $c$ als obere Schranke von $A$.
    - *Fazit*: $c^2 = 2$ muss gelten.

## Kenngrössen

- **Maximum / Minimum**: Grösstes/kleinstes Element; Existenz nur, falls Element **Teil der Menge** ($\in X$) [^def7].
- **Absolutbetrag** (Absolute Value) $|x|$: Definiert als $\max\{x, -x\}$; geometrisch $|x| = \sqrt{x^2}$ [^def7].
    - Entspricht der **Euklidischen Norm** (Vektorlänge).
    - Immer: $|x| \ge 0$ und $x \le |x|$ [^satz4].

## Ungleichungen

- **Archimedisches Prinzip**: Jede Zahl $x \in \mathbb{R}$ wird durch Vielfaches $ny$ einer positiven Zahl $y$ übertroffen [^satz3].
    - **Konsequenz**: Für jedes $\varepsilon > 0$ existiert $n \in \mathbb{N}$ mit $\frac{1}{n} < \varepsilon$.
- **Dreiecksungleichung** (Triangle Inequality): $|x + y| \le |x| + |y|$ [^satz4].
    - *Nach unten*: $|x + y| \ge ||x| - |y||$ [^satz4].
- **Youngsche Ungleichung**: $2|xy| \le \varepsilon x^2 + \frac{1}{\varepsilon} y^2$ für $x, y \in \mathbb{R}, \varepsilon > 0$ [^satz5].
    - **Nutzen**: Abschätzen von Produkten ($xy$) durch Summen von Quadraten ($x^2, y^2$).
    - **Gewichtung**: Parameter $\varepsilon$ balanciert Einflüsse von $x$ und $y$.
    - **Beweisskizze**: Folgt unmittelbar aus $(\sqrt{\varepsilon}|x| - \frac{1}{\sqrt{\varepsilon}}|y|)^2 \ge 0$ durch Ausmultiplizieren.

[^satz1]: **I Logik, Mengen und Zahlen Teil 2 Slide 5**: Satz <br> $\mathbb{R}$ ist ein geordneter und ordnungsvollständiger Körper.
[^def1]: **I Logik, Mengen und Zahlen Teil 2 Slide 2**: Axiome der Addition <br> (A1) $\forall x, y, z \in \mathbb{R} : x + (y + z) = (x + y) + z$ (Assoziativität) <br> (A2) $\exists 0 \in \mathbb{R} \forall x \in \mathbb{R} : x + 0 = x$ (neutrales Element) <br> (A3) $\forall x \in \mathbb{R} \exists(-x) \in \mathbb{R} : x + (-x) = 0$ (inverses Element) <br> (A4) $\forall x, y \in \mathbb{R} : x + y = y + x$ (Kommutativität)
[^def2]: **I Logik, Mengen und Zahlen Teil 2 Slide 2**: Axiome der Multiplikation <br> (M1) $\forall x, y, z \in \mathbb{R} : x \cdot (y \cdot z) = (x \cdot y) \cdot z$ (Assoziativität) <br> (M2) $\exists 1 \in \mathbb{R} \forall x \in \mathbb{R} : x \cdot 1 = x$ (neutrales Element) <br> (M3) $\forall x \in \mathbb{R} \setminus \{0\} \exists x^{-1} \in \mathbb{R} : x \cdot x^{-1} = 1$ (inverses Element) <br> (M4) $\forall x, y \in \mathbb{R} : x \cdot y = y \cdot x$ (Kommutativität)
[^def3]: **I Logik, Mengen und Zahlen Teil 2 Slide 2**: Distributivitätsgesetz (Kompatibilität von Addition und Multiplikation) <br> $\forall x, y, z \in \mathbb{R} : x \cdot (y + z) = x \cdot y + x \cdot z = (y + z) \cdot x$.
[^def4]: **I Logik, Mengen und Zahlen Teil 2 Slide 3**: Ordnungsaxiome <br> (O1) $\forall x \in \mathbb{R} : x \le x$ (Reflexivität) <br> (O2) $\forall x, y, z \in \mathbb{R} : (x \le y \land y \le z) \Rightarrow x \le z$ (Transitivität) <br> (O3) $\forall x, y \in \mathbb{R} : (x \le y \land y \le x) \Rightarrow x = y$ (Antisymmetrie) <br> (O4) $\forall x, y \in \mathbb{R} : x \le y \text{ oder } y \le x$ (Totalität)
[^def5]: **I Logik, Mengen und Zahlen Teil 2 Slide 3**: Konsistenz mit Addition und Multiplikation <br> (K1) $\forall x, y, z \in \mathbb{R} : x \le y \Rightarrow x + z \le y + z$ <br> (K2) $\forall x, y \in \mathbb{R} : (x \ge 0 \land y \ge 0) \Rightarrow x \cdot y \ge 0$
[^def6]: **I Logik, Mengen und Zahlen Teil 2 Slide 4**: Ordnungsvollständigkeit <br> Seien $A, B \subseteq \mathbb{R}$ so, dass <br> 1. $A \neq \emptyset, \quad B \neq \emptyset$, <br> 2. $\forall a \in A \forall b \in B : a \le b$. <br> Dann gibt es ein $c \in \mathbb{R}$ so dass <br> $\forall a \in A : a \le c \quad \text{und} \quad \forall b \in B : c \le b$.
[^satz2]: **I Logik, Mengen und Zahlen Teil 2 Slide 5**: Korollar <br> 1. Additive und multiplikative Inverse sind eindeutig bestimmt. <br> 2. $\forall x \in \mathbb{R} : 0 \cdot x = 0$. <br> 3. $\forall x \in \mathbb{R} : (-1) \cdot x = -x$. <br> 4. $\forall y \in \mathbb{R} : y \ge 0 \iff -y \le 0$. <br> 5. $\forall y \in \mathbb{R} : y^2 \ge 0$. <br> 6. Aus $x \le y$ und $u \le v$ folgt $x + u \le y + v$. <br> 7. Falls gilt $0 \le x \le y$ und $u \ge 0$, gilt auch $xu \le yu$.
[^def7]: **I Logik, Mengen und Zahlen Teil 2 Slide 7**: Definition <br> 1. $\max\{x, y\} := \begin{cases} x, & \text{falls } y \le x, \\ y, & \text{falls } x \le y, \end{cases}$ <br> 2. $\min\{x, y\} := \begin{cases} y, & \text{falls } y \le x, \\ x, & \text{falls } x \le y, \end{cases}$ <br> 3. Absolutbetrag: $|x| := \max\{x, -x\} = \begin{cases} x, & x \ge 0, \\ -x, & \text{sonst.} \end{cases}$
[^satz4]: **I Logik, Mengen und Zahlen Teil 2 Slide 7**: Satz (Eigenschaften des Absolutbetrags) <br> 1. $|x| \ge 0$. <br> 2. $|x + y| \le |x| + |y|$ (Dreiecksungleichung). <br> 3. $|x + y| \ge ||x| - |y||$.
[^satz3]: **I Logik, Mengen und Zahlen Teil 2 Slide 6**: Korollar (Archimedisches Prinzip) <br> 1. Für $x \in \mathbb{R}$ und $y > 0$ existiert $n \in \mathbb{N}$ mit $ny > x$. <br> 2. Für jedes $\varepsilon > 0$ existiert $n \in \mathbb{N}$ mit $\frac{1}{n} < \varepsilon$.
[^satz5]: **I Logik, Mengen und Zahlen Teil 2 Slide 7**: Satz (Youngsche Ungleichung) <br> Für jedes $\varepsilon > 0$ und alle $x, y \in \mathbb{R}$ gilt: <br> $2|xy| \le \varepsilon x^2 + \frac{1}{\varepsilon}y^2$.
