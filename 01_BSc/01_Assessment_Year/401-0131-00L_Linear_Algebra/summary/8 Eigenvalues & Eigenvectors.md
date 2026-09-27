## Complex Numbers Foundation

- **Necessity**: Solving characteristic polynomials $\det(A - \lambda I) = 0$ often requires complex numbers (e.g., $\lambda^2 + 1 = 0$) even for real matrices.
- **Definition**: Set $\mathbb{C} = \{a+ib : a,b \in \mathbb{R}\}$ where $i^2 = -1$.
    - **Real part**: $\Re(a+ib) = a$.
    - **Imaginary part**: $\Im(a+ib) = b$.
    - **Modulus**: $|z| = \sqrt{a^2+b^2}$.
    - **Conjugate**: $\overline{a+ib} = a-ib$.
- **Vector View**: Complex numbers behave like vectors in $\mathbb{R}^2$.
    - Addition: Component-wise.
    - Multiplication: Uses $i^2=-1$.
    - Division: Expand by conjugate of denominator $\frac{z}{w} = \frac{z\bar{w}}{|w|^2}$. Formula: $\frac{a+ib}{x+iy} = \frac{(ax+by)+i(bx-ay)}{x^2+y^2}$.
- **Polar Form**: $z = re^{i\theta}$ where $r=|z|$ and $\theta$ is the argument.
    - **Euler's Formula**: $e^{i\theta} = \cos \theta + i \sin \theta$ .[^8.1.1]
- **Fundamental Theorem of Algebra**:
    - $\mathbb{C}$ is **algebraically closed**.
    - Any non-constant polynomial of degree $n$ has a root in $\mathbb{C}$ .[^8.1.2]
    - A degree $n$ polynomial decomposes into $n$ linear factors: $P(z) = \alpha_n(z-\lambda_1)\cdots(z-\lambda_n)$ .[^8.1.3]

## Eigenvalues and Eigenvectors: Fundamentals

- **Definition**: Square matrix $A \in \mathbb{R}^{n \times n}$, scalar $\lambda \in \mathbb{C}$, vector $v \in \mathbb{C}^n \setminus \{0\}$:
    $$ Av = \lambda v $$
    - Pair $(\lambda, v)$ is an **eigenvalue-eigenvector pair** .[^8.2.1]
- **Geometric Intuition**:
    - **Real $\lambda$**: $A$ scales $v$ (stretching/shrinking/reversing).
    - **Complex $\lambda$**: Represents rotation combined with scaling (no fixed direction in $\mathbb{R}^n$).
- **Computation**:
    - **Derivation**: Non-trivial solution $v \neq 0$ to $(A - \lambda I)v = 0$ requires singular matrix.
    - **Characteristic Equation**: Solve $\det(A - \lambda I) = 0$.
    - **Characteristic Polynomial**: $P(\lambda) = \det(A - \lambda I)$. Degree $n$ polynomial, leading coefficient $(-1)^n$ .[^8.2.4]
- **Existence**:
    - Every matrix $A \in \mathbb{R}^{n \times n}$ has at least one eigenvalue .[^8.2.5]
    - **Real Eigenvalues**: $\lambda \in \mathbb{R} \iff$ exists real eigenvector $v \in \mathbb{R}^n$ .[^8.2.3]
    - **Complex Pairs**: $\lambda$ eigenvalue $\implies \bar{\lambda}$ eigenvalue (conjugate pairs for real matrices) .[^8.2.8]

## Properties and Relations

### Determinant, Trace, and Transpose

- **Trace ($\operatorname{Tr}$)**: Sum of diagonal entries $\sum_{i=1}^n A_{ii}$ .[^8.3.4]
    - Cyclic permutation invariance: $\operatorname{Tr}(ABC) = \operatorname{Tr}(BCA) = \operatorname{Tr}(CAB)$ .[^8.3.7]
- **The "Magic" Connections** :[^8.3.6]
    - **Determinant**: $\det(A) = \prod_{i=1}^n \lambda_i$ (product of eigenvalues).
    - **Trace**: $\operatorname{Tr}(A) = \sum_{i=1}^n \lambda_i$ (sum of eigenvalues).
    - *Tip:* Use to find missing eigenvalues without full calculation.
- **Transpose**: $A$ and $A^T$ share **same eigenvalues** (but typically not eigenvectors).[^8.3.5]

### Matrix Powers and Inverses

If $(\lambda, v)$ is an eigenpair of $A$:

- **Powers**: $(\lambda^k, v)$ is eigenpair of $A^k$ ($k \ge 1$) .[^8.3.1]
	- **Backwards:** If $\mu$ is eigenvalue of $A^k$, then some $\sqrt[k]{\mu} \in \mathbb{C}$ is eigenvalue of $A$.
- **Inverse**: $(1/\lambda, v)$ is eigenpair of $A^{-1}$ (if $\lambda \neq 0$) .[^8.3.1]

### Special Matrix Classes

- **Orthogonal Matrices ($Q$)**:
    - Preserve norms $\implies |\lambda| = 1$ .[^8.2.7]
    - *Example:* Rotation matrices (purely imaginary eigenvalues, e.g., $\pm i$) .[^8.2.6]
- **Triangular Matrices**: Eigenvalues are the diagonal entries.[^9.1.5]
- **Block Matrices**:
    - For block triangular/diagonal matrices $\begin{pmatrix} A & B \\ 0 & D \end{pmatrix}$, eigenvalues are the union of eigenvalues of diagonal blocks $A$ and $D$.
    - Reason: $\det \begin{pmatrix} A-\lambda I & B \\ 0 & D-\lambda I \end{pmatrix} = \det(A-\lambda I)\det(D-\lambda I)$.

## Eigenbases and Linear Independence

- **Independence**: Eigenvectors to **distinct** eigenvalues are **linearly independent** .[^8.3.2]
- **Basis Existence**:
    - $n$ **distinct real eigenvalues** $\implies$ eigenvectors form basis for $\mathbb{R}^n$ .[^8.3.3]
    - *Note:* Distinct eigenvalues guarantee basis; repeated eigenvalues (algebraic multiplicity $> 1$) might not.
- **Algebraic Multiplicity**: Number of times $\lambda$ appears as root in characteristic polynomial .[^8.1.3][^8.3.4]

## Applications and Dynamical Systems

### Fibonacci Numbers Example

- **Recurrence**: $g_n = M g_{n-1}$ with $M = \begin{bmatrix} 1 & 1 \\ 1 & 0 \end{bmatrix}$ (from $F_{n+1} = F_n + F_{n-1}$) .[^8.2.2]
- **Solution**: $g_n = M^n g_0$.
- **Closed Form**: Decompose $g_0$ into eigenvectors $v_1, v_2$. Then $M^n g_0 = c_1 \lambda_1^n v_1 + c_2 \lambda_2^n v_2$.
- **Golden Ratio**: Eigenvalues $\phi = \frac{1+\sqrt{5}}{2}, \psi = \frac{1-\sqrt{5}}{2}$. Large $n$ behavior dominated by $\phi^n$ .[^8.2.9]

### Power Method & Stability

- **Dominance**: Term with largest modulus $|\lambda_{max}|$ dominates $A^n x$ for large $n$.
- **Ranking**: Basis for PageRank (finding steady state).
- **Stability**:
    - All $|\lambda| < 1 \implies$ Decay ($A^n x \to 0$).
    - Any $|\lambda| > 1 \implies$ Growth/Divergence.

[^8.1.1]: **Remark 8.1.1.** Given $\theta \in \mathbb{R}$, we have
(20) $e^{i\theta} = \cos \theta + i \sin \theta$.
This means, in particular, that $e^{i\pi} = -1$. This is usually written as $e^{i\pi} + 1 = 0$ and known as Euler's formula.
A complex number $z \in \mathbb{C}$ can be written as
(21) $z = re^{i\theta}$,
where $r \ge 0$ is the modulus of $z$ and $\theta \in \mathbb{R}$ (we can restrict to $\theta \in [0, 2\pi[)$ is an angle, also called the argument of $z$. This is known under the name polar coordinates.
[^8.1.2]: **Theorem 8.1.2 (Fundamental Theorem of Algebra).** Any degree $n$ non-constant $(n \ge 1)$ polynomial $P(z) = \alpha_n z^n + \alpha_{n-1} z^{n-1} + \dots + \alpha_1 z + \alpha_0$ (with $\alpha_n \neq 0$) has a zero: $\lambda \in \mathbb{C}$ such that $P(\lambda) = 0$.
[^8.1.3]: **Corollary 8.1.3.** Any degree $n$ non-constant $(n \ge 1)$ polynomial $P(z) = \alpha_n z^n + \alpha_{n-1} z^{n-1} + \dots + \alpha_1 z + \alpha_0$ (with $\alpha_n \neq 0$) has $n$ zeros: $\lambda_1, \dots, \lambda_n \in \mathbb{C}$, perhaps with repetitions, such that
(22) $P(z) = \alpha_n(z - \lambda_1)(z - \lambda_2) \cdots (z - \lambda_n)$.
The number of times $\lambda \in \mathbb{C}$ appears in this expansion is called the algebraic multiplicity of the zero.
[^8.2.1]: **Definition 8.2.1.** Given $A \in \mathbb{R}^{n \times n}$, we say $\lambda \in \mathbb{C}$ is an eigenvalue of $A$ and $v \in \mathbb{C}^n \setminus \{0\}$ is an eigenvector of $A$, associated with the eigenvalue $\lambda$, when the following holds:
$Av = \lambda v$.
We call them an eigenvalue-eigenvector pair. If $\lambda \in \mathbb{R}$ then we will call $\lambda$ a real eigenvalue, and the associated eigenvalue-eigenvector pair a real eigenvalue-eigenvector pair.
[^8.2.4]: **Proposition 8.2.4.** $\det(A - \lambda I)$ is a polynomial in $\lambda$ of degree $n$. The coefficient of the $\lambda^n$ term is $(-1)^n$.
[^8.2.5]: **Theorem 8.2.5.** Every matrix $A \in \mathbb{R}^{n \times n}$ has an eigenvalue (perhaps complex-valued).
[^8.2.3]: **Lemma 8.2.3.** Let $A \in \mathbb{R}^{n \times n}$. $\lambda \in \mathbb{R}$ is a real eigenvalue of $A$ if and only if $\det(A - \lambda I) = 0$. A vector $v \in \mathbb{R}^n \setminus \{0\}$ is an eigenvector associated with the eigenvalue $\lambda$ if (and only if) $v \in N(A - \lambda I)$.
[^8.2.8]: **Lemma 8.2.8.** Let $A \in \mathbb{R}^{n \times n}$. If $(\lambda, v)$ is an eigenvalue-eigenvector pair, then $(\bar{\lambda}, \bar{v})$ is an eigenvalue-eigenvector pair.
[^8.3.4]: **Definition 8.3.4.** Let $A \in \mathbb{R}^{n \times n}$.
(34) $P(z) = (-1)^n \det(A - zI) = \det(zI - A) = (z - \lambda_1)(z - \lambda_2) \cdots (z - \lambda_n)$.
The polynomial $P(z)$ in (34) is called the characteristic polynomial of the matrix $A$. The eigenvalues $\lambda_1, \dots, \lambda_n$ as they show up in (34) are not all distinct in general. The number of times an eigenvalue shows up is called the algebraic multiplicity of the eigenvalue.
The trace of $A$ is defined as $\operatorname{Tr}(A) = \sum_{i=1}^n A_{ii}$.
[^8.3.7]: **Lemma 8.3.7.** For matrices $A, B, C \in \mathbb{R}^{n \times n}$ one has
$\operatorname{Tr}(AB) = \operatorname{Tr}(BA)$ and $\operatorname{Tr}(ABC) = \operatorname{Tr}(BCA) = \operatorname{Tr}(CAB)$.
[^8.3.6]: **Lemma 8.3.6.** Let $A \in \mathbb{R}^{n \times n}$ and $\lambda_1, \dots, \lambda_n$ its $n$ eigenvalues as they show up in (34). Then
$\det(A) = \prod_{i=1}^n \lambda_i$ and $\operatorname{Tr}(A) = \sum_{i=1}^n \lambda_i$.
[^8.3.5]: **Lemma 8.3.5.** The eigenvalues of $A \in \mathbb{R}^{n \times n}$ are the same as the ones of $A^T$.
[^8.3.1]: **Proposition 8.3.1.**
(a) If $\lambda$ and $v$ are an eigenvalue-eigenvector pair of a matrix $A$, then, for $k \ge 1$, $\lambda^k$ and $v$ are an eigenvalue-eigenvector pair of the matrix $A^k$.
(b) Let $A$ be an invertible matrix. If $\lambda$ and $v$ are an eigenvalue-eigenvector pair of the matrix $A$, then, $\frac{1}{\lambda}$ and $v$ are an eigenvalue-eigenvector pair of the matrix $A^{-1}$.
[^8.2.7]: **Proposition 8.2.7.** Let $Q \in \mathbb{R}^{n \times n}$ be an orthogonal matrix. If $\lambda \in \mathbb{C}$ is an eigenvalue of $Q$, then $|\lambda| = 1$.
[^8.2.6]: **Example 8.2.6.** The eigenvalues of the matrix $A = \begin{bmatrix} 0 & -1 \\ 1 & 0 \end{bmatrix}$, corresponding to a $90^\circ$ counterclockwise rotation, are the solutions to $0 = \det(A - \lambda I) = \lambda^2 + 1$, which are $\lambda_1 = i$ and $\lambda_2 = -i$. The eigenvectors are given by $v_1 = \begin{pmatrix} i \\ 1 \end{pmatrix}$ and $v_2 = \begin{pmatrix} -i \\ 1 \end{pmatrix}$.
[^9.1.5]: **Example 9.1.5.** The eigenvalues of an $n \times n$ triangular matrix are the $n$ values in the diagonal. However, triangular matrices may not have a complete set of real eigenvectors. Try to find an example!
[^8.3.2]: **Lemma 8.3.2.** Let $A \in \mathbb{R}^{n \times n}$ and let $v_1, \dots, v_k \in \mathbb{R}^n$ be eigenvectors corresponding to eigenvalues $\lambda_1, \dots, \lambda_k \in \mathbb{R}$. If $\lambda_1, \dots, \lambda_k$ are all distinct, the eigenvectors $v_1, \dots, v_k$ are linearly independent.
[^8.3.3]: **Theorem 8.3.3.** Let $A \in \mathbb{R}^{n \times n}$ with $n$ distinct real eigenvalues (meaning that the $n$ zeros of $\det(A - \lambda I)$, as described in Corollary 8.1.3, are all distinct) then there is a basis of $\mathbb{R}^n$, $v_1, \dots, v_n$, made up of eigenvectors of $A$.
[^8.2.2]: **Example 8.2.2.** In this example we will derive a formula for the n-th Ficonacci Number. The Fibonacci numbers are defined by the recurrence:
	(24) $F_0 = 0, F_1 = 1, \text{and, for } n \ge 2, F_n = F_{n-1} + F_{n-2}$.
	The recurrence can be rewritten in linear algebraic notation as, for $n \ge 2$,
	(25) $\begin{pmatrix} F_{n+1} \\ F_n \end{pmatrix} = \begin{bmatrix} 1 & 1 \\ 1 & 0 \end{bmatrix} \begin{pmatrix} F_n \\ F_{n-1} \end{pmatrix}$.
	Defining
	(26) $M = \begin{bmatrix} 1 & 1 \\ 1 & 0 \end{bmatrix} \text{and } g_n = \begin{pmatrix} F_{n+1} \\ F_n \end{pmatrix}$,
	the recurrence can be rewritten as
	$g_0 = \begin{pmatrix} 1 \\ 0 \end{pmatrix} \text{and } g_n = M g_{n-1}$.
	This leads us to the formula
	(27) $g_n = M^n g_0$.
	Let us try to find eigenvalues (and later the eigenvectors) of $M = \begin{bmatrix} 1 & 1 \\ 1 & 0 \end{bmatrix}$. We are looking for $v \in \mathbb{R}^2 \setminus \{0\}$ and $\lambda \in \mathbb{R}$ such that $Mv = \lambda v$, but this can be rewritten as $(M - \lambda I)v = 0$ and since $v \neq 0$ it means that $M - \lambda I$ is non-invertible (also called singular). This is equivalent to $\det(M - \lambda I) = 0$ and so we can find the eigenvalues $\lambda$ with this equation:
	(28) $0 = \det(M - \lambda I) = \begin{vmatrix} 1-\lambda & 1 \\ 1 & 0-\lambda \end{vmatrix} = (1-\lambda)(0-\lambda) - 1 = \lambda^2 - \lambda - 1$.
	By the quadratic formula, the solutions to (28) are given by
	(29) $\lambda_1 = \frac{1+\sqrt{5}}{2} \text{and } \lambda_2 = \frac{1-\sqrt{5}}{2}$.
	The number $\phi = \frac{1+\sqrt{5}}{2}$ is the celebrated Golden Ratio; believed, since the ancient Greeks, to be the ideal aspect ratio for a rectangle.
	---
[^8.2.9]: **Example 8.2.9.** Notice that $v_1$ and $v_2$ are linearly independent, and so they are a basis for $\mathbb{R}^2$. We can write $g_0 = \alpha_1 v_1 + \alpha_2 v_2$.
$\begin{pmatrix} 1 \\ 0 \end{pmatrix} = g_0 = \alpha_1 v_1 + \alpha_2 v_2 = \begin{pmatrix} \alpha_1 \frac{1+\sqrt{5}}{2} + \alpha_2 \frac{1-\sqrt{5}}{2} \\ \alpha_1 + \alpha_2 \end{pmatrix} = \begin{pmatrix} (\alpha_1 + \alpha_2)\frac{1}{2} + (\alpha_1 - \alpha_2)\frac{\sqrt{5}}{2} \\ \alpha_1 + \alpha_2 \end{pmatrix}$,
and so $\alpha_1 = \frac{1}{\sqrt{5}}$ and $\alpha_2 = -\frac{1}{\sqrt{5}}$.
Recall that $g_n = M^n g_0$ and so
$g_n = M^n (\frac{1}{\sqrt{5}} v_1 - \frac{1}{\sqrt{5}} v_2) = \frac{1}{\sqrt{5}} M^n v_1 - \frac{1}{\sqrt{5}} M^n v_2 = \frac{1}{\sqrt{5}} (M^n v_1 - M^n v_2)$.
Since $Mv_1 = \lambda_1 v_1$ we have that $M^2 v_1 = M(\lambda_1 v_1) = \lambda_1^2 v_1$ and iterating this procedure – a formal proof would use induction – gives $M^n v_1 = \lambda_1^n v_1$. This means that
$g_n = \frac{A^n v_1 - A^n v_2}{\sqrt{5}} = \frac{(\frac{1+\sqrt{5}}{2})^n v_1 - (\frac{1-\sqrt{5}}{2})^n v_2}{\sqrt{5}} = \frac{(\frac{1+\sqrt{5}}{2})^n}{\sqrt{5}} \begin{pmatrix} \frac{1+\sqrt{5}}{2} \\ 1 \end{pmatrix} - \frac{(\frac{1-\sqrt{5}}{2})^n}{\sqrt{5}} \begin{pmatrix} \frac{1-\sqrt{5}}{2} \\ 1 \end{pmatrix}$.
