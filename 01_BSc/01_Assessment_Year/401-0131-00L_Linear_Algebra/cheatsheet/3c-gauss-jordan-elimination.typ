#import "lib.typ": *

= 3 Gauss-Jordan Elimination

- Transform $A$ into unique *Reduced Row Echelon Form* (RREF).
- *Operations*: Subtraction, Exchange, *Division* (create pivot $1$).

#definition(number: "3.13")[
  $R$ is in *RREF* if exist col. indices $1 <= j_1 < dots < j_r <= n$ s.t.:
  1. $forall i in [r]$ column $j_i$ is *standard unit vector* $e_i$
  2. Entries $(R)_(i j)$ "below staircase" are $0$ ($i > r$ OR $i <= r, j < j_i$).
]

- *Notation*: $"RREF"(j_1, ..., j_r)$ (matrix with $r$ pivots).
- *Identity* $I_m$ is $"RREF"(1, ..., m)$; *Zero matrix* is $"RREF"()$.

#lemma(number: "3.14")[
  $"RREF"(j_1, ..., j_r)$ has *indep. col.* $j_1, dots, j_r$ and  *rank* $r$.
]

== The Gauss-Jordan Algorithm

- *Process*: Transform augmented $(A|b)$ to $(R|c)$ column by column.
  1. *Normalize Pivot*: Divide row by pivot value (pivot becomes $1$).
  2. *Eliminate*: Row subtraction to zero *above and below* pivot.
  3. *Skip*: If column cannot form pivot (all $0$ below), skip it.
- *Direct Solution* ($R x = c$): Set $x_(j_i) = c_i$ (pivot vars), set others to $0$.
  - *No solution* if $c_i != 0$ for any zero-row $i$ in $R$.

#theorem(number: "3.16")[
  *Elimination Runtime*: For $m$ systems $A x = b_j$ ($n$ vars): Gauss-Jordan returns equivalent $R x = c_j$ in $O(m^2(m+n))$.
]

#theorem(number: "3.15")[
  *Direct Sol. Runtime*: Solving $R x = c$ takes $O(m+n)$.
]

== Theoretical Results & Applications

#theorem(number: "3.17")[
  $(A|I)$ to $(R|M) => M$ is *invertible*, $R = M A$,  $R$ is RREF
]

#theorem(number: "3.18")[
  *CR-Decomposition*: Every $A$ has a *unique* RREF $R$.
  - Indices $j_1 dots j_r$ are the *independent columns* of $A$ (form $C$).
  - $R$ contains $R'$ (top $r$ rows) from *CR decomposition* $A=C R'$.
]

#theorem(number: "3.19")[
  $(A|I)$ to $(R|M)$: $A$ is *invertible* $<=> R=I$ (then $M = A^(-1)$)
]

#theorem(number: "3.20")[
  *Solving Ax=b Strategy*: Efficient for multiple $b$'s:
  1. *Preprocess*: Run on $(A|I)$ to get $(R|M)$. Cost: $O(m^2(m+n))$.
  2. *Solve*: Compute $c = M b$, then solve $R x = c$. Cost: $O(m^2+n)$.
]