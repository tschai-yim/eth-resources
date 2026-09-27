## Modellierung mit Differentialgleichungen

- **Modellierung:** Mathematische Übersetzung realer Phänomene via Änderungsraten (Ableitungen).
    - **Plausibilitätsprüfungen:** Zwingende Einhaltung physikalischer/biologischer Grenzen im Modell (z.B. Vermeidung negativer Konzentrationen, Stoppen bei Ressourcenmangel).
- **Wichtige Modelltypen:**
    - **Proportionaler Abbau / Wachstum:** Änderung proportional zur aktuellen Menge $\Rightarrow u'(t) = k \cdot u(t)$. (Generiert Exponentialfunktion).
    - **Beschränktes Wachstum (Logistisches Wachstum):** $u'(t) = k \cdot u(t) \cdot (1 - \frac{u(t)}{L})$. **Tragfähigkeit** $L$ (Kapazitätsgrenze) erzwingt Stopp des Wachstums bei Erreichen des Limits $L$.
    - **Bimolekulare Reaktion:** $A + B \to C \Rightarrow u'(t) = k \cdot (a-u(t)) \cdot (b-u(t))$. Reaktion blockiert ($u'=0$), sobald eine der Startsubstanzen ($a$ oder $b$) aufgebraucht ist.
- **Gekoppelte Systeme (Beispiel Alkoholabbau):**
    - **Magen-Darm-Trakt** $m_D$: Rein proportionaler Abbau $\Rightarrow m_D'(t) = -k \cdot m_D(t)$.
    - **Blut/Leber** $m_B$: Positiver Input aus Magen minus konstanter Leberabbau (beschränkte Kapazität) $\Rightarrow m_B'(t) = k \cdot m_D(t) - a$.
    - **Resultat:** System gekoppelter DGLs (Lösung von $m_D$ fliesst direkt in Gleichung von $m_B$ ein).

## Klassifizierung von Differentialgleichungen

- **Differentialgleichung** (Ordinary differential equation; ODE): Gleichung zur Verknüpfung einer unbekannten Funktion mit ihren Ableitungen [^def_dgl].
- **Klassifizierungs-Eigenschaften:**
    - **Ordnung** (Order): Bestimmt durch die *höchste* vorkommende Ableitung (z.B. $y^{(5)} \Rightarrow$ 5. Ordnung) [^def_lin_dgl].
    - **Linearität** (Linearity): Funktion $y$ und alle Ableitungen treten *ausschliesslich linear* auf [^def_lin_dgl].
        - Multiplikation nur mit **Koeffizienten-Funktionen** $a_i(x)$ erlaubt.
        - *Nicht linear:* Potenzen ($u^2$), Funktionen ($ln(u), \sin(u)$) oder Produkte von Ableitungen ($u \cdot u'$).
    - **Homogenität** (Homogeneity): Alle Terme abhängig von $y$ stehen isoliert. Restliche Terme bilden die **Störfunktion** $s(x)$ [^def_lin_dgl].
        - **Homogen**: Keine Störfunktion existent ($s(x) = 0$). System komplett isoliert.
        - **Inhomogen**: Störfunktion existent ($s(x) \neq 0$). *Achtung:* Auch hochkomplexe Störfunktionen (z.B. $s(x) = \ln(x)$) verletzen die Linearität der DGL nicht.
    - **Konstante Koeffizienten**: Spezifischer Sonderfall linearer DGLs, bei dem alle Faktoren $a_i(x)$ reine Konstanten (Zahlen) sind (z.B. $5y'' - 3y = 0$) [^def_const_coeff].

## Lineare, homogene Differentialgleichungen

- *Analogie zur Linearen Algebra:* Die Lösungsmenge einer homogenen, linearen DGL verhält sich exakt wie ein **Vektorraum** (sie bildet den Kern eines linearen Differentialoperators).
- **Superpositionsprinzip:** Jede beliebige Linearkombination von gefundenen Teillösungen ergibt zwingend wieder eine gültige Lösung ($y = C_1 y_1 + C_2 y_2$) [^satz_superposition].
    - *Bedingung:* Gilt strikt nur für homogene DGLs (Störfunktionen würden sich bei Addition fälschlicherweise aufsummieren).
- **Fundamentallösungen:** Eine DGL $n$-ter Ordnung besitzt exakt $n$ linear unabhängige Teillösungen [^satz_fundamental].
    - *Analogie:* Entsprechen den **Basisvektoren** des Lösungs-Vektorraums.
- **Allgemeine Lösung:** Summe all dieser Fundamentallösungen. Bildet eine unendliche Parameter-Familie von Funktionen, parametrisiert durch Konstanten $C_i$ [^satz_fundamental].

## Lösung via Eulerscher Ansatz

- Methode exklusiv anwendbar auf lineare, homogene DGLs mit **konstanten Koeffizienten**.
- **Der Eulersche Ansatz:** Annahme der Lösungsform $u(x) = e^{\lambda x}$.
    - *Analogie zur Linearen Algebra:* Suchen von **Eigenfunktionen** ($e^{\lambda x}$) des Differentialoperators. Der Faktor $\lambda$ entspricht dem **Eigenwert**.
- **Transformation:** Einsetzen verwandelt die DGL (via Kettenregel-Faktoren) in ein rein algebraisches **charakteristisches Polynom** $p(\lambda) = 0$.
- **Lösungsfälle (basierend auf Polynom-Nullstellen $\lambda$)** [^satz_lsg_hom_dgl]:
    - **Fall 1 (Einfache reelle Nullstelle):** Liefert direkten Basis-Baustein $e^{\lambda x}$.
    - **Fall 2 (Komplexes Nullstellen-Paar):** Treten zwingend konjugiert auf ($a \pm ib$).
        - Generieren zwei reelle Fundamentallösungen: $e^{ax} \sin(bx)$ und $e^{ax} \cos(bx)$.
        - *Konvention:* Argument $bx$ stets positiv wählen. Das negative Vorzeichen wird vollständig von den freien Parametern $C_i$ absorbiert.
    - **Fall 3 (Mehrfache Nullstellen):** Nullstelle $\lambda$ mit Multiplizität $s$ liefert zu wenige Basisvektoren.
        - *Lösung:* Erzeugung von $s$ unabhängigen Bausteinen durch Multiplikation mit $x$-Potenzen: $e^{\lambda x}, x \cdot e^{\lambda x}, x^2 \cdot e^{\lambda x}, \dots, x^{s-1}e^{\lambda x}$.
- **Formel der Allgemeinen Lösung (Zusammenbau):** Addition aller Basisvektoren mit unbestimmten Vorfaktoren $C_i$.
    - *Beispiel nur reell:* $y(x) = C_1 e^{\lambda_1 x} + C_2 e^{\lambda_2 x} + \dots$
    - *Beispiel komplex:* $y(x) = C_1 e^{ax}\sin(bx) + C_2 e^{ax}\cos(bx)$
- **Polynomdivision-Trick:** Bei Polynomen höheren Grades ($\ge 3$) eine Nullstelle raten (z.B. $x=i$). Konjugiertes Pendant ($x=-i$) zwingend ergänzen und Gradreduktion durch Division mit $(x-i)(x+i) = x^2+1$ erzwingen.

## Randwert- und Anfangswertprobleme

Die allgemeine Lösung liefert ein System mit $n$ unbestimmten Konstanten ($C_1 \dots C_n$). Zur Definition eines exakten physikalischen Zustands (Spezifische Lösung) sind zwingend $n$ **Zusatzinformationen** nötig.

- **Randwertproblem** (Boundary Value Problem):
    - Informationen an **unterschiedlichen Orten/Stellen** vorgegeben (z.B. Gitarrensaite beidseitig eingespannt bei $x_1=0$ und $x_2=L$).
    - Verteilung der $n$ Informationen auf die Orte beliebig.
- **Anfangswertproblem** (Initial Value Problem):
    - Sämtliche Informationen sind an einem **einzigen Punkt** (typischerweise $t_0=0$) gebündelt.
    - Klassisches Beispiel: Vorgabe von Startposition $u(0)$ und Startgeschwindigkeit $u'(0)$.

[^def_dgl]: Unter einer **Differentialgleichung** verstehen wir eine Gleichung, in welcher die gesuchte Funktion sowie deren Ableitungen auftreten.
[^def_lin_dgl]: Eine Differentialgleichung der Form $a_n(x)y^{(n)}(x) + a_{n-1}(x)y^{(n-1)}(x) + \dots + a_1(x)y'(x) + a_0(x)y(x) = s(x)$ heisst **lineare Differentialgleichung** mit Koeffizienten $a_i(t)$. Die **Ordnung** der Differentialgleichung ist die maximale Ordnung der vorkommenden Ableitungen. Die Funktion $s(x)$ nennen wir **Störfunktion**. Falls gilt $s(x) = 0$, wird die Differentialgleichung **homogen**, andernfalls **inhomogen**.
[^def_const_coeff]: Den Spezialfall, dass alle Funktionen $a_i(x)$ in der Differentialgleichung konstante Funktionen sind, nennen wir eine **Differentialgleichung mit konstanten Koeffizienten**.
[^satz_superposition]: **Satz (Superpositionsprinzip):** Sind $y_1(x)$ und $y_2(x)$ Lösungen einer linearen, homogenen Differentialgleichung, so ist auch $y(x) = C_1 y_1(x) + C_2 y_2(x), \quad C_1, C_2 \in \mathbb{R}$ eine Lösung der gleichen Differentialgleichung.
[^satz_fundamental]: **Satz (Fundamentallösungen):** Eine lineare, homogene Differentialgleichung der Ordnung $n$ besitzt $n$ Lösungen $y_1(x), \dots, y_n(x)$, so dass die **allgemeine Lösung** dieser Gleichung gegeben ist durch $y(x) = C_1 y_1(x) + \dots + C_n y_n(x), \quad C_1, \dots, C_n \in \mathbb{R}$. Diese Lösungen werden **Fundamentallösungen** genannt.
[^satz_lsg_hom_dgl]: **Satz über die Lösung einer linearen, homogenen Differentialgleichung:** Schlussendlich können wir die **allgemeine Lösung** der Differentialgleichung $a_n u^{(n)}(x) + a_{n-1} u^{(n-1)}(x) \dots + a_1 u'(x) + a_0 u(x) = 0$ wie folgt angeben ($a_i \in \mathbb{R}$): Falls alle $r$ Nullstellen $\lambda_i$ des charakteristischen Polynoms reell sind und Multiplizität $m_i$ haben, gilt $u(x) = \sum_{i=0}^r \left( \sum_{p=0}^{m_i - 1} C_{ip} x^p e^{\lambda_i x} \right)$. Falls wir $r$ reelle Nullstellen und $s$ Paare komplexer Nullstellen $(a_j \pm ib_j)$ mit jeweils Multiplizität $m_i$ haben, gilt $u(x) = \sum_{i=0}^r \left( \sum_{p=0}^{m_i - 1} C_{ip} x^p e^{\lambda_i x} \right) + \sum_{j=0}^s \left( \sum_{q=0}^{m_j - 1} \left( A_{jq} x^q e^{a_j x} \sin(b_j x) + B_{jq} x^q e^{a_j x} \cos(b_j x) \right) \right)$.
