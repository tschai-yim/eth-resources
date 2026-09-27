## What are the fundamental sets and outcomes in **Probability Theory**?

- **Universe** (\\(\Omega\\)): The set of all possible worlds or outcomes.
- **Elementary event** (\\(\omega\\)): A specific, singular outcome (\\(\omega \in \Omega\\)).
- **Event** (\\(E\\)): A specific subset of the universe (\\(E \subset \Omega\\)). The probability \\(P(E)\\) is the sum of its elementary probabilities.
- **Complement** (\\(\bar{E}\\)): The non-occurrence of an event, calculated as \\(P(\bar{E}) = 1 - P(E)\\).

## What is a **Discrete probability distribution** (\\(P\\))?

- **Definition**: A mathematical function \\(P: \Omega \rightarrow [0, 1]\\).
- **Rules**:
    - Probabilities cannot be negative.
    - The sum of all probabilities in the universe must equal exactly \\(1\\) (\\(\sum_{\omega \in \Omega} P(\omega) = 1\\)).

## What are **Odds** in probability theory?

- **Definition**: The ratio of an event's occurrence vs. its non-occurrence.
- **Formula**: \\(O_P(E) = \frac{P(E)}{P(\bar{E})}\\).
- **Example**: A probability of \\(1/3\\) yields odds of \\(0.5\\).

## What are the core calculation rules for **Union** and **Partition** probabilities?

- **Union**: \\(P(E \cup F) = P(E) + P(F) - P(E \cap F)\\).
- **Partition rule**: \\(P(E) = P(E \cap F) + P(E \cap \bar{F})\\).

## What are the core calculation rules for **Conditional probability** and the **Chain rule**?

- **Conditional probability**: \\(P(E|F) = \frac{P(E \cap F)}{P(F)}\\).
- **Chain rule**: \\(P(E \cap F) = P(E|F) \times P(F)\\).

## What is the fundamental difference between **Disjoint** and **Independent** events?

- **Disjoint events**: Have no intersection (\\(P(E \cap F) = 0\\)). Their union is strictly the sum of individual probabilities.
- **Independent events**: The occurrence of one does not affect the other (\\(P(E|F) = P(E)\\)). Their intersection is strictly the product (\\(P(E \cap F) = P(E) \times P(F)\\)).

## What is a **Random variable** and what is its correct notation?

- **Definition**: A strict **deterministic function** (\\(X: \Omega \rightarrow S\\)) mapping outcomes to a target set. (They are neither random nor variables).
- **Notation Warning**: Mathematically nonsensical to write \\(P(x)\\) or \\(P(x|y)\\).
- **Correct Notation**: Always state the random variable explicitly (e.g., \\(P_X(x)\\) or \\(P(X=x)\\)).

## How are **Joint** and **Conditional probabilities** calculated for Random variables?

- **Joint probabilities**: Evaluated over intersecting conditions: \\(P(X=x \land Y=y)\\).
- **Conditional probabilities**: Calculated using the intersection divided by the condition:
    - \\(P(X=x | Y=y) = \frac{P(X=x \land Y=y)}{P(Y=y)}\\).

## What is **Bayes' Theorem** and its formula?

- **Purpose**: Allows the inversion of conditional probabilities.
- **Formula**:
    - \\[P(A|B) = \frac{P(B|A) \times P(A)}{P(B)}\\]

## What is the difference between a **Prior** and a **Posterior** probability?

- **Prior**: The initial probability estimate before observing any new evidence (e.g., \\(P(\text{rain})\\)).
- **Posterior**: The updated probability after observing new evidence (e.g., \\(P(\text{rain} | \text{umbrella})\\)).

## What is the **Bertrand Paradox** and how is it solved using Bayes' Theorem?

- **Scenario**: Three boxes: Box A (2 Toblerones), Box B (1 Toblerone, 1 Luxembourgerli), Box C (2 Luxembourgerlis).
- **Action**: Blindly pick a random candy. It is a Luxembourgerli (\\(L\\)).
- **Question**: What is the probability the other candy is also \\(L\\) (i.e., you picked Box C)?
- **Solution**:
    - \\(P(C|L) = \frac{P(L|C) \times P(C)}{P(L)}\\)
    - \\(= \frac{1 \times (1/3)}{1/2} = 2/3\\).

## How is the **Document Retrieval Universe** modeled using random variables?

- **Query** (\\(Q\\)): The string input.
- **Document** (\\(D\\)): The document object.
- **Relevance** (\\(R\\)): A Boolean value (True/False or 1/0).

## What is the **Probability Ranking Principle (PRP)**?

- **Definition**: The optimal retrieval strategy ranks documents by their decreasing estimated probability of relevance.
- **Formula**: Order by \\(P(R=1 | D=d \land Q=q)\\).

## What is the **1/0 Loss Case** in the Probability Ranking Principle?

- Assumes **binary relevance**.
- A system loses a point for returning a non-relevant document or missing a relevant document.
- The PRP mathematically minimizes this expected loss (**Bayes risk**).

## How does **Boolean Retrieval** act as a fallback to the Probability Ranking Principle?

- Returns an unranked set where the probability of relevance is \\(> 1/2\\) (meaning **odds \\(> 1\\)**).
- Acts as a bridge that maps continuous probabilistic scores into strict inclusion/exclusion sets.

## How are documents and queries represented in the **Binary Independence Model (BIM)**?

They are modeled as **Boolean incidence vectors** (e.g., sets of words represented as \\(0, 1, 0, 1, 1...\\)).

## What are the variable definitions for **\\(p_k\\)** and **\\(u_k\\)** in the Binary Independence Model?

- **\\(p_k\\)**: The probability a term is present given the document is **relevant** (\\(P(D_k=1 | R=1)\\)).
- **\\(u_k\\)**: The probability a term is present given the document is **non-relevant** (\\(P(D_k=1 | R=0)\\)).

## What are the three simplifying assumptions of the **Binary Independence Model (BIM)**?

- **Naive Bayes Assumption**: Terms occur **independently** in documents, even when conditioned on relevance or query.
- **Terms not in query**: Assumed to be equal in relevant and non-relevant documents (\\(p_k = u_k\\)). This allows dropping non-query terms from calculations.
- **Non-contextuality**: The presence of other query terms has no impact, dropping \\(q\\) dependencies.

## Why are the **Odds Trick** and **Log Transformation** used in the Binary Independence Model?

- **Odds Trick**: Direct calculation of \\(P(R=1 | D=d \land Q=q)\\) yields an impossible denominator. Calculating **Odds** cancels out the complex denominator.
- **Log Transformation**: Applying logarithms converts the resulting multiplicative odds product into a **linear sum**, allowing constants to be discarded.

## What is the formula for the **Retrieval Status Value (RSV)** in the Binary Independence Model?

- **Formula**: \\(RSV_d = \sum_{k|d_k=1 \land q_k=1} c_k\\)
- **Weight (\\(c_k\\))**: \\(\log \frac{p_k}{1-p_k} - \log \frac{u_k}{1-u_k}\\)
    - First log: Odds of term \\(k\\) in relevant docs.
    - Second log: Odds of term \\(k\\) in non-relevant docs.
- **Architecture**: It is evaluated as a **scalar product** (\\(\vec{q} \cdot \vec{d}\\)), matching the Vector Space Model.

## What are the parameters of the **Contingency Table** used for weight estimation in BIM?

Estimates the corpus variables \\(p_k\\) and \\(u_k\\) based on:

- **\\(N\\)**: Total documents.
- **\\(S_k\\)**: Total known relevant documents.
- **\\(df_k\\)**: Number of documents containing term \\(k\\).
- **\\(s_k\\)**: Number of relevant documents containing term \\(k\\).

## How are the probabilities **\\(p_k\\)** and **\\(u_k\\)** initially estimated and why is **Smoothing** applied?

- **\\(p_k\\)**: \\(\frac{s_k}{S_k}\\)
- **\\(u_k\\)**: \\(\frac{df_k - s_k}{N - S_k}\\)
- **Smoothing**: Adding \\(0.5\\) (Maximum A Posteriori estimation) to all counts prevents mathematical zero-division errors.

## How does the Binary Independence Model mathematically justify **Inverse Document Frequency (IDF)**?

- **Assumption 1**: The odds of a query term appearing in a relevant document (\\(p_k\\)) are a constant (e.g., \\(0.5\\)). The first log term (\\(\log \frac{p_k}{1-p_k}\\)) evaluates to \\(0\\).
- **Assumption 2**: Most documents are non-relevant (\\(S_k, s_k \ll df_k, N\\)).
- **Result**: The remaining second log term (\\(-\log \frac{u_k}{1-u_k}\\)) mathematically approximates directly to \\(\log \frac{N}{df_k}\\) (**IDF**).

## What is the **Final IDF Formula** derived from the Binary Independence Model?

\\[RSV_d = \sum_{k|d_k=1 \land q_k=1} \log \frac{N}{df_k}\\]

## What are the iterative steps of the **Relevance Feedback Loop**?

1. **Execute query**: Run input using initial base weights.
2. **User judgment**: Display results and have the user manually mark documents.
3. **Partition**: Split results into a relevant set (**\\(VR\\)**) and a non-relevant set (**\\(VNR\\)**).
4. **Update and loop**: Recalculate posterior probabilities and re-execute.

## What are the three methods for updating the posterior estimate **\\(p_k^{(s+1)}\\)** in Relevance Feedback?

- **Raw estimation**: \\(\frac{|VR_k|}{|VR|}\\) (Relevant docs with term \\(k\\) / Total relevant docs).
- **Smoothed estimation**: \\(\frac{|VR_k| + 0.5}{|VR| + 1}\\).
- **Bayesian updating**: \\(\frac{|VR_k| + \kappa p_k^{(s)}}{|VR| + \kappa}\\).

## What is the role of **Inertia (\\(\kappa\\))** in Bayesian updating?

- **Definition**: A tuning parameter (pseudo-count, e.g., \\(\kappa=5\\)).
- **Purpose**: Reflects confidence in the prior estimate (\\(p_k^{(s)}\\)). A higher \\(\kappa\\) prevents sudden, erratic weight shifts caused by small or noisy user feedback sets.
