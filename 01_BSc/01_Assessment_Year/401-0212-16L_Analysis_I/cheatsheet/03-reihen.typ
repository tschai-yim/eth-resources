#import "lib.typ": *

= Reihen

#definition(number: "2.7.1")[
  *Reihenkonvergenz*
  Die Reihe $sum_(k=1)^infinity a_k$ ist *konvergent*, falls die Folge $(S_n)_(n >= 1)$ mit $S_n = sum_(k=1)^n a_k$ der Partialsummen konvergiert. In diesem Fall definieren wir:
  $sum_(k=1)^infinity a_k := lim_(n -> infinity) S_n.$
]

#definition[
  *Geometrische Reihe*
  Sei $q in CC$ mit $|q| < 1$. Dann konvergiert $sum_(k=0)^infinity q^k$ und dessen Wert ist:
  $sum_(k=0)^infinity q^k = (1)/(1-q).$
]

#definition[
  *Harmonische Reihe*
  Die Reihe $sum_(n=1)^infinity (1)/(n)$ divergiert.
]

#theorem(number: "2.7.4")[
  Seien $sum_(k=1)^infinity a_k$ und $sum_(j=1)^infinity b_j$ konvergent, sowie $alpha in CC$. \
  (1) Dann ist $sum_(k=1)^infinity (a_k + b_k)$ konvergent und $sum_(k=1)^infinity (a_k + b_k) = (sum_(k=1)^infinity a_k) + (sum_(j=1)^infinity b_j)$. \
  (2) Dann ist $sum_(k=1)^infinity alpha dot a_k$ konvergent und $sum_(k=1)^infinity alpha dot a_k = alpha dot sum_(k=1)^infinity a_k$.
]

#theorem(number: "2.7.5")[
  *Cauchy-Kriterium für Reihen*
  Die Reihe $sum_(k=1)^infinity a_k$ ist genau dann konvergent, falls: \
  $forall epsilon > 0 exists N >= 1 " mit " |sum_(k=n)^m a_k| < epsilon quad forall m >= n >= N.$
]

#theorem(number: "2.7.6")[
  Sei $sum_(k=1)^infinity a_k$ eine Reihe mit $a_k >= 0 forall k in NN$. Die Reihe $sum_(k=1)^infinity a_k$ konvergiert genau dann, falls die Folge $(S_n)_(n >= 1)$, $S_n = sum_(k=1)^n a_k$ der Partialsummen nach oben beschränkt ist.
]

#corollary(number: "2.7.7")[
  *Vergleichssatz*
  Seien $sum_(k=1)^infinity a_k$ und $sum_(k=1)^infinity b_k$ Reihen mit $0 <= a_k <= b_k quad forall k >= 1$. Dann gelten: \
  $sum_(k=1)^infinity b_k " konvergent " => sum_(k=1)^infinity a_k " konvergent"$ \
  $sum_(k=1)^infinity a_k " divergent " => sum_(k=1)^infinity b_k " divergent"$ \
  Die Implikationen treffen auch zu, wenn es $K >= 1$ gibt, sodass $0 <= a_k <= b_k quad forall k >= K.$
]

#definition(number: "2.7.9")[
  Die Reihe $sum_(k=1)^infinity a_k$ heisst *absolut konvergent*, falls
  $sum_(k=1)^infinity |a_k|$
  konvergiert.
]

#theorem(number: "2.7.10")[
  Eine absolut konvergente Reihe $sum_(k=1)^infinity a_k$ ist auch konvergent und es gilt:
  $|sum_(k=1)^infinity a_k| <= sum_(k=1)^infinity |a_k|$
]

#theorem(number: "2.7.12")[
  *Leibniz*
  Sei $(a_n)_(n >= 1)$ monoton fallend mit $a_n >= 0 forall n >= 1$ und $lim_(n -> infinity) a_n = 0$. Dann konvergiert
  $S := sum_(k=1)^infinity (-1)^(k+1)a_k$
  und es gilt: $a_1 - a_2 <= S <= a_1$
]

#definition(number: "2.7.14")[
  Eine Reihe $sum_(n=1)^infinity a_n'$ ist eine *Umordnung* der Reihe $sum_(n=1)^infinity a_n$, falls es eine bijektive Abbildung
  $phi : NN --> NN$
  gibt, so dass
  $a_n' = a_(phi(n)).$
]

#theorem(number: "2.7.16")[
  *Dirichlet*
  Falls $sum_(n=1)^infinity a_n$ absolut konvergiert, dann konvergiert jede Umordnung der Reihe und hat denselben Grenzwert.
]

#theorem(number: "2.7.17")[
  *Quotientenkriterium, Cauchy*
  Sei $(a_n)_(n >= 1)$ mit $a_n != 0 forall n >= 1$. Falls
  $limsup_(n -> infinity) |(a_(n+1))/(a_n)| < 1$
  dann konvergiert die Reihe $sum_(n=1)^infinity a_n$ absolut. \
  Falls
  $liminf_(n -> infinity) |(a_(n+1))/(a_n)| > 1$
  divergiert die Reihe.
]

#theorem(number: "2.7.20")[
  *Wurzelkriterium, Cauchy*
  (1) Falls $limsup_(n -> infinity) root(n, |a_n|) < 1$, dann konvergiert $sum_(n=1)^infinity a_n$ absolut. \
  (2) Falls $limsup_(n -> infinity) root(n, |a_n|) > 1$, dann divergieren $sum_(n=1)^infinity a_n$ und $sum_(n=1)^infinity |a_n|$.
]

#definition[
  *Konvergenzradius*
  Sei $(c_k)_(k >= 0)$ eine Folge (in $RR$ oder $CC$). Falls $limsup_(k -> infinity) root(k, |c_k|)$ existiert, definieren wir \
  $
    rho = cases(+infinity & "falls " limsup_(k -> infinity) root(k, |c_k|) = 0, (1)/(limsup_(k -> infinity) root(k, |c_k|)) & "falls " limsup_(k -> infinity) root(k, |c_k|) > 0)
  $
]

#corollary(number: "2.7.21")[
  *Potenzreihen-Konvergenz*
  Die Potenzreihe $sum_(k=0)^infinity c_k z^k$ konvergiert absolut für alle $|z| < rho$ und divergiert für alle $|z| > rho$.
]

#definition[
  *Zeta-Funktion*
  Sei $s > 1$ und $zeta(s) = sum_(n=1)^infinity (1)/(n^s)$. Die Reihe konvergiert.
]

#definition[
  *Doppelfolge und Doppelreihe*
  Gegeben eine Doppelfolge $(a_(i j))_(i,j >= 0)$. Dann können
  $sum_(i=0)^infinity (sum_(j=0)^infinity a_(i j)) "und  " sum_(j=0)^infinity (sum_(i=0)^infinity a_(i j))$
  beide konvergent sein mit verschiedenen Grenzwerten.
  Wir nennen $sum_(i,j >= 0) a_(i j)$ eine Doppelreihe.
]

#definition(number: "2.7.22")[
  $sum_(k=0)^infinity b_k$ ist eine *lineare Anordnung* der Doppelreihe $sum_(i,j >= 0) a_(i j)$, falls es eine Bijektion
  $sigma : NN_0 -> NN_0 times NN_0$
  gibt, mit $b_k = a_(sigma(k))$.
]

#theorem(number: "2.7.23")[
  *Cauchy*
  Wir nehmen an, dass es $B >= 0$ gibt, so dass
  $sum_(i=0)^m sum_(j=0)^m |a_(i j)| <= B quad forall m >= 0.$
  Dann konvergieren die folgenden Reihen absolut:
  $S_i := sum_(j=0)^infinity a_(i j) quad forall i >= 0 quad "und" quad U_j := sum_(i=0)^infinity a_(i j) quad forall j >= 0$
  sowie
  $sum_(i=0)^infinity S_i quad "und" quad sum_(j=0)^infinity U_j$
  und es gilt:
  $sum_(i=0)^infinity S_i = sum_(j=0)^infinity U_j$
  Zudem konvergiert jede lineare Anordnung der Doppelreihe absolut, mit selbem Grenzwert.
]

#definition(number: "2.7.24")[
  Das *Cauchy-Produkt* der Reihen \
  $sum_(i=0)^infinity a_i, sum_(j=0)^infinity b_j$ ist die Reihe $sum_(n=0)^infinity (sum_(j=0)^n a_(n-j)b_j) =$
  $a_0b_0 + (a_0b_1 + a_1b_0) + (a_0b_2 + a_1b_1 + a_2b_0) + dots$
]

#theorem(number: "2.7.26")[
  Falls die Reihen $sum_(i=0)^infinity a_i, sum_(j=0)^infinity b_j$ absolut konvergieren, so konvergiert ihr Cauchy Produkt und es gilt:
  $sum_(n=0)^infinity (sum_(j=0)^n a_(n-j)b_j) = (sum_(i=0)^infinity a_i) (sum_(j=0)^infinity b_j)$
]

#theorem(number: "2.7.28")[
  Sei $f_n : NN_0 --> RR$ eine Folge. Wir nehmen an, dass:

  - $f(j) := lim_(n -> infinity) f_n(j)$ existiert $forall j in NN_0$.
  - Es gibt eine Funktion $g : NN_0 --> [0, infinity)$, so dass
    - $|f_n(j)| <= g(j) quad forall j >= 0, forall n >= 0$.
    - $sum_(j=0)^infinity g(j)$ konvergiert.

  Dann folgt:
  $sum_(j=0)^infinity f(j) = lim_(n -> infinity) sum_(j=0)^infinity f_n(j).$
]

#corollary(number: "2.7.29")[
  Für jedes $z in CC$ konvergiert die Folge $((1+(z)/(n))^n)_(n >= 1)$ und
  $lim_(n -> infinity) (1+(z)/(n))^n = exp(z).$
]

