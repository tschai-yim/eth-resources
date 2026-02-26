#import "lib.typ": *

= 6d Pseudoinverse $A^dagger$

== Case 1: Full Column Rank ($"rank"(A) = n$)

 *Overdetermined* systems ($m >= n$). $A^dagger b$ is *Least Squares* solution.

#definition(number: "6.4.1")[
  For $A in RR^(m times n)$ with $"rank"(A) = n$:
  $A^dagger = (A^T A)^(-1) A^T$
]

#lemma(number: "6.4.2")[
  *Left Inverse*: If $"rank"(A) = n$, then $A^dagger A = I$.
]


== Case 2: Full Row Rank ($"rank"(A) = m$)

*Underdetermined* systems ($m <= n$).

#definition(number: "6.4.3")[
  For $A in RR^(m times n)$ with $"rank"(A) = m$:
  $A^dagger = A^T (A A^T)^(-1)$
]

#lemma(number: "6.4.4")[
  *Right Inverse*: If $"rank"(A) = m$, then $A A^dagger = I$.
]

#lemma(number: "6.4.5 / 6.4.6")[
  *Min Norm Sol.*: For $b in C(A)$, the *unique* sol. to
  $min norm(x)^2 "s.t." A x = b$
  is $hat(x) = A^dagger b$. Strictly in the *Row Space* $C(A^T)$.
]

== Case 3: General Rank ($"rank"(A) = r$)

#definition(number: "6.4.7")[
  *CR Decomposition*: Given $A = C R$ ($C$ full col rank, $R$ full row rank):
  $A^dagger = R^dagger C^dagger$ (order *reversed*)
]

#lemma(number: "6.4.9")[
  *General Factorization*: For any $A=S T$ ($S$ full col rank, $T$ full row rank):
  $A^dagger = T^dagger S^dagger$
]

#lemma(number: "6.4.8")[
  *Optimization Meaning*: The unique solution to $min_x norm(x)^2 "s.t." A^T A x = A^T b$ is $hat(x) = A^dagger b$. \
  Minimizes $norm(x)^2$ among all Least Squares solutions.
]

== Properties

- Always minimizes error $norm(A x - b)^2$ and then $norm(x)^2$.
- *Left Action* ($b in RR^m$): $A^dagger b$ solves $A x approx b$.
- *Right Action* ($v^T in (RR^n)^*$): $v^T A^dagger$ solves $x^T A approx v^T$.

#theorem(number: "6.4.10")[
  $A A^dagger A = A$ and $A^dagger A A^dagger = A^dagger$ and $(A^T)^dagger = (A^dagger)^T$
  - $A A^dagger$ is symmetric and projects onto *Column Space* $C(A)$
  - $A^dagger A$  is symmetric and projects onto *Row Space* $C(A^T)$
]
