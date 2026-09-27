## What is the syntax for **AND**, **OR**, and **NOT** in **Boolean Algebra**?

- **AND**: Product (\\(\cdot\\) or concatenated variables, e.g., \\(AB\\)).
- **OR**: Sum (\\(+\\)).
- **NOT**: Overline (e.g., \\(\overline{A}\\)).

## What is **Duality** in **Boolean Algebra**?

- Swapping **AND** \\(\leftrightarrow\\) **OR** and **1** \\(\leftrightarrow\\) **0**.
- If an expression is true, its dual is also true.

## What are **DeMorgan's Laws** and what do they transform?

They transform gate types:

- \\(\overline{A + B} = \overline{A} \cdot \overline{B}\\) (**NOR** \\(\equiv\\) **AND** with inverted inputs).
- \\(\overline{A \cdot B} = \overline{A} + \overline{B}\\) (**NAND** \\(\equiv\\) **OR** with inverted inputs).

## What is **Logical Completeness** and which gate sets are logically complete?

- **Definition**: A set of gates capable of constructing *any* possible **truth table**.
- The set {**AND**, **OR**, **NOT**} is logically complete.
- A single gate type like **NAND** or **NOR** is universally complete on its own.

## What is the **Sum of Products (SOP)** canonical form and what is a **Minterm**?

Focuses on rows where the output is **1**.

- **Minterm**: **AND** product of all input variables (evaluates to 1 for that specific row).
- Function = logical **OR** (Sum) of all **Minterms**.
- **Shorthand Notation**: \\(\Sigma m(\dots)\\) (e.g., \\(\Sigma m(1,2,3)\\) lists decimal indices of truth table rows where output is 1).

## What is the **Product of Sums (POS)** canonical form and what is a **Maxterm**?

Focuses on rows where the output is **0**.

- **Maxterm**: **OR** sum of all input variables.
- Function = logical **AND** (Product) of all **Maxterms** (DeMorgan equivalent of the inverted **SOP**).
- **Shorthand Notation**: \\(\Pi M(\dots)\\) (e.g., \\(\Pi M(0,4,5)\\) lists decimal indices of truth table rows where output is 0).
