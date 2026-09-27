#import "lib.typ": *

= Folgen

#definition(number: "2.1.1")[
  Eine *Folge* (reeller Zahlen) ist eine Abbildung
  $a : NN --> RR.$
  Wir schreiben $a_n$ statt $a(n)$ und bezeichnen eine Folge mit $(a_n)_(n >= 1)$.
]

#lemma(number: "2.1.3")[
  Sei $(a_n)_(n >= 1)$ eine Folge. Dann gibt es höchstens eine reelle Zahl $l in RR$ mit der Eigenschaft:
  $forall epsilon > 0$ ist die Menge $\{n in NN : a_n in.not (l-epsilon, l+epsilon)\}$ endlich.
]

#definition(number: "2.1.4")[
  *Folgenkonvergenz*
  Eine Folge $(a_n)_(n >= 1)$ heisst *konvergent*, falls es $l in RR$ gibt, so dass $forall epsilon > 0$ die Menge $\{n in NN : a_n in.not (l-epsilon, l+epsilon)\}$ endlich ist. $l$ ist eindeutig bestimmt und wird mit $lim_(n -> infinity) a_n$ (Grenzwert, Limes) bezeichnet.
]

#remark(number: "2.1.5")[
  *konvergent $=>$ beschränkt*
  Jede konvergente Folge ist beschränkt: Sei $(a_n)_(n >= 1)$ konvergent mit Grenzwert $l$. Dann ist $\{a_n : n >= 1\}$ beschränkt:
  Sei $epsilon = 1$ und $\{n in NN : a_n in.not (l-1, l+1)\} = \{i_1, dots, i_M\}$. Dann folgt: $\{a_n : n >= 1\} subset (l-1, l+1) ∪ \{a_(i_1), dots, a_(i_M)\}$
  und ist daher beschränkt.
]

#lemma(number: "2.1.6")[
  *Folgenkonvergenz*
  Sei $(a_n)_(n >= 1)$ eine Folge. Folgende Aussagen sind äquivalent: \
  (1) $(a_n)_(n >= 1)$ konvergiert gegen $l = lim_(n -> infinity) a_n$. \
  (2) $forall epsilon > 0 exists N >= 1$, so dass $|a_n - l| < epsilon quad forall n >= N.$
]

#theorem(number: "2.1.8.")[
  Seien $(a_n)_(n >= 1)$ und $(b_n)_(n >= 1)$ konvergente Folgen mit $a = lim_(n -> infinity) a_n$, $b = lim_(n -> infinity) b_n$. \
  (1) Dann ist $(a_n + b_n)_(n >= 1)$ konvergent und $lim_(n -> infinity) (a_n + b_n) = a+b$. \
  (2) Dann ist $(a_n dot b_n)_(n >= 1)$ konvergent und $lim_(n -> infinity) (a_n dot b_n) = a dot b$. \
  (3) Nehmen wir zudem an, dass $b_n != 0 forall n >= 1$ und $b != 0$. Dann ist $((a_n)/(b_n))_(n >= 1)$ konvergent und $lim_(n -> infinity) ((a_n)/(b_n)) = (a)/(b)$. \
  (4) Falls es ein $K >= 1$ gibt mit $a_n <= b_n forall n >= K$ dann folgt $a <= b$.
]

#definition(number: "2.2.1")[
  *Monotonie von Folgen*
  (1) $(a_n)_(n >= 1)$ ist *monoton wachsend* falls: $a_n <= a_(n+1) quad forall n >= 1.$ \
  (2) $(a_n)_(n >= 1)$ ist *monoton fallend* falls:
  $a_(n+1) <= a_n quad forall n >= 1.$
]

#theorem(number: "2.2.2")[
  *Weierstrass*
  Sei $(a_n)_(n >= 1)$ monoton wachsend (fallend) und nach oben (unten) beschränkt. Dann konvergiert $(a_n)_(n >= 1)$ mit Grenzwert $lim_(n -> infinity) a_n = sup\{a_n : n >= 1\}$ ($inf\{a_n : n >= 1\}$).
]

#remark(number: "2.2.4")[
  Sei $(a_n)_(n >= 1)$ eine konvergente Folge mit $lim_(n -> infinity) a_n = a$ und $k in NN$. Dann ist die durch $b_n := a_(n+k) quad n >= 1$ definierte Folge konvergent und
  $lim_(n -> infinity) b_n = a.$
]

#lemma(number: "2.2.7")[
  *Bernoulli Ungleichung*
  $(1+x)^n >= 1 + n dot x quad forall n in NN, x > -1$
]

#definition[
  *Limes inferior und Limes superior*
  Sei für jedes $n >= 1$: $b_n = inf\{a_k : k >= n\}$ und $c_n = sup\{a_k : k >= n\}$.
  Nach Weierstrass (Satz 2.2.2) sind beide Folgen konvergent und wir definieren: \
  $liminf_(n -> infinity) a_n := lim_(n -> infinity) b_n quad "(Limes inferior)"$ \
  $limsup_(n -> infinity) a_n := lim_(n -> infinity) c_n quad "(Limes superior)"$ \
  Aus $b_n <= c_n$ folgt mit Satz 2.1.8(4): \
  $liminf_(n -> infinity) a_n <= limsup_(n -> infinity) a_n.$
]

#lemma(number: "2.4.1")[
  *Alternative Folgenkonvergenz*
  $(a_n)_(n >= 1)$ konvergiert genau dann, falls $(a_n)_(n >= 1)$ beschränkt ist und
  $liminf_(n -> infinity) a_n = limsup_(n -> infinity) a_n.$
]

#theorem(number: "2.4.2")[
  *Cauchy-Kriterium für Folgen*
  Die Folge $(a_n)_(n >= 1)$ ist genau dann konvergent, falls
  $forall epsilon > 0 exists N >= 1 " so dass " |a_n - a_m| < epsilon forall n,m >= N.$
]

#definition(number: "2.5.1")[ // TODO: check if equivalent
  Ein abgeschlossenes Intervall ist eine Teilmenge $I subset RR$ der Form

  - $[a,b]$, $a <= b, a,b in RR$
  - $[a, +infinity)$, $a in RR$
  - $(-infinity, a]$, $a in RR$
  - $(-infinity, +infinity) = RR$

]

#definition[
  *Länge eines Intervalls*
  Wir definieren die Länge $cal(L)(I)$ des Intervalls als
  $cal(L)(I) = b-a quad "im ersten Fall"$ und $cal(L)(I) = +infinity quad "in (2), (3), (4)."$ \
  Offensichtlich ist $cal(L)(I) >= 0$. Das abgeschlossene Intervall ist genau dann eine beschränkte Teilmenge von $RR$, falls $cal(L)(I) < +infinity$.
]

#remark(number: "2.5.2")[
  Ein Intervall $I subset RR$ ist genau dann abgeschlossen, falls für jede konvergente Folge $(a_n)_(n >= 1)$ aus Elementen in $I$, der Grenzwert $lim_(n -> infinity) a_n$ auch in $I$ ist.
]

#remark(number: "2.5.3")[
  Seien $I = [a,b]$, $J = [c,d]$ mit $a <= b$ und $c <= d, a,b,c,d in RR$. Dann gilt $I subset J$ genau dann, wenn $c <= a$ und $b <= d$. Es folgt dann: $cal(L)(I) = b-a <= d-c = cal(L)(J)$.
]

#definition[
  *Monoton fallende Folge von Teilmengen*
  Eine monoton fallende Folge von Teilmengen von $RR$ ist eine Folge $(X_n)_(n >= 1)$, $X_n subset RR$ mit
  $X_1 supset.eq X_2 supset.eq dots supset.eq X_n supset.eq X_(n+1) supset.eq dots$
]

#theorem(number: "2.5.5")[
  *Cauchy-Cantor*
  Sei $I_1 supset.eq I_2 supset.eq dots supset.eq I_n supset.eq I_(n+1) supset.eq dots$ eine Folge abgeschlossener Intervalle mit $cal(L)(I_1) < +infinity$. \
  Dann gilt: $inter_(n >= 1) I_n != emptyset$. Falls zudem $lim_(n -> infinity) cal(L)(I_n) = 0$ enthält $inter_(n >= 1) I_n$ genau einen Punkt.
]

#theorem(number: "2.5.6")[
  $RR$ ist nicht abzählbar.
]

#definition(number: "2.5.7")[
  *Teilfolge*
  Eine *Teilfolge* einer Folge $(a_n)_(n >= 1)$ ist eine Folge $(b_n)_(n >= 1)$ wobei $b_n = a_(l(n))$ und $l : NN --> NN$ eine Abbildung bezeichnet mit der Eigenschaft $l(n) < l(n+1) quad forall n >= 1.$
]

#theorem(number: "2.5.9")[
  *Bolzano-Weierstrass*
  Jede beschränkte Folge besitzt eine konvergente Teilfolge.
]

#remark(number: "2.5.10")[
  Sei $(a_n)_(n >= 1)$ eine beschränkte Folge. Dann gilt für jede konvergente Teilfolge $(b_n)_(n >= 1)$:
  $liminf_(n -> infinity) a_n <= lim_(n -> infinity) b_n <= limsup_(n -> infinity) a_n$
  Zudem gibt es zwei Teilfolgen von $(a_n)_(n >= 1)$ die $liminf_(n -> infinity) a_n$ respektive $limsup_(n -> infinity) a_n$ als Grenzwert annehmen.
]

#definition(number: "2.6.1")[
  *Folgen in $RR^d$*
  Eine Folge in $RR^d$ ist eine Abbildung $a : NN --> RR^d.$
  Wir schreiben $a_n$ statt $a(n)$ und bezeichnen sie mit $(a_n)_(n >= 1)$.
]

#definition(number: "2.6.2")[
  *Folgenkonvergenz in $RR^d$*
  Eine Folge $(a_n)_(n >= 1)$ in $RR^d$ heisst *konvergent*, falls es $a in RR^d$ gibt, so dass: $forall epsilon > 0 exists N >= 1 " mit " ||a_n - a|| < epsilon quad forall n >= N.$
]

#theorem(number: "2.6.3")[
  Sei $b = (b_1, dots, b_d)$. Folgende Aussagen sind äquivalent: \
  (1) $lim_(n -> infinity) a_n = b$ \
  (2) $lim_(n -> infinity) a_(n,j) = b_j quad forall 1 <= j <= d$.
]

#theorem(number: "2.6.6")[
  (1) Eine Folge $(a_n)_(n >= 1)$ konvergiert genau dann, wenn sie eine Cauchy Folge ist: \
  $forall epsilon > 0 exists N >= 1 " mit " ||a_n - a_m|| < epsilon quad forall n, m >= N.$ \
  (2) Jede beschränkte Folge hat eine konvergente Teilfolge.
]

