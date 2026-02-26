#import "lib.typ": *

= 9b Symmetric Matrices


#lemma(number: "9.2.8 / 9.2.9")[
  Let $A in RR^(n times n)$ be *symmetric* ($A = A^T$).
  - *Only real Eigenvalues*: All $lambda in RR$. At least one eigvalue exists.
]

#lemma(number: "9.2.4 / 9.2.5 / 9.2.7")[
  For symmetric $A$:
  - Eigvecs to *distinct* eigvals ($lambda_1 != lambda_2$) are *orthogonal* ($v_1 perp v_2$).
  - *Alg. mult. = Geom. mult.* for all eigvals. (always *complete set*)
  - *$"rank"(A)$* = the number of *non-zero eigenvalues* (with repetitions).
]

== Spectral Theorem & Eigendecomposition

#theorem(number: "9.2.1")[
  *Spectral Theorem*: Any symmetric matrix $A$ has $n$ real eigenvalues and an *orthonormal basis* of $RR^n$ of eigenvectors.
]

#corollary(number: "9.2.2 / 9.2.3")[
  *Eigendecomposition*: Symmetric $A$ is diagonalizable by an *orthogonal matrix* $V$ ($V^T = V^(-1)$):
  $A = V Lambda V^T$
  - $Lambda$: Eigvalues on diagonal. $V$: Columns are orthonormal eigenvectors.
]

#proposition(number: "9.2.6")[
  $A$ is a weighted sum of *rank-1 projections* onto eigenspaces:
  $A = sum_(i=1)^n lambda_i v_i v_i^T$
]

- Transformation is Rotation ($V^T$) $->$ Scaling ($Lambda$) $->$ Rotation back ($V$).

== Positive Definite (PD) & Semidefinite (PSD)

#proposition(number: "9.2.10")[
  For sym. $A$ and $x != 0$ *Rayleigh Quotient*: $R(x) = (x^T A x) / (x^T x)$ \
  $R(x)$ is *bounded* by eigenvalues of $A$: $lambda_min <= R(x) <= lambda_max$
]

#definition(number: "9.2.11 / 9.2.12")[
  For sym. $A$ with eigenvalues $lambda_1, dots, lambda_n$:
  - *Positive Semidefinite (PSD)*: All $lambda_i >= 0 <=> x^T A x >= 0$ ($forall x$).
  - *Positive Definite (PD)*: All $lambda_i > 0 <=> x^T A x > 0$ ($forall x != 0$).
]

- *Diagonal Dominance*: If $|A_(i i)| > sum_(j != i) |A_(i j)|$ is often PD/PSD.
- *Sum*: PSD + PSD = PSD; PD + PSD = PD; PD + PD = PD.
  - *Proof*: $x^T (A+B) x = x^T A x + x^T B x >= 0$ or $> 0$.
- *Product* (not symmetric): PSD $times$ PD = $lambda_i >= 0$; PD $times$ PD = $lambda_i > 0$.
  - *Proof* ($A$ *PD*, $A=R R^T$): $A B$ similar to $C = R^(-1) A B R = R^T B R$.
    $x^T C x = x^T R^T B R x = (R x)^T B (R x) = y^T B y >= 0$ or $>0$
- *Inverse*: *PD* always invertible ($0$ not eigval). *PSD* may be singular.

== Gram Matrices & Cholesky

#definition(number: "9.2.13")[
  *Gram Matrix* of vecs $v_1, dots, v_n$ (cols of $V$) is $G = V^T V$.
  - Entries are inner products: $G_(i j) = v_i^T v_j$.
]
#observation(number: "9.2.14")[
  Abuse of not.: $A A^T = sum a_i a_i^T$ also called  Gram matrix.
]
#proposition(number: "9.2.15")[
  For any $A in RR^(m times n)$: $A^T A$ ($n times n$) and $A A^T$ ($m times m$) \
  are *symmetric* and *PSD* and share *same non-zero eigenvalues*.
]

#proposition(number: "9.2.16")[
  *Cholesky Decomposition*:
  Every symmetric *PSD* is Gram matrix $M=C^T C$ where $C$ is *upper triangular*.
]

*Construction*: 1. Diagonalize $M = V Lambda V^T$
2. quare root eigenvalues: $Lambda^(1/2)$. 3. Form $C = (Lambda^(1/2) V)(Lambda^(1/2) V)^T$
4. Apply QR decomp to $(Lambda^(1/2) V)^T => M = (Q R)^T (Q R) = bold(R^T R)$

