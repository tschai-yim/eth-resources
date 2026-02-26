#import "lib.typ": *

= 3c Eigenvalues and Eigenvectors

== Complex Numbers Foundation

- *Definition*: $CC = {a+i b : a,b in RR}$ where $i^2 = -1$.
  - *Parts*: $Re(z) = a$, $Im(z) = b$
  - *Modulus*: $|z| = sqrt(a^2+b^2)$  *Conjugate*: $overline(a+i b) = a-i b$.
- *Division*: Expand by conjugate $z/w = (z macron(w))/(|w|^2) = ((a x+b y)+i(b x-a y))/(x^2+y^2)$.
- *Polar Form*: $z = r e^(i theta)$ ($r=|z|$, $theta$ is argument).

#remark(number: "8.1.1")[
  *Euler's Formula*: $e^(i theta) = cos theta + i sin theta$ and $e^(i pi) = -1$.
]

#theorem(number: "8.1.2 / 8.1.3")[
  *Fund. Thr. of Algebra*:
  $CC$ is *algebraically closed*. Any degree $n >= 1$ polynomial $P(z)$ has $n$ roots $lambda_1, dots, lambda_n in CC$:
  $ P(z) = alpha_n (z-lambda_1)dots(z-lambda_n) $
  *Algebraic Multiplicity*: Number of times $lambda$ appears as a root.
]

=== Complex Vectors and Matrices

- *Conjugate Transpose* (Hermitian): $A^H = (macron(A))^T$ ($(A^H)_(i j) = macron(A_(j i))$).
  - Properties: $(A B)^H = B^H A^H$ and $(A^H)^H = A$.
- *Hermitian Matrix*: $A = A^H$ (Complex analog to Symmetric).
  - Diagonal entries must be real ($A_(i i) in RR$).
- *Unitary Matrix*: $U$ is Unitary if $U^H U = I <=> U^(-1) = U^H$.
  - Analog to Orthogonal. Columns form *orthonormal* basis for $CC^n$.
- *Complex Inner Product*:
  $chevron.l u, v chevron.r = u^H v = sum_(i=1)^n macron(u_i) v_i$
  (*not* commut.)
- *Complex Norm*: $||v|| = sqrt(chevron.l v\, v chevron.r) = sqrt(|v_1|^2 + dots + |v_n|^2)$.

== Eigenvalues and Eigenvectors

#definition(number: "8.2.1")[
  For $A in RR^(n times n)$, $lambda in CC$ is an *eigenvalue* and $v in CC^n without {0}$ is an *eigenvector* if
  $A v = lambda v$. $(lambda, v)$ is an *eigen-pair*.
]

- *Real $lambda$*: Scaling, *Complex $lambda$*: Rotation + Scaling.

#lemma(number: "8.2.3")[
  *Real Eigenvalues*
  - $lambda in RR$ is an eigenvalue $<=> det(A - lambda I) = 0$.
  - $v in RR^n without {0}$ is eigenvector $<=> v in N(A - lambda I)$.
]

#proposition(number: "8.2.4")[
  *Characteristic Polynomial*: $P(lambda) = det(A - lambda I)$ is a polynomial of degree $n$ with leading coefficient $(-1)^n$.
]

#theorem(number: "8.2.5")[
  *Existence*: Every $A in RR^(n times n)$ has at least one eigenvalue.
]

#lemma(number: "8.2.8")[
  *Conjugate Pairs*: If $(lambda, v)$ is an eigenpair of real matrix $A$, then $(macron(lambda), macron(v))$ is also an eigenpair.
]

== Properties and Relations

#definition(number: "8.3.4")[
  The *trace* is the sum of the diagonal: $"Tr"(A) = sum_(i=1)^n A_(i i)$.
]

#lemma(number: "8.3.7")[
  *Cyclic Trace*: $"Tr"(A B C) = "Tr"(B C A) = "Tr"(C A B)$.
]

#lemma(number: "8.3.6")[
  *Magic Connections*: For eigenvalues $lambda_1, dots, lambda_n$ of $A$:
  *Determinant*: $det(A) = product_(i=1)^n lambda_i$ and *Trace*: $"Tr"(A) = sum_(i=1)^n lambda_i$
]

#lemma(number: "8.3.5")[
  *Transpose*: $A$ and $A^T$ have the *same eigenvalues*.
]

#proposition(number: "8.3.1")[
  If $(lambda, v)$ is an eigenpair of $A$:
  - *Powers*: $(lambda^k, v)$ is eigenpair of $A^k$ ($k >= 1$).
  - *Inverse*: $(1/lambda, v)$ is eigenpair of $A^(-1)$ (if invertible).
]

- If $mu$ is eigenvalue of $A^k$, then some $root(k, mu) in CC$ is eigenvalue of $A$.

=== Special Matrix Classes

#proposition(number: "8.2.7")[
  *Orthogonal*: If $Q$ is orthogonal, all eigvals $lambda in CC$:  $|lambda| = 1$.
]

- *Rotation*: $A = mat(0, -1; 1, 0)$ ($90 degree$ rot) has $lambda = plus.minus i$ (pure imaginary).
- For $mat(A, B; 0, D)$, eigenvalues are union of eigenvalues of $A$ and $D$.

=== Linear Independence

#lemma(number: "8.3.2")[
  Eigenvectors to *distinct* eigenvalues are *lin. indep.*.
]

#theorem(number: "8.3.3")[
  If $A$ has $n$ *distinct real* eigval. $=>$ Eigvectors basis for $RR^n$.
]

== Applications

=== Fibonacci Numbers

*Fibonacci Recurrence*: $F_(n+1) = F_n + F_(n-1)$ as system $g_n = M g_(n-1)$
with $M = mat(1, 1; 1, 0)$ and $g_0 = (1, 0)^T$.

1. *Find Eigenpairs*: $phi_i, v_i$ (in this case $phi_0 = (1+sqrt(5))/2$ the Golden Ratio).
2. *Decompose* start $g_0$ into eigenbasis: $g_0 = c_1 v_1 + c_2 v_2$.
3. *Apply powers*: $g_n = M^n g_0 = c_1 lambda_1^n v_1 + c_2 lambda_2^n v_2$.
4. Extract $F_n$ from $g_n$ for *closed form*.

=== Stability & Power Method

- For large $n$, $A^n x$ is *dominated* by largest $|lambda_max|$.
- All $|lambda| < 1 =>$ *Decay* (converges to $0$).
- Any $|lambda| > 1 =>$ *Growth* (diverges).
