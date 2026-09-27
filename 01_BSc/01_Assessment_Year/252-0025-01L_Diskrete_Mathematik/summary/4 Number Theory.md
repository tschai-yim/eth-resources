## Fundamentals of Divisibility

- **Divisor**: Integer $a$ **divides** integer $b$ ($a|b$) if $b = ac$ for some integer $c$. [^def4.1]
    - $a$: **divisor**, $b$: **multiple**.
- **Division with Remainder**: For integers $a, d$ with $d \neq 0$, unique integers $q, r$ exist where: [^thm4.1]
    - $a = q \cdot d + r$ and $0 \le r < |d|$.
    - **Note**: Remainder $r$ is always non-negative. Ex: $-27 = (-6) \cdot 5 + 3$.
    - Notation: $R_d(a)$ or $a \pmod d$.

## GCD & LCM

- **Greatest Common Divisor (GCD)**: GCD $d$ of $a, b$: [^def4.2]
    1. $d$ is a common divisor ($d|a \land d|b$).
    2. All other common divisors divide $d$.
    - **Key Idea**: "**Greatest**" refers to the **divisibility relation**, not $\le$ order.
    - `gcd(a,b)` is the **unique positive** GCD. [^def4.3]
- **Least Common Multiple (LCM)**: LCM $l$ of $a, b$: common multiple that divides all other common multiples. [^def4.5]
	- Calculate via GCD: $\text{lcm}(a,b) = \frac{|a \cdot b|}{\text{gcd}(a,b)}$
- **Euclidean Algorithm**:
    - **Principle**: $\text{gcd}(a,b) = \text{gcd}(b, a \pmod b)$. [^lem4.2]
    - **Procedure**: Repeatedly replace $(a,b)$ with $(b, a \pmod b)$ until the remainder is 0. The last non-zero remainder is the GCD.
    - **Example**: $\text{gcd}(252, 198)$:
        1. $\text{gcd}(252, 198) = \text{gcd}(198, 252 \pmod{198}) = \text{gcd}(198, 54)$
        2. $\text{gcd}(198, 54) = \text{gcd}(54, 198 \pmod{54}) = \text{gcd}(54, 36)$
        3. $\text{gcd}(54, 36) = \text{gcd}(36, 18)$
        4. $\text{gcd}(36, 18) = \text{gcd}(18, 0) \implies \text{gcd} = 18$.

## Ideals

- **Definition**: Ideal $(a,b)$: set of all integer linear combinations of $a, b$. [^def4.4]
    - $(a,b) = \{ua + vb \mid u,v \in \mathbb{Z}\}$.
- **Connection to GCD**: The ideal $(a,b)$ is the set of all multiples of $\text{gcd}(a,b)$. [^lem4.3] [^lem4.4]
    - **$(a,b) = (\text{gcd}(a,b))$**
- **Bézout's Identity & Extended Euclidean Algorithm**:
    - **Identity**: Since $\text{gcd}(a,b) \in (a,b)$, it can be written as a linear combination $\text{gcd}(a,b) = ua + vb$. [^cor4.5]
    - **Algorithm**: The Extended Euclidean Algorithm works backwards from the standard algorithm's steps to find the coefficients $u,v$.
        - **Example**: Find $u,v$ for $\text{gcd}(252, 198)=18$.
            1. Equations from Euclidean algorithm: $54 = 252 - 1 \cdot 198$; $36 = 198 - 3 \cdot 54$; $18 = 54 - 1 \cdot 36$.
            2. Substitute backwards: $18 = 54 - 1 \cdot (198 - 3 \cdot 54) = 4 \cdot 54 - 1 \cdot 198$.
            3. Continue: $18 = 4 \cdot (252 - 1 \cdot 198) - 1 \cdot 198 = 4 \cdot 252 - 5 \cdot 198$.
            4. Result: $u=4, v=-5$.

## Prime Numbers

- **Definition**: Positive integer $p > 1$ with only positive divisors 1 and $p$. [^def4.6]
- **Properties & Distribution**:
    - **Infinitude**: There are infinitely many primes. [^thm4.9]
    - **Gaps**: Can be arbitrarily large. [^thm4.10]
    - **Density**: The prime-counting function $\pi(x)$ counts primes $\le x$. [^def4.7] Density around $x$ is $\approx 1/\ln(x)$. [^thm4.11]
- **Open Conjectures**:
    - **Twin Prime**: Infinitely many prime pairs $p, p+2$. [^con4.1]
    - **Goldbach**: Every even integer $> 2$ is the sum of two primes. [^con4.2]

## Factorization

- **Composite Numbers**: An integer $> 1$ that is not prime. [^def4.6]
- **Fundamental Theorem of Arithmetic**: Every integer $n > 1$ has a **unique** prime factorization. [^thm4.6]
    - Relies on: if prime $p$ divides a product, it must divide a factor. [^lem4.7]
    - **Consequence**: Proofs of irrationality (e.g., $\sqrt{n}$ is irrational unless $n$ is a perfect square). [^thm4.8]
- **Primality Testing**: Simple method is trial division by primes up to $\sqrt{n}$. [^lem4.12]
- **Calculations via Prime Factorization**:
    - For $a = \prod p_i^{e_i}$ and $b = \prod p_i^{f_i}$:
        - $\text{gcd}(a,b) = \prod p_i^{\min(e_i, f_i)}$
        - $\text{lcm}(a,b) = \prod p_i^{\max(e_i, f_i)}$
    - **Identity**: $\text{gcd}(a,b) \cdot \text{lcm}(a,b) = |a \cdot b|$ because $\min(e,f) + \max(e,f) = e+f$.

## Modular Arithmetic

- **Congruence Relation**: $a \equiv b \pmod m$ if $m | (a-b)$. [^def4.8]
    - An **equivalence relation**. [^lem4.13]
    - Equivalent to $R_m(a) = R_m(b)$. [^lem4.16]
- **Properties**:
    - Compatible with addition and multiplication. [^lem4.14]
    - For any polynomial $f$, $f(a_1, \dots) \equiv_m f(R_m(a_1), \dots)$. [^cor4.15]
    - Allows reducing intermediate results in calculations modulo $m$. [^cor4.17]
- **The Ring $Z_m$**:
    - Set of remainders $\{0, \dots, m-1\}$ with modular addition/multiplication.
    - If an equation has no solution in $Z_m$, it has no integer solution in $\mathbb{Z}$.

## Solving Systems of Congruences

- **Multiplicative Inverse**: Integer $x$ where $ax \equiv_m 1$. [^def4.9]
    - Exists iff $\text{gcd}(a,m) = 1$. [^lem4.18]
    - Found via Extended Euclidean Algorithm.
    - **Example**: Find inverse of $5 \pmod{13}$.
        1. EEA on $(13,5)$ gives $1 = 2 \cdot 13 - 5 \cdot 5$.
        2. Modulo 13: $1 \equiv -5 \cdot 5 \pmod{13}$.
        3. Since $-5 \equiv 8 \pmod{13}$, the inverse is 8.
- **Chinese Remainder Theorem (CRT)**:
    - Solves a system $x \equiv a_i \pmod{m_i}$ for pairwise coprime moduli $m_i$. [^thm4.19]
    - Has **unique solution** modulo $M = \prod m_i$.
    - **Solution Formula**: $x \equiv \sum_{i=1}^r a_i M_i N_i \pmod M$, where:
        1. $M = \prod m_i$
        2. $M_i = M/m_i$
        3. $N_i$ = inverse of $M_i \pmod{m_i}$.

## Applications in Cryptography

- **One-Way Function**: Easy to compute, hard to reverse. Ex: $x \mapsto g^x \pmod p$.
- **Discrete Logarithm Problem (DLP)**: Given $y,g,p$, find $x$ in $y \equiv g^x \pmod p$. Believed hard.
- **Diffie-Hellman Key Exchange**: Establishes shared secret over public channel.
    1. **Public**: Prime $p$, base $g$.
    2. **Alice**: Secret $a \to$ public $A = g^a \pmod p$.
    3. **Bob**: Secret $b \to$ public $B = g^b \pmod p$.
    4. **Shared Secret**: $S = B^a \equiv A^b \equiv g^{ab} \pmod p$.

[^def4.1]: **Definition 4.1.** For integers $a$ and $b$ we say that $a$ divides $b$, denoted $a|b$, if there exists an integer $c$ such that $b=ac$. In this case, $a$ is called a divisor of $b$, and $b$ is called a multiple of $a$. If $a \ne 0$ and a divisor $c$ exists it is called the quotient when $b$ is divided by $a$, and we write $c = b/a$. We write $a \nmid b$ if $a$ does not divide $b$.
[^thm4.1]: **Theorem 4.1 (Euclid).** For all integers $a$ and $d \ne 0$ there exist unique integers $q$ and $r$ satisfying $a = dq+r$ and $0 \le r < |d|$.
[^def4.2]: **Definition 4.2.** For integers $a$ and $b$ (not both 0), an integer $d$ is called a greatest common divisor of $a$ and $b$ if $d$ divides both $a$ and $b$ and if every common divisor of $a$ and $b$ divides $d$, i.e., if $d|a \land d|b \land \forall c((c|a \land c|b) \to c|d)$.
[^def4.3]: **Definition 4.3.** For $a, b \in \mathbb{Z}$ (not both 0) one denotes the unique positive greatest common divisor by $\text{gcd}(a,b)$ and usually calls it the greatest common divisor. If $\text{gcd}(a,b)=1$, then $a$ and $b$ are called relatively prime.
[^def4.5]: **Definition 4.5.** The least common multiple $l$ of two positive integers $a$ and $b$, denoted $l=\text{lcm}(a,b)$, is the common multiple of $a$ and $b$ which divides every common multiple of $a$ and $b$, i.e., $a|l \land b|l \land \forall m((a|m \land b|m) \to l|m)$.
[^lem4.2]: **Lemma 4.2.** For any integers $m, n$ and $q$, we have $\text{gcd}(m, n-qm) = \text{gcd}(m,n)$.
[^def4.4]: **Definition 4.4.** For $a,b \in \mathbb{Z}$, the ideal generated by $a$ and $b$, denoted $(a,b)$, is the set $(a,b) \stackrel{\text{def}}{=} \{ua+vb \mid u,v \in \mathbb{Z}\}$. Similarly, the ideal generated by a single integer $a$ is $(a) \stackrel{\text{def}}{=} \{ua \mid u \in \mathbb{Z}\}$.
[^lem4.3]: **Lemma 4.3.** For $a,b \in \mathbb{Z}$ there exists $d \in \mathbb{Z}$ such that $(a,b)=(d)$.
[^lem4.4]: **Lemma 4.4.** Let $a,b \in \mathbb{Z}$ (not both 0). If $(a,b)=(d)$, then $d$ is a greatest common divisor of $a$ and $b$.
[^cor4.5]: **Corollary 4.5.** For $a,b \in \mathbb{Z}$ (not both 0), there exist $u,v \in \mathbb{Z}$ such that $\text{gcd}(a,b) = ua+vb$.
[^def4.6]: **Definition 4.6.** A positive integer $p > 1$ is called prime if the only positive divisors of $p$ are 1 and $p$. An integer greater than 1 that is not a prime is called composite.
[^thm4.9]: **Theorem 4.9.** There are infinitely many primes.
[^thm4.10]: **Theorem 4.10.** Gaps between primes can be arbitrarily large, i.e., for every $k \in \mathbb{N}$ there exists $n \in \mathbb{N}$ such that the set $\{n, n+1, \dots, n+k-1\}$ contains no prime.
[^def4.7]: **Definition 4.7.** The prime counting function $\pi: \mathbb{R} \to \mathbb{N}$ is defined as follows: For any real $x$, $\pi(x)$ is the number of primes $\le x$.
[^thm4.11]: **Theorem 4.11.** $\lim_{x\to\infty} \frac{\pi(x)\ln(x)}{x} = 1$.
[^con4.1]: **Conjecture 4.1.** There exist infinitely many twin primes, i.e., primes $p$ for which also $p+2$ is prime.
[^con4.2]: **Conjecture 4.2 (Goldbach).** Every even number greater than 2 is the sum of two primes.
[^thm4.6]: **Theorem 4.6.** Every positive integer can be written uniquely (up to the order in which factors are listed) as the product of primes.
[^lem4.7]: **Lemma 4.7.** If $p$ is a prime which divides the product $x_1 x_2 \cdots x_n$ of some integers $x_1, \dots, x_n$, then $p$ divides one of them, i.e., $p|x_i$ for some $i \in \{1, \dots, n\}$.
[^thm4.8]: **Theorem 4.8.** $\sqrt{n}$ is irrational unless $n$ is a square ($n=c^2$ for some $c \in \mathbb{Z}$).
[^lem4.12]: **Lemma 4.12.** Every composite integer $n$ has a prime divisor $\le \sqrt{n}$.
[^def4.8]: **Definition 4.8.** For $a, b, m \in \mathbb{Z}$ with $m \ge 1$, we say that $a$ is congruent to $b$ modulo $m$ if $m$ divides $a-b$. We write $a \equiv b \pmod m$ or simply $a \equiv_m b$, i.e., $a \equiv_m b \stackrel{\text{def}}{\iff} m|(a-b)$.
[^lem4.13]: **Lemma 4.13.** For any $m \ge 1, \equiv_m$ is an equivalence relation on $\mathbb{Z}$.
[^lem4.16]: **Lemma 4.16.** For any $a,b,m \in \mathbb{Z}$ with $m \ge 1$, (i) $a \equiv_m R_m(a)$. (ii) $a \equiv_m b \iff R_m(a)=R_m(b)$.
[^lem4.14]: **Lemma 4.14.** If $a \equiv_m b$ and $c \equiv_m d$, then $a+c \equiv_m b+d$ and $ac \equiv_m bd$.
[^cor4.15]: **Corollary 4.15.** Let $f(x_1, \dots, x_k)$ be a multi-variate polynomial in $k$ variables with integer coefficients, and let $m \ge 1$. If $a_i \equiv_m b_i$ for $1 \le i \le k$, then $f(a_1, \dots, a_k) \equiv_m f(b_1, \dots, b_k)$.
[^cor4.17]: **Corollary 4.17.** Let $f(x_1, \dots, x_k)$ be a multi-variate polynomial in $k$ variables with integer coefficients, and let $m \ge 1$. Then $R_m(f(a_1, \dots, a_k)) = R_m(f(R_m(a_1), \dots, R_m(a_k)))$.
[^def4.9]: **Definition 4.9.** If $\text{gcd}(a,m)=1$, the unique solution $x \in Z_m$ to the congruence equation $ax \equiv_m 1$ is called the multiplicative inverse of $a$ modulo $m$. One also uses the notation $x \equiv_m a^{-1}$ or $x \equiv_m 1/a$.
[^lem4.18]: **Lemma 4.18.** The congruence equation $ax \equiv_m 1$ has a solution $x \in Z_m$ if and only if $\text{gcd}(a,m)=1$. The solution is unique.
[^thm4.19]: **Theorem 4.19.** Let $m_1, m_2, \dots, m_r$ be pairwise relatively prime integers and let $M=\prod_{i=1}^r m_i$. For every list $a_1, \dots, a_r$ with $0 \le a_i < m_i$ for $1 \le i \le r$, the system of congruence equations $x \equiv_{m_1} a_1$, $x \equiv_{m_2} a_2$, ..., $x \equiv_{m_r} a_r$ for $x$ has a unique solution $x$ satisfying $0 \le x < M$.
