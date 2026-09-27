## What are the features and limitations of **Hash Tables** for dictionary search?

- **Features**:
    - Uses a **hash function** to map terms to integers.
    - Instant lookup time: **\\(O(1)\\)**.
- **Limitations**:
    - **No range queries**: Cannot query alphabetical intervals (e.g., `a` to `c`).
    - **Collisions**: Imperfect functions require linked lists; degrades performance.
    - **Space constraints**: Requires high memory allocation to minimize collisions.

## What are the characteristics and limitations of **Binary Search Trees**?

- **Structure**: Left branch strictly lower, right strictly greater.
- **Lookup time**: **\\(O(\log n)\\)**.
- **Disk Limitation**: Highly **inefficient** for disk blocks (e.g., 4KB) because it reads too little data per node.

## What is the structure of **B+-trees**?

Standard Relational Database Tree:

- **Leaves only**: **Postings lists** are strictly on leaves; internal nodes are purely routing pivots.
- **Balanced**: All leaves sit at the **same depth**.
- **Extra leaf pointers**: Leaves form a **doubly-linked list** for bidirectional linear traversal (enables range queries).

## What are the **Degree Rules** for **B+-trees** and the typical **scale**?

- Defined by parameter **\\(d\\)**.
- **Internal nodes**: Must have between **\\(d+1\\)** and **\\(2d+1\\)** children (equals \\(d\\) to \\(2d\\) keys).
- **Exception**: The **root node** is allowed to have fewer than \\(d+1\\) children.
- **Scaling**: Typically sized at **101-201 children** (\\(d=100\\)) to align node size perfectly with physical disk blocks.

## How do **B+-trees** handle operations?

- **Insertion**: Splits node and propagates upwards if it exceeds **\\(2d+1\\)** children.
- **Deletion**: Merges with neighboring nodes if it falls below **\\(d+1\\)** children.

## How are **Trailing** and **Leading Wildcard Queries** executed?

- **Trailing** (e.g., `Math*`):
    - **Easiest execution**.
    - Performs direct alphabetical range query (e.g., `Math` to `Mati`) on a standard **B+-tree**.
- **Leading** (e.g., `*ics`):
    - Fails on a standard B+-tree.
    - **Solution**: Build an additional **Reverse B+-tree** (terms indexed backwards). Query runs as a trailing wildcard (`sci*`).

## How are **Single/Middle Wildcard Queries** executed and what is the issue?

- **Example**: `stati*tics`
- **Rewrite strategy**:
    - Query `stati*` on standard B+-tree.
    - **AND** query `*tics` on reverse B+-tree.
    - Compute **Intersection**.
- **Limitation**: Generates **False positives** (e.g., matches `statics`). Requires expensive **Post-filtering**.

## What is the **Permuterm Index** and how is it constructed?

- **Goal**: Handle wildcards natively without post-filtering.
- **Construction**:
    - Append end-of-word symbol **`$`** to all terms (e.g., `plant$`).
    - Generate all **Rotations** (e.g., `$plant`, `t$plan`, `nt$pla`).
    - Store all rotations as keys in a single **B+-tree** that points to the original term.

## How are queries executed in a **Permuterm Index**?

- **Process**: Rotate the query until the `*` symbol is at the end.
- **Example**: `pl*t` \\(\rightarrow\\) `pl*t$` \\(\rightarrow\\) `t$pl*`.
- **Execution**: Run a standard trailing wildcard lookup on the B+-tree.

## What is a **K-gram Index** and its optimal sizes?

- **k-gram**: A sliding window of \\(k\\) characters, including `$` for word boundaries (e.g., 3-grams for `computer`: `$co`, `com`, `omp`, ..., `er$`).
- **Optimal Sizes**: **2, 3, or 4-grams**. (1-grams are useless; 6+ grams consume too much space).
- **Index Structure**: A B+-tree of unique k-grams pointing to terms containing them.

## How is **Wildcard Matching** performed using a **K-gram Index**?

1. **Split query** into valid k-grams (e.g., `co*ter` \\(\rightarrow\\) `$co` AND `ter$`).
2. **Intersect** the postings of those k-grams.
3. **Must Post-filter**: Intersection guarantees \\(k\\)-gram presence but not order/exact match (e.g., `co*ter` falsely matches `copter`).

## What are the principles and implementation strategies for **Spelling Correction**?

- **Principles**:
    - Select the **nearest correct spelling**.
    - **Tie-breaker**: Select the most common term (using document frequency or user logs).
- **Implementation Strategies**:
    - **Always query**: Implicitly search corrected terms.
    - **Only query if missing**: Trigger correction if original yields zero/few results.
    - **Suggest**: Prompt the user ("Did you mean?").

## What is **Minimum Edit Distance (Levenshtein)**?

- **Definition**: The minimum number of edits to transform string \\(A\\) into string \\(B\\).
- **Valid Operations**: **Insert**, **Delete**, **Substitute**, **Do nothing**.
- **Computation**: Solved via a **Dynamic Programming** matrix in **\\(O(m \cdot n)\\)** polynomial time.

## What is the **Scaling Problem** of Minimum Edit Distance?

- **Issue**: Running \\(O(m \cdot n)\\) algorithms against an entire dictionary (e.g., 500,000 terms) is **computationally unfeasible**.
- **Solution**: Pre-select a very small **candidate subset** using faster heuristics before applying Edit Distance.

## What is the **Jaccard Coefficient**?

- **Definition**: Mathematical measure of set overlap.
- **Formula**: **\\(|A \cap B| / |A \cup B|\\)**.
- **Range**: **\\(0\\)** to **\\(1\\)**.
- **Use in IR**: Assumes terms with a small edit distance will naturally share **many k-grams**.

## How is the **Jaccard Coefficient** used to speed up spelling correction?

1. **Extract** k-grams from the misspelled query.
2. **Look up** candidate terms in the **k-gram index**.
3. Compute the **Jaccard coefficient** and keep only terms above a set threshold.
4. Run the expensive **Edit Distance** algorithm *only* on this pre-selected subset.

## What is the computational shortcut for finding the Union in the **Jaccard Coefficient**?

**Formula**:

\\(|A \cup B| =\\) **# query k-grams** \\(+\\) **# found term k-grams** \\(-\\) **# intersection**.

- **Why it's fast**: Found term counts are pre-stored; intersection counts equal the number of index hits.

## What is **Context-Sensitive Spelling Correction**?

- **Purpose**: Fixes terms that are spelled correctly but are contextually wrong (e.g., `graduate form ETH`).
- **Heuristic Strategy**: Look up surrounding **biwords** (2-word phrases) in document logs. Select the statistically most frequent combination (e.g., correcting to `graduate from`).

## What is the **Soundex Algorithm**?

- **Purpose**: Phonetic correction based on **sound** (English-specific, highly useful for names).
- **Limitation**: Completely fails if the spelling mistake occurs on the **first letter**.

## What are the rules for computing a **Soundex** fingerprint?

1. **Retain** exact first letter.
2. **Convert** remaining consonants to digits (0-6).
3. **Remove duplicates**: Collapse consecutive identical digits.
4. **Remove zeros**: Drops vowels, H, W, and Y.
5. **Pad and trim**: Output must be exactly **4 characters** (1 letter + 3 digits).
    - Matches occur when terms share identical fingerprints (e.g., `Computer` & `Cmputer` \\(\rightarrow\\) `C513`).
