#import "lib.typ": *

== Integration

#definition[
  *Partielle Integration*
  Nützlich wenn: Produkt von zwei Termen, einer ableitbar und einer integrierbar. \
  Gegeben ein Produkt von zwei Termen: $integral_a^b u(x) dot v'(x) d x$.

  - $u$ und $v'$ zuweisen. $ln$ ist meistens $u$ und $e^x$ ist meistens $v$
  - $u$ ableiten und $v'$ integrieren
  - Umschreiben zu $[ u(x) dot v(x) ]_a^b - integral_a^b u'(x) dot v(x) d x$

  Ohne explizite Grenzen gilt: $integral u(x) dot v'(x) d x = u(x) dot v(x) - integral u'(x) dot v(x) d x$. \
  Kann auch mehrfach hintereinander oder in Kombination mit Substitution etc. angewendet werden!
]

#definition[
  *Substitution*
  Nützlich wenn: Zusammengesetzte Funktion (z. B. Kettenregel rückwärts) oder komplizierter Ausdruck lässt sich durch geeignete Variable vereinfachen.

  - Neue Variable $u = g(x)$ wählen, sodass der komplizierte Teil im Integral ersetzt werden kann
  - Ableiten: $d u = g'(x) d x$ bzw. $d x = (d u)/(g'(x))$
  - Integral umschreiben in $u$-Notation: $integral f(g(x)) dot g'(x) d x = integral f(u) d u$
  - In $u$-Notation integrieren
  - Rücksubstitution: $u$ wieder durch $x$ ersetzen


  Mit Grenzen:
  Wenn das Integral bestimmte Grenzen $[a, b]$ hat, gilt:
  $integral_a^b f(g(x)) dot g'(x) d x = integral_(u(a))^(u(b)) f(u) d u$ \
  Substitution kann auch rückwärts („rückwärts-Substitution“) oder in Kombination mit partieller Integration etc. verwendet werden!

]

#definition[
  *Partialbruchzerlegung*
  Nützlich wenn: Der Integrand ein Bruch aus zwei Polynomen $(P(x))/(Q(x))$ ist.

  *Grundidee:* Komplizierten Bruch in eine Summe einfacherer, integrierbarer Brüche zerlegen.


  - *Grad prüfen (unechter Bruch?)*: Ist der Grad des Zählers $P(x)$ *größer oder gleich* dem Grad des Nenners $Q(x)$?

    - *Ja $->$ Polynomdivision durchführen*: Teile $P(x)$ durch $Q(x)$. Das Ergebnis ist ein Polynom $S(x)$ und ein Restbruch $(R(x))/(Q(x))$.

  $
    integral (P(x))/(Q(x)) d x = integral S(x) d x + integral (R(x))/(Q(x)) d x
  $

  - Der Polynomteil $integral S(x) d x$ kann direkt integriert werden.
  - Auf den neuen Restbruch $(R(x))/(Q(x))$ (bei dem nun der Zählergrad echt kleiner als der Nennergrad ist) wendest du die folgenden Schritte an.


  - *Nenner faktorisieren*: Versuche den Nenner $Q(x)$ in Linearfaktoren (z. B. $x - 3$) und/oder irreduzible quadratische Faktoren (z. B. $x^2 + 1$) zu zerlegen.

  - *Ansatz für Partialbrüche machen*:

    - *Linearfaktor:* Für jeden Faktor $(x - a)^n$ im Nenner lautet der Ansatz:

  $ (A_1)/(x - a) + (A_2)/((x - a)^2) + dots + (A_n)/((x - a)^n) $

  - *Quadratischer Faktor:* Für jeden Faktor $(x^2 + b x + c)^m$ im Nenner lautet der Ansatz:

  $ (B_1 x + C_1)/(x^2 + b x + c) + dots + (B_m x + C_m)/((x^2 + b x + c)^m) $



  - *Koeffizienten bestimmen*: Finde die Werte der Konstanten ($A_i, B_i, C_i, dots$).

    - Bringe alle Partialbrüche auf den Hauptnenner $Q(x)$.
    - Vergleiche den resultierenden Zähler mit dem ursprünglichen Zähler $P(x)$ (bzw. $R(x)$ nach der Polynomdivision).
    - Löse das entstehende lineare Gleichungssystem durch Koeffizientenvergleich oder durch Einsetzen von cleveren x-Werten (z.B. der Nennernullstellen).


  - *Integrieren*: Integriere die Summe der einfachen Brüche.

]

#definition[
  *Integrierbarkeit auf einem Intervall*
  *Frage:* Ist eine Funktion $f: [a,b] -> RR$ integrierbar?

  #v(0.5em)
  *Riemann-Integrierbarkeit:* $f$ ist Riemann-integrierbar auf $[a,b]$, wenn sie auf $[a,b]$ beschränkt ist *und* die Menge ihrer Unstetigkeitsstellen *Nullmaß* hat (also z. B. endlich, abzählbar oder „klein genug“).

  #v(0.5em)
  *Typisches Vorgehen:*

  - Prüfe, ob $f$ auf $[a,b]$ beschränkt ist
  - Analysiere die Stetigkeit:

    - Ist $f$ stetig auf $[a,b]$? $=>$ integrierbar
    - Ist $f$ stückweise stetig? $=>$ integrierbar
    - Hat $f$ nur endlich viele Unstetigkeitsstellen? $=>$ integrierbar

  - Wenn $f$ nicht beschränkt oder zu „sprunghaft“ ist: nicht integrierbar


  #v(0.5em)
  *Beispiele:*

  - $f(x) = (1)/(x)$ auf $[0,1]$ *nicht* integrierbar, da Unbeschränktheit bei $x = 0$
  - Dirichlet-Funktion $f(x) = cases(1 & x in QQ, 0 & x in.not QQ)$ *nicht* integrierbar, da Unstetig auf ganz $[a,b]$
  - Indikatorfunktion einer rationalen Stelle: Integrierbar, da nur an einer Stelle $!= 0$


]


