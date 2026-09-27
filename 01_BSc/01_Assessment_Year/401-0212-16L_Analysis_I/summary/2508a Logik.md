## Aussagen und Prädikate

- Eine **Aussage** ist entweder wahr oder falsch (keine Halbwahrheiten) [^def1].
- Ein **Prädikat** $A(x)$ hängt von Variablen ab; der Wahrheitsgehalt wird erst durch Einsetzen der Variablen bestimmt [^def2].
- Die **Verneinung** (Negation) kehrt den Wahrheitswert um [^def3].
    - **Vorsicht bei Alltagssprache:** Die Negation von "Alle sind..." ist nicht "Keiner ist...", sondern "Es gibt mindestens einen, der nicht... ist".

## Quantoren

- Symbole für Mengenquantifizierung [^def4]:
    - $\forall$: "für alle"
    - $\exists$: "es gibt ein" (mindestens ein)
    - $\exists!$: "es gibt genau ein"
    - $\nexists$: "es gibt kein"
- **Wichtig:** Die Reihenfolge von Quantoren darf **nicht** vertauscht werden, da dies die Bedeutung ändert.
    - *Beispiel:*
        - $\forall x \ge 0 \, \exists y \in \mathbb{R} : x = y^2$ (Wahr: Jede nicht-negative Zahl hat eine Wurzel).
        - $\exists y \in \mathbb{R} \, \forall x \ge 0 : x = y^2$ (Falsch: Es gibt keine "Universalwurzel", die gleich allen Zahlen ist).

## Verknüpfungen und Regeln

- **Grundverknüpfungen** [^def5]:
    - **Und** ($A \land B$): Beide wahr.
    - **Oder** ($A \lor B$): **Einschliessendes Oder** (mindestens einer wahr).
    - **Implikation** ($A \Rightarrow B$): "Aus A folgt B". Nur falsch, wenn A wahr und B falsch ist. Äquivalent zu $\neg A \lor B$.
    - **Äquivalenz** ($A \Leftrightarrow B$): $(A \Rightarrow B) \land (B \Rightarrow A)$.
- **Negationsregeln** für Quantoren [^satz1]:
    - $\neg(\forall x A(x)) \Leftrightarrow \exists x \neg A(x)$ ("Nicht alle" $\Leftrightarrow$ "Es gibt ein Gegenbeispiel").
    - $\neg(\exists x A(x)) \Leftrightarrow \forall x \neg A(x)$ ("Es gibt kein" $\Leftrightarrow$ "Für alle gilt nicht").
- **Kontraposition** (für indirekte Beweise): $(A \Rightarrow B) \Leftrightarrow (\neg B \Rightarrow \neg A)$.

[^def1]: **Einführung Slide 2**: Eine **mathematisch Aussage** ist eine wohlformulierte mathematische Behauptung, welche entweder wahr oder falsch ist.
[^def2]: **Einführung Slide 2**: Eine Aussage, welche von einer oder mehreren Variablen (Argumenten, Inputs) abhängt, nennen wir **Prädikat** und wir schreiben dafür $A(x)$, respektive $A(x, y, \dots)$.
[^def3]: **Einführung Slide 3**: Die **Verneinung (Negation)** einer mathematischen Aussage $A$ ist die Aussage "$A$ gilt nicht" und wir schreiben $\neg A$.
[^def4]: **Einführung Slide 4**: Wir führen die folgenden **Quantoren** ("Kurzschreibweisen") ein: <br> $\forall$ "für alle" <br> $\exists$ "es gibt ein" <br> $\exists !$ "es gibt genau ein" <br> $\nexists$ "es gibt kein" <br> Quantoren stehen vor den Aussagen. <br> **Achtung!** Die Reihenfolge von Quantoren darf *nicht* vertauscht werden.
[^def5]: **Einführung Slide 6**: Die **Grundverknüpfungen von Aussagen** sind wie folgt definiert: <br> i) $A \land B$ ($A$ und $B$, logisches Und) <br> Sowohl $A$ als auch $B$ gelten, respektive $A \land B$ ist genau dann wahr, wenn $A$ und $B$ *beide* wahr sind. <br> ii) $A \lor B$ (einschliessendes Oder) <br> Mindestens eine der Aussagen $A$ und $B$ gilt, respektive $A \lor B$ ist genau dann wahr, wenn $A$ *oder* $B$ *oder beide* wahr sind. <br> iii) $A \Rightarrow B$ (Implikation) <br> $A \Rightarrow B$ bedeutet: Falls $A$ wahr ist, so ist auch $B$ wahr, respektive $\neg A \lor B$ <br> iv) $A \Leftrightarrow B$ (Äquivalenz) <br> Die beiden Aussagen $A$ und $B$ sind äquivalent, falls gilt $(A \Rightarrow B) \land (B \Rightarrow A)$
[^satz1]: **Einführung Slide 7**: Es gelten die folgenden Regeln <br> $\neg(\forall x A(x)) \Leftrightarrow \exists x \neg A(x)$ <br> $\neg(\exists x A(x)) \Leftrightarrow \forall x \neg A(x)$ <br> sowie <br> $\forall x (A(x) \land B(x)) \Leftrightarrow (\forall x A(x)) \land (\forall x B(x))$ <br> $\exists x (A(x) \lor B(x)) \Leftrightarrow (\exists x A(x)) \lor (\exists x B(x))$
