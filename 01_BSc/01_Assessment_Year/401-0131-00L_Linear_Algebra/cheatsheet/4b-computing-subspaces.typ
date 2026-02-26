#import "lib.typ": *

= 4b Computing Matrix Subspaces

- *Fundamental Subspaces* defined as Column-, Row-, and Nullspace.
- Use *Gauss-Jordan* to compute RREF $R$.

#align(center)[
  $A = mat(1, 2, 0, 3; 2, 4, 1, 4; 3, 6, 2, 5) arrow.r^("RREF") R = mat(1, 2, 0, 3; 0, 0, 1, -2; 0, 0, 0, 0)$
]

#theorem(number: "4.31")[
  *Pivot columns* of *original matrix* $A$ form basis for *$C(A)$*.
  $=>$ $dim(C(A)) = "rank"(A) = r$.
]
- *Example* (using $R$ above): Basis is: ${ (1, 2, 3)^T, (0, 1, 2)^T }$.

#theorem(number: "4.32")[
  *First $r$ rows* (non-zero rows) of $R$ form a basis for *$R(A)$*.\
  $=>$ $dim(R(A)) = "rank"(A) = r$.
]

- *Example* (using $R$ above): Basis is ${ (1, 2, 0, 3)^T, (0, 0, 1, -2)^T }$.

#theorem(number: "4.33 / 4.34")[
  For any $A$: $"rank"(A) = "rank"(A^T)$ and $r <= min(m, n)$
]

== Nullspace N(A)

#lemma(number: "4.35")[
  *Nullspace Isomorphism*: $N(A)$ is isomorphic to $RR^(n-r)$.
  1. Map $T: N(R) -> RR^(n-r)$ sends $x$ to vector of its *free variables*.
  2. $dim(N(A)) = n - r$ (number of free variables).
]

- *Invariant*: $N(A) = N(R)$.
- *Free Variables*: Correspond to non-pivot columns.

#theorem(number: "4.36")[
  A basis for *$N(A)$* consists of $n-r$ *special solutions*:
  - For each free variable $k$, set $x_k = 1$ and other free vars to $0$.
  - Solve for dependent variables.
]

- *Example* (using $R$ above): ($x_1, x_3$ dependent; $x_2, x_4$ free).
  - Equations: $x_1 = -2x_2 - 3x_4$ and $x_3 = 2x_4$.
  - *Special Sol 1* ($x_2=1, x_4=0$): $v_1 = (-2, 1, 0, 0)^T$.
  - *Special Sol 2* ($x_2=0, x_4=1$): $v_2 = (-3, 0, 2, 1)^T$.

