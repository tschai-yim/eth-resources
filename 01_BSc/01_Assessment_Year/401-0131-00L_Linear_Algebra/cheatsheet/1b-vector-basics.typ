#import "lib.typ": *

= 1b Vector Basics
== Vector Definition

#definition(number: "1.1")[
  Let $m in NN$. An *m-dimensional coordinate vector* is element of $RR^m$.\
  - Written as *column vector*: $v = vec(v_1, dots.v, v_m)$.
  - *Zero vector* ($bold(0)$): All coordinates 0.
  - *Zero-dimension*: $RR^0 = {()}$ only contains empty tuple.
]

== Vector Addition

#definition(number: "1.2")[
  Let $v, w in RR^m$. The sum is:
  $v+w := vec(v_1+w_1, dots.v, v_m+w_m) in RR^m$
]


- *Geometric View*: Combines movement of $bold(v)$ and $bold(w)$.
- *Associative*: $(u+v)+w = u+(v+w)$.
- *Commutative*: $v+w = w+v$.


== Scalar Multiplication


#definition(number: "1.3")[
  Let $v in RR^m$ and $lambda in RR$. The scalar multiple is
  $lambda v := vec(lambda v_1, dots.v, lambda v_m)$.
]

- *Geometric View*: Scales length by factor $|lambda|$ (neg. *flips* direction).

== Scalar Product

#definition(number: "1.9")[
  Let $v, w in RR^m$. The scalar product is:
  $v dot w := sum_(i=1)^m v_i w_i$
]

#observation(number: "1.10")[
  Let $u, v, w in RR^m, lambda in RR$.
  1. *Symmetry*: $v dot w = w dot v$
  2. *Linearity*: $(lambda v) dot w = lambda(v dot w) = v dot (lambda w)$
  3. *Distributivity*: $u dot (v+w) = u dot v + u dot w$
  4. *Positive-definiteness*: $v dot v >= 0$, equality iff $v=0$.
]

== Transpose

#definition(number: "1.20")[
  The *covector* (transpose of $v$) $v^T in (RR^m)^*$ is the function \
  $v^T: RR^m -> RR, x |-> sum_(i=1)^m v_i x_i$.\
  Written as *row vector*: $v^T = (v_1 dots v_m)$ and reversable $(v^T)^T := v$.
]


#definition(number: "1.19")[
  Covector-vector *multiplication*: $v^T w = v dot w$
]

== Length (Euclidean Norm)


#definition(number: "1.11")[
  For $v in RR^m$, the *Euclidean norm* is: $norm(v) := sqrt(v dot v)$
]

- Generalizes *Pythagorean theorem* (measures length).
- *Unit vector*: $norm(u)=1$. In $RR^2$, lies on *unit circle*.
- *Normalize*: Create unit vector via $u = v / norm(v)$ (for $v != 0$).
- *Std. unit vectors* ($e_i$): $1$ at element $i$, $0$ elsewhere. Points along coordinate axes.


== Angles & Orthogonality

#definition(number: "1.14")[
  For nonzero $v, w in RR^m$, the *angle* is unique $alpha in [0, pi]$ where
  $ cos(alpha) = (v dot w) / (norm(v) norm(w)) in [-1, 1] $
]

- Valid range $[-1, 1]$ guaranteed by *Cauchy-Schwarz*.

#definition(number: "1.15")[
  For $v, w in RR^m$ are *orthogonal* if $v dot w = 0$.
]

- *Orthogonal*: Nonzero vectors Angle is $90 degree$ ($cos = 0$).
- *Zero vector* is orthogonal to everything.

#definition(number: "1.16")[
  Let $d != 0$. A *hyperplane* through origin contains all vectors orthogonal to $d$:
  $H_d = { v in RR^m : v dot d = 0 }$
]

== Fundamental Inequalities

#lemma(number: "1.12")[
  *(Cauchy-Schwarz)*
  Let $v, w in RR^m$ then $abs(v dot w) <= norm(v) norm(w)$.
  Equality iff one vector is scalar multiple of the other.
]

#lemma(number: "1.17")[
  *(Triangle ineq.)*
  Let $v, w in RR^m$ then $norm(v+w) <= norm(v) + norm(w)$.
]
