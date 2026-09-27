#import "lib.typ": *

= Das Riemann-Integral

#definition(number: "5.1.1")[
  Eine *Partition* von $I$ ist eine endliche Teilmenge $P subset.eq [a,b]$ wobei $\{a,b\} subset P$.
  Eine Partition $P'$ ist eine Verfeinerung von $P$ falls $P subset.eq P'$.
]

#definition[
  *Unter- und Obersumme*
  Sei nun $f : [a, b] --> RR$ eine beschränkte Funktion (siehe Def. 3.1.1 (3)), das heisst es gibt $M >= 0$ mit $|f(x)| <= M quad forall x in [a,b]$.
  Sei auch $P = \{x_0, x_1, dots, x_n\}$ eine Partition von $I$. Insbesondere gilt $x_0 = a < x_1 < dots < x_n = b$. Wir bezeichnen mit $delta_i := x_i - x_(i-1), i >= 1$, die Länge des Teilintervalls $[x_(i-1),x_i]$.

  Wir definieren die Untersumme und Obersumme \
  $s(f,P):=sum_(i=1)^(n) f_i delta_i, f_i = inf_(x_(i-1)<= x<= x_i) f(x)$ \
  $S(f,P):=sum_(i=1)^(n) F_i delta_i, F_i = sup_(x_(i-1)<= x<= x_i) f(x)$
]

#lemma(number: "5.1.2")[
  (1) Sei $P'$ eine Verfeinerung von $P$, dann gilt:
  $s(f, P) <= s(f, P') <= S(f, P') <= S(f, P).$ \
  (2) Für beliebige Partitionen $P_1, P_2$ gilt:
  $s(f, P_1) <= S(f, P_2).$
]

#definition(number: "5.1.3")[
  Sei nun $cal(P)(I)$ die Menge der Partitionen von $I$. Wir definieren: $s(f) = sup_(P in cal(P)(I)) s(f,P)$ \
  $S(f) = inf_(P in cal(P)(I)) S(f,P).$ \
  Aus Lemma 5.1.2 (2) folgt $s(f) <= S(f)$. \
  Eine beschränkte Funktion $f : [a,b] --> RR$ ist *Riemann integrierbar* (oder kurz: integrierbar), falls $s(f) = S(f)$. In diesem Fall bezeichnen wir den gemeinsamen Wert von $s(f)$ und $S(f)$ mit $integral_a^b f(x) dif x.$
]

#theorem(number: "5.1.4")[
  Eine beschränkte Funktion ist integrierbar, g.d.w. $forall epsilon > 0 exists P in cal(P)(I) " mit " S(f,P) - s(f,P) < epsilon.$
]

#theorem(number: "5.1.8")[
  *Du Bois-Reymond, Darboux*
  Eine beschränkte Funktion $f : [a,b] --> RR$ ist genau dann integrierbar, falls $forall epsilon > 0 exists delta > 0$ sodass $forall P in cal(P)_(delta)(I), S(f,P) - s(f,P) < epsilon.$
  Hier bezeichnet $cal(P)_(delta)(I)$ die Menge der Partitionen $P$ für welche $max_(1 <= i <= n) delta_i <= delta$.
]

#corollary(number: "5.1.9")[
  In der Folge ist es zweckmässig für eine Partition $P = \{x_0,...,x_n\}$ die Zahl $delta(P) = max_(1 <= i <= n) (x_i - x_(i-1))$ einzuführen.
  Sei $P$ eine Partition und zudem wählen wir $xi_1,...,xi_n$: $xi_i in [x_(i-1), x_i], quad 1 <= i <= n$.
  Dann ist $sigma := sum_(i=1)^n f(xi_i)delta_i$ eine Riemannsche Summe. \
  Die beschränkte Funktion $f : [a,b] --> RR$ ist genau dann integrierbar mit $A := integral_a^b f(x) d x$ falls:
  $forall epsilon > 0 exists delta > 0$ so dass $forall P in cal(P)(I)$ Partition mit $delta(P) < delta$ und $xi_1,...,xi_n$ mit $xi_i in [x_(i-1),x_i]$, $P = \{x_0,...,x_n\}$, $|A - sum_(i=1)^n f(xi_i) (x_i - x_(i-1))| < epsilon.$
]

#theorem(number: "5.2.1")[
  Seien $f,g : [a,b] --> RR$ beschränkt, integrierbar und $lambda in RR$. Dann sind $f+g, lambda dot f, f dot g, |f|, max(f, g), min(f, g)$ und $(f)/(g)$ (falls $|g(x)| >= beta > 0 forall x in [a,b]$) integrierbar.
]

#remark(number: "5.2.2")[
  Sei $phi: [c,d] --> RR$ eine beschränkte Funktion. Dann ist
  $sup_(x,y in [c,d]) |phi(x) - phi(y)| = sup_(x in [c,d]) phi(x) - inf_(x in [c,d]) phi(x).$
]

#corollary(number: "5.2.3")[
  Seien $P, Q$ Polynome und $[a,b]$ ein Intervall in dem $Q$ keine Nullstelle besitzt. Dann ist $[a,b] --> RR: x |-> (P(x))/(Q(x))$ integrierbar.
]

#definition(number: "5.2.4")[
  Eine Funktion $f : D --> RR$, $D subset RR$ ist in $D$ *gleichmässig stetig*, falls $forall epsilon > 0 exists delta > 0 forall x,y in D :$
  $|x-y| < delta => |f(x) - f(y)| < epsilon.$
]

#theorem(number: "5.2.6")[
  *Heine*
  Sei $f : [a,b] --> RR$ stetig in dem kompakten Intervall $[a,b]$. Dann ist $f$ in $[a,b]$ gleichmässig stetig.
]

#theorem(number: "5.2.7")[
  Sei $f : [a,b] --> RR$ stetig. Dann ist $f$ integrierbar.
]

#theorem(number: "5.2.8")[
  Sei $f : [a,b] --> RR$ monoton. Dann ist $f$ integrierbar.
]

#remark(number: "5.2.9")[
  Seien $a < b < c$ und $f: [a,c] --> RR$ beschränkt mit $f|_([a,b])$ und $f|_([b,c])$ integrierbar. Dann ist $f$ integrierbar und \
  $integral_a^c f(x) dif x = integral_a^b f(x) dif x + integral_b^c f(x) dif x.$
]

#theorem(number: "5.2.10")[
  Sei $I subset.eq RR$ ein kompaktes Intervall mit Endpunkten $a, b$ sowie $f_1, f_2 : I --> RR$ beschränkt integrierbar und $lambda_1, lambda_2 in RR$. Dann gilt:
  $integral_a^b (lambda_1 f_1(x) + lambda_2 f_2(x)) dif x = lambda_1 integral_a^b f_1(x) dif x + lambda_2 integral_a^b f_2(x) dif x.$
]

#theorem(number: "5.3.1")[
  Seien $f,g : [a,b] --> RR$ beschränkt integrierbar, und
  $f(x) <= g(x) quad forall x in [a,b].$
  Dann folgt:
  $integral_a^b f(x) dif x <= integral_a^b g(x) dif x.$
]

#corollary(number: "5.3.2")[
  Falls $f : [a,b] --> RR$ beschränkt integrierbar, folgt
  $|integral_a^b f(x) dif x| <= integral_a^b |f(x)| dif x.$
]

#theorem(number: "5.3.3")[
  *Cauchy, Schwarz, Bunjakovski: Die Cauchy-Schwarz Ungleichung*
  Seien $f,g : [a,b] --> RR$ beschränkt integrierbar. Dann gilt
  $|integral_a^b f(x)g(x) dif x| <= sqrt(integral_a^b f^2(x) dif x) sqrt(integral_a^b g^2(x) dif x).$
]

#theorem(number: "5.3.4")[
  *Mittelwertsatz, Cauchy*
  Sei $f : [a,b] --> RR$ stetig. Dann gibt es $xi in [a,b]$ mit:
  $integral_a^b f(x) dif x = f(xi)(b-a).$
]

#theorem(number: "5.3.6")[
  *Cauchy*
  Seien $f,g : [a,b] --> RR$ wobei $f$ stetig, $g$ beschränkt integrierbar mit $g(x) >= 0 forall x in [a,b]$. Dann gibt es $xi in [a,b]$ mit
  $integral_a^b f(x)g(x) dif x = f(xi) integral_a^b g(x) dif x.$
]

#theorem(number: "5.4.1")[
  *Fundamentalsatz der Differentialrechnung*
  Seien $a < b$ und $f : [a,b] --> RR$ stetig. Die Funktion
  $F(x) = integral_a^x f(t) dif t, quad a <= x <= b$
  ist in $[a,b]$ stetig differenzierbar und
  $F'(x) = f(x) quad forall x in [a,b].$
]

#definition(number: "5.4.2")[
  Sei $a < b$ und $f : [a,b] --> RR$ stetig. $F : [a,b] --> RR$ heisst *Stammfunktion* von $f$, falls $F$ (stetig) differenzierbar in $[a,b]$ ist und $F' = f$ in $[a,b]$ gilt.
]

#theorem(number: "5.4.3")[
  *Fundamentalsatz der Differentialrechnung*
  Sei $f : [a,b] --> RR$ stetig. Dann gibt es eine Stammfunktion $F$ von $f$, die bis auf eine additive Konstante eindeutig bestimmt ist und es gilt:
  $integral_a^b f(x) dif x = F(b) - F(a).$
]

#theorem(number: "5.4.5")[
  *Partielle Integration*
  Seien $a < b$ reelle Zahlen und $f,g : [a,b] --> RR$ stetig differenzierbar. Dann gilt:
  $integral_a^b f(x)g'(x) dif x = f(b)g(b) - f(a)g(a) - integral_a^b f'(x)g(x) dif x.$
]

#theorem(number: "5.4.6")[
  *Substitution*
  Sei $a < b$, $phi : [a,b] --> RR$ stetig differenzierbar, $I subset RR$ ein Intervall mit $phi([a,b]) subset.eq I$ und $f : I --> RR$ eine stetige Funktion. Dann gilt:
  $integral_(phi(a))^(phi(b)) f(x) dif x = integral_a^b f(phi(t)) phi'(t) dif t.$
]

#corollary(number: "5.4.8")[
  Sei $I subset.eq RR$ ein Intervall und $f : I --> RR$ stetig.
  (1) Seien $a, b, c in RR$ so dass das abgeschlossene Intervall mit Endpunkten $a+c, b+c$ in $I$ enthalten ist. Dann gilt:
  $integral_(a+c)^(b+c) f(x) dif x = integral_a^b f(t+c) dif t.$ \
  (2) Seien $a, b, c in RR$ mit $c != 0$ so dass das abgeschlossene Intervall mit Endpunkten $a c, b c$ in $I$ enthalten ist. Dann gilt:
  $integral_a^b f(c t) dif t = (1)/(c) integral_(a c)^(b c) f(x) dif x.$
]

#theorem(number: "5.5.1")[
  Sei $f_n : [a,b] --> RR$ eine Folge von beschränkten, integrierbaren Funktionen die gleichmässig gegen eine Funktion $f : [a,b] --> RR$ konvergiert. Dann ist $f$ beschränkt integrierbar und
  $lim_(n -> infinity) integral_a^b f_n(x) dif x = integral_a^b f(x) dif x.$
]

#corollary(number: "5.5.2")[
  Sei $f_n : [a,b] --> RR$ eine Folge beschränkter integrierbarer Funktionen so dass
  $sum_(n=0)^infinity f_n$
  auf $[a,b]$ gleichmässig konvergiert. Dann gilt: \
  $sum_(n=0)^infinity integral_a^b f_n(x) dif x = integral_a^b (sum_(n=0)^infinity f_n(x)) dif x.$
]

#corollary(number: "5.5.3")[
  Sei $f(x) = sum_(k=0)^infinity c_k x^k$ eine Potenzreihe mit positivem Konvergenzradius $rho > 0$. Dann ist für jedes $0 <= r < rho$, $f$ auf $[-r,r]$ integrierbar und es gilt $forall x in (-rho, rho) : integral_0^x f(t) dif t = sum_(n=0)^infinity (c_n)/(n+1) x^(n+1).$
]

#definition[
  *Stirling'sche Formel*
  Die Stirling'sche Formel, oder dessen geläufige Version, ist eine qualitative Aussage über das Verhalten der Fakultät: $n --> n!$
  Nämlich: $n! approx (sqrt(2pi n) n^n)/(e^n),$
  das heisst $lim_(n -> infinity) (n!) / ((sqrt(2pi n) n^n)/(e^n)) = 1$.
  Für eine Approximation von $n!$ ist dies nicht so nützlich, da wir nicht wissen, wie schnell obige Folge gegen 1 konvergiert.
]

#theorem(number: "5.7.1")[
  $ n! = (sqrt(2pi n) n^n)/(e^n) dot exp((1)/(12n) + R_3(n)) $
  wobei
  $|R_3(n)| <= (sqrt(3))/(216) dot (1)/(n^2) quad forall n >= 1.$
]

#lemma(number: "5.7.2")[
  $forall m >= n + 1 >= 1: |R_3(m,n)| <= (sqrt(3))/(216)((1)/(n^2) - (1)/(m^2)).$
]

#definition(number: "5.8.1")[
  Sei $f : [a, infinity) --> RR$ beschränkt und integrierbar auf $[a,b]$ für alle $b > a$. Falls $lim_(b -> infinity) integral_a^b f(x) dif x$ existiert, bezeichnen wir den Grenzwert mit $integral_a^infinity f(x) dif x$ und sagen, dass $f$ auf $[a, +infinity)$ integrierbar ist.
]

#lemma(number: "5.8.3")[
  Sei $f : [a, infinity) --> RR$ beschränkt und integrierbar auf $[a,b] forall b > a$.
  (1) Falls $|f(x)| <= g(x) forall x >= a$ und $g(x)$ ist auf $[a, infinity)$ integrierbar, so ist $f$ auf $[a, infinity)$ integrierbar.
  (2) Falls $0 <= g(x) <= f(x)$ und $integral_a^infinity g(x) dif x$ divergiert, so divergiert auch $integral_a^infinity f(x) dif x$.
]

#theorem(number: "5.8.5")[
  *McLaurin*
  Sei $f : [1, infinity) --> [0, infinity)$ monoton fallend. Die Reihe $sum_(n=1)^infinity f(n)$ konvergiert genau dann, wenn $integral_1^infinity f(x) dif x$ konvergiert.
]

#definition(number: "5.8.8")[
  In dieser Situation ist $f : (a,b] --> RR$ integrierbar, falls
  $lim_(epsilon -> 0^+) integral_(a+epsilon)^b f(x) dif x$ existiert; in diesem Fall wird der Grenzwert mit $integral_a^b f(x) dif x$ bezeichnet.
]

#definition(number: "5.8.11")[
  Für $s > 0$ definieren wir $Gamma(s) := integral_0^infinity e^(-x)x^(s-1) dif x.$
]

#theorem(number: "5.8.12")[
  *Bohr-Mollerup*
  (1) Die Gamma Funktion erfüllt die Relationen
  a) $Gamma(1) = 1$
  b) $Gamma(s+1) = s Gamma(s)$
  c) $Gamma$ ist logarithmisch konvex, das heisst $Gamma(lambda x + (1 - lambda)y) <= Gamma(x)^lambda Gamma(y)^(1-lambda)$ für alle $x,y > 0$ und $0 <= lambda <= 1$.

  (2) Die Gamma Funktion ist die einzige Funktion $(0, infinity)--> (0, infinity)$ die (a), (b) und (c) erfüllt. \
  Darüber hinaus gilt: \
  $Gamma(x) = lim_(n -> +infinity) (n!n^x)/(x(x+1)dots(x+n)) quad forall x > 0.$
]

#lemma(number: "5.8.13")[
  Sei $p > 1$ und $q > 1$ mit $(1)/(p) + (1)/(q) = 1$. Dann gilt $forall a,b >= 0$: $a dot b <= (a^p)/(p) + (b^q)/(q).$
]

#theorem(number: "5.8.14")[
  *Hölder Ungleichung*
  Seien $p > 1$ und $q > 1$ mit $(1)/(p) + (1)/(q) = 1$. Für alle $f,g : [a,b] --> RR$ stetig gilt: $integral_a^b |f(x)g(x)| dif x <= ||f||_p ||g||_q$
]

#definition[
  *Unbestimmtes Integral*
  Sei $f: I --> RR$ auf einem Intervall $I subset RR$ definiert. Falls $f$ stetig ist, gibt es eine Stammfunktion $F$ für $f$ (siehe Satz 5.4.1); wir schreiben in diesem Fall: \
  $integral f(x) dif x = F(x) + C$
]

#theorem(number: "A.0.1")[
  *Binomialsatz*
  $forall x, y in CC, n >= 1$ gilt $(x+y)^n = sum_(k=0)^n binom(n, k) x^k y^(n-k).$
]

