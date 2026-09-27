#import "lib.typ": *

== Folgen-Konvergenz

#definition[

  *Ansätze*

  - *Kennt man den Grenzwert direkt?* Oft bei gebrochen-rationalen Ausdrücken mit L'Hospital oder durch dominierende Terme.

  - *Monotonie und Beschränktheit prüfen*
  Eine monotone und beschränkte Folge konvergiert (Monotoniekriterium).

  - *Ist die Folge rekursiv definiert?*
  → Dann ggf. Fixpunkt betrachten und Monotonie nachweisen.

  - *Vergleich mit bekannten konvergenten/divergenten Folgen?*
  (z. B. $(1)/(n) -> 0$, $q^n -> 0$ bei $|q|<1$, $ln(n)$ divergent, usw.)

  - *Grenzwert mit Grenzwertsätzen berechnen*
  (z. B. Quotientenregel, Produktregel, Wurzelregel)

  - *Ist $lim_(n -> infinity) a_n$ überhaupt definiert?* \
  Falls der Grenzwert nicht existiert → divergent!

]

#definition[

  *Typische Grenzwerte*

  - $lim_(n -> infinity) (1)/(n^p) = 0$ für $p > 0$
  - $lim_(n -> infinity) q^n = 0$ für $|q| < 1$; divergent für $|q| > 1$
  - $lim_(n -> infinity) root(n, a) = 1$ für $a > 0$
  - $lim_(n -> infinity) (n^p)/(e^n) = 0$ für alle $p > 0$ (Exponential wächst schneller als Polynom)
  - $lim_(n -> infinity) ln(n) = infinity$ aber langsamer wachsend als jede Potenz

]

#definition[
  *L'Hospital-Regel*
  Anwendbar bei Grenzwerten vom Typ:

  $
    lim_(x -> a) (f(x))/(g(x)) quad "mit" quad (0)/(0) " oder " (infinity)/(infinity)
  $


  *Voraussetzungen:*

  - Funktionen $f$ und $g$ sind in Umgebung von $a$ differenzierbar
  - Grenzwert existiert oder ist unendlich


  *Regel:*

  $
    lim_(x -> a) (f(x))/(g(x)) = lim_(x -> a) (f'(x))/(g'(x)) quad "(falls existiert)"
  $


  *Achtung bei Folgen:*
  Man kann $a_n = (f(n))/(g(n))$ mit stetigen $f, g$ betrachten und dann $lim_(n -> infinity) a_n = lim_(x -> infinity) (f(x))/(g(x))$ mit L’Hospital berechnen.

  _Typische Anwendungen:_

  $
    lim_(n -> infinity) (ln(n))/(n) = 0, quad lim_(x -> 0) (sin(x))/(x) = 1, quad lim_(x -> infinity) (n^p)/(e^n) = 0
  $

]

#definition[
  *Monotonie-Kriterium*
  Eine Folge $(a_n)$, die:

  - monoton wachsend ($a_(n+1) >= a_n$ oder $<=$)
  - und beschränkt ist (nach oben/unten)

  konvergiert gegen einen Grenzwert.

  _Tipp:_ Zeige $a_(n+1) - a_n >= 0$ für Wachstumsverhalten.
]

#definition[
  *Rekursiv definierte Folgen*
  Ziel: Zeige Konvergenz und bestimme Grenzwert.

  Gegeben: $a_(n+1) = f(a_n)$, Startwert $a_0$ bekannt.


  - *Zeige Beschränktheit*
  z. B. durch vollständige Induktion oder direkt durch Abschätzung
  - *Zeige Monotonie*
  z. B. $a_(n+1) - a_n >= 0$ oder $f(x) >= x$
  - *Schluss mit Monotonie-Kriterium:*
  Folge ist monoton + beschränkt $=>$ konvergent
  - *Grenzwert bestimmen:*
  Falls $a_n -> a$, dann gilt im Grenzwert: $a = f(a)$
  → Fixpunktgleichung nach a lösen

]

#definition[
  *Grenzwertsätze*
  Seien $a_n -> a$, $b_n -> b$:

  - $lim (a_n + b_n) = a + b$
  - $lim (a_n b_n) = a b$
  - $lim ((a_n)/(b_n)) = (a)/(b)$, falls $b != 0$
  - $lim (root(n, a_n)) = 1$ falls $a_n > 0$ und $lim a_n = a > 0$

]

#definition[

  *Divergenz erkennen*

  - Folge oszilliert: z. B. $(-1)^n$
  - Folge wächst unbeschränkt: z. B. $n$, $ln(n)$, $e^n$, $n^k$
  - Keine eindeutige Annäherung an einen Wert

]

