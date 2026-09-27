## Solving Linear Equations Ax = b

- **System of linear equations**: $m$ equations, $n$ variables; find values for variables satisfying all equations.[^3.1]
- **Standard Form**: Variables ($x_1, ..., x_n$) left, constants ($b_1, ..., b_m$) right.
    - Example:
        $x_1 - 2x_2 = 0$
        $x_1 - x_3 = 3$
        $x_1 + x_2 + x_3 = 17$
- **Matrix-Vector-Form**: Compactly written as $Ax = b$.
    - $A$: **coefficient matrix** ($m \times n$).
    - $x$: **vector of variables** ($n \times 1$).
    - $b$: **right-hand side vector** ($m \times 1$).
    - Example:
        $$
        \begin{bmatrix} 1 & -2 & 0 \\ 1 & 0 & -1 \\ 1 & 1 & 1 \end{bmatrix}
        \begin{pmatrix} x_1 \\ x_2 \\ x_3 \end{pmatrix}
        =
        \begin{pmatrix} 0 \\ 3 \\ 17 \end{pmatrix}
        $$
- **Applications**: Ubiquitous in science and engineering.
    - **PageRank Algorithm**: Models web page relevance as a large linear system.
    - **Matrix Inversion**: Finding $A^{-1}$ by solving $m$ systems of the form $Ax_j = e_j$.

## Two Perspectives on Ax = b

1. **Row Picture (Zeilenweise)**:
    - Each row $u_i^T$ of matrix $A$ defines a hyperplane: $u_i^T x = b_i$.
    - Solution is the intersection point of all $m$ hyperplanes.
2. **Column Picture (Spaltenweise)**:
    - $A$ is a collection of column vectors $v_j$.
    - Solution provides coefficients $x_j$ to write $b$ as a **linear combination** of $A$'s columns: $b = \sum x_j v_j$.
    - Solution exists iff $b$ is in the **column space** of $A$ ($b \in C(A)$).

## Gauss Elimination: The Core Algorithm

- Classic algorithm to solve a **square system** $Ax=b$.
- **Core Idea**: Transform $Ax=b$ into an equivalent (same solution set) system $Ux=c$.
    - $U$ is an **upper triangular matrix** (all entries below the main diagonal are zero).

### Back Substitution (Rückwärtseinsetzung)

- Method to solve $Ux=c$ when $U$ is upper triangular.
- **Procedure**:
    1. Solve last equation for last variable ($x_m$).
    2. Substitute result into equation above to find $x_{m-1}$.
    3. Repeat upwards, finding variables in reverse order ($x_m, ..., x_1$).
- **Requirement**: All diagonal elements of $U$ (the **pivots**) must be **non-zero**.

### Elimination

- Procedure to transform $A$ into upper triangular matrix $U$.
- **Goal**: Create zeros in all positions below the main diagonal.
- **Procedure**:
    - Proceed column by column, left to right ($j=1, ..., m-1$).
    - Use the diagonal element $u_{jj}$ (**pivot**) to eliminate all entries below it.
    - Operation: `(row i) <- (row i) - (u_ij / u_jj) * (row j)`.
- **Problem Case: Pivot is 0**:
    - **Solution**: **Row exchange**. Swap the current row with a row below it that has a non-zero entry in the pivot column.
    - **Failure**: If pivot is 0 and all entries below it are also 0, the algorithm fails. This is a **productive failure**, revealing that $A$ is not invertible.

## Row Operations and Their Properties

- Elimination uses **row operations**, each corresponding to left-multiplication by an **invertible matrix** $M$.
- **Types of Row Operations**:
    1. **Row Subtraction**: Multiplication by an **elimination matrix** $E_{ij}$.
    2. **Row Exchange**: Multiplication by a **permutation matrix** $P_{jk}$.
- **Invariance of Solutions**:
    - Systems $Ax=b$ and $MAx=Mb$ have the **same solutions** iff $M$ is **invertible**.[^3.2]
    - Row operations preserve the solution set.
- **Invariant Properties** (under left-multiplication by invertible $M$):
    - **Nullspace**: $N(A) = N(MA)$[^3.3]
    - **Linear Independence of Columns**[^3.4]
    - **Row Space**: $R(A) = R(MA)$[^3.5]
    - **Rank**[^3.6]
- **NOT Invariant**:
    - **Column Space**: Generally $C(A) \neq C(MA)$.

## Success, Failure, and Runtime

- **Success and Failure**: For a square matrix $A$, the following are equivalent:[^3.7]
    1. Gauss elimination **succeeds** (all pivots are non-zero after potential row exchanges).
    2. The columns of $A$ are **linearly independent**.
    3. $A$ is **invertible**.
- If columns are linearly independent, Gauss elimination finds the **unique solution**. If dependent, it fails.[^3.8]
- **Runtime (Big-O Notation)**:
    - **Gauss Elimination**: **$O(m^3)$**[^3.9]
    - **Back Substitution**: **$O(m^2)$**[^3.10]
    - **Solving $Ax=b$ (Total)**: **$O(m^3)$**
    - **Matrix Inversion**: **$O(m^3)$**[^3.11][^3.12]
- **Faster Algorithms**:
    - Theoretically faster methods exist (e.g., Strassen's algorithm, $\approx O(m^{2.81})$).
    - Not used in practice except for immense matrices due to large constant overhead.

[^3.1]: **Definition 3.1 (System of linear equations).** A system of linear equations in $m$ equations and $n$ variables $x_1, x_2, \dots, x_n$ is of the form$$
\begin{align*}
a_{11}x_1 + a_{12}x_2 + \dots + a_{1n}x_n &= b_1 \\
a_{21}x_1 + a_{22}x_2 + \dots + a_{2n}x_n &= b_2 \\
&\vdots \\
a_{m1}x_1 + a_{m2}x_2 + \dots + a_{mn}x_n &= b_m,
\end{align*}
$$where the $a_{ij}$ and $b_i$ stand for known real numbers, and the $x_i$ stand for unknown real numbers that we want to compute such that they satisfy all the equations.
[^3.2]: **Lemma 3.2 (Invariance of solutions).** Let $A$ be an $m \times n$ matrix and $M$ an invertible $m \times m$ matrix. Then the two systems $Ax = b$ and $MAx = Mb$ have the same solutions $x$.
[^3.3]: **Lemma 3.3 (Invariance of the nullspace).** Let $A$ be an $m \times n$ matrix and $M$ an invertible $m \times m$ matrix. Then $A$ and $MA$ have the same nullspace, $N(A) = N(MA)$.
[^3.4]: **Lemma 3.4 (Invariance of linear independence).** Let $A$ be an $m \times n$ matrix and $M$ an invertible $m \times m$ matrix. Then the following is true: $A$ has linearly independent columns if and only if $MA$ has linearly independent columns.
[^3.5]: **Lemma 3.5 (Invariance of the row space).** Let $A$ be an $m \times n$ matrix and $M$ an invertible $m \times m$ matrix. Then $A$ and $MA$ have the same row space, $R(A) = R(MA)$.
[^3.6]: **Lemma 3.6 (Invariance of independent column indices and rank).** Let $A$ be an $m \times n$ matrix, $M$ an invertible $m \times m$ matrix. Then the following is true for all $j \in [n]$: column $j$ of $A$ is independent if and only if column $j$ of $MA$ is independent. In particular, A and MA have the same number of independent columns and therefore also the same rank.
[^3.7]: **Theorem 3.7.** Let $Ax = b$ be a system of $m$ linear equations in $m$ variables (so $A$ is an $m \times m$ matrix). The following two statements are equivalent.
(i) Gauss elimination as in Algorithm 2 succeeds.
(ii) The columns of $A$ are linearly independent.
[^3.8]: **Theorem 3.8 (Solving $Ax = b$ with Gauss elimination).** Let $Ax = b$ a system of $m$ linear equations in $m$ variables. If $A$ has linearly independent columns, then Gauss elimination (Algorithm 2) with back substitution (Algorithm 1) computes the unique solution $x$ of the system. If $A$ has linearly dependent columns, then Gauss elimination fails.
[^3.9]: **Theorem 3.9 (Runtime of Gauss elimination).** Let $Ax = b$ be a system of $m$ linear equations in $m$ variables. In time
$$O(m^3),$$
Gauss elimination (Algorithm 2) returns an equivalent system $Ux = c$ (in case of success, $U$ is upper triangular with nonzero diagonal entries).
[^3.10]: **Theorem 3.10 (Runtime of Back substitution).** Let $Ux = b$ be a system of $m$ linear equations in $m$ variables, where $U$ is upper triangular with nonzero diagonal entries. In time
$$O(m^2),$$
back substitution (Algorithm 1) returns the unique solution $x$.
[^3.11]: **Theorem 3.11 (Runtime of Gauss elimination with m right-hand sides).** Let $Ax = b_j, j \in [m]$, be m systems of m linear equations in m variables, where the $b_j$'s are the columns of the input matrix $B$. In time
$$O(m^3),$$
Gauss elimination (Algorithm 3) returns equivalent systems $Ux = c_j, j \in [m]$, where the $c_j$'s are the columns of the output matrix $C$ (in case of success, $U$ is upper triangular with nonzero diagonal entries).
[^3.12]: **Theorem 3.12 (Runtime of Inverse computation).** Let $A$ be an $m \times m$ matrix. In time
$$O(m^3),$$
Algorithm 4 either reports that $A$ is singular, or computes the inverse matrix $A^{-1}$.
