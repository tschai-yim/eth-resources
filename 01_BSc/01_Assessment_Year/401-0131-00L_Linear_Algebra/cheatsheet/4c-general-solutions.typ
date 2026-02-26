#import "lib.typ": *

= 4c The General Solution of Ax = b

#definition(number: "4.37")[
  The *solution space* is $"Sol"(A, b) := {x in RR^n : A x = b}$.
]

#theorem(number: "4.38 / 4.39")[
  - *Affine*: If $s$ is sol. ($A s=b$), then $"Sol"(A, b) = { s + x : x in N(A) }$.
  - *Dimension*: If solvable, $dim("Sol"(A, b)) = dim(N(A)) = n - r$.
]

- *Never a subspace* if $b!=0$ (does not contain zero vector).

== Existence & Classification

- *Existence*: Solvable $<=> b in C(A)$.

#theorem(number: "4.40")[
  If $A$ has *full row rank* ($r=m$), then *always solvable*.
]

#theorem(number: "4.41 - 4.44")[ For *typical* $A$ and $b$:
  - *Rank $r < m$*: Typically unsolvable.
  - *Underdetermined* ($m < n$, *Wide*): Typically solvable.
  - *Overdetermined* ($m > n$, *Tall*): Typically unsolvable.
]
