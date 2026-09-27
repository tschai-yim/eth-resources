## What is an **atomic** (atomar) statement or instruction?

- A statement or instruction is (truly) **atomic** if it is executed by the CPU in a single, non-interruptible step.

## What does **abstractly atomic** (abstrakt atomar) mean?

- A statement or instruction that, at a certain level of abstraction, appears to be executed atomically.
- *Example*: From a caller's perspective, a method `synchronized append(x)` of a queue appears to append element `x` in one step, but from the queue's perspective, this might take several steps.

## What is **Amdahl's law** (Amdahlsches Gesetz)?

- Specifies the maximum amount of **speedup** that can be achieved for a program with a given **sequential part**.
- It represents the pessimistic view on **scalability**.

## What is a **bad interleaving** (ungünstige Verschränkung)?

- An **interleaving** that yields a problematic or otherwise undesirable computation.
- *Examples*: An incorrect result, a **deadlock**, or non-deterministic output.

## What is **busy waiting** (aktives Warten)?

- Occurs when a **thread** busily (actively) waits, e.g., by spinning in a loop, for a condition to become true.
- In the opposite scenario, the thread sleeps (i.e., is blocked; in Java: `join()`, `wait()`) until the condition becomes true.
- **Trade-off**:
    - **Busy waiting** uses up CPU time.
    - Blocking may cause additional **context switches**.

## What are **cache coherence protocols** (Cache-Kohärenz-Protokolle)?

- Hardware protocols that ensure consistency across caches.
- Typically work by tracking which locations are cached, and synchronising them if necessary.

## What is **cilk-style programming** (Cilk-artige Programmierung)?

- A parallel programming idiom: To compute a program, execute code and spawn new tasks if required.
- Before returning, wait for all spawned tasks to complete.
- The system manages the eventual execution of the spawned tasks potentially in parallel.
- Spawning and waiting on tasks creates a **task graph** which is a DAG.

## What are **CISC, RISC** (CISC, RISC)?

- **CISC** (complex instruction set computer) and **RISC** (reduced instruction set computer) are two fundamental CPU architecture models.
- Classical **RISC** is easier to study since it is simpler.
    - *Example*: **RISC** instructions can only work on registers, and reading/writing memory are separate instructions.

## What is **concurrency** (Nebenläufigkeit)?

- Dealing with multiple things at the same time (as opposed to **parallelism**: doing multiple things at the same time).
- Reasoning about and managing shared resources.
- Often used interchangeably with **parallelism**.

## What is a **context switch** (Kontextwechsel)?

- Given a computation unit (CPU), a **context switch** denotes the action of switching the unit from one computation to another.
- Typically refers to switching between **processes**, but can also refer to switching between **threads**.
- Depending on the size of the context ("large" for a process, "small" for a thread), a **context switch** might be computationally expensive, i.e., require comparably much CPU time.

## What is **context switch overhead** (Kontextwechsel-Overhead)?

- An overhead refers to resources required to set up an operation, which can include computation time and memory.
- In terms of a **context switch**, the CPU needs to:
    - Store to save the local data, program pointer, etc. of the current **thread/process**.
    - Load the local data, program pointer, etc. of the next **thread/process** to execute.
- The resources needed for a **context switch** is the **context switch overhead**.

## What is a **critical section** (kritischer Abschnitt)?

- A piece of code that, in order to guarantee correct program execution, may only be executed by one **thread** at a time.

## What is a **data race** (Data Race / Datenwettlauf)?

- A program has a **data race** if, during any possible execution, a memory location could be written from one **thread**, while concurrently being read or written from another thread.
- Often used interchangeably with **race condition**.

## What is **divide and conquer style parallelism** (Teile-und-Herrsche-Parallelität)?

- Also called recursive splitting.
- Solve a problem in divide and conquer style: solve a larger problem by recursively solving smaller sub-problems and combine their results.
- Solve the sub-problems in separate **threads** to gain a **speedup**.
- This way, work can be decomposed recursively into small tasks that can be efficiently scheduled on available tasks using e.g., the **ForkJoin framework**.

## What is a **deadlock** (Verklemmung / Deadlock)?

- Circular waiting/blocking between **threads** where no instructions are executed and no CPU time is used.
- Results in the system (union of all threads) not being able to make any progress anymore.

## What is **efficiency** (Effizienz)?

- Expresses how much of the available CPU performance can be used.
- Heavily limited by the **sequential part** of a program.
- **Efficiency** = \\( S_p/p \\).

## What is the **ForkJoin framework** (ForkJoin-Framework)?

- Introduced in Java 7, this framework embraces **divide and conquer parallelism**.
- Tasks can be spawned (forked) and joined by the framework.
- The **ForkJoin framework** automatically assigns these tasks (lightweight) to Java **threads** (heavyweight).
- May also execute multiple tasks in one thread to avoid **thread context switching overhead**.

## What is a **functional unit** (Funktionseinheit)?

- A component of a CPU (or core) that performs a certain task, e.g., executing integer arithmetic operations.
- An execution unit is one such **functional unit** (see also **RISC**).

## What is **granularity** (Granularität) in parallel programming?

- **Coarse vs. fine**: Splitting work into large tasks (coarse) reduces overhead, but might not use all available **threads**.
- Small tasks (fine granular) can be parallelized more, but also add more overhead.
- The trick is to find a "reasonable" size to minimize overhead and maximize **parallelism**.

## What is **Gustafson's law** (Gustafsons Gesetz)?

- Specifies how much more work can be performed for a given fixed amount of time by adding more processors.
- Represents the optimistic view on **scalability**.

## What is **instruction level parallelism (ILP)** (Parallelität auf Befehlsebene)?

- CPU-internal parallelisation of independent instructions.
- The goal is improving performance by increasing utilisation of a CPU's **functional units**.

## What is an **interleaving** (Verschränkung / Interleaving)?

- Given multiple **threads**, each executing a sequence of instructions, an **interleaving** is a sequence of instructions obtained from merging the individual sequences.
- A sequentially consistent **interleaving** is one where the relative order of statements from one thread is preserved.

## What is **latency** (Latenz)?

- An evaluation metric for pipelines.
- **Latency** measures the time a pipeline needs to process a given work item (e.g., a CPU instruction).

## What is a **livelock** (Livelock)?

- A situation in which all **threads** starve by infinitely often trying to enter a **critical section**, but never succeeding.
- Similar to a **deadlock**, the system makes no real progress, although the threads execute statements/use CPU time.

## What is a **liveness property** (Lebendigkeitseigenschaft)?

- Property of a system: "something good eventually happens".
- Can only be violated in infinite time.
- Infinite loops and **starvation** are typical **safety properties** (as stated in the text).
- Will be formally defined in Formal Methods using temporal logic.

## What does **locality** (Lokalität) mean in parallel programming?

Has several meanings in the context of parallel programming:

- **1. Locally reason** about one **thread** at a time (also known as thread modularity). Simplifies correctness arguments.
- **2. Data locality**: related memory locations are accessed shortly after each other. Improves performance by optimal cache usage.
- **3. Code locality**: straight-line code increases opportunities for **instruction level parallelism**.

## What is a **lock** (Sperre / Lock)?

- In general, a token/resource that can be acquired by at most one **thread** at a time.
- Locks are typically provided by a programming language to enforce **mutual exclusion**, by guarding/protecting a **critical section**.
- A **lock** can be acquired/locked by a thread, and is then held until it is released/unlocked.
- In Java, each object can be used as a lock (intrinsic/monitor lock), but the JDK also provides more complex locks.

## What is a **lockout** (Aussperrung / Lockout)?

- Needlessly preventing a **thread** from entering a **critical section**.

## What are **maps** (Maps / Abbildungen)?

- A **map** operates on each element of a collection independently to create a new collection of the same size.
- *Example*: Vector addition that computes the sum of a collection of tuples (containing the \\( n^{\text{th}} \\) element of both vectors).

## What is **mutual exclusion** (wechselseitiger Ausschluss)?

- Preventing more than one **thread** from being in a **critical section**, i.e., to execute a piece of code, at a given moment in time.

## What is **multiprocessing (multitasking)** (Multiprocessing (Multitasking))?

- Concurrent execution of multiple tasks/processes.
- Typically refers to **parallelism** on the operating system level.

## What is **multithreading** (Multithreading)?

- **Threads** running in parallel.

## What is **parallelism** (Parallelität)?

- Doing multiple things at the same time (as opposed to **concurrency**: dealing with multiple things at the same time).
- Performing computations simultaneously; either actually, if sufficient computation units (CPUs, cores, ...) are available, or virtually, via some form of alternation.
- Often used interchangeably with **concurrency**.
- **Parallelism** can be specified explicitly by manually assigning tasks to **threads** or implicitly by using a framework that takes care of distributing tasks to threads.

## What is **parallelism (max speedup)** (Parallelität (Maximaler Speedup))?

- **Parallelism** is the maximum possible **speedup**: \\( T_1/T_\infty \\)

## What is **parallel execution time** (parallele Ausführungszeit)?

- \\( T_p \\): The time that is required to perform some work on \\( p \\) processors.
- \\( T_\infty \\) denotes the time required for some work if we had an infinite amount of processors. In this scenario, the total runtime only depends on the time it takes to execute the **sequential part** of a program.

## What is a **process** (Prozess)?

- Independently running instance of a program/application, typically on the operating system level.
- Similar to a **thread**, but usually more heavy-weight (since it is a whole program) and encapsulated in memory.

## What is a **process context** (Prozesskontext)?

- All state associated with a **process**, including:
    - CPU state (registers, program counter)
    - Program state (stack, heap, resource handles)
    - Additional management information.
- A **thread** also has a context, but it is typically much smaller.

## What is a **race condition** (Wettlaufsituation / Race Condition)?

- A program has a **race condition** if, during any possible execution with the same inputs, its observable behaviour (results, output, ...) may change if events happen in different order.
- Events here are typically **scheduler** interactions causing different **interleavings**, but could also be, e.g., changing network **latency**.
- Often used interchangeably with **data race**.

## What are **reductions** (Reduktionen)?

- Operations that produce a single answer from a collection via an associative operator.
- *Examples*: max, count, rightmost, sum, ...

## What is **reentrancy** (Reentranz / Wiedereintrittsinvarianz)?

- A **lock** is reentrant if it can be acquired (and released) multiple times by the same **thread**.
- If a lock is non-reentrant, trying to acquire it again might cause an exception or other problems.

## What is a **safety property** (Sicherheitseigenschaft)?

- Property of a system: "nothing bad ever happens".
- Can be violated in finite time.
- Exceptions, absence of **deadlocks**, and **mutual exclusion** are typical **safety properties**.
- Will be formally defined in Formal Methods using temporal logic.

## What is **sequential execution time** (sequenzielle Ausführungszeit)?

- \\( T_1 \\): The time that is required to perform some work on a single processor.

## What is a **sequential cutoff** (sequenzieller Cutoff / Abbruchbedingung)?

- When decomposing work into tasks, stop splitting tasks at a given problem size (**sequential cutoff**).
- The problem size should be significantly larger than **scheduling overhead**.

## What is a **sequential part** (sequenzieller Teil)?

- Part of a given program that can't be executed in parallel.
- Limits the maximum **speedup**.

## What is **scalability** (Skalierbarkeit)?

- In our context: By how much can a program be parallelized.
- What is the maximum **speedup** that can be achieved, given an infinite amount of processors. (See "**speedup**").

## What is a **scheduler** (Scheduler / Ablaufplaner)?

- A management process, e.g., on the operating system level, that performs **context switches**.
- i.e., it interrupts/pauses/sends to sleep the currently running **process** (or **thread**), performs a **context switch**, and selects the next process (or thread) to run.
- Schedulers typically do not give guarantees when and how often they act, who gets selected next, etc.

## What is **scheduling overhead** (Scheduling-Overhead)?

- The extra time spent by the system or the algorithm to distribute work on multiple **threads**/tasks.

## What is a **shared resource** (geteilte Ressource)?

- Any resource (memory location, input source, output sink, ...) shared by more than one **thread**.

## What is **speedup** (Speedup / Beschleunigung)?

- \\( S_p \\): How much faster does a program run using \\( p \\) processors, compared to running the sequential version of the same program.
- \\( S_p = T_1/T_p \\).
- **Speedup** is an absolute value. The relative value is called "**efficiency**".

## What is **starvation** (Verhungern / Starvation)?

- A **thread** starves if it can never enter a/any **critical section**.

## What is **synchronisation** (Synchronisation)?

- Some form of orchestration via **threads**.
- Typically, to prevent **bad interleavings**.

## What does the keyword **synchronized** (synchronized) do?

- Java keyword, enforcing **mutual exclusion** for a **critical section** via some object's intrinsic **lock**.

## What are a **task graph, work, span** (Taskgraph, Work, Span)?

- **Task graph**: Graph (DAG) created by drawing nodes (tasks) and edges (spawns, joins).
- **Work**: In a task graph (\\( T_1 \\)), it is the sum of the cost of all nodes in the graph.
- **Span**: The critical path (height) of the task graph. Corresponds to \\( T_\infty \\).

## What is **throughput** (Durchsatz)?

- An evaluation metric for pipelines.
- **Throughput** measures the amount of work (e.g., CPU instructions) that can be done by a pipeline in a given period of time.

## What is a **thread** (Thread / Faden)?

- In general, an independent (i.e., capable of running in parallel) unit of computation that executes a piece of code.
- The concept of **threads** exists on various levels: hardware (CPU), operating systems, programming languages.
- In Java, thread also refers to an instance of the `Thread` class.

## What is **thread mapping** (Thread-Mapping)?

- How a Java/JVM **thread** is related to an operating system thread.
- In **native threading** (most common), each JVM thread is mapped to a dedicated operating system thread.
- In **green threading**, the JVM maps several threads to a single operating system thread.

## What is **vectorisation** (Vektorisierung)?

- Using special machine code instructions to execute a single operation (e.g., plus) on a chunk of data (e.g., an array segment).
- Can significantly improve performance.
- Code can be vectorised automatically, by compilers, or manually, by using intrinsics libraries provided by hardware vendors.

## What is **warm-up** (Aufwärmphase / Warm-up)?

- In order to perform optimally, the JVM often needs some time to 'learn' what kind of code is typically being executed.
- This applies also and especially to the **ForkJoin framework**, which needs some time to optimally distribute tasks on **threads**.

## What is **work partitioning** (Arbeitsaufteilung / Work Partitioning)?

- Split-up of a program into smaller tasks that can be executed in parallel.
- Ideally, each task performs its work independently of any other task, for instance on separate areas of a data structure.
