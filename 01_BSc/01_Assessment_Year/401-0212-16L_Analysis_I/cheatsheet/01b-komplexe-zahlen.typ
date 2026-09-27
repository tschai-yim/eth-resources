#import "lib.typ": *

== Komplexe Zahlen
#definition[ // TODO: maybe remove
  Auf $RR^2$ definieren wir folgende Multiplikation: \
  $(x_1, y_1) dot (x_2, y_2) = (x_1x_2 - y_1y_2, x_1y_2 + x_2y_1)$ \
  Dann gilt insbesondere: \
  $(0,0)(x,y) = (0,0), quad (1,0)(x,y) = (x,y)$ \
  Falls $(x,y) != (0,0) : (x,y)((x)/(x^2+y^2), (-y)/(x^2+y^2)) = (1,0)$
]
#theorem(number: "1.3.1")[
  $RR^2$ versehen mit der Addition der Vektoren $+$ und obig definierter Multiplikation $dot$ ist ein kommutativer Körper mit Einselement $(1,0)$ und Nullelement $(0,0)$. $RR^2, +, dot$ wird Körper der *komplexen Zahlen* genannt und wird mit $CC$ bezeichnet.
]

#definition[
  *Komplexe Konjugation*
  $overline(z) := x - y i$ \
  *Satz 1.3.2*: (i) $overline((z_1 + z_2)) = overline(z_1) + overline(z_2)$, $overline((z_1 z_2)) = overline(z_1) dot overline(z_2) forall z_1, z_2 in CC$ \
  (ii) $z overline(z) = x^2 + y^2 = ||z||^2$
]
Insbesondere folgt aus (ii), dass für $z != 0$ das multiplikative Inverse gegeben ist durch $z^(-1) = (overline(z))/(||z||^2).$

#definition[
  *Betrag*
  $|| z || := sqrt(x^2 + y^2)$
]

#definition[
  *Polarform*
  Sei $r = ||z||$, dann ist $x = r cos phi$ und $y = r sin phi$ wobei man $phi$ mod $2pi k, k in ZZ$ nehmen kann.
  In der Darstellung $z = r(cos phi + i sin phi)$ nennt sich $r = ||z||$ *Absolutbetrag* und $phi$ *Argument* der Zahl $z$.
]

#corollary(number: "1.3.3")[
  Sei $n in NN$. Dann hat die Gleichung $z^n = 1$ genau $n$ Lösungen in $CC$: $z_1, z_2, dots, z_n$, wobei $z_j = cos((2pi j)/(n)) + i dot sin((2pi j)/(n)), quad 1 <= j <= n.$
]

#theorem(number: "1.3.4")[
  *Fundamentalsatz der Algebra*
  Sei $n >= 1, n in NN$ und $P(z) = z^n + a_(n-1)z^(n-1) + dots + a_0, quad a_j in CC$. Dann gibt es $z_1, dots, z_n$ in $CC$, sodass $P(z) = (z - z_1)(z - z_2)dots(z - z_n)$. Die Menge $\{z_1, dots, z_n\}$ und die Vielfachheit der Nullstellen $z_j$, d.h., die Anzahl der Zahlen $k$ sodass $z_k = z_j$, sind eindeutig bestimmt.
]

