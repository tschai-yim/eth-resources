#import "lib.typ": *

= 2d Matrix Invertibility

#definition(number: "2.48")[
  Let $f: X -> Y$ be a function.
  - *Injective*: Every $y in Y$ has *at most one* pre-image $x in X$.
  - *Surjective*: Every $y in Y$ has *at least one* pre-image $x in X$.
  - *Bijective*: Both injective and surjective (exactly one pre-image).
  - *Inverse*: If bijective, $f^(-1): Y -> X$ maps $y |-> x "where" f(x)=y$.
]

#lemma(number: "2.49")[
  If $f$ is bijective $=>$  $f^(-1)$ is also bijective and $(f^(-1))^(-1) = f$
  - *Cancellation*: $f^(-1) compose f = id_X$ and $f compose f^(-1) = id_Y$.
]

== Invertibility and Inverse Matrices

- *Bijective* transformation $<=>$ *Invertible* matrix $=>$ matrix *square*.

#lemma(number: "2.50")[
  *Wide Mat.*: If $A in RR^(m times n)$ with $m < n$, $T_A$ is *not injective*.
]
#lemma(number: "2.51")[
  *Tall Mat.*: If $A in RR^(m times n)$ with $m > n$, $T_A$ is *not surjective*.
]

#lemma(number: "2.52")[
  If linear transf. $T$ is bijective, $T^(-1)$ is also a *linear transf.*.
]

#definition(number: "2.53 / 2.55 / 2.57")[
  For $A in RR^(m times m)$:
  A is *invertible* $<=>$ \
  $exists B$ s.t. $B A = I$ $<=>$ $T_A$ is *bijective* $<=>$ Columns of $A$ are *lin. indep.*.
  - *Inverse*: The *unique* $B = A^(-1)$.
  - *Singular*: $A$ is not invertible.
]


== Properties and Formulas


#lemma(number: "2.54 / 2.56")[
  *Commutativity*: $A^(-1) A = A A^(-1)= I$
]

#observation(number: "2.58")[
  If $A$ is invertible, $A^(-1)$ is invertible and $(A^(-1))^(-1) = A$.
]

#lemma(number: "2.59")[
  If $A, B$ invertible, $A B$ is invertible and $(A B)^(-1) = B^(-1) A^(-1)$..
]

#lemma(number: "2.60")[
  If $A$ invertible, $A^T$ is invertible and $(A^T)^(-1) = (A^(-1))^T$.
]

- $[a]^(-1) = [1/a] "iff" a != 0$.
#v(1pt)
- $A = mat(a, b; c, d) => A^(-1) = 1/(a d - b c) mat(d, -b; -c, a) "iff" det(A) != 0$.