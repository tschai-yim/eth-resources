## What are the goals and benefits of **Index Compression**?

- **Disk space conservation**: Reduces physical storage needs.
- **Increased caching**: Fits more data into RAM; minimizes costly disk seeks.
- **Faster data transfer**: Compressed disk-to-RAM transfer + CPU decompression is generally faster than uncompressed transfer.

## What are the types of **Compression**?

- **Lossless compression**: Preserves all info (e.g., standard index compression techniques).
- **Lossy compression**: Discards unimportant info (e.g., removing stop words, stemming, case folding).

## What is the impact of **Lossy Pre-processing** on index size?

- **Remove numbers**: Minor impact.
- **Case folding**: High dictionary impact.
- **Remove stop words**: Zero impact on dictionary, massive impact on postings.
- **Stemming**: High dictionary impact, minor postings impact.
- **Total typical reduction**: Dictionary (\\(\downarrow 33\%\\)), non-positional postings (\\(\downarrow 42\%\\)), positional postings (\\(\downarrow 52\%\\)).

## What is **Heaps' Law**?

- Models **vocabulary size** as a function of collection size.
- **Formula**: \\(M = kT^b\\) (\\(M\\) = distinct terms, \\(T\\) = total tokens).
- **Parameters**: \\(30 \le k \le 100\\) and \\(b \approx 0.5\\) (demonstrates **square root growth**).
- **Implication**: Infinite vocabulary growth (never caps out) due to proper nouns, names, and new internet text.

## What is **Zipf's Law**?

- Models **collection frequency** (\\(cf\_i\\)) based on term rank (\\(i\\)).
- **Formula**: \\(cf\_i \propto 1/i\\) or \\(cf\_i = c/i\\).
- Frequency halves as rank doubles.
- Produces a linear graph with slope \\(-1\\) on a **log-log scale**.
- **Rule of 30**: Top 30 words \\(\approx 30\%\\) of all tokens in written text.

## What is the **Fixed-width Array** strategy for Dictionary Compression?

- Static size per term (e.g., 20 bytes string, 4 bytes frequency, 4 bytes pointer).
- **Issue**: Highly wasteful for short words (avg English word = 8 chars); truncates long words (e.g., *supercalifragilisticexpialidocious*).

## What is the **Dictionary-as-a-string** strategy for Dictionary Compression?

- Single concatenated string for all terms.
- Array of pointers (e.g., 3 bytes each) marks term starts; length deduced from adjacent pointer.
- **Benefit**: Saves space (avg 11 bytes per term instead of 20).

## What is the **Blocked storage** strategy for Dictionary Compression?

- Groups terms into blocks of size \\(k\\) (e.g., \\(k=4\\)).
- Single string pointer per block (for the first term).
- 1-byte length prefix prepended to each string for internal block traversal.
- **Space-time tradeoff**: Reduces pointer space by factor of \\(k\\), but requires a linear scan within the block after the initial binary search.

## What is the **Front coding** strategy for Dictionary Compression?

- Shares **common prefixes** between consecutive alphabetically sorted terms (e.g., *automat*ion, *automat*ic).
- Uses special delimiters to reference the previous prefix.
- **Benefit**: Massive space savings (\\(\approx 50\%\\) reduction from fixed-width arrays).

## What is **Gap Encoding** in Postings File Compression?

- Standard absolute `docID`s waste space.
- Sorted postings lists allow storing **gaps** (differences) between consecutive `docID`s.
- Frequent terms yield tiny gaps; rare terms yield massive gaps.
- Requires **variable gap size** encodings.

## What are **Prefix Codes**?

- No valid code word is a prefix of another valid code word.
- **Benefit**: Decoder deduces exactly **when to stop** reading bits without explicit separators (e.g., phone numbers, UTF-8).

## What is **Variable Byte (VB) Encoding**?

- Uses an integral number of bytes (or packets, like 4-bit nibbles) per gap.
- **Structure** (8-bit packet): 1 **continuation bit** + 7 **payload bits**.
    - `1`: Ends here (last byte of gap).
    - `0`: Does not end here (more bytes follow).
- **Tradeoff**: Parameterized packet size. Large packets = less overhead, less compression. Small packets = more overhead, more compression.

## How are values encoded in **Variable Byte (VB) Encoding** (Examples)?

- **Example** (\\(x = 4\\)): 7-bit payload `100`, prepended with `1` \\(\rightarrow\\) `10000100`.
- **Example** (\\(x = 270\\)): Binary `1 0000 1110`. Payloads `0000010` and `0001110`. First byte gets `0`, last gets `1` \\(\rightarrow\\) `00000010 10001110`.

## What is **Unary Code** (Thermometer code)?

- Integer \\(x\\) is encoded as \\(x\\) ones, followed by `0` to mark the stop.
- **Example**: \\(4 \rightarrow\\) `11110`.

## What is **Gamma (\\(\gamma\\)) Encoding** (Elias code)?

- Bit-level, parameter-free, prefix-free code optimal for small integers.
- **Algorithm**:
    1. Convert gap to binary (e.g., \\(19 \rightarrow\\) `10011`).
    2. Strip leading `1` (remaining `0011` = **offset**).
    3. Encode **length** of offset in **Unary** (4 bits \\(\rightarrow\\) `11110`).
    4. Concatenate: `11110` + `0011` \\(\rightarrow\\) `111100011`.
- Gap of \\(1 \rightarrow\\) `0`.

## What is the **Amount of Information** (Surprise) in Information Theory?

- Information gained from a specific outcome \\(x\\) of random variable \\(X\\).
- **Formula**: \\(I\_X(x) = -\log\_2(p\_X(x))\\).
- \\(p\_X(x)\\) represents the **probability** of outcome \\(x\\). Lower probability \\(\rightarrow\\) higher surprise/information.

## What is **Shannon Entropy** (\\(H(X)\\))?

- Expected value of the amount of information for a distribution.
- **Formula**: \\(H(X) = \mathbb{E}[I\_X(X)] = -\sum\_x p\_X(x)\log\_2(p\_X(x))\\).
- Theoretical **lower bound** for average bits per encoded value in lossless compression. Claims beating this bound are mathematically impossible.

## What are examples of **Shannon Entropy** calculations?

- **Deterministic distribution**: 100% probability for one outcome (\\(p=1\\)). Formula yields \\(-\log\_2(1) = 0\\). \\(H(X) = 0\\) bits (no uncertainty).
- **Uniform distribution**: 4 equiprobable options (\\(p=1/4\\)). Formula yields \\(-\log\_2(1/4) = 2\\). \\(H(X) = 2\\) bits required on average.

## What is a **Universal Encoding**?

- A code whose expected length is bounded by a constant factor of **Shannon Entropy** \\(H(X)\\) for *any* arbitrary distribution.

## What are the theoretical bounds of **Unary** and **Gamma Encodings**?

- **Unary encoding**: Mathematically **optimal** (expected length exactly equals \\(H(X)\\)) *only* if the gap distribution is a **geometric distribution** with \\(p=1/2\\).
- **Gamma Encoding**: Is **universal** (\\(\mathbb{E}[L\_\gamma(X)] \le 3H(X)\\) for any distribution).

## What is the structure of **Decimal Gamma Encoding**?

- Extends Gamma encoding for decimal numbers (e.g., in databases).
- **Structure**:
    1. Convert to scientific notation (e.g., \\(1.23 \times 10^8\\)).
    2. 2 bits for sign combinations (+/+, +/-, -/+, -/-).
    3. Gamma encode the **offset exponent**.
    4. Encode the mantissa in binary chunks.

## What is the key advantage of **Decimal Gamma Encoding**?

- Preserves **lexicographical order**.
- Allows physical bit-sequence comparisons for range queries **without decoding values**.
