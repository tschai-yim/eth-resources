## What is the **Memory Hierarchy** in hardware and its components?

- **Trade-off**: speed, cost and volatility.
- **CPU Cache (L1/L2)**: Instant latency, extremely low capacity, highest cost, volatile.
- **Main Memory (RAM)**: Fast access (\(\sim 10-100\) ns), medium capacity (GBs to TBs), volatile.
- **Secondary Storage (Disk)**: Slow access (\(\sim 10\) ms seek time), massive capacity (TBs), non-volatile (ensures **ACID** durability).
- **Tertiary Storage (Tapes/DVDs)**: Extremely slow (seconds to hours), practically infinite capacity, cheapest.

## What are the primary **Performance Factors** in hardware?

- **Capacity**: Storable data volume.
- **Throughput**: Continuous data transmission rate (e.g., GB/s for RAM, MB/s for Disk).
- **Latency**: Wait time before data reception starts.

## What are the characteristics of **Disk Access**?

- **Seek Time**: Moving the disk head to the data location takes significant time (\(\sim 5\) ms).
- **Block Transfers**: Data is read/written in **blocks** (\(\sim 4\) KB) for efficiency. Reading a single byte takes the same time as reading a full block.
- **Caching**: Keeping frequently used disk data in RAM buffers minimizes disk I/O.

## What is the motivation for **Blocked Sort-Based Indexing (BSBI)**?

- Massive collections exceed RAM.
- **External sorting algorithms** (which utilize disk storage) are required.

## What is the process of **Blocked Sort-Based Indexing (BSBI)**?

1. **Shard** the collection into equal-sized blocks.
2. **Parse** documents into `[termID, docID]` pairs.
3. **Sort** pairs in RAM by `termID` (primary) and `docID` (secondary).
4. **Invert** and write the sorted block to disk.
5. **Merge** all disk blocks simultaneously into the final inverted index.

## What are the characteristics and complexity of **Blocked Sort-Based Indexing (BSBI)**?

- Requires a **two-pass approach** or an on-the-fly dictionary for the `term` \(\rightarrow\) `termID` mapping.
- **Complexity**: **\(O(T \log T)\)** (\(T\) = total positional tokens).
- **Bottleneck**: Sorting all tokens.

## What is the motivation for **Single-Pass In-Memory Indexing (SPIMI)**?

- In BSBI, the `term` \(\rightarrow\) `termID` mapping **exhausts RAM** when dealing with massive vocabularies.

## What is the process of **Single-Pass In-Memory Indexing (SPIMI)**?

1. Read tokens sequentially. Use raw **terms** directly in a **hash map** (no `termID` translation).
2. Build the dictionary on the fly. Dynamically allocate new postings lists for new terms.
3. Append `docID`s directly to the postings list (no prior sorting).
4. On full memory: **Sort dictionary terms alphabetically** (not `docID`s, as they are inherently sorted by arrival).
5. Write the block's index to disk.
6. **Stream** and merge all parallel, alphabetically sorted intermediate indices into the final index.

## What are the characteristics and complexity of **Single-Pass In-Memory Indexing (SPIMI)**?

- **No term-termID mapping in RAM**, saving massive memory.
- Postings lists are **dynamic** (double in size as needed).
- **Complexity**: Often estimated as linear \(O(T)\). Technically **\(O(T \log M)\)** (\(T\) = tokens, \(M\) = unique terms) because only unique dictionary terms are sorted per block, vastly improving speed over BSBI.

## What is the motivation and core concept behind **Distributed Indexing (MapReduce)**?

- **Motivation**: Collections (e.g., the Web) exceed single-machine limits.
- **Core Concept**: **Bring the Query to the Data**. Process data on local storage machines to minimize network traffic.

## What is the architecture of **MapReduce** for distributed indexing?

Splits jobs across cheap commodity machine clusters:

- **Master Node**: Directs the process, assigns data **splits** to worker nodes, reassigns failed tasks.
- **Map Phase (Parsers)**: Workers parse local data splits into intermediate `[term, docID]` pairs.
- **Shuffle Phase**: Routes pairs sharing the same key (term) to the same node. Features **Quadratic complexity** (heavy network routing).
- **Reduce Phase (Inverters)**: Workers collect, sort, and write `docID`s for assigned terms.

## What is the motivation for **Dynamic Indexing**?

- Frequent updates cause **result staleness**.
- Complete periodic reconstruction causes **system unavailability**.

## What is the **Auxiliary Index Strategy** in Dynamic Indexing?

- Keep a large, static **Main index** on disk.
- Maintain a small, dynamic **Auxiliary index** in RAM for new documents.
- **Querying**: Query both indices simultaneously and return the **union** of results.
- **Periodic Merging**: Merge the auxiliary index into the main index when RAM is full.

## How are deletions handled in **Dynamic Indexing**?

- Maintain an in-memory **Invalidation bit vector** (flip to `0` on deletion).
- Filter out invalidated documents dynamically during querying (instant \(O(1)\) lookup).
- Physically remove deleted documents during the periodic auxiliary-to-main merge.

## What are the scaling issues regarding file management in **Dynamic Indexing**?

- **One file per posting list**: Makes auxiliary index merging trivial (simple file append operation), but is completely **impracticable** due to OS limits on millions of tiny files.
- **Decision spectrum**: Trade-off between having fewer large files (hard to merge/update) vs. efficient appending (creating too many files).

## What is the motivation for **Logarithmic Merging**?

- Standard auxiliary index merging requires reading and rewriting the entire main index.
- This yields an inefficient **quadratic complexity** of **\(O(T^2/n)\)** (\(T\) = total postings, \(n\) = auxiliary index capacity).

## What is the process of **Logarithmic Merging**?

- Accumulate \(n\) postings in a RAM index (**\(Z_0\)**).
- On full \(Z_0\): flush to disk as index **\(I_0\)** (size \(n\)).
- On next full \(Z_0\): if \(I_0\) exists, merge \(Z_0\) and \(I_0\) into a new disk index **\(I_1\)** (size \(2n\)).
- Cascade indices in **base-2 (binary)** sizes (\(n, 2n, 4n, 8n, 2^k n\)).

## What is the complexity of **Logarithmic Merging**?

- **Construction time**: **\(O(T \log(T/n))\)** (each posting is merged exactly \(\log(T/n)\) times).
- **Query time**: **\(O(\log(T/n))\)** (requires searching across \(\log(T/n)\) separate disk indices and unioning results).
- **Compromise**: Exponentially faster construction at the cost of slightly slower querying.

## How does **Ranked Retrieval** complicate dynamic index updates?

- Boolean systems sort indices by `docID`.
- Ranked systems sort indices by **weight/impact**.
- **Complication**: You cannot simply append new documents to the end of an existing postings list.

## How are **Access Control Lists (ACLs)** implemented for security in search?

- **Purpose**: Enterprise search requires hiding unauthorized documents.
- **Implementation**: Represented as a **User-Document Matrix** (`1` if readable, `0` otherwise).
- **Access List**: Inverted into a per-user Access List.
- **Querying**: Intersect query results with the user's access list. Heavily complicates dynamic indexing upon permission changes.
