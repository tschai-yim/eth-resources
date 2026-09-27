## Information Retrieval Evolution

- **Information Retrieval (IR)**: Coined by **Calvin Mooers** (1950s). Focus: answering user queries.
- **Dewey Decimal System**: Numerical library cataloging system by Melvil Dewey.
- **File Systems**: Dominant in 1960s.
- **Relational Era (1970s)**: **Edgar Codd** invented **relational databases** (abstracting files into tables for data independence).
- **Object Era**: Emerged in 1980s.
- **NoSQL Era (2000s)**: Web-scaled via **Key-value stores**, **Triple stores**, **Column stores**, and **Document stores**.

## Unstructured Data & The Semantic Gap

- **Unstructured data examples**: **Text**, **Picture (bitmap)**, **Audio**, **Video (sequence of bitmaps)**, **Tweets**.
- **Characteristics**: **Raw form**, **no explicit structure**. Relies on **implicit features** (e.g., characters, grammar, pixels, sound waves).
- **Semantic gap**: Disconnect between raw **Representation of Information** (the physical data/format) and the true **Semantic description of information** (the actual human meaning, intent, or concept).
- **Knowledge Hierarchy**:
    - **Data** (+ meaning) $\rightarrow$ **Information**.
    - **Information** (+ meaningful application) $\rightarrow$ **Knowledge**.
    - **Knowledge** ultimately leads to **Wisdom**.

## Early Systems & Hardware Scaling (1956-2026)

- **Early IR Systems**:
    - **Memex**: Early conceptual mechanical retrieval system (Vannevar Bush).
    - **SMART (1960s)**: Built by **Gerard Salton**. Introduced the **vector space model** (linear algebra/scalar products; mathematical foundation for modern LLM embeddings).
    - **IBM STAIRS (1969)**: Early **Boolean retrieval system** for legal document search.
- **Hardware Evolution**:
    - **IBM RAMAC 350 (1956)**: First commercial hard drive. Capacity: 5 MB, Throughput: 12.5 kB/s, Latency: 600 ms.
    - **ExaDrive EDDCT100 (2026)**: Modern SSD. Capacity: 100 TB, Throughput: 500 MB/s, Latency: 0.1 ms.
- **The Scaling Problem**: Hardware capacity vastly outpaced throughput.
    - Capacity: $\uparrow 1,082,000,000,000\times$
    - Throughput: $\uparrow 960,000\times$
    - Latency: $\downarrow 6,000\times$
    - *Analogy*: Reading a 100 TB drive at standard human speed = 1287 years.
- **Solution**: **Parallelization** and **Batch processing** across massive machine clusters (10,000s).

## SI Prefixes (Must know by heart)

- **kilo (k)**: $1,000$ (3 zeros)
- **Mega (M)**: $1,000,000$ (6 zeros)
- **Giga (G)**: $1,000,000,000$ (9 zeros)
- **Tera (T)**: $1,000,000,000,000$ (12 zeros)
- **Peta (P)**: $1,000,000,000,000,000$ (15 zeros)
- **Exa (E)**: $1,000,000,000,000,000,000$ (18 zeros)
- **Zetta (Z)**: $1,000,000,000,000,000,000,000$ (21 zeros)
- **Yotta (Y)**: $1,000,000,000,000,000,000,000,000$ (24 zeros)
- **Ronna (R)**: $1,000,000,000,000,000,000,000,000,000$ (27 zeros)
- **Quetta (Q)**: $1,000,000,000,000,000,000,000,000,000,000$ (30 zeros)
