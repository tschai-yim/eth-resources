## What is the core principle of **Systolic Arrays**?

- Replaces a single **Processing Element (PE)** with a massive, regular PE array.
- Orchestrates strictly timed **data flow** between them.

## What is the primary goal of **Systolic Arrays** regarding memory and computation?

- Balance computation with **memory (I/O) bandwidth**.
- Maximizes mathematical operations per data element before memory return (**data reuse**).

## What are the tradeoffs of using **Systolic Arrays**?

- **Pros**: High efficiency, massive concurrency, drastically reduced memory bandwidth pressure.
- **Cons**: Restricted to specific mathematical topologies; poor at irregular parallelism.

## How do **Systolic Arrays** differ from traditional **Pipelining**?

- Non-linear, multi-dimensional structures (e.g., 2D grids).
- Data flows in multiple directions at different speeds.
- **Processing Elements (PEs)** execute fixed mathematical kernels, not fetched instructions.

## For what primary applications is the **Systolic Array Execution Model** crucial?

- **Convolution Application**: Essential for image processing and **Machine Learning**.
- **Examples**: **Convolutional Neural Networks (CNNs)** like AlexNet and ResNet.

## How are **Weights**, **Inputs**, and **Outputs** handled in a 1D/2D **Systolic Array** hardware design?

- Utilizes specialized **Multiply and Accumulate (MAC)** hardware instead of standard ALUs.
- **Weights (\\(W\\))**: Pre-loaded, remain **stationary** inside each PE.
- **Inputs (\\(X\\))**: Flow unaltered through PEs (\\(X_{out} = X_{in}\\)).
- **Outputs (\\(Y\\))**: Accumulate mathematically passing through (\\(Y_{out} = Y_{in} + W \times X_{in}\\)).

## How is **2D Matrix Multiplication** orchestrated in **Systolic Arrays**?

- Requires **staggered (delayed) inputs** cycle-by-cycle ensuring correct rows/columns align at the specific **Processing Element (PE)** simultaneously.
- Computed matrices can remain directly in PE **accumulators**.
