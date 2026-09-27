#import "lib.typ": *

= Stetige Funktionen
#definition(number: "3.1.1")[
  Sei $f in RR^D$.
  (1) $f$ ist *nach oben beschränkt*, falls $f(D) subset RR$ nach oben beschränkt ist.
  (2) $f$ ist *nach unten beschränkt*, falls $f(D) subset RR$ nach unten beschränkt ist.
  (3) $f$ ist *beschränkt*, falls $f(D) subset RR$ beschränkt ist.
]

#definition(number: "3.1.2")[
  Eine Funktion $f : D --> RR$, wobei $D subset RR$, ist
  (1) *monoton wachsend*, falls $forall x,y in D$
  $x <= y => f(x) <= f(y)$,
  (2) *streng monoton wachsend*, falls $forall x,y in D$
  $x < y => f(x) < f(y)$ ,
  (3) *monoton fallend*, falls $forall x,y in D$
  $x <= y => f(x) >= f(y)$,
  (4) *streng monoton fallend*, falls $forall x,y in D$
  $x < y => f(x) > f(y)$,
  (5) *monoton*, falls $f$ monoton wachsend oder monoton fallend,
  (6) *streng monoton*, falls $f$ streng monoton wachsend oder streng monoton fallend ist.
]

#definition(number: "3.2.1")[
  *Stetigkeit*
  Sei $D subset RR$, $x_0 in D$. Die Funktion $f: D --> RR$ ist in $x_0$ *stetig*, falls es für jedes $epsilon > 0$ ein $delta > 0$ gibt, so dass für alle $x in D$ die Implikation
  $|x - x_0| < delta => |f(x) - f(x_0)| < epsilon$
  gilt. Die Funktion $f: D --> RR$ ist *stetig*, falls sie in jedem Punkt von $D$ stetig ist.
]

#theorem(number: "3.2.4")[
  Sei $x_0 in D subset RR$ und $f: D --> RR$. Die Funktion $f$ ist genau dann in $x_0$ stetig, falls für jede Folge $(a_n)_(n >= 1)$ in $D$ folgende Implikation gilt: \
  $lim_(n -> infinity) a_n = x_0 => lim_(n -> infinity) f(a_n) = f(x_0).$
]

#corollary(number: "3.2.5")[
  Sei $x_0 in D subset RR$, $lambda in RR$ und $f: D --> RR$, $g: D --> RR$ beide stetig in $x_0$. \
  (1) Dann sind $f+g$, $lambda dot f$, $f dot g$ stetig in $x_0$. \
  (2) Falls $g(x_0) != 0$ dann ist
  $(f)/(g) : D inter \{x in D : g(x) != 0\} --> RR, quad x |-> (f(x))/(g(x))$
  stetig in $x_0$.
]

#definition(number: "3.2.6")[
  Eine *polynomiale Funktion* $P : RR --> RR$ ist eine Funktion der Form
  $P(x) = a_n x^n + dots + a_0$
  wobei $a_n, dots, a_0 in RR$. Falls $a_n != 0$ ist $n$ der *Grad* von $P$.
]
#corollary(number: "3.2.7")[
  Polynomiale Funktionen sind auf ganz $RR$ stetig.
]
#corollary(number: "3.2.8")[
  Seien $P, Q$ polynomiale Funktionen auf $RR$ mit $Q != 0$. Seien $x_1, dots, x_m$ die Nullstellen von $Q$. Dann ist $(P)/(Q) : RR \{x_1, dots, x_m\} --> RR$ $x |-> (P(x))/(Q(x))$
  stetig.
]

#definition[
  *Zwischenwertsatz (Bolzano)*
  Sei $I subset RR$ ein Intervall, $f : I --> RR$ eine stetige Funktion und $a, b in I$. Für jedes $c$ zwischen $f(a)$ und $f(b)$ gibt es ein $z$ zwischen $a$ und $b$ mit $f(z)=c$.
]

#corollary(number: "3.3.2")[
  Sei $P(x) = a_n x^n + a_(n-1) x^(n-1) + dots + a_0$ ein Polynom mit $a_n != 0$ und $n$ ungerade. Dann besitzt $P$ mindestens eine Nullstelle in $RR$.
]

#definition(number: "3.4.2")[
  Ein Intervall $subset RR$ ist *kompakt*, falls es von der Form $I = [a,b], quad a <= b$ ist.
]

#lemma(number: "3.4.3")[
  Sei $D subset RR$, $x_0 in D$ und $f, g: D --> RR$ stetig in $x_0$. Dann sind
  $|f|$, $max(f, g)$, $min(f, g)$
  stetig in $x_0$.
]

#lemma(number: "3.4.4")[
  Sei $(x_n)_(n >= 1)$ eine konvergente Folge in $RR$ mit Grenzwert $lim_(n -> infinity) x_n in RR$. Sei $a <= b$. Falls $\{x_n : n >= 1\} subset [a,b]$ folgt $lim_(n -> infinity) x_n in [a,b].$
]

#theorem(number: "3.4.5")[
  Sei $f : I = [a,b] --> RR$ stetig auf einem kompakten Intervall $I$. Dann gibt es $u in I$ und $v in I$ mit
  $f(u) <= f(x) <= f(v) quad forall x in I.$
  Insbesondere ist $f$ beschränkt.
]

#theorem(number: "3.5.1")[
  Seien $D_1, D_2 subset RR$ zwei Teilmengen, $f: D_1 --> D_2$, $g: D_2 --> RR$ Funktionen, sowie $x_0 in D_1$. Falls $f$ in $x_0$ und $g$ in $f(x_0)$ stetig sind, so ist $g compose f : D_1 --> RR$ in $x_0$ stetig.
]

#corollary(number: "3.5.2")[
  Falls in Satz 3.5.1 $f$ auf $D_1$ und $g$ auf $D_2$ stetig sind, so ist $g compose f$ auf $D_1$ stetig.
]

#theorem(number: "3.5.3")[
  Sei $I subset RR$ ein Intervall und $f : I --> RR$ stetig, streng monoton. Dann ist $J := f(I) subset RR$ ein Intervall und $f^(-1) : J --> I$ ist stetig, streng monoton.
]

#theorem(number: "3.6.1")[
  *Exponentialfunktion*
  $exp : RR --> (0, +infinity)$ ist streng monoton wachsend, stetig und surjektiv.
]

#definition[
  *Korollare zur Exponentialfunktion*
  $exp(x) > 0 quad forall x in RR, quad exp(z) > exp(y) quad forall z > y,$ \
  $exp(x) >= 1 + x quad forall x in RR.$
]

#corollary(number: "3.6.5")[
  *Natürlicher Logarithmus*
  Der natürliche Logarithmus $ln : (0, +infinity)--> RR$ ist eine streng monoton wachsende, stetige, bijektive Funktion. Des weiteren gilt $ln(a dot b) = ln a + ln b quad forall a, b in (0, +infinity).$
]

#corollary(number: "3.6.6")[
  *zum Natürlichen Logarithmus*
  (1) Für $a > 0$ ist
  $(0, +infinity)&--> (0, +infinity), quad x &|-> x^a$
  eine stetige, streng monoton wachsende Bijektion. \
  (2) Für $a < 0$ ist
  $(0, +infinity)&--> (0, +infinity), quad x &|-> x^a$
  eine stetige, streng monoton fallende Bijektion. \
  (3) $ln(x^a) = a ln(x) quad forall a in RR, forall x > 0$. \
  (4) $x^a dot x^b = x^(a+b) quad forall a, b in RR, forall x > 0$. \
  (5) $(x^a)^b = x^(a dot b) quad forall a, b in RR, forall x > 0$.
]

#definition(number: "3.7.1")[
  *Funktionenfolgen-Konvergenz*
  Die Funktionenfolge $(f_n)_(n >= 0)$ *konvergiert punktweise* gegen eine Funktion $f: D --> RR$, falls für alle $x in D$:
  $f(x) = lim_(n -> infinity) f_n(x).$
]

#definition(number: "3.7.3")[
  *Weierstrass*
  Die Folge $f_n : D --> RR$ *konvergiert gleichmässig* in $D$ gegen $f : D --> RR$ falls gilt: $forall epsilon > 0 exists N >= 1$, so dass: $forall n >= N, forall x in D : |f_n(x) - f(x)| < epsilon.$

  Wichtig: $N$ hängt nur von $epsilon$ und nicht von $x in D$ ab. Deswegen kommt die Bedingung “$forall x in D$” nach der Bedingung “$exists N >= 1$”.
]

#theorem(number: "3.7.4")[
  Sei $D subset RR$ und $f_n : D --> RR$ eine Funktionenfolge bestehend aus (in $D$) stetigen Funktionen die (in $D$) gleichmässig gegen eine Funktion $f : D --> RR$ konvergiert.
  Dann ist $f$ (in $D$) stetig.
]

#definition(number: "3.7.5")[
  Eine Funktionenfolge $f_n : D --> RR$ ist *gleichmässig konvergent*, falls für alle $x in D$ der Grenzwert $f(x) := lim_(n -> infinity) f_n(x)$ existiert und die Folge $(f_n)_(n >= 0)$ gleichmässig gegen $f$ konvergiert.
]

#definition[
  *Cauchy-Kriterium für Funktionenfolgen*
  Funktionenfolge $f_n : D --> RR$ konvergiert gleichmässig in $D$, gdw.
  $forall epsilon > 0 exists N >= 1, " sodass " forall n,m >= N " und " forall x in D : |f_n(x) - f_m(x)| < epsilon.$
]

#corollary(number: "3.7.7")[
  Sei $D subset RR$. Falls $f_n : D --> RR$ eine gleichmässig konvergente Folge stetiger Funktionen ist, dann ist die Funktion $f(x) := lim_(n -> infinity) f_n(x)$ stetig.
]

#definition(number: "3.7.8")[
  Die Reihe $sum_(k=0)^infinity f_k(x)$ konvergiert gleichmässig (in $D$), falls die durch $S_n(x) := sum_(k=0)^n f_k(x)$ definierte Funktionenfolge gleichmässig konvergiert.
]

#theorem(number: "3.7.9")[
  Sei $D subset RR$ und $f_n : D --> RR$ eine Folge stetiger Funktionen. Angenommen, $|f_n(x)| <= c_n quad forall x in D$ und $sum_(n=0)^infinity c_n$ konvergiert. Dann konvergiert die Reihe $sum_(n=0)^infinity f_n(x)$ gleichmässig in $D$ und deren Grenzwert $f(x) := sum_(n=0)^infinity f_n(x)$ ist eine in $D$ stetige Funktion.
]

#definition(number: "3.7.10")[
  Die Potenzreihe $sum_(k=0)^infinity c_k x^k$ hat *positiven Konvergenzradius*, falls $limsup_(k -> infinity) root(k, |c_k|)$ existiert.
  Der Konvergenzradius ist dann definiert als: \
  $
    rho = cases(
      +infinity & "falls " limsup_(k -> infinity) root(k, |c_k|) = 0,
      1 / (limsup_(k -> infinity) root(k, |c_k|)) & "falls " limsup_(k -> infinity) root(k, |c_k|) > 0
    )
  $
]

#theorem(number: "3.7.11")[
  Sei $sum_(k=0)^infinity c_k x^k$ eine Potenzreihe mit positivem Konvergenzradius $rho > 0$ und sei $f(x) := sum_(k=0)^infinity c_k x^k, |x| < rho$. Dann gilt: $forall 0 <= r < rho$ konvergiert $sum_(k=0)^infinity c_k x^k$ gleichmässig auf $[-r,r]$, insbesondere ist $f : (-rho, rho) --> RR$ stetig.
]

#definition[
  *Sin / Cos als Potenzreihe*
  Wir definieren die Sinusfunktion für $z in CC$: \
  $sin z = z - (z^3)/(3!) + (z^5)/(5!) - (z^7)/(7!) + dots = sum_(n=0)^infinity ((-1)^n z^(2n+1))/((2n+1)!)$ \
  und die Cosinusfunktion für $z in CC$: \
  $cos z = 1 - (z^2)/(2!) + (z^4)/(4!) - (z^6)/(6!) + dots = sum_(n=0)^infinity ((-1)^n z^(2n))/((2n)!).$
]

#theorem(number: "3.8.1")[
  $sin : RR --> RR$ und $cos : RR --> RR$ sind stetig.
]

#theorem(number: "3.8.2")[
  (1) $exp i z = cos(z) + i sin(z) forall z in CC$ \
  (2) $cos z = cos(-z) " und " sin(-z) = - sin z forall z in CC$. \
  (3) $sin z = (e^(i z) - e^(-i z))/(2i), cos z = (e^(i z) + e^(-i z))/(2)$ \
  (4) $sin(z + w) = sin(z) cos(w) + cos(z) sin(w)$ \
  $cos(z + w) = cos(z) cos(w) - sin(z) sin(w)$. \
  (5) $cos(z)^2 + sin(z)^2 = 1 forall z in CC$.
]

#corollary(number: "3.8.3")[
  $sin(2z) = 2sin(z) cos(z)$ \
  $cos(2z) = cos(z)^2 - sin(z)^2.$
]

#theorem(number: "3.9.1")[
  Die Sinusfunktion hat auf $(0, +infinity)$ mindestens eine Nullstelle.
  Sei $pi := inf \{t > 0 : sin t = 0\}.$
  Dann gilt:
  (1) $sin pi = 0, pi in (2, 4)$,
  (2) $forall x in (0, pi) : sin x > 0$. \
  (3) $e^((i p i)/(2)) = i$.
]

#corollary(number: "3.9.2")[
  $x >= sin x >= x - (x^3)/(3!) quad forall 0 < x <= sqrt(6).$
]

#corollary(number: "3.9.3.")[
  (1) $e^(i pi) = -1$, $e^(2 i pi) = 1$ \
  (2) $sin (x + (pi)/(2)) = cos(x)$, $cos (x + (pi)/(2)) = - sin(x) forall x in RR$ \
  (3) $sin (x + pi) = - sin(x)$, $sin (x + 2pi) = sin(x) forall x in RR$ \
  (4) $cos (x + pi) = - cos(x)$, $cos (x + 2pi) = cos(x) forall x in RR$ \
  (5) Nullstellen von Sinus $= \{k dot pi : k in ZZ\}$

  - $sin(x) > 0 forall x in (2 k pi, (2k+1)pi), k in ZZ$
  - $sin(x) < 0 forall x in ((2k+1)pi, (2k+2)pi), k in ZZ$

  (6) Nullstellen von Cosinus $= \{(pi)/(2) + k dot pi : k in ZZ\}$

  - $cos(x) > 0 forall x in (-(pi)/(2) + 2 k pi, -(pi)/(2) + (2k+1)pi), k in ZZ$
  - $cos(x) < 0 forall x in (-(pi)/(2) + (2k+1)pi, -(pi)/(2) + (2k+2)pi), k in ZZ$

]

#definition[
  *Tangens- und Cotangensfunktion*
  Für $z in.not (pi)/(2) + pi dot ZZ$ definieren wir die Tangensfunktion:
  $tan(z) = (sin(z))/(cos(z))$
  und für $z in.not pi dot ZZ$ die Cotangensfunktion:
  $cot(z) = (cos(z))/(sin(z))$
]

#definition(number: "3.10.1")[
  $x_0 in RR$ ist ein *Häufungspunkt* der Menge $D$ falls $forall delta > 0$:
  $(x_0 - delta, x_0 + delta) \{x_0\}) inter D != emptyset$.
]

#definition(number: "3.10.3")[
  Sei $f: D --> RR$, $x_0 in RR$ ein Häufungspunkt von $D$. Dann ist $A in RR$ der Grenzwert von $f(x)$ für $x -> x_0$, bezeichnet mit
  $lim_(x -> x_0) f(x) = A,$
  falls $forall epsilon > 0 exists delta > 0$ sodass
  $ forall x in D inter ((x_0 - delta, x_0 + delta) \{x_0\})) : |f(x) - A| < epsilon. $
]

#theorem(number: "3.10.6")[
  Seien $D, E subset RR$, $x_0$ Häufungspunkt von $D$, $f: D --> E$ eine Funktion.
  Wir nehmen an, dass $y_0 := lim_(x -> x_0)f(x)$ existiert und $y_0 in E$. Falls $g: E --> RR$ stetig in $y_0$ folgt:
  $lim_(x -> x_0) g(f(x)) = g(y_0).$
]

#definition[
  *Links-/Rechtsseitiger Grenzwert*
  Sei $f : D --> RR$ und $x_0 in RR$. Wir nehmen an, $x_0$ ist Häufungspunkt von $D inter [x_0, +infinity)$; das heisst ein rechtsseitiger Häufungspunkt. \
  Falls der Grenzwert der eingeschränkten Funktion
  $f|_(D inter [x_0, +infinity))$
  für $x -> x_0$ existiert, wird er mit
  $lim_(x -> x_0^+) f(x)$
  bezeichnet und nennt sich rechtsseitiger Grenzwert von $f$ bei $x_0$. \
  Wir erweitern diese Definition auf:
  $lim_(x -> x_0^+) f(x) = +infinity$
  falls gilt:
  $forall epsilon > 0 exists delta > 0, forall x in D inter (x_0, x_0 + delta) : f(x) > (1)/(epsilon)$
  und analog:
  $lim_(x -> x_0^+) f(x) = -infinity$
  falls
  $forall epsilon > 0 exists delta > 0, forall x in D inter (x_0, x_0 + delta) : f(x) < -(1)/(epsilon).$
  Linksseitige Häufungspunkte und Grenzwerte werden analog definiert. \
  Mit diesen Definitionen gilt:
  $lim_(x -> 0^+) (1)/(x) = +infinity, lim_(x -> 0^-) (1)/(x) = -infinity.$
]

