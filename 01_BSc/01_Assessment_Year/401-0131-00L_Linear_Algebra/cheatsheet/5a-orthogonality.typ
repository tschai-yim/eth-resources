#import "lib.typ": *

= 5a Orthogonality

#definition(number: "5.1.1")[
  $v, w in RR^n$ are *orthogonal* ($perp$) $<=> v^T w = 0$.
  - $V, W$ *orthogonal* $<=> forall v in V, w in W: v perp w$.
]

#lemma(number: "5.1.2")[
  Spaces $V perp W$ (*bases ${v_i}, {w_j}$*) $<=>$ $v_i perp w_j$ for all $i, j$.
]

#lemma(number: "5.1.3 / 5.1.4")[
  If $V perp W$:
  - Union of bases is *linearly independent*
  - $V inter W = {0}$ (Intersection is zero vector).
  - $dim(V+W) = dim(V) + dim(W) <= n$.
]

== The Orthogonal Complement

#definition(number: "5.1.5")[
  *Orthogonal Complement* $V^perp$ is set of all vectors orth. to *every* vector in $V$:
  $V^perp = {x in RR^n mid(|) v^T x = 0 quad forall v in V}$
]

- $V^perp$ is a subspace.

#lemma(number: "5.1.8")[
  $(V^perp)^perp = V$.
]

#theorem(number: "5.1.6 / 5.1.9")[
  *Compute Complement*: For matrix $A in RR^(m times n)$:
  $N(A) = C(A^T)^perp = R(A)^perp$ and $R(A) = C(A^T) = N(A)^perp$.
]

#theorem(number: "5.1.7")[
  *Decomposition*: For *orthogonal* subspaces $V, W subset RR^n$:\
  $W = V^perp <=> dim(V) + dim(W) = n <=>$ \
  Every $u in RR^n$ has *unique* decomp $u = v+w$ ($v in V, w in W$).
]

#lemma(number: "5.1.10")[
  $N(A) = N(A^T A)$ and $C(A^T) = C(A^T A)$.
]

