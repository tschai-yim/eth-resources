Create a precise and structured summary of the spoken content of a lecture that includes all relevant information.

## Content Specifications

- Use the attached subtitles and documents as sources.
- The documents were covered either directly (e.g., slides or handwritten notes) or indirectly (e.g., scripts) in the lecture. For the chronological listing, choose the document according to the following priority list: **Slides over Script over Handwritten Notes over Other**. In case of doubt, the document that best covers the lecture content.
- The summary should be structured as follows:
	- Short, descriptive title of the lecture content.
    - Content Legend (without a title, extremely brief description):
        - What was generally included and omitted.
        - What the formatting (italics, bold, etc.) means.
        - Which document was used as a reference.
        - That it is a summary of the spoken content.
    - **`## Important Notes`** (Level-2 heading without ##): A brief list of information where the lecturer explicitly pointed out its importance. For example:
        - Changes in dates
        - Prevention of common mistakes
        - Typical misunderstandings
        - A call to do something without fail
    - Chronological listing of **all sections (slides / chapters / logical sections)** of the reference document (grouped if necessary):
        - Title (Level-2 without ##): `## <Slide/Chapter/Note Section> <a>/<a>-<b>: <short title>`. For example:
            - `Slide 1-5: One Topic`
            - `Chapter 5.6.1: Another Topic`
            - `Note Section 2: A Further Topic`
        - A summary of everything that was said **without any loss of information**.
            - Italicize everything that is also in the section of the document: *like this*.
            - Bold everything that was implicitly or explicitly emphasized by the lecturer: **like this**.
            - The complete reproduction of the lecturer's statements has priority. A beautifully crafted structure is not necessary.
            - If something was **proven** in the lecture, the fact that it was proven must be absolutely mentioned.
        - Mention all possible questions and answers in a **`Questions` sub-point**.
            - If the question is inaudible, write down a guess (clearly marked as "was inaudible").
        - If sections were not discussed, they should **not be omitted** but marked very briefly, for example, with "Skipped" or "Not reviewed" as the chapter content.

## Formatting Specifications

- Use **bullet points** or **very short phrases** and **avoid continuous text**.
- Use **indented bullet points** for sub-points/lists where necessary. (indent using 4 spaces)
- Mark **important keywords** in bold (`**word**`).
- Be **specific and concrete**, adding examples where possible (if necessary, in parentheses or as a sub-point).
- The language should be **concise, clear, and understandable** (English).
- Prefer **simple and common language**. Avoid unnecessary technical terms that are not explicitly mentioned in the sources and can easily be replaced by more common words (e.g., "dehydration" instead of the less common "desiccation").
- Prefer inline LaTeX (`$<expression>$`, not enclosed in backticks, Obsidian syntax) for formulas and mathematical symbols. Only use blocks for large formulas.

## Steps for Creation

Execute the following steps without interruption and report each step in the chat. Only ask any follow-up questions after all steps are completed.

1. **Select Reference Document:**
    - Use the following priority list: **Slides over Script over Handwritten Notes over Other**.
    - **ALWAYS prefer** the slides or script over handwritten notes.
    - If the document proves to be a poor reference in later steps, choose a better one based on the new insights.
2. **Assign Subtitles to Sections:**
    - Assign the spoken content to each section without any loss of information.
3. **Write the Summary:**
    - Create the complete summary based on the specified structure.
    - Ensure that all relevant details of the terms and concepts are included.
4. **Review Specifications:**
    - List all specifications (content and format) again individually and check each one (with a checkmark or a cross and a short comment **per item**) to see if it has been adequately addressed in the summary and in the desired format. Pay attention to the following **minimum breakdown** for the content check:
        - List all slides of presentations individually.
        - List all chapters and subchapters of documents individually.
        - List all logical sections of unordered documents (like notes) individually.
        - If there is a lot of content, further subdivide the learning objectives / chapters / slides.
    - If there are gaps or deviations, describe them clearly.
    - Be aware that all your previous work could be wrong and evaluate it critically as a third person would.
5. **Address Deficiencies (if necessary):**
    - If gaps were identified in step 3, formulate a clear follow-up prompt with instructions for improvement or ask specifically for missing information.
