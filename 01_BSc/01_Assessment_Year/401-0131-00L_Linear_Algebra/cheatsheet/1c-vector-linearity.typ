#import "lib.typ": *

= 1c Vector Linearity
== Linear Combinations

#definition(number: "1.4")[
  If $v_1, dots, v_n in RR^m$ and $lambda_1, dots, lambda_n in RR$, then $sum_(i=1)^n lambda_i v_i$ is a *linear combination*.
]

#definition(number: "1.7")[
  A linear combination $sum lambda_i v_i$ is:
  1. *Affine*: if $sum lambda_i = 1$.
  2. *Conic*: if $forall j, lambda_j >= 0$.
  3. *Convex*: if both affine and conic ($sum lambda_i = 1$ and $lambda_j >= 0$).
]

#image("media/1 Special Linear Combinations.png")

=== Spanning $RR^2$ Prove

// Not useful but included for completeness
/* #lemma(number: "1.5")[
  *(Fact)* Every vector in $RR^2$ is a linear combination of $v = vec(2, 3)$ and $w = vec(3, -1)$.
] */

- *Strategy*: Given specific $v, w in RR^2$ solve for $lambda, mu$ in\ $u = lambda v + mu w$ where $u in RR^2$ is arbitrary.
- *Row Picture*: Equations are lines in $lambda mu$-plane. Solution is *intersection*. Non-parallel lines $->$ unique intersection.
- *Column Picture*: $v, w$ form *skewed coordinate system*. Target $u$ is diagonal of *parallelogram* formed by $lambda v, mu w$.

== Linear (In)dependence

#definition(number: "1.21")[
  Vectors $v_1, dots, v_n$ are *linearly dependent* if at least one is a linear combination of others:
  $exists k in [n], lambda_j$ such that $v_k = sum_(j != k) lambda_j v_j$. \
  Otherwise, they are *linearly independent*.
]

#lemma(number: "1.22 / 1.23")[
  Let $v_1, dots, v_n in RR^m$.
  - *Dependent* $<=>$ *Non-trivial* comb. of zero exists (some $lambda_j != 0$ where $sum lambda_j v_j = 0$) $<=>$ One vector is lin. comb. of *previous* ones.
  - *Independent* $<=>$ Only *trivial* comb. of zero exists ($sum lambda_j v_j = 0 =>$ all $lambda_j = 0$) $<=>$ None is lin. comb. of *previous* ones.
]

#lemma(number: "1.24")[
  If $v_1, dots, v_n in RR^m$ are *linearly independent*, any linear combination $v in RR^m$ has *unique* coefficients.
]

- *Dependent*: has *zero vector* ($0$) or length $n > m$ (in $RR^m$).
- *Independent*: *Empty* sequence.

== Span of Vectors

#definition(number: "1.25")[
  The *span* is the set of *all* possible linear combinations:
  #align(center)[$"Span"(v_1, dots, v_n) := { sum_(j=1)^n lambda_j v_j : lambda_j in RR }$]
]

- 1 *non-zero* vector: *Line* through origin.
- 2 *non-collinear* vectors: *Plane* through origin.
- Empty sequence: *Point* ${0}$.

#lemma(number: "1.26 / 1.27")[
  *Adding* a lin. comb. of existing vectors or *removing* a lin. comb. of others *does not change* the Span.
]

#lemma(number: "1.28")[
  $m$ *linearly independent* vectors in $RR^m$ span the entire space: $"Span"(v_1, dots, v_m) = RR^m$
]