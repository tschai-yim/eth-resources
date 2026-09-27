## Geometric Intuition, Axioms & Definition

- **Geometric Meaning**: Factor by which linear transformation inflates space (area in $\mathbb{R}^2$, volume in $\mathbb{R}^3$).
    - **Sign**: Indicates orientation (negative = reversed/flipped).
- **General Formula (Leibniz)**:
    - Sum over all $n!$ permutations: [^def7.2.3] $$\det(A) = \sum_{\sigma \in \Pi_n} \operatorname{sgn}(\sigma) \prod_{i=1}^n A_{i, \sigma(i)}$$
    - $n=3$: 6 terms (Rule of Sarrus).
- **Axiomatic Properties**: Determinant is the unique function satisfying:
    1. **Normalization**: $\det(I) = 1$.
    2. **Alternating**: $\det(A) = 0$ with two identical columns (implies linear dependence).
    3. **Multilinear**: Linear in each column (or row) .[^prop7.3.7]
- **Symmetry**: Rows and columns treated equally; $\det(A) = \det(A^T)$ .[^thm7.2.5]
- **The $2 \times 2$ Case**:
    - For $A = \begin{bmatrix} a & c \\ b & d \end{bmatrix}$, $\det(A) = ad - bc$ .[^def7.1.1]
    - Derivable directly from axioms/general formula.

## Permutations

- **Permutation ($\sigma$)**: Bijective mapping $\sigma : \{1, \dots, n\} \to \{1, \dots, n\}$.
    - $\Pi_n$: Set of all permutations of $n$ elements.
- **Sign of a Permutation ($\operatorname{sgn}(\sigma)$)**:
    - Defined by parity of **inversions** (pairs $(i, j)$ where $i < j$ but $\sigma(i) > \sigma(j)$) .[^def7.2.1]
    - $\operatorname{sgn}(\sigma) = 1$ (even number of inversions) or $-1$ (odd).
- **Swaps**: A transposition (swapping two elements) always flips permutation sign.

## Fundamental Properties & Operations

- **Multiplicativity**:
    - $\det(AB) = \det(A)\det(B)$ .[^thm7.2.6]
    - Explicit calculation proof for $2 \times 2$ .[^lem7.1.2]
    - **Tip**: $\det(SDS^{-1}) = \det(S)\det(D)\det(S^{-1}) = \det(D)$ (similarity transformations).
- **Invertibility Check**:
    - $A$ invertible $\iff \det(A) \neq 0$ .[^lem7.1.3][^thm7.2.6]
    - **Singular**: Linearly dependent columns/rows $\implies \det(A) = 0$.
- **Inverse**:
    - If invertible: $\det(A^{-1}) = \frac{1}{\det(A)}$ .[^thm7.2.6]
- **Row/Column Operations**:
    - **Swapping rows/columns**: Multiplies determinant by $-1$ .[^prop7.3.6]
    - **Linearity**: Linear in each row individually .[^prop7.3.7]
        - $\det(\dots, \alpha r_i + \beta r'_i, \dots) = \alpha \det(\dots, r_i, \dots) + \beta \det(\dots, r'_i, \dots)$.

## Special Matrix Classes

- **Triangular Matrices** (Upper/Lower):
    - $\det(T) = \prod_{k=1}^n T_{kk}$ (Product of diagonal entries) .[^prop7.2.4]
    - **Logic**: Only identity permutation avoids picking zeros.
- **Orthogonal Matrices ($Q$)**:
    - $Q^T Q = I \implies \det(Q)^2 = 1$.
    - $\det(Q) = 1$ (rotation) or $-1$ (reflection) .[^prop7.2.4]
- **Permutation Matrices ($P$)**:
    - $\det(P) = \operatorname{sgn}(\sigma)$ .[^prop7.2.4]
    - Corresponds to number of row swaps to reach $I$.

## Cofactors & Applications

- **Cofactors ($C_{ij}$)**:
    - $C_{ij} = (-1)^{i+j} \det(\mathscr{A}_{ij})$ ($\mathscr{A}_{ij}$ = submatrix without row $i$, col $j$) .[^def7.3.1]
- **Laplace Expansion**:
    - Expansion along any row $i$ (or col): $\det(A) = \sum_{j=1}^n A_{ij} C_{ij}$ .[^prop7.3.2]
    - **Tip**: Minimize calculation by choosing row/column with most zeros.
- **Formula for Inverse**:
    - $A^{-1} = \frac{1}{\det(A)} C^T$ ($C$ = matrix of cofactors) .[^prop7.3.3]
    - **Note**: Theoretically elegant ($AC^T = \det(A)I$), computationally expensive.
- **Cramer's Rule**:
    - Solution to $Ax = b$: $x_j = \frac{\det(\mathscr{B}_j)}{\det(A)}$ ($\mathscr{B}_j$ = col $j$ replaced by $b$) .[^prop7.3.5]
    - Useful for proofs (e.g., integer solutions), inefficient for solving.

## Efficient Calculation

- **Direct Formula**: $n!$ terms $\implies$ infeasible for large $n$.
- **Gaussian Elimination** (Primary Method):
    - Transform $A$ to upper triangular $U$ via row operations.
    - Track swaps ($P$): Each swap multiplies determinant by $-1$.
    - $\det(A) = (-1)^{\#\text{swaps}} \cdot \prod U_{ii}$ (product of diagonals).
- **Laplace Expansion**:
    - Recursive calculation method .[^prop7.3.2]
    - Viable for sparse matrices (many zeros); generally slower than Gaussian elimination for dense matrices.

[^def7.2.3]: **Definition 7.2.3.** Given a square matrix $A \in \mathbb{R}^{n \times n}$ the determinant $\det(A)$ is defined as $\det(A) = \sum_{\sigma \in \Pi_n} \operatorname{sgn}(\sigma) \prod_{i=1}^n A_{i, \sigma(i)}$, where $\Pi_n$ is the set of all permutations of $n$ elements.
[^prop7.3.7]: **Proposition 7.3.7.** The determinant is linear in each row (or each column). In other words, for any $a_0, a_1, a_2 \dots, a_n \in \mathbb{R}^n$ and $\alpha_0, \alpha_1 \in \mathbb{R}$ we have $\left| \begin{matrix} \rule[2.5pt]{10pt}{0.5pt} & \alpha_0 a_0^T + \alpha_1 a_1^T & \rule[2.5pt]{10pt}{0.5pt} \\ \rule[2.5pt]{10pt}{0.5pt} & a_2^T & \rule[2.5pt]{10pt}{0.5pt} \\ & \vdots & \\ \rule[2.5pt]{10pt}{0.5pt} & a_n^T & \rule[2.5pt]{10pt}{0.5pt} \end{matrix} \right| = \alpha_0 \left| \begin{matrix} \rule[2.5pt]{10pt}{0.5pt} & a_0^T & \rule[2.5pt]{10pt}{0.5pt} \\ \rule[2.5pt]{10pt}{0.5pt} & a_2^T & \rule[2.5pt]{10pt}{0.5pt} \\ & \vdots & \\ \rule[2.5pt]{10pt}{0.5pt} & a_n^T & \rule[2.5pt]{10pt}{0.5pt} \end{matrix} \right| + \alpha_1 \left| \begin{matrix} \rule[2.5pt]{10pt}{0.5pt} & a_1^T & \rule[2.5pt]{10pt}{0.5pt} \\ \rule[2.5pt]{10pt}{0.5pt} & a_2^T & \rule[2.5pt]{10pt}{0.5pt} \\ & \vdots & \\ \rule[2.5pt]{10pt}{0.5pt} & a_n^T & \rule[2.5pt]{10pt}{0.5pt} \end{matrix} \right|$, and $\left| \begin{matrix} \rule[-4pt]{0.5pt}{10pt} & & \rule[-4pt]{0.5pt}{10pt} \\ \alpha_0 a_0 + \alpha_1 a_1 & \cdots & a_n \\ \rule[-4pt]{0.5pt}{10pt} & & \rule[-4pt]{0.5pt}{10pt} \end{matrix} \right| = \alpha_0 \left| \begin{matrix} \rule[-4pt]{0.5pt}{10pt} & & \rule[-4pt]{0.5pt}{10pt} \\ a_0 & \cdots & a_n \\ \rule[-4pt]{0.5pt}{10pt} & & \rule[-4pt]{0.5pt}{10pt} \end{matrix} \right| + \alpha_1 \left| \begin{matrix} \rule[-4pt]{0.5pt}{10pt} & & \rule[-4pt]{0.5pt}{10pt} \\ a_1 & \cdots & a_n \\ \rule[-4pt]{0.5pt}{10pt} & & \rule[-4pt]{0.5pt}{10pt} \end{matrix} \right|$.

	---

[^thm7.2.5]: **Theorem 7.2.5.** Given a matrix $A \in \mathbb{R}^{n \times n}$, then $\det(A^T) = \det(A)$.
[^def7.1.1]: **Definition 7.1.1.** Let $A = \begin{bmatrix} a & c \\ b & d \end{bmatrix}$. The determinant of $A$ is $\det(A) = ad - bc$.
[^def7.2.1]: **Definition 7.2.1 (Sign of a permutation).** Given a permutation $\sigma : \{1, \dots, n\} \to \{1, \dots, n\}$ of $n$ elements, its sign $\operatorname{sgn}(\sigma)$ can be 1 or $-1$. The sign counts the parity of the number of pairs of elements that are out of order (sometimes called inversions) after applying the permutation. In other words, $\operatorname{sgn}(\sigma) = \begin{cases} 1 & \text{if } |\{(i, j) \in \{1, \dots, n\} \times \{1, \dots, n\} \text{ such that } i < j \text{ and } \sigma(i) > \sigma(j)\}| \text{ is even}, \\ -1 & \text{if } |\{(i, j) \in \{1, \dots, n\} \times \{1, \dots, n\} \text{ such that } i < j \text{ and } \sigma(i) > \sigma(j)\}| \text{ is odd}. \end{cases}$
[^thm7.2.6]: **Theorem 7.2.6.** $\bullet$ A matrix $A \in \mathbb{R}^{n \times n}$ is invertible if and only if $\det(A) \neq 0$. $\bullet$ Given matrices $A, B \in \mathbb{R}^{n \times n}$ we have $\det(AB) = \det(A)\det(B)$. $\bullet$ Given a matrix $A \in \mathbb{R}^{n \times n}$ such that $\det(A) \neq 0$, then $A$ is invertible and $\det(A^{-1}) = \frac{1}{\det(A)}$.
[^lem7.1.2]: **Lemma 7.1.2.** Let $A, W \in \mathbb{R}^{2 \times 2}$. Then $\det(AW) = \det(A)\det(W)$.
[^lem7.1.3]: **Lemma 7.1.3.** A matrix $A \in \mathbb{R}^{2 \times 2}$ is invertible if and only if $\det(A) \neq 0$.
[^prop7.3.6]: **Proposition 7.3.6.** If $A$ is an $n \times n$ matrix and $P$ is a permutation that swaps two elements, meaning that $PA$ corresponds to swapping two rows of $A$ then $\det(PA) = -\det(A)$.
[^prop7.2.4]: **Proposition 7.2.4.** (a) Given a permutation matrix $P \in \mathbb{R}^{n \times n}$ corresponding to a permutation $\sigma$, then $\det(P) = \operatorname{sgn}(\sigma)$. We sometimes also write $\operatorname{sgn}(P)$. (b) Given a triangular (either upper- or lower-) matrix $T \in \mathbb{R}^{n \times n}$ we have $\det(T) = \prod_{k=1}^n T_{kk}$, in particular, $\det(I) = 1$. (c) If $Q \in \mathbb{R}^{n \times n}$ is an orthogonal matrix then $\det(Q) = 1$ or $\det(Q) = -1$.
[^def7.3.1]: **Definition 7.3.1.** Given $A \in \mathbb{R}^{n \times n}$, for each $1 \leq i, j \leq n$ let $\mathscr{A}_{ij}$ denote the $(n-1) \times (n-1)$ matrix obtained by removing row $i$ and column $j$ from $A$. Then we define the co-factors of $A$ as $C_{ij} = (-1)^{i+j} \det(\mathscr{A}_{ij})$.
[^prop7.3.2]: **Proposition 7.3.2.** Let $A \in \mathbb{R}^{n \times n}$, for any $1 \leq i \leq n$, $\det(A) = \sum_{j=1}^n A_{ij} C_{ij}$.
[^prop7.3.3]: **Proposition 7.3.3.** Given $A \in \mathbb{R}^{n \times n}$ with $\det(A) \neq 0$ we have $A^{-1} = \frac{1}{\det(A)} C^T$, where $C$ is the $n \times n$ matrix with the co-factors of $A$ as entries.
[^prop7.3.5]: **Proposition 7.3.5 (Cramer's Rule).** Let $A \in \mathbb{R}^{n \times n}$ such that $\det(A) \neq 0$ and $b \in \mathbb{R}^n$ then the solution $x \in \mathbb{R}^n$ of $Ax = b$ is given by $x_j = \frac{\det(\mathscr{B}_j)}{\det(A)}$, where $\mathscr{B}_j$ is the matrix obtained by $A$ by replacing the $j$-th column of $A$ with the vector $b$.
