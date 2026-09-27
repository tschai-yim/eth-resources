## What are the structural models of **Data Shapes**?

- **Tables**: Relational model (SQL).
- **Trees**: XML / JSON (denormalized tables).
- **Graphs**: Graph databases (nodes and edges).
- **Cubes**: Business Intelligence (multi-dimensional).
- **Text Vectors**: Unstructured text data (**IR focus**).

## What are the base units in **Text Data Models**?

- **Document**: Base unit of retrieval (e.g., book, email, web page).
- **Term**: Indexed unit / extracted word.

## What are the types of **Term-Document Relationships**?

- **Set of terms**: **Inclusion** only (presence/absence).
- **Bag of terms / Multiset**: **Inclusion** and **occurrence** (frequency), no order.
- **List of terms**: **Inclusion**, **occurrence**, and **order** (position).

## What is the difference between **Information Need** and **Query** when evaluating a system's effectiveness?

- **Information Need**: Actual intent inside user's brain (e.g., climate impact on butterflies).
- **Query**: Imperfect string representation of need.
- **Evaluation**: Targets **need**, not **query**.

## How are **IR Results Classified** (Positives/Negatives)?

- **True Positives (TP)**: Returned and relevant (desired).
- **False Positives (FP)** / **Type I Error**: Returned but not relevant (waste).
- **False Negatives (FN)** / **Type II Error**: Not returned but relevant (missed).
- **True Negatives (TN)**: Not returned and not relevant.

## What are the **Evaluation Metrics** for IR systems?

- **Precision**: Fraction of **returned results** being relevant: \\(TP / (TP + FP)\\).
- **Recall**: Fraction of **existing relevant documents** found: \\(TP / (TP + FN)\\).

## What is the **Precision-Recall Trade-off**?

- High precision and high recall simultaneously is **difficult**.
- Trade-off is tuned based on the **acceptable error type** (e.g., missing a result vs. showing junk).

## What is **Grepping** and its features?

- **Definition**: Linear line-by-line file scanning (Unix `grep`).
- **Features**:
    - **Regular expressions** (e.g., `[a-z]+`).
    - **Wildcards** (e.g., `.*`).
    - Piping (`|` for AND).
    - Flags (`-v` for NOT).

## What are the shortcomings of **Grepping**?

- **No Ranking**: Output strictly by file order; no relevance sorting.
- **No Proximity**: Cannot search physical closeness (e.g., "NEAR").
- **Scaling**: Linear time \\(O(n)\\); fails on massive collections (Web).

## What is the structure of a **Term-Document Incidence Matrix**?

**2D boolean representation** of **Set of terms** model:

- **Columns**: **Documents**.
- **Rows**: **Terms**.
- **Cells**: `1` if term present, `0` otherwise.

## How are queries executed in an **Incidence Matrix**?

- **Single term**: Read row vector (\\(O(n)\\) complexity).
- **NOT**: Bitwise NOT (flip `1`s/`0`s).
- **AND**: Bitwise AND product.
- **OR**: Bitwise OR addition.

## What is the **Sparsity Problem** in Incidence Matrices?

- Matrices are gigantic (e.g., billions of Booleans).
- Typical document has relatively few terms \\(\rightarrow\\) **99.8% empty**.
- Highly **space-inefficient**.

## What is an **Inverted Index** and its components?

- **Definition**: Core IR structure; maps terms to documents (solves sparsity).
- **Components**:
    - **Dictionary**: All unique terms in memory (fast lookup).
    - **Document ID (docID)**: Unique serial number per document.
    - **Postings list**: Sorted list of docIDs containing the term (on disk).
    - **Document Frequency**: Length of postings list; stored at list head.

## What are the steps to construct an **Inverted Index**?

1. **Tokenize** raw text.
2. Apply **Linguistic pre-processing** (normalization, punctuation removal).
3. Create `[term, docID]` pairs.
4. **Sort** alphabetically by term.
5. **Merge** duplicates into single **postings list** per term.
6. Add **document frequency** to dictionary.

## How does the **Boolean Intersection Algorithm (AND)** work?

- **Logic**:
    - Initialize **two pointers** at list heads.
    - If values **equal**: Output docID, advance both.
    - If **not equal**: Advance pointer of **smaller docID**.
- **Complexity**: Linear **\\(O(x+y)\\)** (sum of list lengths).

## How does the **Boolean Union Algorithm (OR)** work?

- Initialize **two pointers**.
- If values **equal**: Output docID once, advance both.
- If **not equal**: Output **smaller docID**, advance its pointer.

## What is the primary heuristic for **Query Optimization** in Boolean retrieval?

- Process terms by **increasing document frequency**.
- **Intersect smallest lists first**.
- **Benefits**:
    - Keeps intermediate memory results minimal.
    - Accelerates termination (result set shrinks faster).
- **OR size estimation**: Sum frequencies of component terms; process complex queries by sorting these sizes.

## What is the structure of the **Simple Boolean Language** (Grammar)?

Formalized via **Context-Free Grammar (EBNF)**:

```
PrimaryExpr ::= Term | "(" Expr ")"
NotExpr ::= "NOT"? PrimaryExpr
AndExpr ::= NotExpr ("AND" NotExpr)*
Expr ::= AndExpr ("OR" AndExpr)*
```
