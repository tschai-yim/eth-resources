#import "lib.typ": *

= 9c Singular Value Decomposition

#definition(number: "9.3.1 / 9.3.3")[
  Every matrix $A in RR^(m times n)$ has an *SVD*: $A = U Sigma V^T$
  - $U in RR^(m times m)$: Orthogonal ($U^T U = I$). Col. $u_i$ *Left Singular Vectors*.
  - $V in RR^(n times n)$: Orthogonal ($V^T V = I$). Col. $v_i$ *Right Singular Vectors*.
  - $Sigma in RR^(m times n)$: Rectangular diagonal matrix. Entries $sigma_i$ (*Singular Values*) are non-negative and ordered: $sigma_1 >= dots >= sigma_min >= 0$.
]

- *Identities*: $A V = U Sigma$ and $A v_i = sigma_i u_i$

// - Transformation is *Rotation* ($V^T$) $->$ *Stretch* ($Sigma$) $->$ *Rotation* ($U$).

#observation(number: "9.3.2")[
  *Compact SVD*: Efficient form for rank $r$: $A = U_r Sigma_r V_r^T$
  - *$"rank"(A)$* is the number of *non-zero* singular values ($sigma_r > 0$).
  - $U_r in RR^(m times r)$ (first $r$ cols), $V_r in RR^(n times r)$ (first $r$ cols).
  - $Sigma_r in RR^(r times r)$ (diagonal, strictly positive).
]

- *Storage*: Compact form stores $r(m+n+1)$ entries (vs $m n$ for full).
- *Compact $->$ Full*: *$Sigma$*: Pad with zeros. *$U$* / *$V$*: Extend to orthonormal basis (e.g. Gram-Schmidt).

== Construction & Relations

- *From any $A$ (General)*: 1. Eigendecomp $bold(A^T A) ->$ sorted $lambda_i, v_i$.
  2. *Right site*: $V = [v_1, ..., v_n]$. *Singular Values*: $sigma_i = sqrt(lambda_i)$.
  3. *Left side* (*only* $i <= r$): $U_r = A V_r Sigma_r^(-1)$ or $u_i = 1/sigma_i A v_i$.
  4. *Extend*: If $m > r$, fill rest of $U$ via Gram-Schmidt (spans $N(A^T)$).
- *From Spectral Decomposition* (Symmetric $A = Q Lambda Q^T$):
  1. *$Sigma$*: $sigma_i = |lambda_i|$ (absolute values). 2. *$V$*: $v_i = q_i$ (orig. eigenvectors).
  3. *$U$*: $u_i = "sgn"(lambda_i) v_i$ (flip sign if $lambda_i < 0$). 4. *Sort* cols and diag by $sigma_i$.
- *Rel.*: *$V$*: Eigvecs of $A^T A$ *$U$*: Eigvecs of $A A^T$ *$Sigma$*: $sigma_i = sqrt(lambda_i)$ of either.

== Subspaces & Inverses

- *Column Space* $C(A)$: Span of first $r$ cols of $U$ ($u_1 dots u_r$).
- *Left Nullspace* $N(A^T)$: Span of last $m-r$ cols of $U$.
- *Row Space* $C(A^T)$: Span of first $r$ cols of $V$ ($v_1 dots v_r$).
- *Nullspace* $N(A)$: Span of last $n-r$ cols of $V$.
- *Pseudoinverse*: $A^dagger = V Sigma^dagger U^T$. *$Sigma^dagger$*: Transpose $Sigma$, invert entries ($1/sigma_i$).

== Applications

#lemma(number: "9.3.4")[
  *Rank-$r$ Decomposition*: Any matrix of rank $r$ is the sum of $r$ outer products:
  $A = sum_(k=1)^r sigma_k u_k v_k^T$
]

- *Low-Rank Approximation*: Truncate sum at $k < r$ (keep largest $sigma$)
