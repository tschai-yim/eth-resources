#import "lib.typ": *

= 2a Matrix Basics
== Matrix Definition

#definition(number: "2.1")[
  An *$m times n$ matrix* $A in RR^(m times n)$ has $m$ rows and $n$ columns.
  - *Entry-wise*: $A => a_(i j)$ (row $i$, column $j$).
  - *Dot-free*: $A = [a_(i j)]_(i=1,j=1)^(m,n)$.
  - *Column Notation*: $A = mat(v_1, dots, v_n)$ with $v_i in RR^m$.
  - *Row Notation*: $A = mat(u_1^T; dots.v; u_m^T)$ with $u_i^T in (RR^n)^*$.
]

#definition(number: "2.2")[
  Let $A, B in RR^(m times n), lambda in RR$.
  - *Addition*: $A + B := [a_(i j) + b_(i j)]_(i=1,j=1)^(m,n)$ (element-wise).
  - *Scalar Mult*: $lambda A := [lambda a_(i j)]_(i=1,j=1)^(m,n)$ (element-wise).
  - *Zero Matrix*: $0$ contains all zeros.
]

#definition(number: "2.12")[
  #box(inset: (right: -1em))[
    // a^T is abuse of notation for element of transpose
    The *transpose* of $A in RR^(m times n)$ is $A^T in RR^(n times m)$ where $a^T_(i j) = a_(j i).$
  ]
]

#observation(number: "2.13")[ *Double Transpose*: $(A^T)^T = A$ ]

== Special Matrix Types

- *Shapes*: tall ($m > n$; $<$ rows), wide ($m < n$; $<$ col.), square ($m=n$)

#definition(number: "2.3")[
  For $A in RR^(m times m)$:
  1. *Identity ($I$)*: Diagonal entries $1$, off-diagonal $0$. Defined by *Kronecker delta* $delta_(i j)$ ($1$ if $i=j$, else $0$).
  2. *Diagonal*: Off-diagonal entries are $0$ ($a_(i j) = 0$ for $i != j$).
  3. *Upper triangular*: Entries below diagonal are $0$ ($a_(i j)=0$ for $i > j$).
  4. *Lower triangular*: Entries above diagonal are $0$ ($a_(i j)=0$ for $i < j$).
  5. *Symmetric*: $a_(i j) = a_(j i)$ for all $i,j$.
]

== Subspaces

#definition(number: "2.9")[
  The *column space* $C(A)$ is the span of the columns:
  #align(center)[$C(A) := {A x : x in RR^n} subset.eq RR^m$]
]

#definition(number: "2.14")[
  The *row space* is the transpose:
  $R(A) := C(A^T) subset.eq RR^n$
]

#definition(number: "2.17")[
  The *nullspace* is the set of inputs mapped to zero:
  #align(center)[$N(A) = {x in RR^n : A x = 0} subset.eq RR^n$]
]

// - *Intuition*: Nullspace represents "redundancy" among columns.
- *Independence*: $N(A) = {0} <=>$ columns of $A$ are lin. independent.

== Rank

#definition(number: "2.10")[
  Let $A = mat(v_1, dots, v_n)$.
  - *Independent Column*: $v_j$ is *not* a linear combination of *preceding* columns ($v_1, dots, v_(j-1)$).
    Same for *rows* via transpose. // Part of definition 2.14
  - *Rank*: $"rank"(A)$ is the number of independent columns.
]

- *Full Rank*: $"rank"(A)=n <=>$ all columns independent.
- *Zero Rank*: $"rank"(A)=0 <=> A$ is zero matrix.
- *Rank Matches*: Column rank $=$ Row rank.

#lemma(number: "2.11")[
  The *indep. col.* span the column space: $C(A) = C(C_"indep")$
]

#lemma(number: "2.15")[
  $"rank"(A) = 1 <=>$ Non-zero $A$ is outer product of two vectors $v in RR^m, w in RR^n$:
  $A = v w^T quad ("entries" v_i w_j)$
]

// TODO: check if this is the case
// Shown more generally later
/* #corollary(number: "2.16")[
  If $"rank"(A) = 1$, then $"rank"(A^T) = 1$.
] */
