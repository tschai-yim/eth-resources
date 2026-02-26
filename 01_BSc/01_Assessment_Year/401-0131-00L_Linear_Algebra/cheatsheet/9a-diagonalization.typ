#import "lib.typ": *

= 9a Diagonalization

#definition(number: "9.1.2")[
  *Diagonalizable Matrix*: $A in RR^(n times n)$ is diagonalizable \
  $<=> exists$ invertible $V$ s.t. $V^(-1) A V = Lambda$ (diagonal).
]

#theorem(number: "9.1.1")[
  *Eigendecomposition*: $A$ has eigenvectors $v_1, dots, v_n$ forming a basis of $RR^n <=> A = V Lambda V^(-1)$.
  - $V = mat(v_1, dots, v_n)$ (columns are eigenvectors).
  - $Lambda$: Diagonal matrix with $Lambda_(i i) = lambda_i$ (associated eigenvalues).
]

- Represents linear transformation as *scaling* in the *eigenbasis*.

== Conditions for Diagonalizability

#definition(number: "9.1.10")[
  For eigvalue $lambda$ of $A$, the *geometric multiplicity* is the dimension of the eigenspace: $dim(N(A - lambda I))$.
]

- *Algebraic Mult.*: Mult. of root $lambda$ in char. polynomial $det(A - lambda I)$.

#definition(number: "9.1.3")[
  $A$ has *complete set of real eigvecs.* if they form $RR^n$ *basis*.
]

#lemma(number: "9.1.11")[
  *Criterion*: $A$ has a complete set (is diagonalizable) $<=>$ \
  #box(inset:(right:-1em))[All eigenval are *real* and all *Geom. Multiplicity = Alg. Multiplicity*.]
]

- If $A$ has $n$ *distinct* real eigval $=>$ diagonalizable (eigvecs. lin. indep.).

== Matrix Classes & Examples

- *Diagonal Matrices*: eigvalues $D_(i i)$; eigvectors. $e_1, dots, e_n$ form basis

#proposition(number: "9.1.6")[
  *Projection Mat.* $P$ on space $U$ *always diagonalizable*.
  *Eigvals*: $0$, $1$ *Basis*: Union of basis for $U$ ($lambda=1$) and $U^perp$ ($lambda=0$).
]

- *Nilpotent Matrix* ($A^k=0$): Only diagonalizable if $A=bold(0)$.

== Similarity Transformations

#definition(number: "9.1.7")[
  $A, B$ are *similar* if $exists$ invertible $S$ s.t. $B = S^(-1) A S$.
]

#proposition(number: "9.1.8")[
  If $A$ and $B$ are similar => *same eigvals* (same char. poly)
  - $A$ has complete set (diagonalizable) $<=>$ $B$ does.
]

- *Eigenvectors*: Not identical; transform via $S$ ($v_B = S^(-1) v_A$).