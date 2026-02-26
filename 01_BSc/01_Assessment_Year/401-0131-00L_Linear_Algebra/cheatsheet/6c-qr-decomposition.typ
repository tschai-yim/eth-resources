#import "lib.typ": *

= 6c Orthonormal Bases

#definition(number: "6.3.1")[
  *Orthonormal Vectors* $q_1, dots, q_n$ have length $1$ and are pairwise orthogonal:
  $q_i^T q_j = delta_(i j)$
]

#definition(number: "6.3.3")[
  *Orth. Matrix*: Square $Q in RR^(n times n)$ with orthonormal col. \
  $<=> Q^T Q = I (= Q Q^T)$. Inverse is $Q^(-1) = Q^T$.
]

#proposition(number: "6.3.6")[
  *Preserves* norm and angle: \
  #align(center)[$norm(Q x) = norm(x)$ and $(Q x)^T (Q y) = x^T y$]
]

- *Examples*: Rotation matrices $R_theta = mat(cos theta, -sin theta; sin theta, cos theta)$

#proposition(number: "6.3.7 / 6.3.12")[
  If cols of $Q$ are orthonormal basis for subspace $S$:
  - *Projection Matrix* onto $S$: $P = Q Q^T$.
  - *Least Squares* solution to $A x = b$: $R hat(x) = Q^T b$.
]

== Gram-Schmidt & QR Decomposition

#algorithm(number: "6.3.8 / 6.3.9")[
  *Gram-Schmidt*: Convert independent $a_1, dots, a_n$ into orthonormal $q_1, dots, q_n$.
  1. *Orthogonalize*: $q'_k = a_k - sum_(i=1)^(k-1) (a_k^T q_i) q_i$ (rem. proj. onto prev. $q_i$)
  2. *Normalize*: $q_k = q'_k / norm(q'_k)$.
  *Result*: $"Span"(a_1 dots a_k) = "Span"(q_1 dots q_k)$ at every step.
]

#definition(number: "6.3.10 / 6.3.11")[
  *QR Decomp.* For $A in RR^(m times n)$ *full rank*, $A = Q R$:
  - $Q in RR^(m times n)$: Orthonormal columns (from Gram-Schmidt).
  - $R in RR^(n times n)$: *Upper triangular* and *invertible* ($R = Q^T A$).
]
