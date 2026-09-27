## Diskrete Mathematik Übungsstunde

**Für Material bezüglich der Übungsstunde siehe Unterordner:** [`03_TA/26HS_252-0025-01L_Diskrete_Mathematik`](03_TA/26HS_252-0025-01L_Diskrete_Mathematik).

---

# ETH Resources

This repository contains all the summaries, flashcards, LLM prompts, cheat sheets, and other documents I have produced so far during my Computer Science studies at ETH Zurich. 

Additionally, I have documented my study workflow below. Organizing my studies this way has helped me immensely, and I hope others can draw inspiration from it to optimize their own routines.

## Index

- **00_General**: Workflow-specific files and documentation.
  - [prompts](00_General/prompts): All LLM prompts I've iterated on over the years. (Note: Check the subject folders below for specific add-ons).
- **01_BSc**: All documents categorized by subject.
  - **01_Assessment_Year**
    - [227-0003-10L_Digital_Design_and_Computer_Architecture](01_BSc/01_Assessment_Year/227-0003-10L_Digital_Design_and_Computer_Architecture)
    - [252-0025-01L_Diskrete_Mathematik](01_BSc/01_Assessment_Year/252-0025-01L_Diskrete_Mathematik)
    - [252-0026-00L_Algorithmen und Datenstrukturen](01_BSc/01_Assessment_Year/252-0026-00L_Algorithmen%20und%20Datenstrukturen)
    - [252-0027-00L_Einführung_in_die_Programmierung](01_BSc/01_Assessment_Year/252-0027-00L_Einführung_in_die_Programmierung)
    - [252-0029-00L_Parallele_Programmierung](01_BSc/01_Assessment_Year/252-0029-00L_Parallele_Programmierung)
    - [252-0030-00L_Algorithmen_und_Wahrscheinlichkeit](01_BSc/01_Assessment_Year/252-0030-00L_Algorithmen_und_Wahrscheinlichkeit)
    - [401-0131-00L_Linear_Algebra](01_BSc/01_Assessment_Year/401-0131-00L_Linear_Algebra)
    - [401-0212-16L_Analysis_I](01_BSc/01_Assessment_Year/401-0212-16L_Analysis_I)
  - **04_Elective_Courses**
    - [252-0341-01L_Information_Retrieval](01_BSc/04_Elective_Courses/252-0341-01L_Information_Retrieval)
  - **05_Other_Courses**
    - [351-1109-00L_Einführung_in_die_Mikroökonomie](01_BSc/05_Other_Courses/351-1109-00L_Einführung_in_die_Mikroökonomie)
- **03_TA**: Material for subjects where I act as a Teaching Assistant.
  - [26HS_252-0025-01L_Diskrete_Mathematik](03_TA/26HS_252-0025-01L_Diskrete_Mathematik)

## My Workflow

> **Note:** This guide recommends skipping most in-person lectures and exercise sessions. However, if you are a first-semester student, I highly advise attending them. They are essential for meeting your peers, and the fixed lecture schedule acts as a great pacer for your progress.

At first glance, this workflow might seem extremely time-intensive. Let me assure you it is not: you can achieve under 20 hours of work per credit while maintaining excellent grades. My goal for the *Basisjahr* (first year) was a GPA of >= 5.5 to qualify for specific exchange university programs. By applying this workflow, I achieved this goal *relatively* efficiently, despite ETH's reputation for heavy workloads.

The efficiency comes from the simplistic, linear nature of the weekly schedule. I assign a specific set of tasks for each subject and work through them chronologically. This removes decision fatigue (metaphorically turning me into a machine executing steps). Combined with the [Pomodoro technique](https://en.wikipedia.org/wiki/Pomodoro_Technique), this structure makes it easy to maintain 8+ hours of deep focus per day. This allows you to complete all your work between Monday and Friday, leaving the weekend entirely free.

Additionally, at the start of the semester, I decide which steps to skip for each subject based on my prior knowledge, the exam format (memorization vs. logic), and course difficulty. For *Introduction to Programming*, I skipped almost everything except reading slides and doing occasional exercises because I already knew how to code. For *Discrete Mathematics*, the only step I skipped was making flashcards.

Here are the specific weekly steps I follow:

1. **Prepare for the lecture:** For conceptually difficult courses (like DiskMat, LinAlg, AuW), I skim the scripts or the lemmas we will be proving *before* the lecture. Whenever I forgot to do this, my comprehension during the lecture and my retention afterward dropped considerably.
2. **Watch the lecture:**
   - This is your source of truth. Your goal is to **understand 90%** of the material presented. If you fall short of this, increase your prep time (e.g., read the lecture notes more thoroughly or watch previous years' recordings on your commute).
   - Skipping in-person lectures and watching recordings on your own schedule saves an immense amount of time. You avoid 15-minute scheduled breaks and can watch at 2.5x speed, since [humans process information much faster than people speak](https://github.com/codebicycle/videospeed#the-science-of-accelerated-playback).
   - I **never take manual notes**. Because lectures are recorded, I feed transcripts directly into my summaries. Focus entirely on understanding the concepts rather than worrying about formatting notes or deciphering the lecture's handwriting. You will notice that the percentage of students taking manual notes drops significantly in later semesters.
3. **Summarize the lecture:** This step bridges the gap from 90% to 99% understanding. The final summary document isn't the primary goal (you will likely only skim it during exercises or read it once before your first practice exam). The real value lies in the mental structure you build by actively editing and organizing the content.
   1. **Transcribe the lecture:** The ETH Video platform provides transcripts for all recordings. I take this transcript, alongside the closest source material (usually slides or lecture notes), and feed it into an LLM using my [Captions Prompt](00_General/prompts/05e Captions.md). This filters out transcription errors and extracts only the relevant insights not already in the official notes, capturing exactly what the lecturer emphasized.
   2. **Write the initial draft:** I use an LLM to generate the entire first draft, reducing summary writing time by 80% while losing less than 10% of the learning effect. I feed the relevant sources into the LLM using my [Summary Prompt](00_General/prompts/01e Summary.md), sometimes adding course-specific instructions (e.g., for [AuW](01_BSc/01_Assessment_Year/252-0026-00L_Algorithmen und Datenstrukturen/Zusammenfassung Prompt Zusatz.md)). Providing fewer, high-quality inputs (the cleaned transcript, slides, specific script pages, and previous summaries for structural context) works best, as LLMs struggle to synthesize overly sparse information.
   3. **Iterate:** This is the most crucial step. You must **read the entire initial draft** and add `TODO: <comment>` tags to dictate what needs reorganizing, adding, or changing. (You can also edit or delete parts manually). Feed this commented draft back into the LLM using the [Postprocessing Prompt](00_General/prompts/02e Postprocess Summary.md) and repeat until you are satisfied. By acting as the "editor," you retain 90% of the learning effect and quickly identify concepts you still haven't fully grasped.
   4. **Add images:** I manually insert diagrams and images where needed. It is tedious, but highly beneficial for certain subjects.
4. **Create flashcards:** Flashcards are only necessary for memorizing algorithms or facts when you are not allowed a comprehensive cheat sheet. Because I use my refined summaries as a base, generating cards is purely mechanical and offers no active learning effect.
   1. **Draft from summary:** Feed the summary and previous cards into an LLM using the [Flashcard Prompt](00_General/prompts/03e Flashcards.md). With a high-quality summary, modern LLMs usually generate a *good enough* set of cards on the first try. This outputs a Markdown file (example [here](01_BSc/01_Assessment_Year/227-0003-10L_Digital_Design_and_Computer_Architecture/cards/2614a Pipelining.md)).
   2. **Export to Anki:** I use [`markdown-anki-decks`](https://github.com/lukesmurray/markdown-anki-decks) to convert these Markdown files into Anki packages for import. Because this tool doesn't support images well, I add them manually inside Anki. If you want to use my decks, I highly recommend importing the `ALL_...` packages (like [this one](01_BSc/01_Assessment_Year/227-0003-10L_Digital_Design_and_Computer_Architecture/cards/ALL_Digital Design and Computer Architecture.apkg)), as these contain the manually added images. (If you find a better automated workflow for images, please message me).
   3. **Learn cards:** Anki uses a sophisticated spaced-repetition algorithm (I recommend turning on FSRS) to schedule reviews so you never forget material. It works best if you start months in advance, though I realistically only started grinding cards four weeks before exams during the *Lernphase*. Four weeks is adequate, but be warned: if you have a massive deck, going through it thoroughly just **once** can take an entire week.
5. **Correct previous week's exercises:** Practicing without a feedback loop is useless. You can get fast, accurate corrections by feeding your solution and the context into an LLM using the [Corrections Prompt](00_General/prompts/06e Corrections.md). Use the output as a guide to see which parts of your logic hold up and which need scrutiny. The key is to deeply understand *why* your approach was wrong. I never redo an exact exercise, but after reviewing it, I ensure I can confidently solve variations using the same core proof or logic. I also use this exact method to correct my practice exams.
6. **Solve this week's exercises:** Finally, I tackle all labs, exercises, and quizzes. Track deadlines obsessively and **ALWAYS** submit bonus exercises on time. Missing them throws away free exam points and can literally be the difference between passing and failing. 
   - **Rule for LLMs:** Do not use an LLM for the first 20–30 minutes of being stuck. If you still have no progress, ask it for a *hint*, not the solution. Your goal should be to reduce LLM reliance to zero by the end of the semester. During the actual exam, you will inevitably get stuck for 10+ minutes; if you never practice pushing through that frustration during the semester, you will fail in the exam.
   - **Rule for completion:** Avoid the trap of stopping when your solution is "95% correct." Certain exams (like the coding section in AuD) award zero points for incomplete or buggy answers. If you don't practice squashing those final bugs during the semester, you are effectively training to get zero points.
   - **Prioritize understanding over completing:** While you should target solving all exercises for difficult subjects, it is even more important that you understood all solutions. Lectures often provide exercises to show important edge-cases or mechanics not mentioned in the lecture.

To manage these steps across multiple subjects, I create an Obsidian note for every week and every course, utilizing a standardized checklist. This system allows me to fall a month behind on lectures and seamlessly pick up exactly where I left off. (Bonus submissions get separate, prioritized reminders since they cannot be delayed). 

Here is an example weekly checklist for DDCA:

```markdown
## Postprocess

- [ ] Watch lectures
- [ ] Transcribe lectures
- [ ] Summarize lectures
	- [ ] Write
	- [ ] Add images
- [ ] Create cards
	- [ ] Write cards
	- [ ] Create Anki deck
	- [ ] Add images
- [ ] Learn cards
- [ ] Watch problem session
- [ ] Solve lab exercise
	- [ ] Submit
- [ ] Write lab report
	- [ ] Submit
```

I wish I had more time to detail my organizational philosophy. For instance, my Obsidian vault (and my entire file system) is structured similarly to the [Johnny.Decimal](https://johnnydecimal.com/) system. Many of these ideas stem from discussions with peers about their workflows, which I’ve refined over the years for maximum efficacy. 

My large summary and flashcard prompts are a good example of this iterative process. I built them before "thinking" models existed (which is why they still instruct the LLM to output its reasoning steps) and fine-tuned them to maximize the output of the best free model available to me (currently Gemini 3.1 Pro).

If you've read this far, I hope you've found a few actionable ideas to implement into your own routine. Ultimately, succeeding at ETH is about extracting the most value out of limited weekly time. Find a workflow that suits your strengths, and get exceptionally fast at executing it.