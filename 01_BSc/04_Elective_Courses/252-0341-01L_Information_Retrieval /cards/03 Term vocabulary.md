## What are the concepts regarding **Character Sequence Decoding**?

- **Byte Sequence**: Physical storage format (bits/bytes); requires conversion.
- **Encoding Detection**: Determining the correct mapping (via heuristics/ML).
- **ASCII**: 7-bit encoding (128 chars); limited to basic English.
- **Unicode**: A **catalog** (map) of characters to integers (codepoints); **not** an encoding.
- **UTF-8**: Standard variable-length **encoding** translating Unicode codepoints to bits (1-4 bytes).

## What are the types of **Document Unit Granularity**?

- **Fine-grained**:
    - Small units (e.g., single emails, paragraphs).
    - **High precision**, potential loss of context.
- **Coarse-grained**:
    - Large units (e.g., whole files, aggregated sources).
    - **High recall**, potential spurious matches (low precision).

## What are the **Raw Text** term definitions?

- **Positional Token** (Token): Raw text, tied to document, tied to position.
- **Non-positional Token**: Raw text, tied to document, **no position**.
- **Non-normalized Type** (Word): Raw text, **not tied** to document/position.

## What are the **Processed Text** term definitions?

- **Normalized Type** (**Term**): Processed text, not tied (Dictionary entry).
- **Positional Posting**: Processed text, tied to document, tied to position.
- **Non-positional Posting**: Processed text, tied to document, **no position** (Standard Index entry).

## What are the **Language Challenges** in Tokenization?

- **Compounds**: Must be split in languages like German (e.g., *Lebensversicherungs...*).
- **Segmentation**: Required for languages without spaces (Chinese/Japanese).
- **Morphology**: Complex grammar (e.g., Swiss German ordering) or sentence merging (Polysynthetic languages like Siberian Yupik).

## What are specific **Token Parsing Challenges**?

- **Hyphens**: Inconsistent usage (e.g., *co-education* vs. *B-52*).
- **Formats**: Specific parsing needed for Dates (*3/12/91*), IPs, Email addresses.
- **Apostrophes**: Splitting decisions (e.g., *aren't* \(\rightarrow\) *are n't*?).

## What are **Stop Words** and their modern usage?

- **Definition**: Extremely common words (*a, an, the*) traditionally excluded to save space.
- **Modern Trend**: **Kept** in indices to allow precise phrase queries (e.g., "to be or not to be").

## What is **Normalization** and **Equivalence Classing**?

- **Goal**: Create **Equivalence Classes** so variant forms match the same query.

## What are common **normalization operations**?

- **Case-folding**: Lowercase conversion.
- **Truecasing**: ML preserves meaning-bearing capitalization (e.g., *Apple* company vs. *apple* fruit).
- **Accents**: Stripping diacritics (risk of altering meaning, e.g., *peña* \(\ne\) *pena*).

## What is **Symmetric Expansion** in Normalization?

- Maps multiple variants to **one single form** (Many-to-one).
- **Implicit**: Removing characters (e.g., deleting hyphens).
- **Explicit**: Mapping variants like *anti-discriminatory* \(\leftrightarrow\) *antidiscriminatory*.

## What is **Asymmetric Expansion** in Normalization?

Maps one term to **multiple variant lists** (One-to-many).

- **Indexing time**: Index *Windows* as *Windows* AND *windows*.
    - **Result**: Faster query, larger index.
- **Querying time**: Query *window* searches for *window* OR *windows*.
    - **Result**: Slower query, smaller index.

## What is **Stemming**?

- **Definition**: Crude, rule-based chopping of word ends.
- **Characteristics**: Fast, deterministic, often produces non-words (*operate* \(\rightarrow\) *oper*).
- **Standard**: **Porter Stemmer** (5 phases of rules).
- **Effect**: Increases **recall**, reduces **precision**.

## What is **Lemmatization**?

- **Definition**: Uses vocabulary and morphological analysis to find the dictionary base (**Lemma**).
- **Characteristics**: Context-dependent (distinguishes noun *saw* vs. verb *saw*).
- **Utility**: Vital for **morphologically rich** languages (e.g., German, Spanish); marginal gain for English.

## What is the **Vauquois Triangle**?

Models the depth of translation/analysis:

- **Direct Transfer**: Surface level (Word-for-word).
- **Stemming**: Operates near Direct/Surface level.
- **Syntactic/Semantic Transfer**: Deeper analysis; where **Lemmatization** operates.
- **Interlingua**: Deepest semantic representation.

## What is **Byte Pair Encoding (BPE)** in LLMs?

- **Process**: Iteratively merges the most frequent adjacent pair of characters/tokens.
- **Spaces**: Treated as distinct characters (not delimiters).
- **Result**: Common words = single tokens; rare words = split into sub-word chunks (e.g., "Strawberry" \(\rightarrow\) "Straw" + "berry").

## What is the consequence of **BPE** for LLM capabilities?

Explains the inability to perform **character-level tasks** (e.g., counting letters) because the model sees chunks, not individual characters.

## What are **Skip Lists**?

- **Problem**: Intersecting postings lists is linear \(O(m+n)\); inefficient for sparse matches.
- **Structure**: **Skip Pointers** added to jump over non-matching docIDs.
- **Logic**: If `skip_target` \(\le\) `current_docID_of_other_list`, take shortcut.

## What is the optimal heuristic for **Skip Lists**?

- **Skip Interval**: \(\approx \sqrt{P}\) (where \(P\) = list length).
- **Trade-off**:
    - **Too short**: High comparison overhead.
    - **Too long**: Missed skipping opportunities.

## What is a **Biword Index**?

- **Structure**: Index consecutive pairs as single terms (*friends romans*, *romans countrymen*).
- **Usecase**: Exact sequence ("Stanford University")
- **False Positives**: Query "A B C" matches documents where "A B" and "B C" exist but are separated.
- **False Negatives**: None.
- **Issues**: Vocabulary explosion.

## What is the structure of a **Positional Index**?

- **Format**: `Term: docID: <pos1, pos2...>; docID...`
- **Content**: Stores **Term Frequency** and **Positions** (offsets).
- **Trade-off**: 2-4x larger than non-positional indexes; complexity \(\Theta(T)\) (\(T\) = total tokens).
- **Usecase**: Exact sequence ("Stanford University") or **Proximity Search**

## How are **Positional Indexes** processed?

1. **Intersect docIDs** (standard Boolean retrieval).
2. **Verify positional constraints** (e.g., for "ETH Zurich", ensure \(pos(\text{Zurich}) - pos(\text{ETH}) = 1\)).
