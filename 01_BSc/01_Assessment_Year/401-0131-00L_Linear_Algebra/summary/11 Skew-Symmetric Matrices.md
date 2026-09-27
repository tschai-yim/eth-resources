## Definition & Basic Structure

- **Definition**: Square matrix $A \in \mathbb{R}^{m \times m}$ satisfying $A^\top = -A$ .[^A2.6]
- **Entry-wise Condition**: $a_{ij} = -a_{ji}$.
- **Diagonal Entries**: Must be **zero** ($a_{ii} = 0$) .[^A2.6b]
    - *Derivation*: $a_{ii} = -a_{ii} \implies a_{ii} = 0$.

## Vector Space Properties

- **Subspace**: Set $S_m$ of skew-symmetric matrices forms subspace of $\mathbb{R}^{m \times m}$ .[^A6.3a]
    - Closed under addition/scaling: $(\lambda A + B)^\top = -(\lambda A + B)$.
- **Dimension**: $\dim(S_m) = \frac{m(m-1)}{2}$ .[^A6.3b]
    - *Basis construction*: Determined solely by entries strictly above diagonal.

## Determinant & Rank

- **Odd Dimension**: If $n$ is **odd**, matrix is **singular** ($\det(A) = 0$) .[^A10.6b]
    - *Proof*: $\det(A) = \det(-A^\top) = (-1)^n \det(A)$. If $n$ odd, $\det(A) = -\det(A)$.
- **Even Dimension**: Matrix **can** be invertible ($\det(A) \neq 0$) .[^A10.6c]
    - *Note*: For real $A$, $\det(A) \ge 0$ (square of Pfaffian).
- **Rank Parity**: Rank is **always even**.
    - *Justification*: Non-zero eigenvalues come in conjugate pairs $\pm i\lambda$ (see Spectral Properties). Each pair contributes 2 to rank.
    - *Example*: Rank of $3 \times 3$ skew-symmetric matrix is $\le 2$ .[^A2.6d]

## Spectral Properties & Algebra

- **Quadratic Form**: Vanishes for all real vectors, $x^\top A x = 0$.
    - *Proof*: Scalar equals its transpose; $x^\top A x = (x^\top A x)^\top = x^\top (-A) x = -x^\top A x$.
- **Square of Matrix**:
    - $A^2$ is **symmetric**.
    - $-A^2$ is **Positive Semidefinite (PSD)** .[^A13.1]
    - *Implication*: Eigenvalues of $A^2$ are real and $\le 0$.
- **Eigenvalues**: Purely imaginary or zero ($\lambda \in i\mathbb{R}$).
    - Non-zero eigenvalues occur in pairs $\pm i \lambda$ ($\lambda \in \mathbb{R}$).

[^A2.6]: **Assignment 2, Exercise 6:** "A square matrix $A \in \mathbb{R}^{m \times m}$ is skew-symmetric if and only if $A^\top = -A$."
[^A2.6b]: **Assignment 2, Exercise 6b:** "Let $A = [a_{ij}]$ be skew-symmetric. Show that $a_{ii} = 0$ for all $i \in [m]$."
[^A6.3a]: **Assignment 6, Exercise 3a:** "Show that $S_m$ \[set of skew-symmetric matrices] is a subspace of $\mathbb{R}^{m \times m}$."
[^A6.3b]: **Assignment 6, Exercise 3b:** "What is the dimension of $S_m$?"
[^A10.6b]: **Assignment 10, Exercise 6b:** "Let $A \in \mathbb{R}^{n \times n}$ be skew-symmetric. Show that $\det(A) = 0$ if $n$ is odd."
[^A10.6c]: **Assignment 10, Exercise 6c:** "Let $n$ be even. Show that there exists a skew-symmetric $A \in \mathbb{R}^{n \times n}$ such that $\det(A) \neq 0$."
[^A2.6d]: **Assignment 2, Exercise 6d:** "Let $A \in \mathbb{R}^{3 \times 3}$ be skew-symmetric. Show that $\text{rank}(A) \le 2$."
[^A13.1]: **Assignment 13, Exercise 1:** "Let $S \in \mathbb{R}^{n \times n}$ such that $S^\top = -S$. Prove that $-S^2$ is symmetric and positive semidefinite."
