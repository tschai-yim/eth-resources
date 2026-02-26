#import "lib.typ": *

= 2c Matrix Multiplication

// TODO: move to function definitions
#definition(number: "2.33")[
  *Function Composition*: $f compose g: X -> Z, x |-> f(g(x))$.
]

== Matrix Multiplication Concepts

For $A in RR^(a times n)$ and $B in RR^(n times b)$

#lemma(number: "2.34 / 2.35 / 2.37")[
  *Matrix Composition*: For linear $T_A$ and $T_B$:
  1. The composition $T_A compose T_B$ is a matrix transformation.
  2. It corresponds to the *unique* matrix product: $T_A compose T_B = T_(A B)$.
]

#lemma(number: "2.36")[
  *Column Notation*: $A B := [A b_(dot 1), dots, A b_(dot b)]$ (B's columns)
]

#observation(number: "2.45")[
  *Row Notation*: $A B = mat(a_(1 dot)^T B; dots.v; a_(a dot)^T B)$ (A's rows)
]

#observation(number: "2.38 / 2.39")[
  *Entry-wise*: $(A B)_(i j) = a_(i dot) dot b_(dot j) = sum_(l=1)^n a_(i l)b_(l j)$
]

#lemma(number: "2.40 / 2.41 / 2.42")[
  *Properties*:
  - *Neutrality*: $I A = A$ and $A I = A$.
  - *Distrib.*: $A(B+C) = A B+A C$ and $(A+B)C = A C+B C$.
  - *Associativity*: $(A B)C = A(B C)$.
  - *Transpose*: $(A B)^T = B^T A^T$. (reverses order)
]

== Mixed Multiplications ("The Zoo")

- *Unifying View*: Vectors are $m times 1$, Covectors are $1 times n$ matrices.

#definition(number: "2.43")[
  *Covector-Matrix*: $y^T A = (y^T v_1 quad dots quad y^T v_n) in (RR^n)^*$
]

#definition(number: "2.44")[
  *Outer Product*: For $v in RR^m, w in RR^n$: $v w^T = [v_i w_j]_(i, j)$
]

== CR-Decomposition

#theorem(number: "2.46")[
  Let $A in RR^(m times n)$ have *rank $r$*. Unique decomp. $A = C R'$:
  - $C in RR^(m times r)$: Contains the $r$ *independent columns* of $A$.
  - $R' in RR^(r times n)$: Unique coefficients to express $A$'s columns via $C$.
]

#box(inset:(right: -1em))[- *Compression* (only low rank): store $(m+n)r$ entries instead of $m n$.]

