#import "@preview/cheq:0.3.0": checklist

#import "lib.typ": *

#show: checklist.with(
  marker-map: (
    "t": text(fill: green)[$checkmark$],
    "f": text(fill: red)[$crossmark$],
  ),
  highlight-map: (
    "f": it => { text(fill: red, it) },
  ),
)

= 12 Multiple Choice

== General & Linear Maps
- [t] $"Tr"(A)$ is linear; $"Tr"(A B) = "Tr"(B A)$.
- [f] $det(A)$, $norm(A)$ are linear.
- [t] $A^k$ is invertible $<=> A$ is invertible (for $k in ZZ$).
- [t] $A^2 = A$ (Idempotent) and $A$ invertible $=> A=I$.
- [t] $(A B)^(-1) = B^(-1) A^(-1)$ (if $A,B$ invertible).
- [t] $(A^T)^(-1) = (A^(-1))^T$.
- [f] $A B A^(-1) = B$ (generally false, unless $A B = B A$).
- [f] $x, y, z$ dependent $=> x in "span"(y, z)$ (could be $y in "span"(z)$).
- [t] $A x = 0$ has non-trivial sol $x eq.not 0 => A$ singular.
- [t] $A in RR^(m times n)$ has $"rank"(A)=m => A x = b$ solvable $forall b$ (Surjective).

== Norms & Dot Products
- [t] $x^T (A^T y) = (A x)^T y$ (Adjoint property).
- [f] $f(x) = norm(A x)$ is a norm (True *only* if $N(A)={0}$).
- [f] $norm(v) <= norm(v+u)$ (Reverse Triangle is $|norm(v)-norm(u)| <= norm(v-u)$).
- *Orthogonal Matrix $Q$* ($Q^T = Q^(-1)$):
  - [t] Preserves dot product ($(Q x)^T (Q y) = x^T y$).
  - [t] Isometry ($norm(Q x)_2 = norm(x)_2$).
  - [t] $Q^T$, $Q^(-1)$, $A B$ (if $A,B$ orth) are orthogonal.
  - [f] $A+B$ is orthogonal (almost always false).

== Vector Spaces
- [t] $S subset V$ and subspace $W  subset V$: $S subset W => "span"(S) subset W$.
- [t] Finite dim Euclidean space ($RR^n$) always has orthonormal basis.
- [t] Any Orthogonal set can be extended to orthonormal basis.
- *Subspaces of $RR^(n times n)$*:
  - [t] Symmetric ${A | A^T = A}$ and Skew-Sym ${A | A^T = -A}$.
  - [t] Commuting ${A | A B = B A}$.
  - [f] Invertible ($"GL"(n)$) or Singular matrices (not closed under $+$).
- [t] $dim("Skew"_(n times n)) = (n(n-1))/2$ (For $n=3$, dim=3).

== Linear Mappings $F: V -> W$
- [t] $F$ inj $=> F("basis")$ is lin. indep.
- [t] $F$ surj $=> F("basis")$ is generating set.
- [t] $F$ iso $<=> F("basis")$ is a basis.
- *Orthogonal Map*:
  - [t] Isomorphism onto its Image.
  - [t] $F^(-1): C(F) -> V$ is orthogonal.
- [f] $v^T F(v) = 0 forall v => F=0$ (False for real matrices, e.g., Rot. $90 degree$).

== Determinant
- [t] $det(A^k) = det(A)^k$ and $det(A^T) = det(A)$.
- [t] $det(P A P) = det(A)$ if $P$ is Permutation ($P^T P = I$).
- [t] $det(P B P^(-1)) = det(B)$ (Similarity invariant).
- [f] $det(c A) = c det(A)$ (True is $det(c A) = c^n det(A)$).
- [f] $det(A + B) = det(A) + det(B)$.
- [f] $det(Q A) = det(A)$ with Q orth. (True is $|det(Q A)| = |det(A)|$).
- [t] $A$ singular $=> A B$ singular
- For $A B = - B A$ ($n times n$):
  - [t] $det(A B) = det(-B A) = (-1)^n det(B A)$.
  - [t] If $n$ is odd, $det(A B) = 0$ (either $A$ or $B$ singular).

== Eigenvalues & Diagonalization
- [t] $v$ is eigenvector $=> c v$ is eigenvector ($forall c eq.not 0$).
- [t] Real Matrix $A$ has eigenvalue $=> infinity$ eigenvectors.
- [t] Distinct $lambda_i =>$ eigenvectors lin. indep $=>$ Diagonalizable.
- [f] Diagonalizable $=>$ distinct $lambda_i$ (e.g., $I$).
- [t] $A "similar" B => lambda_A = lambda_B$ (Same char. poly).
- [f] $A "similar" B => v_A = v_B$ (Eigenvectors change).
- [f] $v_1, v_2$ eigenvectors $=> v_1+v_2$ eigenvectors (True only if $lambda_1 = lambda_2$).
- [t] Rotation in $RR^3$ always has $lambda=1$ (Axis).

== QR Decompositions

- [t] $A$ cols lin. indep $=> A=Q R$ unique (with diag($R$)>0).
- [t] $A$ cols lin. indep $=> "rank"(R) = n$ (Full rank).
- [t] $A = Q_1 R_1 = Q_2 R_2 => Q_1^T Q_2$ is diagonal matrix.

== Systems & Subspaces

- [t] *Dimension Formula*: $dim(N(A)) + dim(C(A)) = n$.
- [t] $A x=0$ only trivial sol $=> dim(N(A))=0, "rank"(A)=n$.
- [t] $C(A) = C(A A^T)$ and $N(A) = N(A^T A)$.
- [t] $C(A) = C(2 A)$ and $N(A) = N(2 A)$.
- [f] $C(A) = C(A^2)$ (generally false).
- [f] $N(A) = N(A^T)$ (generally false).