## What is **Ranked Retrieval**?

- **Definition**: Search method that returns a **ranked subset of documents** based on calculated relevance.
- **Purpose**: Solves the primary issue of Boolean retrieval, which produces massive, unordered result sets.

## What is **Parametric Search**?

- **Definition**: Search method that queries structured **Document Metadata** (e.g., Title, Author, Publication Date).
- **Execution**: Handled as a classical database problem using standard relational structures like **Hash tables** and **Trees**.

## How do modern Information Retrieval systems integrate text and metadata?

They combine **parametric indices** (for structured metadata) with standard **inverted indices** (for unstructured text) into a unified architecture.

## What is **Zone Search**?

- **Definition**: Search method applied to free text within specific, structurally defined document sections or **zones** (e.g., title vs. body text).

## What are the two storage strategies for a **Shared Inverted Index** in Zone Search?

- **Zones in terms**: Zones are encoded directly in the dictionary term (e.g., `albert.author`).
- **Zones in postings**: Zones are stored as payload data inside the posting list (e.g., `1.title`).

## How is the **Document Score** calculated in Zone Search?

- **Zone Weights (\(g_i\))**: Importance values assigned to specific sections (e.g., Title = 0.3, Body = 0.5).
- **Boolean Match (\(s_i\))**: \(1\) if the term is present in the zone, \(0\) otherwise.
- **Calculation**: Computed as the **scalar product** (inner product) of weights and matches: \(\sum_{i=1}^{l} g_i s_i = \vec{g} \cdot \vec{s}\).
- **Execution**: Uses the **Intersection algorithm** to advance pointers across sorted posting lists, summing scores dynamically via **Accumulators**.

## How are **Zone Weights** optimized in an Information Retrieval system?

- Manual weight guessing is highly ineffective.
- **Data Collection**: Systems collect query **samples** and pair them with human expert **relevance scores** (\(r_j \in \{0, 1\}\)).
- **Machine Learning**: Predicts relevance by minimizing the error between the calculated score and the human judgment.
- **Error Function**: \(\text{error}_j(g) = (r_j - \vec{g}_j \cdot \vec{s}_j)^2\).

## What is the **Bag of Words** model?

- **Definition**: Simplifies document representation from an ordered sequence of words to a **vector of numbers** (term counts).
- **Characteristic**: Completely **ignores word order** and linguistic structure.

## What are the metric definitions of **TF**, **CF**, and **DF** in Information Retrieval?

- **Term Frequency (\(tf_{t,d}\))**: Total count of term \(t\) inside a specific document \(d\).
- **Collection Frequency (\(cf_t\))**: Total count of term \(t\) across the entire corpus (poor metric because it ignores high concentration in a single document).
- **Document Frequency (\(df_t\))**: Count of distinct documents containing term \(t\).

## What is **Inverse Document Frequency (IDF)** and its formula?

- **Definition**: Metric that assigns higher mathematical value to rare, highly discriminative terms and lower value to common terms.
- **Formula**: \(idf_t = \log \frac{N}{df_t}\) (where \(N\) is the total number of documents).

## What is **TF-IDF Weighting**?

- **Definition**: Composite scoring metric calculated as \(tf \times idf\).
- **Purpose**: Balances local term abundance (**Term Frequency**) with global term rarity (**Inverse Document Frequency**) to determine a word's actual significance in a document.

## How are documents mapped in the **Vector Space Model (VSM)**?

- **Boolean mapping**: Terms represent vertices of a simplex; documents are vertices on a hypercube.
- **TF-IDF mapping**: Documents are plotted as vectors with continuous magnitudes in the first quadrant of an \(\mathbb{R}^M\) space (where \(M\) = total vocabulary size).

## What is **Vector Renormalization** in the Vector Space Model?

- **Process**: Document vectors are divided by their **Euclidean norm** (\(||x||\)) to reach a uniform **unit length** of \(1\).
- **Property**: Duplicating a document's content changes raw term frequencies but does **not** change its semantic angle; renormalization scales it back to the exact same unit point in space.

## How is **Cosine Similarity** used to match queries to documents?

- Queries are plotted as vectors in the exact same mathematical space as documents.
- **Similarity** is calculated via the normalized **inner product** (\(\cos \theta\)).
- **Relevance** is directly proportional to the narrowness of the angle between the query vector and the document vector.

## What is **SMART Notation**?

- **Definition**: A standard 6-letter syntax used to represent IR weighting configurations.
- **Format**: `ddd.qqq` (3 letters for the **Document** configuration, 3 letters for the **Query** configuration).

## What are the **Term Frequency (TF)** scaling options in SMART Notation (First letter)?

- **Natural (n)**: Raw term count (\(tf\)).
- **Sublinear (l)**: \(1 + \log(tf)\) (mitigates diminishing returns of repeated words).
- **Augmented (a)**: \(a + (1-a)\frac{tf}{tf_{max}}\) (prevents zero scores).
- **Boolean (b)**: \(1\) if present, \(0\) otherwise.
- **Log-average (L)**: \(\frac{1 + \log(tf)}{1 + \log(\text{average } tf)}\).

## What are the **Document Frequency (DF)** scaling options in SMART Notation (Second letter)?

- **No scaling (n)**: Value of \(1\).
- **IDF (t)**: \(\log \frac{N}{df_t}\).
- **Probabilistic IDF (p)**: \(\max(0, \log \frac{N - df_t}{df_t})\).

## What are the **Normalization** options in SMART Notation (Third letter)?

- **None (n)**: Value of \(1\).
- **Cosine (c)**: Scales the vector to a unit length of \(1\).
- **Byte-size (b)**: Scales length by \(\frac{1}{\text{CharLength}^\alpha}\).
- **Pivoted (p)**: Corrects bias against long documents.

## How are **Weights** efficiently stored in a Ranked Retrieval index?

- Precomputing and storing final float weights wastes disk space and compresses poorly.
- **Solution**:
    - Store **raw Term Frequency** (\(tf_{t,d}\)) and **Vector Lengths** (\(||d||\)) natively inside the postings.
    - Store global stats (\(N\) and \(df_t\)) inside the Term Headers.
    - Compute the final float dynamically during query time.

## What is the difference between **Term-at-a-time** and **Document-at-a-time** traversal?

- Both use an **Accumulator** per document to store running sums.
- **Term-at-a-time**: Fully processes one query term's posting list (updating all affected accumulators) before moving to the next query term.
- **Document-at-a-time**: Scans horizontally across all relevant posting lists simultaneously, completely finishing one document's final score before moving to the next document.

## What is the computational complexity of extracting **Top-K Results** from millions of scored documents?

- Takes **\(O(N)\)** time (not \(O(N \log N)\)).
- **Mechanism**: Achieved by utilizing a **Priority queue** (min-heap) sized at \(K\) to filter the highest scores during traversal.

## What are common **Scoring Optimizations** used to speed up Ranked Retrieval?

- **Query length omission**: The query divisor (\(||q||\)) in \(\frac{\vec{q} \cdot \vec{d}}{||q|| \times ||d||}\) is constant and can be ignored without altering rank order.
- **Late division**: Divide by the document length (\(||d||\)) only at the very end.
- **Sparse accumulators**: Only instantiate accumulators for documents matching at least one query term.
- **Binary query weights**: Use an `*n*` SMART scheme for queries to drop query-side IDF, avoiding redundant double-IDF math.

## What is the fundamental strategy of **Inexact Top-K Document Retrieval**?

- Calculates exact vector scores only within a drastically reduced, **preselected candidate sub-pool**.
- Drastically saves computation time at the slight risk of missing a marginally relevant document.

## What is **Index Elimination** in Inexact Top-K Retrieval?

- **Strategy**: Drops low-IDF terms (**Stop words**) from the query entirely.
- Focuses only on evaluating documents that contain the rare, high-value query terms (or require documents to contain *all* query terms).
- **Risk**: Can aggressively eliminate too many valid documents.

## What are **Champion Lists** (Top Docs) in Inexact Top-K Retrieval?

- **Strategy**: Pre-sorts the index by decreasing Term Frequency (TF).
- Retains only the top \(r\) highest-scoring documents per term.
- At query time, takes the union of these small top \(r\) sets.
- **Flaw**: Term-dependent ordering destroys the global document ID ordering, breaking standard **Document-at-a-time** traversal algorithms.

## What is **Impact Ordering** in index traversal?

- **Strategy**: Sorts the dictionary globally by **IDF** (processes rarest terms first) and sorts postings locally by **TF**.
- Allows early termination once accumulators stabilize.
- **Limitation**: Strictly requires **Term-at-a-time** traversal because the local TF-sorting destroys sequential global document IDs.

## What are **Tiered Indices** in Inexact Top-K Retrieval?

- **Strategy**: Creates fallback priority rings (e.g., Tier I, Tier II, Tier III) based on term importance thresholds.
- The system only queries Tier I initially.
- **Fallback**: Search only drops down to process Tier II if Tier I fails to yield the minimum \(K\) requested results.

## How does **Document Clustering** improve search efficiency?

- **Indexing**: Selects \(\sqrt{N}\) random documents as **leaders** and assigns all other documents to the nearest leader, forming a **cluster**.
- **Querying**: Finds the single leader closest to the query and calculates exact scores **only** for documents within that leader's local cluster.

## What distance metric is exclusively used in **Document Clustering**?

- Relies entirely on the **cosine angle** from the origin.
- **Ignores** absolute Euclidean distance (L2).

## What is the **HNSW (Hierarchical Navigable Small Worlds)** Index?

- **Definition**: A specialized vector database index.
- **Structure**: Functions like a multi-layered skip list in 2D/3D space.
- **Traversal**: Navigates from a low-density top layer (fast routing, low recall) down to a high-density bottom layer (slower search, high recall).

## What is the **IVFFlat (Inverted File with Flat Compression)** Index?

- **Definition**: A specialized vector database index.
- **Structure**: Groups vectors into predefined physical clusters.
- **Comparison**: Functions conceptually identically to **Tiered Indices** in standard text retrieval.

## What happens in **Phase 1 (Indexing)** of an Information Retrieval system?

- **Data Ingestion**: Raw documents pass through **Parsing & Linguistics** (tokenization, stemming).
- **Structure Mapping**: Indexers convert text and metadata into specialized structures like **Zone indices**, **Tiered inverted indices**, and **Biword/k-gram indices**.

## What happens in **Phase 2 (Querying)** of an Information Retrieval system?

- **User Input**: Raw query is processed by a **Query parser** (translates operators, parses free text) and a **Spell correction** module.
- **Execution**: The optimized query is executed against the generated indices.

## What happens in **Phase 3 (Scoring & Results)** of an Information Retrieval system?

- **Accumulation**: Index hits trigger **Evidence accumulation** (merging matches).
- **Ranking**: Documents are ordered via a **Scoring module** (often using Machine Learning Weights).
- **Delivery**: Top results fetch preview snippets from a **Document cache** and are returned to the user.
