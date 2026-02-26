#import "lib.typ": *

= 3b Gauss Elimination

Transform *square* $A x = b$ into equivalent *upper triangular* $U x = c$.

1. *Elimination Procedure*
  - For $j in [m-1]$ use pivot $u_(j j)$ to *eliminate entries below*.
  - *Zero Pivot*: Swap with lower row having non-zero entry.
    - *Failure*: Pivot is $0$ and all below are $0$ $=>$ $A$ is *singular*.
2. *Back Substitution*: Solve $U x = c$ from bottom up ($x_m -> x_1$).
  - *Requirement*: Pivots must be *non-zero*.


== Row Operations & Properties

Row ops. $O_i$ like left-multip. by *invertible matrix* $M = O_1...O_q$.

#lemma(number: "3.2 - 3.6")[
  *Invariant Properties* (under invertible $M$):
  - Systems $A x = b$ and $M A x = M b$ have the *same solutions*.
  - *Nullspace*: $N(A) = N(M A)$.
  - *Independence*: $A$ cols. are indep. $<=> M A$ cols. are indep.
  - *Row Space*: $R(A) = R(M A)$.
  - *Rank*: $A$ and $M A$ have same rank.
]

- *NOT Invariant*: *Column Space* ($C(A) != C(M A)$ usually).

== Success, Failure & Runtime

#theorem(number: "3.7")[
  For square $A$, equivalent statements:
  Gauss el. *succeeds* $<=>$ \
  $A$ columns are *linearly independent* $<=>$
  $A$ is *invertible*.
]

#theorem(number: "3.8")[
   Cols *indep.* $=>$ Unique solution; Cols *dependent* $=>$ Fails.
]

#theorem(number: "3.9 - 3.12")[
  *Runtime* ($m$ variables):
  - *Elimination*: $O(m^3)$; *Back Substitution*: $O(m^2)$.
  - *Inverse / Multiple RHS*: $O(m^3)$.
]

- *Faster*: Strassen $O(m^2.81)$ exists but rarely used (big constant).