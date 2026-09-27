## Beschränktheit und Monotonie

- **Definitionen:**
    - **Beschränktheit (Boundedness):** Existenz einer oberen und unteren Schranke ($M \le a_n \le K$) [^def_eigenschaften].
    - **Monotonie (Monotonicity):** Klare Entwicklungsrichtung ($a_{n+1} \le a_n$ oder $a_{n+1} \ge a_n$) [^def_eigenschaften].
- **Zusammenhänge zur Konvergenz:**
    - Konvergenz $\Rightarrow$ zwingend beschränkt [^lem_konv_beschr].
    - **Achtung:** Beschränktheit allein bedingt **keine** Konvergenz (z.B. Oszillation $a_n = (-1)^n$, unendlich viele Häufungspunkte bei $a_n = \sin(n)$).
    - Beschränkt **und** monoton $\Rightarrow$ zwingend konvergent [^thm_beschr_monoton] [^thm_monoton_sup_inf].
- **Grenzwerte monotoner Folgen:**
    - Monoton wachsend: Grenzwert = Supremum der Folgeglieder.
    - Monoton fallend: Grenzwert = Infimum der Folgeglieder.

## Limes Superior und Limes Inferior

- **Konzept:** Betrachtung der Restglieder ab Index $n$. Menge der Kandidaten schrumpft mit wachsendem $n$.
- **Limes superior ($\limsup$):** Limes der Suprema dieser Restglieder [^def_limsup_inf].
    - = **Grösstmöglicher Häufungspunkt (Accumulation Point)** der Folge [^thm_limsup_hp].
    - Hilfsfolge der Suprema ($s_n$) ist stets monoton fallend.
- **Limes inferior ($\liminf$):** Limes der Infima dieser Restglieder [^def_limsup_inf].
    - = **Kleinstmöglicher Häufungspunkt** der Folge.
    - Hilfsfolge der Infima ($j_n$) ist stets monoton wachsend.
- **Eigenschaften:**
    - **Notation:** Zwingend $\limsup$ / $\liminf$ (Schreibweise $\overline{\lim}$ fehleranfällig).
    - **Konvergenz-Äquivalenz:** Beschränkte Folge konvergiert $\iff \limsup = \liminf = \lim$ [^lem_limsup_inf].
    - **Satz von Bolzano-Weierstrass:** Jede beschränkte Folge in $\mathbb{R}$ besitzt mindestens einen Häufungspunkt (und konvergente Teilfolge) [^cor_bolzano].
- **Berechnungsbeispiel:** $a_n = (-1)^n \cdot 2 + (-1)^n \frac{1}{n}$
    - *Tipp:* Erste Glieder auflisten ($-3, \frac{5}{2}, -\frac{7}{3}, \frac{9}{4}$).
    - Ungerade Indizes: monoton wachsend gegen $-2 \Rightarrow \liminf = -2$.
    - Gerade Indizes: monoton fallend gegen $2 \Rightarrow \limsup = 2$.

## Cauchy-Folgen

- **Konzept & Metrik-Warnung:**
    - Ziel: Konvergenz-Nachweis ohne explizite Kenntnis des Grenzwerts.
    - Sätze basieren stets auf dem gewohnten Absolutbetrag (Abstand $|x-y|$).
    - *Warnung:* Bei alternativen Metriken (z.B. diskrete Metrik: $d(x,y)=1$ für $x \neq y$, sonst $0$) konvergiert z.B. $1/n$ **nicht**, da der Abstand zur $0$ bis zur Unendlichkeit konstant $1$ bleibt (wird nie $< \varepsilon$).
- **Formalismus:**
    - **Definition:** Abstand zweier **beliebiger** Glieder ab Index $N$ strikt kleiner als Toleranz $\varepsilon$ ($|a_n - a_m| < \varepsilon \quad \forall n, m \ge N$) [^def_cauchy].
    - Beschränktheit: Jede Cauchy-Folge ist zwingend beschränkt [^lem_cauchy_beschr].
    - **Hauptsatz:** In $\mathbb{R}$ gilt: Folge konvergent $\iff$ Folge ist Cauchy-Folge [^thm_cauchy_konv].
- **Wichtige Beispiele & Beweistricks:**
    - **Nullfolge $1/n$:** Ist Cauchy-Folge.
        - *Beweis-Skizze:* Direkte Abschätzung der Differenz: $|\frac{1}{n} - \frac{1}{m}| \le \frac{1}{\min(n,m)} < \varepsilon$.
    - **Teleskopsumme ($s_n = \sum_{k=1}^n \frac{1}{k^2}$):** Ist Cauchy-Folge.
        - *Trick:* Summand-Abschätzung $\frac{1}{k^2} < \frac{1}{k(k-1)} = \frac{1}{k-1} - \frac{1}{k}$.
        - Teleskop-Effekt in Differenz $|s_n - s_m|$ löscht innere Terme, verbleibender Rest $\frac{1}{m} - \frac{1}{n} \to 0$.
    - **Harmonische Reihe ($c_n = \sum_{k=1}^n \frac{1}{k}$):** Divergent $\Rightarrow$ **keine** Cauchy-Folge.
        - *Beweis-Skizze (Pakete schnüren):* $(1/3 + 1/4) > 1/2$ und $(1/5 + \dots + 1/8) > 1/2$.
        - Unendliche Paketbildung $> 1/2$ erzwingt Divergenz gegen $\infty$.

[^def_eigenschaften]: 02b Folgen, Slide 3: **Definition** <br> Eine Folge $(a_n)_{n \in \mathbb{N}_0}$ nennen wir **nach unten/oben beschränkt**, falls die Menge $M = \{a_n \mid n \in \mathbb{N}_0\}$ eine untere/obere Schranke besitzt. <br> Eine Folge, welche nach oben und nach unten beschränkte ist, nennen wir kurz **beschränkte Folge**. <br> Eine Folge $(a_n)_{n \in \mathbb{N}_0}$ nennen wir **monoton fallend/monoton wachsend**, falls gilt $\forall n, m \in \mathbb{N}_0 : m > n \Rightarrow a_m \le a_n$ respektive $\forall n, m \in \mathbb{N}_0 : m > n \Rightarrow a_m \ge a_n$. <br> Eine Folge $(a_n)_{n \in \mathbb{N}_0}$ nennen wir **streng monoton fallend/streng monoton wachsend**, falls gilt $\forall n, m \in \mathbb{N}_0 : m > n \Rightarrow a_m < a_n$ respektive $\forall n, m \in \mathbb{N}_0 : m > n \Rightarrow a_m > a_n$.
[^lem_konv_beschr]: 02b Folgen, Slide 5: **Lemma** Jede konvergente Folge ist beschränkt.
[^thm_beschr_monoton]: 02b Folgen, Slide 4: **Satz** Jede beschränkte und monotone Folge konvergiert.
[^thm_monoton_sup_inf]: 02b Folgen, Slide 6: **Satz** i) Eine monotone Folge reeller Zahlen $(a_n)_{n \in \mathbb{N}_0}$ konvergiert genau dann, wenn sie beschränkt ist. ii) Falls die Folge $(a_n)_{n \in \mathbb{N}_0}$ monoton wachsend ist, gilt $\lim_{n \to \infty} a_n = \sup \{a_n \mid n \in \mathbb{N}_0\}$. iii) Falls die Folge $(a_n)_{n \in \mathbb{N}_0}$ monoton fallend ist, gilt $\lim_{n \to \infty} a_n = \inf \{a_n \mid n \in \mathbb{N}_0\}$.
[^def_limsup_inf]: 02b Folgen, Slide 7: **Definition** <br> Die Grösse $\limsup_{n \to \infty} a_n = \lim_{n \to \infty} \sup \{a_k \mid k \ge n\}$ heisst **Limes superior** der Folge $a_n$. <br> Die Grösse $\liminf_{n \to \infty} a_n = \lim_{n \to \infty} \inf \{a_k \mid k \ge n\}$ heisst **Limes inferior** der Folge $a_n$.
[^thm_limsup_hp]: 02b Folgen, Slide 9: **Satz** Es sei $(a_n)_{n \in \mathbb{N}_0}$ eine beschränkte Folge mit $A = \limsup_{n \to \infty} a_n$. Dann ist $A$ eine Häufungspunkt und für alle $\varepsilon > 0$ gilt, i) dass es nur endlich viele Elemente $a_n$ gibt, für welche gilt $a_n \ge A + \varepsilon$. ii) dass für unendlich viele Elemente gilt $A - \varepsilon < a_n < A + \varepsilon$. Eine analoge Aussage gilt selbstverständlich für den limes inferior.
[^lem_limsup_inf]: 02b Folgen, Slide 8: **Lemma** Es gelten die folgenden Tatsachen: i) $\limsup_{n \to \infty} a_n = \inf_{n \in \mathbb{N}} (\sup \{a_k \mid k \ge n\})$. ii) $\liminf_{n \to \infty} a_n = \sup_{n \in \mathbb{N}} (\inf \{a_k \mid k \ge n\})$. iii) Ist $(a_n)_{n \in \mathbb{N}_0}$ eine konvergente Folge, so gilt $\lim_{n \to \infty} a_n = \limsup_{n \to \infty} a_n = \liminf_{n \to \infty} a_n$. iv) Eine beschränkte Folge $(a_n)_{n \in \mathbb{N}_0}$ konvergiert genau dann, wenn gilt $\lim_{n \to \infty} a_n = \limsup_{n \to \infty} a_n = \liminf_{n \to \infty} a_n$.
[^cor_bolzano]: 02b Folgen, Slide 10: **Korollar** Jede beschränkte Folge reeller Zahlen hat einen Häufungspunkt und eine konvergente Teilfolge.
[^def_cauchy]: 02b Folgen, Slide 11: **Definition** Eine Folge $(a_n)_{n \in \mathbb{N}_0} \subset \mathbb{R}$ heisst **Cauchy-Folge**, falls für jedes $\varepsilon > 0$ ein $N \in \mathbb{N}$ existiert, so dass gilt $\forall m, n \ge N \, |a_n - a_m| < \varepsilon$.
[^lem_cauchy_beschr]: 02b Folgen, Slide 12: **Lemma** Jede Cauchy-Folge ist beschränkt.
[^thm_cauchy_konv]: 02b Folgen, Slide 13: **Satz** Eine Folge reeller Zahlen konvergiert genau dann, wenn sie eine Cauchy-Folge ist.
