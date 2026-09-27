#import "lib.typ": *

= Differenzierbare Funktionen
#definition[
  *Differenzierbarkeit*
  Sei $D subset RR$, $f:D --> RR$ und $x_0 in D$ ein Häufungspunkt von $D$. $f$ ist *in $x_0$ differenzierbar*, falls der Grenzwert
  $ lim_(x -> x_0) (f(x) - f(x_0))/(x - x_0) " bzw. " lim_(h -> 0) (f(x_0 + h) - f(x_0))/(h) $
  existiert. Ist dies der Fall, wird der Grenzwert mit $f'(x_0)$ bezeichnet.
]

#theorem(number: "4.1.3")[
  *Weierstrass*
  Sei $f: D --> RR$, $x_0 in D$ Häufungspunkt von $D$. Folgende Aussagen sind äquivalent: \
  (1) $f$ ist in $x_0$ differenzierbar. \
  (2) Es gibt $c in RR$ und $r: D --> RR$ mit: \
  2.1 $f(x) = f(x_0) + c(x-x_0) + r(x)(x-x_0)$ \
  2.2 $r(x_0) = 0$ und $r$ ist stetig in $x_0$. \
  Falls dies zutrifft ist $c = f'(x_0)$ eindeutig bestimmt.
]

#theorem(number: "4.1.4")[
  Eine Funktion $f: D --> RR$ ist genau dann in $x_0$ differenzierbar, falls es eine Funktion $phi: D --> RR$ gibt, die stetig in $x_0$ ist und so, dass
  $f(x) = f(x_0) + phi(x)(x-x_0) quad forall x in D.$
  In diesem Fall gilt $phi(x_0) = f'(x_0)$.
]
#corollary(number: "4.1.5")[
  Sei $f: D --> RR$ und $x_0 in D$ ein Häufungspunkt von $D$. Falls $f$ in $x_0$ differenzierbar ist, so ist $f$ stetig in $x_0$.
]

#definition(number: "4.1.7")[
  $f : D --> RR$ ist *in $D$ differenzierbar*, falls für jeden Häufungspunkt $x_0 in D$, $f$ in $x_0$ differenzierbar ist.
]

#theorem(number: "4.1.9")[
  Sei $D subset RR$, $x_0 in D$ ein Häufungspunkt von $D$ und $f,g: D --> RR$ in $x_0$ differenzierbar. Dann gelten:
  (1) $f+g$ ist in $x_0$ differenzierbar und
  $(f+g)'(x_0) = f'(x_0) + g'(x_0)$ \
  (2) $f dot g$ ist in $x_0$ differenzierbar und
  $(f dot g)'(x_0) = f'(x_0)g(x_0) + f(x_0)g'(x_0).$ \
  (3) Falls $g(x_0) != 0$ ist $(f)/(g)$ in $x_0$ differenzierbar und
  $((f)/(g))'(x_0) = (f'(x_0)g(x_0) - f(x_0)g'(x_0))/(g(x_0)^2).$
]

#theorem(number: "4.1.11")[
  Seien $D,E subset RR$ und sei $x_0 in D$ ein Häufungspunkt. Sei $f: D --> E$ eine in $x_0$ differenzierbare Funktion so dass $y_0 := f(x_0)$ ein Häufungspunkt von $E$ ist, und sei $g: E --> RR$ eine in $y_0$ differenzierbare Funktion. Dann ist $g compose f : D --> RR$ in $x_0$ differenzierbar und
  $(g compose f)'(x_0) = g'(f(x_0)) f'(x_0).$
]

#corollary(number: "4.1.12")[
  Sei $f: D --> E$ eine bijektive Funktion, $x_0 in D$ Häufungspunkt; wir nehmen an $f$ ist in $x_0$ differenzierbar und $f'(x_0) != 0$; zudem nehmen wir an $f^(-1)$ ist in $y_0 = f(x_0)$ stetig. Dann ist $y_0$ Häufungspunkt von $E$, $f^(-1)$ ist in $y_0$ differenzierbar und
  $(f^(-1))'(y_0) = (1)/(f'(x_0)).$
]

#definition(number: "4.2.1")[
  Sei $f : D --> RR$, $D subset RR$ und $x_0 in D$.
  (1) $f$ besitzt ein _lokales Maximum_ in $x_0$ falls es $delta > 0$ gibt mit:
  $f(x) <= f(x_0) quad forall x in (x_0 - delta, x_0 + delta) inter D$ \
  (2) $f$ besitzt ein _lokales Minimum_ in $x_0$ falls es $delta > 0$ gibt mit:
  $f(x) >= f(x_0) quad forall x in (x_0 - delta, x_0 + delta) inter D$ \
  (3) $f$ besitzt ein _lokales Extremum_ in $x_0$ falls es entweder ein lokales Minimum oder Maximum von $f$ ist.
]

#theorem(number: "4.2.2")[
  Sei $f : (a,b) --> RR$, $x_0 in (a,b)$. Wir nehmen an, $f$ ist in $x_0$ differenzierbar.
  (1) Falls $f'(x_0) > 0$ gibt es $delta > 0$ mit
  $f(x) > f(x_0) quad forall x in (x_0, x_0 + delta)$ und \
  $f(x) < f(x_0) quad forall x in (x_0 - delta, x_0).$ \
  (2) Falls $f'(x_0) < 0$ gibt es $delta > 0$ mit \
  $f(x) < f(x_0) quad forall x in (x_0, x_0 + delta)$ und \
  $f(x) > f(x_0) quad forall x in (x_0 - delta, x_0).$ \
  (3) Falls $f$ in $x_0$ ein lokales Extremum besitzt, folgt $f'(x_0) = 0$.
]

#theorem(number: "4.2.3")[
  *Rolle*
  Sei $f : [a,b] --> RR$ stetig und in $(a,b)$ differenzierbar. Erfüllt sie $f(a) = f(b)$ so gibt es $xi in (a,b)$ mit
  $f'(xi) = 0.$
]

#theorem(number: "4.2.4")[
  *Lagrange*
  Sei $f : [a,b] --> RR$ stetig mit $f$ in $(a,b)$ differenzierbar. Dann gibt es $xi in (a,b)$ mit
  $f(b) - f(a) = f'(xi)(b-a).$
]

#corollary(number: "4.2.5")[
  Seien $f,g : [a,b] --> RR$ stetig und in $(a,b)$ diff.-bar. \
  (1) Falls $f'(xi) = 0 forall xi in (a,b)$ ist $f$ konstant. \
  (2) Falls $f'(xi) = g'(xi) forall xi in (a,b)$ gibt es $c in RR$ mit $f(x) = g(x)+c forall x in [a,b]$. \
  (3) Falls $f'(xi) >= 0 forall xi in (a,b)$ ist $f$ auf $[a,b]$ monoton wachsend. \
  (4) Falls $f'(xi) > 0 forall xi in (a,b)$ ist $f$ auf $[a,b]$ strikt monoton wachsend. \
  (5) Falls $f'(xi) <= 0 forall xi in (a,b)$ ist $f$ auf $[a,b]$ monoton fallend. \
  (6) Falls $f'(xi) < 0 forall xi in (a,b)$ ist $f$ auf $[a,b]$ strikt monoton fallend. \
  (7) Falls es $M >= 0$ gibt mit
  $|f'(xi)| <= M quad forall xi in (a,b)$
  dann folgt $forall x_1, x_2 in [a,b] :$
  $|f(x_1) - f(x_2)| <= M|x_1 - x_2|.$
]

#definition[
  *Trigonometrische Ableitungen*
  $tan'(x) = (1)/(cos^2(x))$ \
  $arcsin'(x) = (1)/(sqrt(1 - x^2))$ \
  $arccos'(x) = -(1)/(sqrt(1 - x^2))$ \
  $arctan'(x) = (1)/(1 + x^2)$ \
  $arccot'(x) = -(1)/(1 + x^2)$
]

#definition[
  *Hyperbelfunktionen*
  $cosh x = (e^x + e^(-x))/(2)$ \
  $sinh x = (e^x - e^(-x))/(2)$ \
  $tanh x = (sinh x)/(cosh x) = (e^x - e^(-x))/(e^x + e^(-x)).$ \
  Es gilt offensichtlich: \
  $cosh'(x) = (e^x - e^(-x))/(2) = sinh x$ \
  $sinh'(x) = (e^x + e^(-x))/(2) = cosh x$ \
  Offensichtlich gilt $cosh x >= 1 forall x in RR$, $sinh x >= 0 forall x in (0, +infinity)$, $sinh(0) = 0$. Daraus folgt: $cosh$ ist auf $[0, infinity)$ strikt monoton wachsend, $cosh(0) = 1$ und $lim_(x -> +infinity) cosh x = +infinity$. Also ist $cosh : [0, infinity) --> [1, infinity)$ bijektiv. Deren Umkehrfunktion wird mit $arcosh : [1, infinity) --> [0, infinity)$ bezeichnet. Unter Benützung von $cosh^2(x) - sinh^2(x) = 1 quad forall x in RR$ folgt:
  $arcosh'(y) = (1)/(sqrt(y^2-1)) quad forall y in (1, +infinity).$ \
  Analog zeigt man, dass: $sinh : RR --> RR$ streng monoton wachsend und bijektiv ist. Dessen Umkehrfunktion wird mit $arsinh : RR --> RR$ bezeichnet und es gilt: $arsinh'(y) = (1)/(sqrt(1 + y^2)) quad forall y in RR.$ \
  Für $tanh(x)$ folgt: $tanh'(x) = (1)/(cosh^2(x)) > 0.$
  Also ist $tanh$ auf $RR$ streng monoton wachsend und man zeigt, dass $lim_(x -> +infinity) tanh(x) = 1$, $lim_(x -> -infinity) tanh(x) = -1$.
  Die Funktion $tanh : RR --> (-1,1)$ ist bijektiv. Ihre Umkehrfunktion wird mit $artanh : (-1,1)--> RR$ bezeichnet. Es gilt dann: $artanh'(y) = (1)/(1 - y^2) quad forall y in (-1,1).$
]

#theorem(number: "4.2.9")[
  *Cauchy*
  Seien $f,g : [a,b] --> RR$ stetig und in $(a,b)$ differenzierbar. Dann gibt es $xi in (a,b)$ mit $g'(xi) (f(b) - f(a)) = f'(xi) (g(b) - g(a))$. Falls $g'(x) != 0 forall x in (a,b)$ folgt $g(a) != g(b)$ und $(f(b) - f(a))/(g(b) - g(a)) = (f'(xi))/(g'(xi)).$
]

#theorem(number: "4.2.10")[
  *Regel von l'Hospital*
  Seien $f,g : (a,b) --> RR$ differenzierbar mit $g'(x) != 0 forall x in (a,b)$. \
  Falls $lim_(x -> b^-) f(x) = 0, quad lim_(x -> b^-) g(x) = 0$ und $lim_(x -> b^-) (f'(x))/(g'(x)) =: lambda$ existiert, folgt $lim_(x -> b^-) (f(x))/(g(x)) = lim_(x -> b^-) (f'(x))/(g'(x)).$

  Der Satz gilt auch falls $b = +infinity$, $lambda = +infinity$ oder $x -> a^+$.
]

#definition(number: "4.2.13")[
  (1) $f$ ist *konvex* (auf $I$) falls für alle $x <= y, x,y in I$ und $lambda in [0,1]$
  $f(lambda x + (1-lambda)y) <= lambda f(x) + (1-lambda)f(y)$
  gilt.
  (2) $f$ ist *streng konvex* falls für alle $x < y, x,y in I$ und $lambda in (0,1)$,
  $f(lambda x + (1-lambda)y) < lambda f(x) + (1-lambda)f(y).$
]

#lemma(number: "4.2.15")[
  Sei $f : I --> RR$ eine beliebige Funktion. Die Funktion $f$ ist genau dann konvex, falls für alle $x_0 < x < x_1$ in $I$
  $quad (f(x) - f(x_0))/(x - x_0) <= (f(x_1) - f(x))/(x_1 - x)$
  gilt.
  Sie ist genau dann streng konvex, falls strikte Ungleichheit gilt.
]

#theorem(number: "4.2.16")[
  Sei $f : (a,b) --> RR$ in $(a,b)$ differenzierbar. Die Funktion $f$ ist genau dann (streng) konvex, falls $f'$ (streng) monoton wachsend ist.
]

#corollary(number: "4.2.17")[
  Sei $f : (a,b) --> RR$ zweimal differenzierbar in $(a,b)$. \
  Die Funktion $f$ ist (streng) konvex, falls $f'' >= 0$ (bzw. $f'' > 0$) auf $(a,b)$.
]

#definition(number: "4.3.1")[
  (1) Für $n >= 2$ ist $f$ *$n$-mal differenzierbar in $D$* falls $f^((n-1))$ in $D$ differenzierbar ist. Dann ist $f^((n)) := (f^((n-1)))'$ und nennt sich die $n$-te Ableitung von $f$. \
  (2) Die Funktion $f$ ist *$n$-mal stetig differenzierbar in $D$*, falls sie $n$-mal differenzierbar ist und falls $f^((n))$ in $D$ stetig ist. \
  (3) Die Funktion $f$ ist in $D$ *glatt*, falls sie $forall n >= 1$, $n$-mal differenzierbar ist.
]

#theorem(number: "4.3.3")[
  Sei $D subset RR$ wie in Def. 4.3.1, $n >= 1$ und $f,g : D --> RR$ $n$-mal differenzierbar in $D$. (1) $f+g$ ist $n$-mal differenzierbar und
  $(f+g)^((n)) = f^((n)) + g^((n))$, (2) $f dot g$ ist $n$-mal differenzierbar und
  $(f dot g)^((n)) = sum_(k=0)^(n) binom(n, k) f^((k)) g^((n-k)).$
]

#theorem(number: "4.3.5")[
  Sei $D subset RR$ wie in Def. 4.3.1, $n >= 1$ und $f,g : D --> RR$ $n$-mal differenzierbar in $D$.
  Falls $g(x) != 0 forall x in D$, ist $(f)/(g)$ in $D$ $n$-mal differenzierbar.
]

#theorem(number: "4.3.6")[
  Seien $E,D subset RR$ Teilmengen für die jeder Punkt Häufungspunkt ist. Seien $f: D --> E$ und $g: E --> RR$ $n$-mal differenzierbar. Dann ist $g compose f$ $n$-mal differenzierbar, und $(g compose f)^((n)) (x) = sum_(k=1)^n A_(n,k)(x) (g^((k)) compose f) (x)$ \
  wobei $A_(n,k)$ ein Polynom in den Funktionen $f', f^((2)), dots, f^((n+1-k))$ ist.
]

#theorem(number: "4.4.1")[
  Seien $f_n : (a,b) --> RR$ eine Funktionenfolge wobei $f_n$ einmal in $(a,b)$ stetig differenzierbar ist $forall n >= 1$. Wir nehmen an, dass sowohl die Folge $(f_n)_(n >= 1)$ wie $(f_n')_(n >= 1)$ gleichmässig in $(a,b)$ konvergieren (siehe Def. 3.7.5) mit $lim_(n -> infinity) f_n =: f$ und $lim_(n -> infinity) f_n' =: p$.
  Dann ist $f$ stetig differenzierbar und $f' = p$.
]

#theorem(number: "4.4.2")[
  Sei $sum_(k=0)^infinity c_k x^k$ eine Potenzreihe mit positivem Konvergenzradius $rho > 0$ (siehe 3.7.10, 3.7.11). Dann ist $f(x) = sum_(k=0)^infinity c_k (x - x_0)^k$ auf $(x_0 - rho, x_0 + rho)$ differenzierbar und $f'(x) = sum_(k=1)^infinity k c_k (x - x_0)^(k-1)$ für alle $x in (x_0 - rho, x_0 + rho)$.
]

#corollary(number: "4.4.3")[
  Unter der Voraussetzung von Satz 4.4.1 ist $f$ auf $(x_0 - rho, x_0 + rho)$ glatt und
  $f^((j))(x) = sum_(k=j)^infinity c_k (k!)/((k-j)!) (x - x_0)^(k-j)$.
  Insbesondere ist $c_j = (f^((j))(x_0))/(j!).$
]

#theorem(number: "4.4.5")[
  Sei $f : [a,b] --> RR$ stetig und in $(a,b)$ $(n+1)$-mal differenzierbar. Für jedes $a < x <= b$ gibt es $xi in (a,x)$ mit: \
  $f(x) = sum_(k=0)^n (f^((k))(a))/(k!) (x-a)^k + (f^((n+1))(xi))/((n+1)!) (x-a)^(n+1).$
]

#corollary(number: "4.4.6")[
  *Taylor Approximation*
  Sei $f : [c,d] --> RR$ stetig und in $(c,d)$ $(n+1)$-mal differenzierbar. Sei $c < a < d$. Für alle $x in [c,d]$ gibt es $xi$ zwischen $x$ und $a$ sodass \
  $f(x) = sum_(k=0)^n (f^((k))(a))/(k!) (x-a)^k + (f^((n+1))(xi))/((n+1)!) (x-a)^(n+1).$
]

#corollary(number: "4.4.7")[
  Sei $n >= 0$, $a < x_0 < b$ und $f : [a,b] --> RR$ in $(a,b)$ $(n+1)$-mal stetig differenzierbar. \
  Annahme: $f'(x_0) = f^((2))(x_0) = dots = f^((n))(x_0) = 0$. \
  (1) Falls $n$ gerade ist und $x_0$ lokale Extremalstelle, folgt $f^((n+1))(x_0) = 0$. \
  (2) Falls $n$ ungerade ist und $f^((n+1))(x_0) > 0$ so ist $x_0$ eine strikte lokale Minimalstelle. \
  (3) Falls $n$ ungerade ist und $f^((n+1))(x_0) < 0$ so ist $x_0$ eine strikte lokale Maximalstelle.
]

#corollary(number: "4.4.8")[
  Sei $f : [a,b] --> RR$ stetig und in $(a,b)$ zweimal stetig differenzierbar. Sei $a < x_0 < b$. Annahme: $f'(x_0) = 0$.
  (1) Falls $f^((2))(x_0) > 0$ ist $x_0$ strikte lokale Minimalstelle.
  (2) Falls $f^((2))(x_0) < 0$ ist $x_0$ strikte lokale Max.-stelle.
]

