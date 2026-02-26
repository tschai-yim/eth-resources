#import "lib.typ": *

= 7 Determinant

- *Geometry*: Factor by which linear transf. inflates space. (*Sign* = flip)
#definition(number: "(lecture)")[
  *Axioms*: Unique function satisfying:
  1. *Normalization*: $det(I) = 1$.
  2. *Alternating*: Two identical cols. $=> det(A) = 0$ (implies lin. dep.).
  3. *Multilinear*: Linear in each col./row individually (see Prop 7.3.7).
]

#definition(number: "7.1.1")[
  *2x2 Determinant*: For $A = mat(a, c; b, d)$, $det(A) = a d - b c$.
]

#definition(number: "7.2.3")[
  *Leibniz Formula*: For $A in RR^(n times n)$, sum over all permuts. $Pi_n$
  $ det(A) = sum_(sigma in Pi_n) "sgn"(sigma) product_(i=1)^n A_(i, sigma(i)) $
]
- *Sarrus Rule*: $n!$ terms derived from general formula.


#theorem(number: "7.2.5")[
  *Symmetry*: $det(A^T) = det(A)$. (equal over rows).
]

#proposition(number: "7.3.7")[
  *Linearity*: Det. is linear in each row (or col):
  $ det(dots, alpha a + beta b, dots) = alpha det(dots, a, dots) + beta det(dots, b, dots) $
]

== Permutations

- #box(inset: (right: -1em))[*Permutation* ($sigma in Pi_n$): Bijective mapping $sigma : {1, dots, n} -> {1, dots, n}$]
- *Swaps*: Transposition (swapping 2 elements) flips sign.

#definition(number: "7.2.1")[
  *Inversions*: $S_I = {(i, j) : 1 <= i < j <= n "and" sigma(i) > sigma(j)}$
  *Sign*: Parity of *inversions*. $"sgn"(sigma) = 1$ if |S_I| is even else $-1$.
]

== Fundamental Properties & Operations

- *Similarity*: $det(S D S^(-1)) = det(D)$.

#theorem(number: "7.1.2 / 7.1.3 / 7.2.6")[
  *Multiplicativity & Invertibility*:
  - $det(A B) = det(A)det(B)$.
  - $A$ is *invertible* $<=> det(A) != 0$.
  - If invertible: $det(A^(-1)) = 1 / det(A)$.
]

#proposition(number: "7.3.6")[
  *Swaps*: If $P$ swaps two rows/cols, $det(P A) = -det(A)$.
]

#proposition(number: "7.2.4")[
  *Special Matrix Classes*
  1. *Permutation ($P$)*: $det(P) = "sgn"(sigma)$ (based on swap count).
  2. *Triangular ($T$)*: $det(T) = product_(k=1)^n T_(k k)$ (product of diagonals).
  3. *Orthogonal ($Q$)*: $Q^T Q = I => det(Q) in {1, -1}$.
]

== Cofactors & Applications

#definition(number: "7.3.1")[
  *Cofactor*: $C_(i j) = (-1)^(i+j) det(scr(A)_(i j))$
  ($scr(A)_(i j)$ is w/o row $i$, col $j$).
]

#proposition(number: "7.3.2")[
  *Laplace Expansion* row (or col) $i$: $det(A) = sum_(j=1)^n A_(i j) C_(i j)$
]

#proposition(number: "7.3.3")[
  *Inverse* (if exists): $A^(-1) = 1 / det(A) C^T$ ($C$ is cofactor matrix).
]

#proposition(number: "7.3.5")[
  *Cramer's Rule*: Solution to $A x = b$:
  $x_j = det(scr(B)_j) / det(A)$\
  $scr(B)_j$ is $A$ with col $j$ replaced by $b$.
]

== Efficient Calculation

- *Gaussian Elimination*:
  1. Transform $A ->$ upper triangular $U$ (track swaps $k$)
  2. $det(A) = (-1)^k dot product_(i=1)^n U_(i i)$.
- *Laplace Expansion*: Recursive. Good for *sparse* matrices.
