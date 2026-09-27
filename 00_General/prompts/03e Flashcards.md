Create Anki flashcards from the given text **without summarizing**. The question should be a Level-2 Markdown heading (`## <Question>`) and the answer should be the content of the sub-chapter. Except for Questions, no further Markdown-headers should be used.

## Content Specifications

- The goal is the **complete understanding of the content**, not its one-to-one reproduction.
- All concepts (e.g., "What is Switzerland?") and relationships (e.g., "Which countries are in Europe?") should be covered.
- The content should be divided into the smallest, most isolated parts possible.
- No content should be queried twice.
- If the complete definition of a concept is necessary in a relationship card, a separate card for the concept should no longer be created.
- Relationship cards come **under** the corresponding concept cards.
- Questions should always be unambiguous and atomic and clearly ask for the required answer. They should be answerable by an expert who has never seen the text or the other cards.
- Cards should contain a **maximum of approx. 120 words**, but can also be much smaller.
- Examples should only be queried in the context of the actual concept.
- If I attach other **flashcards in Markdown**, their content should be understood as existing knowledge and not be repeated in the new flashcards.

## Formatting Specifications

Use the verbatim text and its formatting as much as possible. **Only change it when absolutely necessary** and keep it pragmatic. If you have to make any changes when trimming the content, observe the following guidelines:

- Use **bullet points** or **very short phrases** and **avoid prose**.
- If necessary, use **indented bullet points** for sub-items/lists. (indent using 4 spaces)
- Mark **important keywords** and all mentioned **terms** in bold (`**word**`).
- Formulate **specifically and concretely**, adding examples where possible (e.g., in parentheses or as a sub-item).
- The language should be **concise, clear, and understandable** (US English).
- Prefer **simple and common language**. Avoid unnecessary technical terms that are not explicitly mentioned in the learning objectives or sources, and that can be easily replaced by more common words (e.g., "dehydration" instead of the less common "desiccation").
- **Avoid redundancies**: Do not repeat information verbatim or very similarly in directly consecutive sections. Short references or the application of a concept as an example in another context (e.g., mentioning climate factors in the climate section and again as an example of animal adaptations) are acceptable if they serve to improve understanding.
- The goal is a structure that enables quick comprehension and repetition (**Anki-friendly**).
- **Do not** reference the attachments in the text, as they will not be available to the reader later.
- Prefer inline LaTeX (Anki syntax: `\\(<expression>\\)`, not wrapped in backticks) for mathematical expressions. Only use blocks (`\\[<expression>\\]`) for big formulas. Escape Markdown-specific characters in the expression like \* or \_ as MathJax will be applied on the resulting HTML. **Never** wrap an expression in $ instead of \\(.

## Steps for Creation

Execute the following steps without interruption and report each step in the chat. Only ask any follow-up questions after all steps are completed.

1. **Plan Structure:**
    - Briefly list the atomic parts of each chapter.
    - Briefly list the relationships between these atomic parts.
    - Outline a sensible **division of the content** into cards.
    - Ensure that all relevant concepts and relationships are mentioned and that the same thing is not asked twice.
2. **Write Cards:**
    - Create all cards based on the planned structure.
    - Be as faithful as possible to the text, its formatting, and its conciseness.
    - Ensure that all relevant relationships to concepts are mentioned.
3. **Review Specifications:**
    - List all chapters and sub-chapters of the text and all specifications (content and format) individually once more and check individually (with a check mark or a cross and a short comment **per item**) whether they have been sufficiently addressed in the summary and in the desired format.
    - If there are gaps or deviations, describe them clearly.
    - Be aware that all your previous work could be incorrect and evaluate it critically as a third person would.
4. **Address Deficiencies (if necessary):**
    - If gaps were identified in step 3, formulate a clear follow-up prompt with instructions for improvement or ask specifically for missing information.

## Source Text to Process
