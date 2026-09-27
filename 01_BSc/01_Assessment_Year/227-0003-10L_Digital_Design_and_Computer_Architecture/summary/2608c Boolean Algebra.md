## Boolean Algebra

- **Syntax Overview**:
    - **AND**: Product ($\cdot$ or concatenated variables, e.g., $AB$).
    - **OR**: Sum ($+$).
    - **NOT**: Overline (e.g., $\overline{A}$).
- **Axioms & Laws**: Mathematical system on 1s and 0s.
    - **Identity**: $A + 0 = A$, $A \cdot 1 = A$.
    - **Commutative**: $A + B = B + A$, $A \cdot B = B \cdot A$.
    - **Distributive**: $A \cdot (B + C) = (A \cdot B) + (A \cdot C)$, $A + (B \cdot C) = (A + B) \cdot (A + C)$.
    - **Complement**: $A + \overline{A} = 1$, $A \cdot \overline{A} = 0$.
- **Duality**: Swapping AND $\leftrightarrow$ OR and 1 $\leftrightarrow$ 0. If an expression is true, its dual is also true.
- **DeMorgan's Laws**: Transforms gate types.
    - $\overline{A + B} = \overline{A} \cdot \overline{B}$ (NOR $\equiv$ AND with inverted inputs).
    - $\overline{A \cdot B} = \overline{A} + \overline{B}$ (NAND $\equiv$ OR with inverted inputs).
- **Logical Completeness**: A set of gates capable of constructing *any* possible truth table.
    - Set {AND, OR, NOT} is logically complete.
    - A single gate type like **NAND** or **NOR** is universally complete on its own.

## Canonical Forms

- **Truth Table**: The unique signature of a logic function.
- **Canonical Forms**: Standardized, universally agreed-on algebraic representation derived from Truth Tables.
- **Sum of Products (SOP)**: Focuses on rows where output is 1.
    - **Minterm**: AND product of all input variables (evaluates to 1 for that specific row).
    - Function = logical OR (Sum) of all Minterms.
    - **Shorthand Notation**: $\Sigma m(\dots)$ (e.g., $\Sigma m(1,2,3)$ lists decimal indices of truth table rows where output is 1).
- **Product of Sums (POS)**: Focuses on rows where output is 0.
    - **Maxterm**: OR sum of all input variables.
    - Function = logical AND (Product) of all Maxterms (DeMorgan equivalent of the inverted SOP).
    - **Shorthand Notation**: $\Pi M(\dots)$ (e.g., $\Pi M(0,4,5)$ lists decimal indices of truth table rows where output is 0).
