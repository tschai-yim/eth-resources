## What is the motivation and **Core Idea** behind **Decoupled Access/Execute (DAE)**?

- **Motivation**: **Tomasulo's algorithm** was too complex for 1980s hardware.
- **Core Idea**: Decoupling memory access from execution via separate instruction streams and **ISA-visible queues**.

## What are the two **Instruction Streams** in a **Decoupled Access/Execute (DAE)** architecture and how are they synchronized?

- **Stream A (Access Processor)**: Fetches memory, supplies the execution stream.
- **Stream E (Execute Processor)**: Computes data, supplies memory addresses back.
- **Synchronization**: Synchronized purely on control flow (**branch queues**).

## What are the distinct **Queues** in a **Decoupled Access/Execute (DAE)** architecture and what is their structural significance?

- **Access-to-Execute (AEQ)**: Buffers data fetched from memory for the execute stream.
- **Execute-to-Access (EAQ)**: Buffers memory addresses calculated by the execute stream for the access stream.
- **Latency tolerance**: Hardware latency tolerance is dictated by the queue length.
- **Scalability**: Serves as a scalable alternative to massive physical register files or tag-matching logic.

## What are the hardware and execution advantages of **Decoupled Access/Execute (DAE)**?

- **Asynchronous execution**: Streams run ahead of each other (e.g., Stream E computes while Stream A waits for memory).
- **Hardware simplicity**: Achieves limited **out-of-order execution** without the complexity of wakeup/select logic.
- **Modern use**: Utilized in the **Google TPU** and various ML accelerators.

## What are the disadvantages and limitations of **Decoupled Access/Execute (DAE)**?

- **Compiler dependence**: Heavy reliance on **compiler support** for instruction partitioning.
- **Branch disruption**: Branches disrupt streams (Stream E must explicitly signal Stream A to halt wrong-path fetching).
