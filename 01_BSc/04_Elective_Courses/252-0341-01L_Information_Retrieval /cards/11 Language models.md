## How do concepts translate from **Theoretical Computer Science (TCS)** to **Information Retrieval (IR)**?

- **Letters / Characters** (TCS) \(\rightarrow\) **Terms / Words** (IR).
- **Words / Strings** (TCS) \(\rightarrow\) **Documents** (IR).

## What is a **Language Model (LM)**?

- A **probabilistic function** that creates a distribution over vocabulary strings.
- The sum of all generated string probabilities equals exactly \(1\).

## What is a **Finite State Automaton (FSA)** and how does it generate probabilities?

- **Definition**: Theoretical graph for recognizing/generating regular languages.
- **Components**:
    - **States** (nodes).
    - **Transitions** (edges).
    - **Start state** and **Accept/Stop state**.
- **Probability Rules**:
    - Outgoing transition probabilities must sum to \(1\) per node.
    - **Generation Probability**: Calculated as the product of all transition probabilities along the path until the stop state.

## What is **The Chain Rule** in generative document models?

- The exact decomposition of sequence generation (makes absolutely no independence assumptions).
- **Formula**:
  \[P(D = (d\_1, d\_2, d\_3)) = P(L\_D \ge 1) \times P(D\_1 = d\_1 | L\_D \ge 1) \times \dots\]
- **Requirement**: Needs a **stopping condition** (\(p\_{stop}\)) to terminate the sequence generation.

## What is the **Markov Assumption** and how does it define **K-Gram Models**?

- **Markov Assumption**: Limits memory complexity by assuming the probability of a term depends *only* on the previous \(k\) terms.
- **Bigram Model**:
    - Remembers \(1\) previous term (\(P(d\_k | d\_{k-1})\)).
    - Uses an FSA with exactly one state per vocabulary word.
- **Unigram Model**:
    - Employs **zero memory**.
    - Assumes complete term independence (\(P(d\_k)\)).

## What is the **Bias-Variance Tradeoff** regarding higher-order language models in IR?

- Higher-order models capture local structure better.
- **IR Reality**: IR exclusively relies on **Unigrams**.
- **Reason**: Individual documents suffer from severe **data sparseness**, making higher-order estimations highly inaccurate.

## What are the characteristics of **List of Words Semantics**?

- Exact sequence and **order matter** (\(D \in \Omega \rightarrow \mathcal{T}^{\*}\)).
- **Unigram List Probability Formula**:
  \[P(D=d) = p\_{stop} (1 - p\_{stop})^{L\_d} \prod\_t p\_t^{tf\_{t,d}}\]
- **Key Insight**: Despite strict order rules, the formula relies purely on multiplication and **Term Frequency (TF)** powers. Therefore, shuffled permutations mathematically yield the **exact same probability**.

## What are the characteristics of **Bag of Words Semantics** and its mathematical distribution?

- Sequence and **order are completely ignored** (\(D' \in \Omega \rightarrow \mathbb{N}^\mathcal{W}\)).
- Documents act as equivalence classes (all shuffles are grouped together).
- Relies on the **Multinomial Distribution**: Scales the unigram list probability by combinatorics (total number of permutations).
    - **Combinatorics formula**: \(\frac{(\sum\_t k\_t)!}{\prod\_t k\_t!}\) (where \(k\_t\) is term frequency).
- **Probability Formula**:
  \[P(D=d | L\_D = L\_d) = \frac{L\_d!}{\prod\_t tf\_{t,d}!} \prod\_t p\_t^{tf\_{t,d}}\]

## What is the core concept of the **Query Likelihood Model (QLM)**?

- **Goal**: Ranks documents based purely on the probability that a document's language model (\(M\_d\)) would generate the user's query (\(q\)).

## How is the **Query Likelihood Model (QLM)** derived using Bayes' rule?

- **Inversion**: \(P(D=d | Q=q) = \frac{P(Q=q | D=d) \times P(D=d)}{P(Q=q)}\).
- **Denominator**: \(P(Q=q)\) is constant across all documents and is **ignored**.
- **Prior Probability**: \(P(D=d)\) is typically assumed to be a **uniform prior** and ignored (though advanced systems might use PageRank or document length).
- **Result**: Document ranking depends solely on the **Query Likelihood** (\(P(Q=q | D=d)\)).

## What is the mathematical connection between the **Query Likelihood Model (QLM)** and the **Vector Space Model**?

- Applying a logarithm converts the multinomial product into a **linear sum**.
- This results in a **scalar product** between query **Term Frequency (TF)** and document **TF**:
  \[\log P(Q=q | D=d) = C + \sum\_t tf\_{t,q}(\log tf\_{t,d} - \log L\_d)\]
- **Major IR Insight**: **Language models** justify **Term Frequency (TF)**, whereas **Probabilistic models** (like BIM) justify **Inverse Document Frequency (IDF)**.

## What is the **Maximum Likelihood Estimate (MLE)** and the associated **Zero Probability Problem**?

- **MLE Definition**: Raw unigram probabilities derived directly from observed document text.
    - **Formula**: \(P\_{mle}(t|M\_d) = \frac{tf\_{t,d}}{L\_d}\)
- **The Zero Probability Problem**: Missing query terms result in a \(0\) probability.
    - Causes **strict conjunctive semantics** (a single missing term drops the entire document score to \(0\)).
    - Severely overestimates the probability of chance single-occurrence terms.

## What is **Linear Interpolation (Jelinek-Mercer)** in language model smoothing?

- **Purpose**: Reassigns probability mass from observed words to unseen words to fix zero probabilities.
- **Mechanism**: Mixes the document's MLE with a global **Collection Model** (\(M\_c\)).
- **Formula**:
  \[P(t|d) = \lambda P\_{mle}(t|M\_d) + (1 - \lambda) P\_{mle}(t|M\_c)\]
- **Parameter**: Controlled by the mixing weight \(\lambda \in (0, 1)\).

## What is **Bayesian Smoothing (Dirichlet Prior)** and its secondary mathematical effect?

- **Mechanism**: Uses the global collection model as a prior probability distribution for the document.
- **Formula**:
  \[P(t|d) = \frac{tf\_{t,d} + \alpha P\_{mle}(t|M\_c)}{L\_d + \alpha}\]
- **Secondary Effect**: Beyond fixing zero probabilities, smoothing mathematically implements an **IDF-like effect** (heavily rewards terms that are rare in the global collection but present in the local document).

## What are the **Extended Language Modeling Approaches** in IR?

- **Document Likelihood Model**: Reverses QLM to generate documents from a **Query Language Model** (\(M\_q\)). Highly useful for integrating **Relevance Feedback** (expanding \(M\_q\) via relevant docs).
- **Model Comparison**: Builds probabilistic models for both query (\(M\_q\)) and document (\(M\_d\)), measuring distance via **Kullback-Leibler (KL) Divergence** (calculates how bad \(M\_q\) models \(M\_d\)).
- **Translation Models**: Translates document terms into query terms (\(T(t|v)\)) via external dictionaries to handle vocabulary mismatches (e.g., synonymy, cross-language IR).
