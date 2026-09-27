## What is the primary goal when evaluating an **Information Retrieval (IR)** system?

- To optimize **Relevance**.
- To maximize **Customer benefit**.

## What are the three required components of a **Test Collection** for evaluating an IR system?

- **Document collection**.
- **Test suite** of information needs.
- **Relevance judgments** (binary assessment of relevant/non-relevant) forming a **Gold standard** / **Ground truth**.

## What are examples of standard **IR Evaluation Datasets** (from early to modern)?

- **Cranfield**: Small, early dataset (1,398 documents) with exhaustive human judgments.
- **TREC**: Large dataset (1.89M documents) maintained by NIST.
- **GOV2**: Massive web dataset (25M pages).
- **NTCIR** / **CLEF**: Specialized datasets used for **cross-language** evaluation.

## What is **Pooling** in the context of IR evaluation?

- **Definition**: Evaluation strategy used for **massive collections**.
- **Execution**: Domain experts manually assess only a **pooled subset** (the top \\(k\\) documents returned by multiple competing systems) instead of exhaustively reviewing the entire collection.

## What is the **Kappa Statistic** in IR evaluation?

A metric that measures **agreement between human judges** on relevance assessments, mathematically correcting for expected **chance agreement**.

## What is **Specificity** in evaluating IR systems?

- The fraction of **non-relevant documents properly ignored** by the system.
- **Formula**: \\(TN / (TN + FP)\\).

## What is **Accuracy** and why is it severely flawed for evaluating IR systems?

- **Definition**: Fraction of all correct classifications: \\((TP + TN) / (TP + FP + FN + TN)\\).
- **Flaw**: Completely useless due to **massive data skew** (the collection typically contains >99.9% True Negatives).
- **Hacking**: A system can easily achieve 99% accuracy simply by **returning nothing**.

## How can a system exploit or **hack Recall**?

By **returning everything** (every single document in the collection), achieving 100% recall while completely destroying precision.

## What is the **F-Measure (F-Score)** and its primary purpose?

- A single evaluation metric that trades off **Precision** and **Recall**.
- **Purpose**: Prevents independent metric hacking (e.g., maximizing Recall by returning all documents).

## Why does the **F-Measure** use the **Harmonic Mean** instead of the arithmetic mean?

To heavily penalize **extreme discrepancies** between metrics (e.g., if Recall is 100% but Precision is ~0%, the harmonic mean appropriately drops the final combined score near 0).

## What is the general formula for the **F-Measure** (\\(F\_{\\alpha}\\))?

\\[F\_{\\alpha} = \\frac{1}{\\frac{\\alpha}{P} + \\frac{1-\\alpha}{R}} = \\frac{(\\beta^2 + 1)PR}{\\beta^2P + R}\\]

- Note: \\(\\beta^2 = \\frac{1-\\alpha}{\\alpha}\\).

## How are the weights configured for **Balanced**, **Precision-heavy**, and **Recall-heavy** F-Measures?

- **Balanced (\\(F\_1\\))**: Equal weighting (\\(\\alpha = 0.5\\), \\(\\beta = 1\\)). Simplifies to \\(\\frac{2PR}{P+R}\\).
- **Precision-heavy**: \\(\\beta < 1\\) (or \\(\\alpha > 0.5\\)).
- **Recall-heavy**: \\(\\beta > 1\\) (or \\(\\alpha < 0.5\\)).

## How does retrieving different document types affect the trajectory of a **Precision-Recall Curve**?

Iterating down a ranked list produces a distinctive **saw-tooth shape**:

- **Retrieving relevant**: Moves the curve **up and right** (Precision \\(\\uparrow\\), Recall \\(\\uparrow\\)).
- **Retrieving irrelevant**: Moves the curve **straight down** (Recall is stable, Precision \\(\\downarrow\\)).

## What is **Interpolated Precision** in a Precision-Recall Curve?

- A monotonically decreasing curve that mathematically removes "jiggles" (saw-tooth drops).
- **Formula**: \\(p\_{interp}(r) = \\max\_{r' \\ge r} p(r')\\).
- **Logic**: Looks ahead to the **maximum precision** achieved at any future recall level.

## What is **11-Point Interpolated Average Precision**?

A single-figure metric that averages the **interpolated precision** across exactly 11 fixed recall levels (from \\(0.0\\) to \\(1.0\\)) across all evaluated queries.

## What is **Mean Average Precision (MAP)**?

- A single-figure metric averaging precision exactly at ranks containing **relevant documents**.
- **Macro-averaged** across all queries.
- Roughly corresponds to the exact area under the un-interpolated Precision-Recall curve.

## What is **Precision at \\(k\\)** and what is its primary limitation?

- **Definition**: Measures precision at a fixed low depth (e.g., top 10 results).
- **Use case**: Highly applicable and useful for **web search**.
- **Limitation**: Unstable because it entirely **ignores total existing relevant documents** within the collection.

## What is **R-Precision** and how is it visually represented?

- **Definition**: Precision evaluated exactly at rank \\(k = |Rel|\\) (the total number of known relevant documents in the collection).
- **Key Property**: At this exact rank, **Precision mathematically equals Recall**.
- **Visualization**: Seen as the **Break-even point** (the intersection with the \\(P=R\\) ray extending from the origin).

## What are the axes and the optimal point (sweet spot) of an **ROC Curve**?

- **Y-axis**: **Sensitivity** (Recall / True Positive Rate).
- **X-axis**: **\\(1 - \\text{Specificity}\\)** (False Positive Rate).
- **Sweet Spot**: **Top-left corner** (High sensitivity, low false positive rate).

## How can engines with completely inverted **ROC Curves** be fixed?

Systems whose curves sit at the bottom-right edge can become highly effective engines simply by **reversing their boolean outputs**.

## What are the characteristics of **Normalized Discounted Cumulative Gain (NDCG)**?

- Handles **non-binary** (graded) relevance scores.
- **Discounts the value** of results positioned further down the list to explicitly model user drop-off.

## What are additional, non-mathematical **System Metrics** used to evaluate IR systems?

- **Speed** (index construction time, query processing latency).
- **Size** (collection volume, index footprint).
- **Query language expressiveness**.
- **Snippets**: High-quality document summaries generated from cached prefixes. Significantly impacts actual user utility.
