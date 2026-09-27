#import "lib.typ": *

= 1 Reelle Zahlen, Komplexe Zahlen
== Reelle Zahlen

#theorem[ *von Lindemann*
  // TODO: maybe remove
  Es gibt keine Gleichung der Form $x^n + a_(n - 1)x^(n - 1) + " ... " + a_0 = 0$ mit $a_i in QQ$, sodass $x = pi$ eine Lösung ist.
]

#theorem(number: "1.1.2")[
  $RR$ ist ein kommutativer, angeordneter Körper, der ordnungsvollständig ist.
]

#definition[
  *Axiome der Addition*
  (A1) Assoziativität: $x+(y + z) = (x + y) + z forall x, y, z in RR$ \
  (A2) Neutrales Element: $x + 0 = x forall x in RR$ \
  (A3) Inverses Element: $forall x in RR exists y in RR : x + y = 0$ \
  (A4) Kommutativität: $x + z = z + x forall x, z in RR$
]

#definition[
  *Axiome der Multiplikation*
  (M1) Assoziativität: $x dot (y dot z) = (x dot y) dot z forall x, y, z in RR$ \
  (M2) Neutrales Element: $x dot 1 = x forall x in RR$ \
  (M3) Inverses Element: $forall x in RR, x != 0 exists y in RR : x dot y = 1$ \
  (M4) Kommutativität: $x dot z = z dot x forall x, z in RR$
]

#definition[
  *Axiom der Distributivität*
  (D) Distributivität: $x dot (y + z) = x dot y + x dot z forall x, y, z in RR$
]

#definition[
  *Ordnungsaxiome*
  (O1) Reflexivität: $x <= x forall x in RR$ \
  (O2) Transitivität: $x <= y " und " y <= z => x <= z$ \
  (O3) Antisymmetrie: $x <= y " und " y <= x => x = y$ \
  (O4) Total: $forall x, y in RR " gilt entweder " x <= y " oder " y <= x$
]

#definition[
  *Kompatibilität*
  (K1) $forall x,y,z in RR : x <= y => x+z <= y+z$ \
  (K2) $forall x >= 0, forall y >= 0 : x dot y >= 0$
]

#definition[
  *Ordnungsvollständigkeit*
  Seien $A, B$ Teilmengen von $RR$, so dass \
  (i) $A != emptyset, B != emptyset$ \
  (ii) $forall a in A$ und $forall b in B$ gilt: $a <= b$ \
  Dann gibt es $c in RR$, so dass $forall a in A : a <= c$ und $forall b in B : c <= b$.
]

#corollary(number: "1.1.6")[
  (1) Eindeutigkeit der additiven und multiplikativen Inverse. \
  (2) $0 dot x = 0 forall x in RR$ \
  (3) $(-1) dot x = -x forall x in RR$, insbesondere $(-1)^2 = 1$ \
  (4) $y >= 0 <=> (-y) <= 0$ \
  (5) $y^2 >= 0 forall y in RR$, insbesondere $1 = 1 dot 1 >= 0$ \
  (6) $x <= y " und " u <= v => x+u <= y+v$ \
  (7) $0 <= x <= y " und " 0 <= u <= v => x dot u <= y dot v$
]

#corollary(number: "1.1.7")[
  *Archimedisches Prinzip*
  Sei $x in RR$ mit $x > 0$ und $y in RR$. Dann gibt es $n in NN$ mit $y <= n dot x$.
]

#theorem(number: "1.1.8")[
  Für jedes $t >= 0, t in RR$ hat die Gleichung $x^2 = t$ eine Lösung in $RR$.
]

#definition(number: "1.1.9")[
  Seien $x, y in RR$: \
  (i) $max\{x, y\} = cases(x & "falls " y <= x, y & "falls " x <= y)$ \
  (ii) $min\{x, y\} = cases(y & "falls " y <= x, x & "falls " x <= y)$ \
  (iii) Der Absolutbetrag einer Zahl $x in RR$: $|x| = max\{x, -x\}$
]

#theorem(number: "1.1.10.")[
  (i) $|x| >= 0 forall x in RR$ \
  (ii) $|x y| = |x||y| forall x,y in RR$ \
  (iii) $|x+y| <= |x| + |y| forall x,y in RR$ \
  (iv) $|x+y| >= ||x| - |y|| forall x,y in RR$.
]

#theorem(number: "1.1.11")[
  *Young'sche Ungleichung*
  $forall epsilon > 0, forall x, y in RR$ gilt:
  $2|x y| <= epsilon x^2 + (1)/(epsilon)y^2.$
]

#definition(number: "1.1.12")[
  Sei $A subset RR$ eine Teilmenge. \
  (i) $c in RR$ ist eine *obere Schranke* von $A$ falls $forall a in A : a <= c$. Die Menge $A$ heisst *nach oben beschränkt*, falls es eine obere Schranke von $A$ gibt. \
  (ii) $c in RR$ ist eine *untere Schranke* von $A$ falls $forall a in A : c <= a$. Die Menge $A$ heisst *nach unten beschränkt*, falls es eine untere Schranke von $A$ gibt. \
  (iii) Ein Element $m in RR$ heisst ein *Maximum* von $A$ falls $m in A$ und $m$ eine obere Schranke von $A$ ist. \
  (iv) Ein Element $m in RR$ heisst ein *Minimum* von $A$ falls $m in A$ und $m$ eine untere Schranke von $A$ ist.
]

#theorem(number: "1.1.15")[
  Sei $A subset RR$, $A != emptyset$.
  (i) Sei $A$ nach oben beschränkt. Dann gibt es eine kleinste obere Schranke von $A$:
  $c := sup A$ (*Supremum*) \
  (ii) Sei $A$ nach unten beschränkt. Dann gibt es eine grösste untere Schranke von $A$:
  $d := inf A$ (*Infimum*)
]

#corollary(number: "1.1.16")[
  Seien $A subset B subset RR$ Teilmengen von $RR$. \
  (1) Falls $B$ nach oben beschränkt ist: $sup A <= sup B$. \
  (2) Falls $B$ nach unten beschränkt ist: $inf B <= inf A$.
]

KONVENTION. Falls $A$ nicht nach oben beschränkt (resp. nicht nach unten beschränkt) ist, definieren wir
$sup A = +infinity " (resp. " inf A = -infinity).$

#definition(number: "1.1.18.")[ *Kardinalität*
  // TODO: maybe remove
  (i) Zwei Mengen $X, Y$ heissen *gleichmächtig*, falls es eine Bijektion $f: X --> Y$ gibt. \
  (ii) Eine Menge $X$ ist *endlich*, falls entweder $X = emptyset$ oder $exists n in NN_0$, so dass $X$ und $\{1,2,3,...,n\}$ gleichmächtig sind.
  Im ersten Fall ist die *Kardinalität* von $X$, $"card " X = 0$ und im zweiten Fall ist $"card " X = n$. \
  (iii) Eine Menge $X$ ist *abzählbar*, falls sie endlich oder gleichmächtig wie $NN$ ist.
]

