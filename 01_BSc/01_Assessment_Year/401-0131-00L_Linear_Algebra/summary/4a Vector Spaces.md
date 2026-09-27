## The Abstract Vector Space

- **Core Idea**: A **vector** is an element of a **vector space**.[^4.1]
    - "Natural habitat" for vectors: addition and scaling do not leave the space.
- **Formal Definition**: A real **vector space** is a triple $(V, +, \cdot)$.
    - Consists of a set $V$ (vectors), vector addition $+$, and scalar multiplication $\cdot$.
    - The operations must satisfy **8 axioms** (e.g., commutativity, associativity) that mirror the behavior of vectors in $\mathbb{R}^m$.[^4.1]
- **Fundamental Properties**:
    - Properties obvious for $\mathbb{R}^m$ must be proven from the axioms in general.
    - **Unique Zero Vector**: Every vector space has exactly one zero vector.[^4.6]
    - **Unique Negative Vector**: Every vector $v$ has exactly one negative vector $-v$.[^4.7]
    - **Scaling by Zero**: $0 \cdot v = 0$ for any vector $v$. This is a provable fact, not an axiom.[^4.10]
- **Examples of Vector Spaces**:
    - m-tuples $\mathbb{R}^m$ with component-wise operations.[^4.2]
    - All **polynomials** in one variable, $\mathbb{R}[x]$.[^4.3][^4.4]
        - **Zero vector**: The zero polynomial (degree -1).
    - All $m \times n$ **matrices**, $\mathbb{R}^{m \times n}$, with entry-wise operations.[^4.5]

## Subspaces

- **Definition**: A **subspace** $U$ is a non-empty subset of a vector space $V$ that is **closed** under vector addition and scalar multiplication:[^4.8]
    - (i) $v, w \in U \implies v+w \in U$.
    - (ii) $v \in U, \lambda \in \mathbb{R} \implies \lambda v \in U$.
- **Core Property**: Every subspace **must contain the zero vector** $0$.[^4.9]
    - Quick test: If a set misses the origin, it is not a subspace.
- **Subspaces as Vector Spaces**: Every subspace is itself a vector space with the inherited operations.[^4.14]
- **Examples of Subspaces**:
    - In $\mathbb{R}^3$: Lines or planes **through the origin**.
    - For a matrix $A$: The **column space** $C(A)$,[^4.11] **row space** $R(A)$,[^4.12] and **nullspace** $N(A)$.[^4.13]
    - The solution set for $Ax=b$ is a subspace only if $b=0$.
    - **Of Polynomials**:
        - Polynomials up to a certain degree.
        - Polynomials with no constant term.
    - **Of Matrices** (in $\mathbb{R}^{2 \times 2}$):
        - Symmetric $2 \times 2$ matrices.
        - $2 \times 2$ matrices with **trace 0**.
    - **Counterexample**: Matrices with only non-negative entries (not closed under multiplication by negative scalars).

## Linearity in Abstract Vector Spaces

- **From Sequences to Sets**: Abstract vector spaces generalize concepts from $\mathbb{R}^m$ by using **sets** of vectors, which can be infinite.
- **Linear Combination**: A sum of a **finite** number of scaled vectors from a set $G$. Finiteness is crucial to guarantee the result is in the vector space.[^4.15][^4.16]
- **Span**: The set of all possible (finite) linear combinations of vectors from a set $G$.[^4.17]
- **Linear (In)dependence**: A set $G$ is **linearly dependent** if some vector in $G$ is a linear combination of others in $G$. Otherwise, it is **linearly independent**.[^4.17]

## Basis

- **Definition**: A subset $B$ of a vector space $V$ is a **basis** for $V$ if:[^4.18]
    1. $B$ is **linearly independent**.
    2. $B$ **spans** the entire space $V$ (i.e., $Span(B) = V$).
- **Uniqueness of Representation**: A basis provides a unique "coordinate system". Every vector $v \in V$ can be written as a linear combination of basis vectors in **exactly one way**.[^4.29]
- **Existence**:
    - A space is **finitely generated** if a finite set spans it.[^4.21]
        - $\mathbb{R}^m$ is finitely generated; $\mathbb{R}[x]$ is not.
    - **Theorem**: Every finitely generated vector space has a finite basis.[^4.22]
        - **Finding a basis**: Start with a finite spanning set $G$. If dependent, remove a redundant vector. Repeat until independent.
- **The Steinitz Exchange Lemma**: Key result for finitely generated spaces. If $F$ is a linearly independent set and $G$ is a spanning set:[^4.23]
    1. $|F| \le |G|$.
    2. $F$ can be extended with $|G|-|F|$ vectors from $G$ to form a new spanning set.
- **Examples of Bases**:
    - $\mathbb{R}^m$: The **canonical basis** is $\{e_1, \dots, e_m\}$. Any $m$ linearly independent vectors form a basis.[^4.20]
    - **Column Space $C(A)$**: The independent columns of $A$.[^4.19]
    - **Polynomials $\mathbb{R}[x]$**: The infinite set of monomials $\{1, x, x^2, \dots \}$.
    - **Symmetric $2 \times 2$ Matrices**: A basis is $\left\{ \begin{pmatrix} 1 & 0 \\ 0 & 0 \end{pmatrix}, \begin{pmatrix} 0 & 0 \\ 0 & 1 \end{pmatrix}, \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix} \right\}$.
    - **Zero-Vector Space $\{0\}$**: The **empty set** $\emptyset$.

## Dimension and Isomorphism

- **Dimension**:
    - **Theorem**: All bases of a finitely generated vector space have the **same size**.[^4.24]
    - **Dimension**, $\text{dim}(V)$, is the size of any basis.[^4.25]
        - $\text{dim}(\mathbb{R}^m) = m$.
        - $\text{dim}(\{0\}) = 0$.
        - A set with fewer vectors than the dimension cannot span the space.[^4.30]
	- **Addition:** Given subspaces $U$, $V$: $dim(U + V) = dim(U)+dim(V)-dim(U \cap V )$
- **Isomorphism**:
    - A **linear transformation** is a function between vector spaces preserving addition and scaling.[^4.26]
    - Spaces are **isomorphic** if a **bijective** linear transformation (an **isomorphism**) exists between them.[^4.28]
        - Isomorphic spaces are structurally identical.
        - Isomorphisms preserve bases and dimension.[^4.27]
    - **Key Fact**: Any two real vector spaces of the same finite dimension are isomorphic.

[^4.1]: **Definition 4.1 (Vector space).** A vector space is a triple $(V, +, \cdot)$ where $V$ is a set (the vectors), and
$+: V \times V \to V$ is a function (vector addition),
$\cdot: \mathbb{R} \times V \to V$ is a function (scalar multiplication),
satisfying the following axioms of a vector space for all $u, v, w \in V$ and all $\lambda, \mu \in \mathbb{R}$.
	1. $v+w = w+v$ (commutativity)
	2. $u+(v+w) = (u+v)+w$ (associativity)
	3. There is a vector $0$ such that $v+0=v$ for all $v$ (zero vector)
	4. There is a vector $-v$ such that $v+(-v)=0$ (negative vector)
	5. $1 \cdot v = v$ (identity element)
	6. $(\lambda \mu)v = \lambda(\mu v)$ (compatibility of $\cdot$ and $\cdot$ in $\mathbb{R}$)
	7. $\lambda(v+w) = \lambda v + \lambda w$ (distributivity over +)
	8. $(\lambda + \mu)v = \lambda v + \mu v$ (distributivity over + in $\mathbb{R}$)
[^4.6]: **Fact 4.6.** Let $(V, +, \cdot)$ be a vector space. $V$ contains exactly one zero vector (a vector satisfying axiom 3 of Definition 4.1: $v+0=v$ for all $v$).
[^4.7]: **Fact 4.7.** Let $(V, +, \cdot)$ be a vector space. For every $v \in V$, there is exactly one negative vector $-v$ (a vector satisfying axiom 4 of Definition 4.1: $v+(-v)=0$).
[^4.10]: **Fact 4.10.** Let $V$ be a vector space, $v \in V$. Then $0v=0$.
[^4.2]: **Observation 4.2.** $(\mathbb{R}^m, +, \cdot)$, with "+" as in Definition 1.2 and "·" as in Definition 1.3, is a vector space.
[^4.3]: **Definition 4.3 (Polynomial).** A polynomial p is a formal sum of the form
$p = \sum_{i=0}^m p_i x^i$,
for some $m \in \mathbb{N}$. Here $x$ is a variable, and the numbers $p_0, p_1, \dots, p_m \in \mathbb{R}$ are the coefficients of p. The largest $i$ such that $p_i \neq 0$ is the degree of $p$. If all $p_i$ are 0, we have the zero polynomial $0=0$ whose degree we define to be $-1$.
[^4.4]: **Theorem 4.4.** Let $\mathbb{R}[x]$ denote the set of polynomials in one variable $x$. Given two polynomials $p = \sum_{i=0}^m p_i x^i$ and $q = \sum_{i=0}^n q_i x^i$, we define $p+q$ to be the polynomial
$p+q = \sum_{i=0}^{\max(m,n)} (p_i+q_i)x^i$,
where we set $p_i=0$ for $i>m$ and $q_i=0$ for $i>n$. For a scalar $\lambda \in \mathbb{R}$, we further define $\lambda p$ as the polynomial
$\lambda p = \sum_{i=0}^m (\lambda p_i)x^i$.
Then $(\mathbb{R}[x], +, \cdot)$ is a vector space.
[^4.5]: **Theorem 4.5.** Let $\mathbb{R}^{m \times n}$ be the set of $m \times n$ matrices, with addition $A+B$ and scalar multiplication $\lambda A$ defined in the usual way, see Definition 2.2. Then $(\mathbb{R}^{m \times n}, +, \cdot)$ is a vector space.
[^4.8]: **Definition 4.8 (Subspace).** Let $V$ be a vector space. A nonempty subset $U \subseteq V$ is called a subspace of $V$ if the following two axioms of a subspace are true for all $v, w \in U$ and all $\lambda \in \mathbb{R}$.
(i) $v+w \in U$;
(ii) $\lambda v \in U$.
[^4.9]: **Lemma 4.9.** Let $U \subseteq V$ be a subspace of a vector space $V$. Then $0 \in U$.
[^4.14]: **Lemma 4.14 (Subspaces are vector spaces).** Let $V$ be a vector space, and let $U$ be a subspace of $V$. Then $U$ is also a vector space (with the same "+" and "·" as $V$).
[^4.11]: **Lemma 4.11 (The column space is a subspace).** Let A be an $m \times n$ matrix. Then the column space $C(A) = \{Ax : x \in \mathbb{R}^n\}$ is a subspace of $\mathbb{R}^m$.
[^4.12]: **Corollary 4.12 (The row space is a subspace).** Let A be an $m \times n$ matrix. Then the row space $R(A) = C(A^T)$ is a subspace of $\mathbb{R}^n$.
[^4.13]: **Exercise 4.13 (The nullspace is a subspace).** Let A be an $m \times n$ matrix. Then the nullspace $N(A) = \{x \in \mathbb{R}^n : Ax=0\}$ is a subspace of $\mathbb{R}^n$.
[^4.15]: **Definition 4.15 (Linear combination of a set of vectors).** Let $V$ be a vector space, $G \subseteq V$ a (possibly infinite) subset of vectors. A linear combination of $G$ is a sum of the form
$\sum_{j=1}^n \lambda_j v_j$,
where $F = \{v_1, v_2, \dots, v_n\}$ is a finite subset of $G$.
[^4.16]: **Lemma 4.16 (A vector space is closed under linear combinations).** Let $V$ be a vector space. Every linear combination of $V$ is again in $V$.
[^4.17]: **Definition 4.17 (Linear independence and span of a set of vectors).** Let $V$ be a vector space, $G \subseteq V$ a (possibly infinite) subset of vectors.
The set $G$ is called linearly dependent if there is an element $v \in G$ such that $v$ is a linear combination of $G \setminus \{v\}$. Otherwise, $G$ is called linearly independent.
The span of $G$, written as $Span(G)$, is the set of all linear combinations of $G$.
[^4.18]: **Definition 4.18 (Basis).** Let $V$ be a vector space. A subset $B \subseteq V$ is called a basis of $V$ if $B$ is linearly independent and $Span(B) = V$.
[^4.29]: **Theorem 4.29 (A basis writes each vector as a unique linear combination).** Let $V$ be a finitely generated vector space of dimension $m$ and $B=\{v_1, v_2, \dots, v_m\} \subseteq V$ a basis of $V$. For every $v \in V$, there are unique scalars $\lambda_1, \lambda_2, \dots, \lambda_m$ such that
$v = \sum_{j=1}^m \lambda_j v_j$.
[^4.21]: **Definition 4.21 (Finitely generated vector space).** A vector space $V$ is called finitely generated if there exists a finite subset $G \subseteq V$ with $Span(G) = V$.
[^4.22]: **Theorem 4.22.** Let $V$ be a finitely generated vector space, and let $G \subseteq V$ be a finite subset with $Span(G)=V$. Then $V$ has a basis $B \subseteq G$.
[^4.23]: **Lemma 4.23 (Steinitz exchange lemma).** Let $V$ be a finitely generated vector space, $F \subseteq V$ a finite set of linearly independent vectors, and $G \subseteq V$ a finite set of vectors with $Span(G)=V$. Then the following two statements hold.
(i) $|F| \le |G|$.
(ii) There exists a subset $E \subseteq G$ of size $|G|-|F|$ such that $Span(F \cup E) = V$.
[^4.20]: **Observation 4.20.** Every set $B = \{v_1, v_2, \dots, v_m\} \subseteq \mathbb{R}^m$ of $m$ linearly independent vectors is a basis of $\mathbb{R}^m$.
[^4.19]: **Lemma 4.19.** Let $A$ be an $m \times n$ matrix. The set of independent columns of $A$ (Definition 2.10) is a basis of the column space $C(A)$.
[^4.24]: **Theorem 4.24 (All bases have the same size).** Let $V$ be a finitely generated vector space and let $B, B' \subseteq V$ be two bases of $V$. Then $|B| = |B'|$.
[^4.25]: **Definition 4.25 (Dimension).** Let $V$ be a finitely generated vector space. Then $\text{dim}(V)$, the dimension of $V$, is the size of an arbitrary basis $B$ of $V$.
[^4.30]: **Lemma 4.30 (Less than dim(V) vectors do not span V).** Let $V$ be a finitely generated vector space. Let $G \subseteq V$ be a finite subset of size $|G| < \text{dim}(V)$ (Definition 4.25). Then $Span(G) \neq V$.
[^4.26]: **Definition 4.26 (Linear transformation between vector spaces).** Let $V, W$ be two vector spaces. A function $T: V \to W$ is called a linear transformation between vector spaces if the following linearity axiom holds for all $x_1, x_2 \in V$ and all $\lambda_1, \lambda_2 \in \mathbb{R}$.
$T(\lambda_1 x_1 + \lambda_2 x_2) = \lambda_1 T(x_1) + \lambda_2 T(x_2)$.
[^4.28]: **Definition 4.28 (Isomorphic vector spaces, isomorphism).** Let $V, W$ be two vector spaces. If there is a bijective linear transformation $T: V \to W$ (Definition 4.26), then $V$ and $W$ are called isomorphic, and $T$ is called an isomorphism between $V$ and $W$.
[^4.27]: **Lemma 4.27 (Bijective linear transformations preserve bases).** Let $T: V \to W$ be a bijective linear transformation between vector spaces $V$ and $W$. Let $B = \{v_1, v_2, \dots, v_\ell\} \subseteq V$ be a finite set of some size $\ell$, and $T(B) = \{T(v_1), T(v_2), \dots, T(v_\ell)\} \subseteq W$ the transformed set. Then $|T(B)|=|B|$. Moreover, $B$ is a basis of $V$ if and only if $T(B)$ is a basis of $W$. We therefore also have $\text{dim}(V) = \text{dim}(W)$.
