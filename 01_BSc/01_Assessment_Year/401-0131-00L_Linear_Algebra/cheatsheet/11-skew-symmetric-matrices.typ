#import "lib.typ": *

= 11 Skew-Symmetric Matrices

- *Def*: Square matrix $A in RR^(m times m)$ is *skew-symmetric* $<=>$ $A^T = -A$.
- *Entry-wise*: $a_(i j) = -a_(j i)$. (diagonal zero $a_(i i) = 0$ $forall i in [m]$)

== Vector Space Properties
- The set $S_m$ of skew-symmetric matrices is a *subspace* of $RR^(m times m)$.
- *Dimension*: $dim(S_m) = (m(m-1))/2$ (*Basis* by entries *above diagonal*)

== Determinant & Rank

- *Odd Dimension*: If $n$ is *odd*, $A$ is *singular* ($det(A) = 0$).
  - *Proof*: $det(A) = det(-A^T) = (-1)^n det(A^T) = (-1)^n det(A)$.\
    If $n$ odd: $det(A) = -det(A) => det(A)=0$.
- *Even Dimension*: If $n$ is *even*, $A$ *can* be invertible ($det(A) != 0$).
  - *Example*: $A = mat(0, 1; -1, 0)$ has $det(A) = 1$. Build recursive blocks.
- *Rank Parity*: Rank of skew-symmetric matrix is *always even*.
  - *Proof*: Non-zero eigenvalues come in conjugate pairs $lambda = plus.minus i k$.

== Spectral Properties & Algebra

- *Quadratic Form*: Vanishes for all real vectors ($x^T A x = 0$).
  - *Proof*: $x^T A x = (x^T A x)^T = x^T A^T x = -x^T A x$.
- $-A^2$ is *symmetric* and *PSD* $=>$ eigenvalues of $A^2$ are $<= 0$.
  - *Proof Sym.*: $(-A^2)^T = -(A^T A^T) = -(-A)(-A) = -A^2$.
  - *Proof PSD*: $x^T (-A^2) x = x^T A^T A x = (A x)^T (A x) = norm(A x)^2 >= 0$.
- *Eigenvalues of $A$*: Purely *imaginary* or zero ($lambda in i RR$).
  - *Proof*: $A x = lambda x => A^2 x = lambda^2 x$. Since $lambda^2 <= 0 => lambda in i RR$.