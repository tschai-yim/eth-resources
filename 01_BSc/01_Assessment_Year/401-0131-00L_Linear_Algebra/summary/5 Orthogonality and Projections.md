## Orthogonality of Vectors & Subspaces

- **Orthogonal Vectors**: $v, w \in \mathbb{R}^n$ are **orthogonal** if their scalar product is zero: $v^T w = 0$. [^5.1.1]
- **Orthogonal Subspaces**: Subspaces $V, W$ are **orthogonal** if every vector in $V$ is orthogonal to every vector in $W$. [^5.1.1]
    - **Practical Check**: $V, W$ are orthogonal $\iff$ every basis vector of $V$ is orthogonal to every basis vector of $W$. [^5.1.2]
- **Key Properties**: For orthogonal subspaces $V, W$:
    - The union of their bases is a linearly independent set. [^5.1.3]
    - Their intersection is only the zero vector: $V \cap W = \{0\}$. [^5.1.4]
    - The sum of their dimensions is at most $n$: $\dim(V) + \dim(W) \le n$. [^5.1.4]

## The Orthogonal Complement

- **Orthogonal Complement** $V^\perp$: The set of all vectors in $\mathbb{R}^n$ orthogonal to **every** vector in a subspace $V$. [^5.1.5]
    - $V^\perp = \{x \in \mathbb{R}^n \mid v^T x = 0 \text{ for all } v \in V\}$.
    - $V^\perp$ is also a subspace.
    - The complement of the complement is the original space: $(V^\perp)^\perp = V$. [^5.1.8]
- **Fundamental Theorem of Orthogonality**: The nullspace of $A$ is the orthogonal complement of its row space ($C(A^T)$). [^5.1.6]
    - $N(A) = C(A^T)^\perp$
    - The relationship is symmetric: $C(A^T) = N(A)^\perp$. [^5.1.9]
- **Decomposition of $\mathbb{R}^n$**: For two orthogonal subspaces $V, W$, the following are equivalent: [^5.1.7]
    1. $W = V^\perp$
    2. $\dim(V) + \dim(W) = n$
    3. Every vector $u \in \mathbb{R}^n$ has a **unique** decomposition $u = v+w$ where $v \in V, w \in W$.
- **Relation for $A^TA$**: The nullspace of $A$ is identical to the nullspace of $A^TA$. [^5.1.10]
    - $N(A) = N(A^TA)$
    - $A^TA$ is always a square and symmetric matrix.

## Projections

- **Goal**: Find the vector $p$ in a subspace $S$ that is closest to a given vector $b$. [^5.2.1]
    - $p = \text{proj}_S(b) = \arg\min_{p \in S} \|b-p\|$.
    - This finds the "best possible" approximate solution to an unsolvable system $Ax=b$.
- **Geometric Intuition**: The projection $p$ is the unique point in $S$ where the **error vector** $e = b-p$ is **orthogonal** to the subspace $S$ (i.e., $e \in S^\perp$).

### Projection onto a Line (1D Case)

- For $S = C(a)$ where $a \ne 0$, the projection is $p = \lambda a$.
- The orthogonality condition $(b-p)^T a = 0$ gives the optimal scalar:
    $$ \lambda^* = \frac{a^T b}{a^T a} = \frac{a^T b}{\|a\|^2} $$
- **1D Projection Matrix**: $p=Pb$ with $P = \frac{a a^T}{a^T a}$. [^5.2.2]
    - $aa^T$: outer product (matrix).
    - $a^Ta$: inner product (scalar).

### Projection onto a General Subspace

- For $S = C(A)$, the projection is $p=A\hat{x}$ for some coefficient vector $\hat{x}$.
- The orthogonality condition is $A^T(b-p) = 0$.
- Substituting $p=A\hat{x}$ yields the **Normal Equations**: [^5.2.3]
    $$ A^T A \hat{x} = A^T b $$
- **Unique Solution**: A unique solution for $\hat{x}$ exists if $A^TA$ is invertible, which is true if and only if the columns of $A$ are linearly independent. [^5.2.4]

### The Projection Matrix

- If columns of $A$ form a basis for $S$, the unique coefficient vector is $\hat{x} = (A^TA)^{-1}A^Tb$.
- The projection is $p = A\hat{x} = A(A^TA)^{-1}A^Tb$.
- The general **projection matrix** is $P = A(A^TA)^{-1}A^T$. [^5.2.5]
- **Properties of P**: [^5.2.6]
    - **Idempotent**: $P^2 = P$ (projecting twice is the same as projecting once).
    - **Action on $S$**: For $v \in S$, $Pv = v$. (Specifically, $PA=A$).
    - **Action on $S^\perp$**: For $v \in S^\perp$, $Pv = 0$.

[^5.1.1]: **Definition 5.1.1.** Two vectors $v, w \in \mathbb{R}^n$ are called **orthogonal** if $v^T w = \sum_{i=1}^n v_i w_i = 0$. Two subspaces $V$ and $W$ are **orthogonal** if for all $v \in V$ and $w \in W$, the vectors $v$ and $w$ are orthogonal.
[^5.1.2]: **Lemma 5.1.2.** Let $v_1, \dots, v_k$ be a basis of subspace $V$. Let $w_1, \dots, w_l$ be a basis of subspace $W$. $V$ and $W$ are orthogonal if and only if $v_i$ and $w_j$ are orthogonal for all $i \in \{1, \dots, k\}$ and $j \in \{1, \dots, l\}$.
[^5.1.3]: **Lemma 5.1.3.** Let $V$ and $W$ be two orthogonal subspaces of $\mathbb{R}^n$. Let $v_1, \dots, v_k$ be a basis of subspace $V$. Let $w_1, \dots, w_l$ be a basis of subspace $W$. The set of vectors $\{v_1, \dots, v_k, w_1, \dots, w_l\}$ are linearly independent.
[^5.1.4]: **Corollary 5.1.4.** Let $V$ and $W$ be orthogonal subspaces. Then $V \cap W = \{0\}$. Moreover, if $\dim(V) = k$ and $\dim(W) = l$, then $\dim(V+W) = k+l \le n$.
[^5.1.5]: **Definition 5.1.5.** Let $V$ be a subspace of $\mathbb{R}^n$. We define the **orthogonal complement** of $V$ as $V^\perp = \{w \in \mathbb{R}^n \mid w^T v = 0 \text{ for all } v \in V\}$.
[^5.1.8]: **Lemma 5.1.8.** Let $V$ be a subspace of $\mathbb{R}^n$. Then $V = (V^\perp)^\perp$.
[^5.1.6]: **Theorem 5.1.6.** Let $A \in \mathbb{R}^{m \times n}$ be a matrix. $N(A) = C(A^T)^\perp = R(A)^\perp$.
[^5.1.9]: **Corollary 5.1.9.** Let $A \in \mathbb{R}^{m \times n}$. $N(A) = C(A^T)^\perp$ and $C(A^T) = N(A)^\perp$.
[^5.1.7]: **Theorem 5.1.7.** Let $V, W$ be orthogonal subspaces of $\mathbb{R}^n$. The following statements are equivalent.
(i) $W = V^\perp$.
(ii) $\dim(V) + \dim(W) = n$.
(iii) Every $u \in \mathbb{R}^n$ can be written as $u = v+w$ with unique vectors $v \in V, w \in W$.
[^5.1.10]: **Lemma 5.1.10.** Let $A \in \mathbb{R}^{m \times n}$. Then $N(A) = N(A^TA)$ and $C(A^T) = C(A^TA)$.
[^5.2.1]: **Definition 5.2.1 (Projection of a vector onto a subspace).** The projection of a vector $b \in \mathbb{R}^m$ on a subspace $S$ (of $\mathbb{R}^m$) is the point in $S$ that is closest to $b$. In other words $\text{proj}_S(b) = \arg\min_{p \in S} \|b - p\|$.
[^5.2.2]: **Lemma 5.2.2.** Let $a \in \mathbb{R}^m \setminus \{0\}$. The projection of $b \in \mathbb{R}^m$ on $S = \{\lambda a \mid \lambda \in \mathbb{R}\} = C(a)$ is given by $\text{proj}_S(b) = \frac{aa^T}{a^Ta}b$.
[^5.2.3]: **Lemma 5.2.3.** The projection of a vector $b \in \mathbb{R}^m$ to the subspace $S=C(A)$ is well defined. It can be written as $\text{proj}_S(b) = A\hat{x}$, where $\hat{x}$ satisfies the normal equations $A^T A \hat{x} = A^T b$.
[^5.2.4]: **Lemma 5.2.4.** $A^TA$ is invertible if and only if $A$ has linearly independent columns.
[^5.2.5]: **Theorem 5.2.5.** Let $S$ be a subspace in $\mathbb{R}^m$ and $A$ a matrix whose columns are a basis of $S$. The projection of $b \in \mathbb{R}^m$ to $S$ is given by $\text{proj}_S(b) = Pb$, where $P = A(A^TA)^{-1}A^T$ is the projection matrix.
[^5.2.6]: **Remark 5.2.6.**
    - If $b \in \mathbb{R}^m$, then $\text{proj}_S(\text{proj}_S(b)) = \text{proj}_S(b)$ by definition. This requires us to have that $PPb = Pb$, i.e., we should have $P^2=P$. Indeed $P^2 = (A(A^TA)^{-1}A^T)^2 = A(A^TA)^{-1}A^TA(A^TA)^{-1}A^T = A(A^TA)^{-1}A^T = P$.
    - Let $S^\perp$ be the orthogonal complement of $S$ and $P$ the projection matrix onto the subspace $S$, i.e., $\text{proj}_S(b)=Pb$. Then $I-P$ is the projection matrix that maps $b \in \mathbb{R}^m$ to $\text{proj}_{S^\perp}(b)$. This follows since $b = e + \text{proj}_S(b) = e+Pb$ where $e \in S^\perp$. Hence, $(I-P)b = b-Pb=e=\text{proj}_{S^\perp}(b)$.
    - Note that - as it should be - we have that $(I-P)^2 = I - 2P + P^2 = I - P$.
