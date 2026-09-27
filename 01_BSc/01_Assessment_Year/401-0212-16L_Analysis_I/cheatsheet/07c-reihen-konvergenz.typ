#import "lib.typ": *

== Reihen-Konvergenz

#definition[

  *Ansätze*

  - *Spezieller Typ?* (Geometrische Reihe $sum q^k$ konv. falls $|q| < 1$; Alternierende Reihe $sum (-1)^n a_n$ konv. falls $a_n$ mon. und $lim_(n -> infinity) a_n = 0$; Riemannsche Zeta-Reihe $zeta(s) = sum 1/n^s$ konv. falls $s > 1$ — für s = 1 ist es die harmonische Reihe; Teleskopreihe $sum (b_n - b_(n - 1))$ konv. mit Grenzwert $b - b_0$ falls $lim_(n -> infinity) b_n = b$ existiert)
  - *Ist $lim_(n -> infinity) a_n = 0$?* Falls nein, divergiert die Reihe
  - *Quotientenkriterium anwendbar?*
  - *Wurzelkriterium anwendbar?*
  - *Gibt es konv. Majorante?* Falls $b_n$ existiert mit $0 <= a_n <= b_n$ und $sum b_n$ konvergiert, konv. auch $a_n$
  - *Gibt es div. Minorante?* Falls $b_n$ existiert mit $0 <= b_n <= a_n$ und $sum b_n$ divergiert, div. auch $a_n$

]

#definition[
  *Quotientenkriterium*
  Anwendbar für $(a_n)_(n >= 1)$ falls $a_n != 0 forall n >= 1$. \
  (1) Falls $limsup_(n -> infinity) |(a_(n+1))/(a_n)| < 1$ dann konvergiert $sum_(n=1)^infinity a_n$ absolut. \
  (2) Falls $liminf_(n -> infinity) |(a_(n+1))/(a_n)| > 1$ divergiert die Reihe.
]

#definition[
  *Wurzelkriterium*
  (1) Falls $limsup_(n -> infinity) root(n, |a_n|) < 1$, dann konvergiert $sum_(n=1)^infinity a_n$ absolut. \
  (2) Falls $limsup_(n -> infinity) root(n, |a_n|) > 1$, dann divergieren $sum_(n=1)^infinity a_n$ und $sum_(n=1)^infinity |a_n|$.
]

#definition[
  *Konvergenzradius über das Quotientenkriterium*
  *Ziel:* Den Konvergenzradius $rho$ einer Potenzreihe der Form $sum_(n=0)^infinity a_n (x-x_0)^n$ zu finden.

  #v(0.5em)
  *Vorgehen:*
  Man fordert, dass der Grenzwert aus dem Quotientenkriterium kleiner als 1 ist, um Konvergenz zu garantieren:

  $
    lim_(n -> infinity) |(a_(n+1)(x-x_0)^(n+1))/(a_n(x-x_0)^n)| < 1
  $

  Isoliert man den Term $|x-x_0|$, führt dies direkt zur Formel für den Radius $rho$.

  #v(0.5em)
  *Formel:*
  Der Konvergenzradius $rho$ berechnet sich durch den Kehrwert des Grenzwertes der Koeffizienten:

  $
    rho = 1 / (lim_(n -> infinity) |(a_(n+1))/(a_n)|) = lim_(n -> infinity) |(a_n)/(a_(n+1))|
  $

  *Wichtig:* Die Formel gilt, falls der Grenzwert existiert und von Null verschieden ist.

  - Falls $lim |(a_(n+1))/(a_n)| = 0$, dann ist $rho = infinity$.
  - Falls $lim |(a_(n+1))/(a_n)| = infinity$, dann ist $rho = 0$.

]

