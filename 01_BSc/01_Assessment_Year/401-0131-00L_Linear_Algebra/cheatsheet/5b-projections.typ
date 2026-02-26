#import "lib.typ": *

= 5b Projections

#definition(number: "5.2.1")[
  *Projection* of $b$ onto subspace $S$ is the closest point $p in S$:
  #align(center)[$p = "proj"_S (b) = arg min_(p in S) norm(b - p)$]
]

- *Error vector* $e = b-p$ is orthogonal to $S$ ($e in S^perp$).
- *Goal*: Best approx. solution for unsolvable $A x = b$.

#lemma(number: "5.2.2")[
  *1D Projection* of $b$ onto line $"Span"(a)$: $p = (a a^T) / (a^T a) b$
]

- Orthogonality condition from error $A^T (b-p) = 0$ leads to:

#lemma(number: "5.2.3")[
  *General Projection* is $p = A hat(x)$ such that:
  #align(center)[$A^T A hat(x) = A^T b$ #h(0.5em) (Normal Equation)]
]

#lemma(number: "5.2.4")[
  $A^T A$ is *invertible* $<=>$ columns of $A$ are *linearly indep.*.
]

#theorem(number: "5.2.5")[
  Projection $p = P b$ uses matrix:
  $P = A (A^T A)^(-1) A^T$
]

#observation(number: "5.2.6")[
  *Idempotent*: $P^2 = P$ (Projecting twice = once).
  - *Result*: If $v in S => P v = v$; If $v in S^perp => P v = 0$.
  - *Complement*: $I - P$ is the projection matrix onto $S^perp$.
]