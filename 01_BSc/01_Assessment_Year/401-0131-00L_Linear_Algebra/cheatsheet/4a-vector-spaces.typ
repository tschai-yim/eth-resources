#import "lib.typ": *

= 4. The Abstract Vector Space

#definition(number: "4.1")[
  $(V, +, dot)$ is a *Vector Space* which $forall$ $u, v, w in V$ and $lambda, mu in RR$:
  1. *Commutativity*: $v+w = w+v$
  2. *Associativity*: $u+(v+w) = (u+v)+w$
  3. *Zero vector*: Exists $0$ s.t. $v+0=v$
  4. *Negative vector*: Exists $-v$ s.t. $v+(-v)=0$
  5. *Identity*: $1 dot v = v$
  6. *Compatibility of multiplications*: $(lambda mu)v = lambda(mu v)$
  7. *Distributivity (+)*: $lambda(v+w) = lambda v + lambda w$
  8. *Distributivity ($RR$)*: $(lambda + mu)v = lambda v + mu v$
]

#lemma(number: "4.6 / 4.7 / 4.10")[
  *Basic Properties*:
  - *Unique Zero*: $V$ contains exactly one zero vector.
  - *Unique Negative*: Every $v$ has exactly one inverse $-v$.
  - *Zero Scaling*: $0 dot v = 0$ (provable, not axiom).
]

#observation(number: "4.2 / 4.5")[
  *$RR^m$* (tuples) and *$RR^(m times n)$* (matrices) are vector spaces.
]

#definition(number: "4.3 / 4.4")[
  *Polynomials $RR[x]$* is a vector space.
  - *Polynomial*: $p = sum_(i=0)^m p_i x^i$ with $p_i in RR$ (*zero polynomial* is $0$).
  - *Degree*: Largest $i$ with $p_i != 0$ (degree of zero poly is $-1$).
]

== Subspaces

#definition(number: "4.8")[
  *Subspace*: Nonempty subset $U subset.eq V$ closed under operations:
  1. *Additivity*: $v, w in U => v+w in U$
  2. *Scaling*: $lambda in RR, v in U => lambda v in U$
]

#lemma(number: "4.9")[
  Subspace *must contain zero*: $0 in U$.
]
#lemma(number: "4.14")[
  $U$ is itself a *vector space* (inherits operations).
]

#lemma(number: "4.11 - 4.13")[
  For $A in RR^(m times n)$, these are *Matrix Subspaces*:
  Column- ($C(A) subset.eq RR^m$), Row- ($R(A) subset.eq RR^n$), Nullspace ($N(A) subset.eq RR^n$)
]

- *Geometric Examples*: Lines or planes *through the origin* in $RR^3$.
- *Polynomials*: Polys up to degree $k$; Polys with no constant term.
- *Matrices*: Symmetric matrices; Matrices with trace 0.

== Linearity

#definition(number: "4.15 / 4.16")[
  #box(inset: (right: -1em))[
    *Linear Comb.*: $sum_(j=1)^n lambda_j v_j in V$ of *finite* set of vectors.
  ]
]

#definition(number: "4.17")[
  *Linear dependent* if some $v in G$ is a lin. comb. of others ($G without {v}$).
  Otherwise *linear independent*.
  - *$"Span"(G)$*: Set of all (finite) linear combinations of $G$.
]

== Basis

#definition(number: "4.18")[
  *Basis*: Subset $B subset.eq V$ is a basis if:\
  $B$ is *linearly independent* and $"Span"(B) = V$.
]

#theorem(number: "4.29")[
  *Unique Representation*: If $B$ is a basis, every $v in V$ has *unique* scalars $lambda_i$:
  $v = sum lambda_i v_i$ (defines coordinate system).
]

#definition(number: "4.21")[
  $V$ is *finitely generated* if finite $G subset.eq V$ has $"Span"(G) = V$.
]

#theorem(number: "4.22")[
  Every finitely generated space $V$ has a finite basis $B subset.eq G$.
]

#lemma(number: "4.23")[
  *Steinitz Exchange Lem.*: For finitely generated space V. \
  If finite independent set $F$ and spanning set $G$ ($"Span"(G) = V$) then:
  1. $|F| <= |G|$
  2. Exist a subset $E subset.eq G$ with $|E| = |G|-|F|$ s.t $"Span"(F union E) = V$
]

#observation(number: "4.19")[
  Any *$m$ independent vectors* from basis of $RR^m$.
]

#lemma(number: "4.20")[
  The *independent columns of $A$* form basis of $C(A)$.
]

- *Finding Basis*: Remove dependent vectors from spanning set.
- *Zero Space*: Basis of ${0}$ is empty set $emptyset$.

== Dimension & Isomorphism

#theorem(number: "4.24")[
  All bases of finitely generated space have *same size*.
]
#definition(number: "4.25")[
  *Dimension*: $"dim"(V) = |B|$ (size of basis).
]

#lemma(number: "4.30")[
  Any set $G$ with $|G| < "dim"(V)$ *cannot span* $V$.
]

- $"dim"(RR^m) = m$ and $"dim"({0}) = 0$.
- *Sum Rule*: $"dim"(U + V) = "dim"(U)+"dim"(V)-"dim"(U inter V )$.

#definition(number: "4.26")[
  *Linear Transf.*: Function $T: V -> W$ preserving structure:
  #align(center)[$T(lambda_1 x_1 + lambda_2 x_2) = lambda_1 T(x_1) + lambda_2 T(x_2)$]
]

#definition(number: "4.27")[
  *Isomorphism*: Bijective linear transformation $T: V -> W$. \
  - $V$ and $W$ are *isomorphic* if such $T$ exists.
]

#lemma(number: "4.28")[ Basis $B$ of V $<=>$ *$T(B)$ basis of W*. $=> "dim"(V) = "dim"(W)$
]
- All *spaces of same dimension* are isomorphic (use basis of both).
