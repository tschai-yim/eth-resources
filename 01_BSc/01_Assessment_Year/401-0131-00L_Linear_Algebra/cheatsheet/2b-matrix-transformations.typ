#import "lib.typ": *

= 2b Matrix Transformations
== Matrix-Vector Multiplication

#definition(number: "2.4")[
  Let $A = mat(v_1, dots, v_n)$ and $x in RR^T$:
  $A x := sum_(j=1)^n x_j v_j in RR^m$\
  $A x$ is the *linear combination* of $A$'s columns.
]

#observation(number: "2.8")[
  *Row Notation*: Let $A$ have rows $u_1^T, dots, u_m^T$: $A x = vec(u_1^T x, dots.v, u_m^T x)$\
  The $i$-th entry is the *scalar product* of the $i$-th row and $x$.
]

#observation(number: "2.6")[
  *Table Notation*: The entries are $(A x)_i = sum_(j=1)^n a_(i j) x_j$.
]

#observation(number: "2.5")[
  *Implications*:
  1. $b$ is a *linear comb.* of columns of $A <=> A x = b$ has a solution.
  2. $A$ is *full rank* $<=> A x = 0$ has only the trivial solution $x = 0$.
]

#corollary(number: "2.7")[
  *Identity*: $I x = x$ for all $x in RR^m$.
]

== Matrices as Linear Transformations

#definition(number: "2.18")[
  The *matrix transf.* is the function $T_A: RR^n -> RR^m, x |-> A x$.
]

#lemma(number: "2.19")[
  *Linearity*:
  $A(lambda_1 x_1 + lambda_2 x_2) = lambda_1 A x_1 + lambda_2 A x_2$.
]

#observation(number: "2.22")[ Every matrix transformation is a linear transformation. ]
#theorem(number: "2.26")[
  Every linear transformation corresponds to a *unique matrix*
  $A = mat(T(e_1), T(e_2), dots, T(e_n))$
]

=== General Linear Transformations

#definition(number: "2.21")[
  Func. $T$ is *linear* if: $T(lambda_1 x_1 + lambda_2 x_2) = lambda_1 T(x_1) + lambda_2 T(x_2)$
  (*Functional* if maps to $RR$, *Transformation* if maps to $RR^m$).
]

#lemma(number: "2.23")[
  $T$ is linear $<=>$ for all vectors $x, x'$ and scalars $lambda$:
  1. *Additivity*: $T(x + x') = T(x) + T(x')$
  2. *Homogeneity*: $T(lambda x) = lambda T(x)$
]

#lemma(number: "2.24 / 2.25")[ $T$ linear $=>$ $T(0) = 0$ and $T(sum lambda_j x_j) = sum lambda_j T(x_j)$ ]

== Kernel and Image

Generalizations of Nullspace and Column Space to linear transforms.

#definition(number: "2.27")[
  *Image*: $"Im"(T) := {T(x) : x in RR^n}$ (All possible outputs).
  *Kernel*: $"Ker"(T) := {x in RR^n : T(x) = 0}$ (Inputs mapped to zero).
]

#observation(number: "2.28 / 2.29")[
  *Relation*: $"Im"(T) = C(A)$ and $"Ker"(T) = N(A)$.
]
