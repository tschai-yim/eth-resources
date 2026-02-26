#import "lib.typ": *

= 6b Geometry of Solutions

#lemma(number: "6.2.1")[
  *Injectivity $C(A^T)$*
  For $x, y in C(A^T)$: $A x = A y <=> x = y$.
]

#theorem(number: "6.2.2 / 6.2.3")[
  If system $A x = b$ is *solvable*,
  there exists a *unique $x_1 in C(A^T)$* s.t. $A x_1 = b$.
  And $S = x_1 + N(A)$ is the general sol.
]

- *Min-Norm*: $x_1$ has the *shortest length* (closest to origin) of all sol.

#theorem(number: "6.2.4")[
  *Unsolvable Certificate*: Exactly one set is non-empty.
  1. *Solvable*: $P = {x in RR^n : A x = b} != emptyset$.
  2. *Unsolvable*: $D = {z in RR^m : A^T z = 0, b^T z = 1} != emptyset$.
]

- *Geometric Intuition*: $b in.not C(A) => z perp C(A)$ and $z cancel(perp) b$ ($z in D$)
  