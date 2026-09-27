## Wie lässt sich die Korrektheit paralleler Programme durch **Erschöpfung (Exhaustion)** theoretisch beweisen und woran scheitert dies?

- Durch die manuelle Evaluation **aller möglichen Ausführungsreihenfolgen**.
- Formel für Interleavings bei \\(2\\) Threads à \\(k\\) Statements (Ziehen ohne Zurücklegen): \\(\binom{2k}{k}\\).
- **Problem**: Scheitert in der Praxis an der Kombinationsexplosion (es gibt viel zu viele Möglichkeiten).

## Wie funktioniert der **Beweis durch Widerspruch (Contradiction)** bei parallelen Programmen?

- Durch logische Deduktion, dass ein Fehler unmöglich ist.
- Annahme eines Fehlerfalls führt zu einem **logischen Kreisschluss (Zyklus)** in der Ausführungsreihenfolge.
- Beispiel: Durch Transitivität ergibt sich, dass eine Aktion vor sich selbst stattgefunden haben müsste (z.B. \\(a=y \rightarrow b=x \rightarrow x=1 \rightarrow y=1 \rightarrow a=y\\)).

## Was versteht man unter **Heisenbugs** bei der Softwareentwicklung?

- **Stochastische oder zufällige Fehler** in ungeschütztem Parallel-Code.
- Sie verschwinden oft bei blosser Beobachtung (z.B. durch Nutzung eines Debuggers oder das Setzen des `-O0` Compiler-Flags).
- Unerwartete Abstürze treten meist erst unter **aggressiver Optimierung** (z.B. `-O3`) auf.

## Was ist die **Grundregel** für Code-Veränderungen durch Compiler oder Hardware beim **Memory Reordering**?

- Beliebige Umordnungen sind erlaubt, solange die **sequenzielle Semantik** erhalten bleibt.
- Das korrekte Resultat für einen einzelnen, isolierten Thread muss garantiert sein.

## Welche drei Arten von **Compiler-Optimierungen** führen auf Software-Ebene zu Memory Reordering?

- **Dead Code Elimination**: Das Entfernen von effektlosen Befehlen.
- **Register Hoisting**: Das Zwischenspeichern (Caching) von Werten in CPU-Registern ohne Update in den RAM.
- **Locality Optimizations**: Strukturelle Anpassungen für eine bessere Cache-Nutzung.

## Warum kann eine Warteschleife wie `while(x==1)` auf eine globale Variable durch Compiler-Optimierung zu einer **Infinite Loop** werden?

- Der Compiler geht von **lokaler Unveränderlichkeit** aus (z.B. durch **Register Hoisting**).
- Er erwartet nicht, dass ein anderer Thread den Wert ändert.
- Die Schleife wird zu einem **unbedingten Sprung** (z.B. `jmp always`) wegoptimiert.

## Welche drei Konzepte der **CPU-Architektur** führen auf Hardware-Ebene zu Memory Reordering?

- **Pipelined Architecture**: Instruktionen überholen sich zur Laufzeit.
- **Caches**: Speichern Daten privat pro Kern (Register, L1) oder geteilt (L2, System Memory).
- **Store Buffers**: Erbringen einen enormen Performance-Boost, vertauschen aber hardwareseitig Lese- und Schreiboperationen.

## Was definiert ein **Speichermodell (Memory Model)** in der Computerarchitektur?

- Es ist ein **Vertrag (Contract)** zwischen dem System und dem Programmierer.
- Es erlaubt dem System, Optimierungen durchzuführen.
- Im Gegenzug fordert es eine explizite **Synchronisation** durch den Programmierer.

## Wie unterscheiden sich **starke** und **schwache** Architektur-Speichermodelle?

- **Starke Modelle** (z.B. x86 - Intel/AMD):
  - Bieten eine hohe Vorhersehbarkeit.
  - Ausnahme: Lesezugriffe (Reads) dürfen wegen **Store Buffers** nach Schreibzugriffen (Writes) umgeordnet werden.
- **Schwache Modelle** (z.B. ARM):
  - Erlauben maximale Umordnungen.
  - Bieten hohes Performance-Potenzial, machen die Programmierung aber extrem komplex.

## Auf welcher Basis evaluiert das **Java Memory Model (JMM)** die Ausführung eines Programms?

- Die Evaluation erfolgt via **Traces** (den tatsächlichen Ausführungspfaden zur Laufzeit).
- Sie erfolgt **nicht** via Quellcode.
- Das JMM bietet eine plattformübergreifende Abstraktion.

## Was definiert die **Program Order (PO)** im Java Memory Model?

- Die totale Ordnung der Instruktionen **innerhalb eines einzelnen Threads**.
- Register-Zuweisungen (z.B. `r1 = y`) passieren exklusiv auf dieser Ebene.
- Es gibt dabei **keine Garantie** für das korrekte Verhalten von geteiltem Speicher.

## Was sind **Synchronization Actions (SA)** im Java Memory Model und welche Kern-Eigenschaft haben sie?

- Es sind besondere Aktionen wie Lese-/Schreibzugriffe auf `volatile`, Lock/Unlock durch `synchronized` und der Thread-Lifecycle.
- Sie fungieren als **globale Ankerpunkte**.
- Sie erzeugen Speichersichtbarkeit und **verhindern das Reordering** über die SA-Grenze hinweg.

## Was beschreibt die **Synchronizes-With (SW)** Beziehung im Java Memory Model?

- Die Paarung korrespondierender **Synchronization Actions** über Thread-Grenzen hinweg.
- Beispiel: Thread A schreibt eine `volatile` Variable \\(x\\) \\(\rightarrow\\) Thread B liest danach exakt dieses `volatile` \\(x\\).

## Was ist die **Happens-Before (HB)** Ordnung im Java Memory Model?

- Die transitive Hülle (Verkettung) aus **Program Order (PO)** und der **Synchronizes-With (SW)** Beziehung.

## Was garantiert die **HB Consistency (Happens-Before Consistency)** im Java Memory Model?

- Ein Lesezugriff (Read) sieht zwingend den **letzten Schreibzugriff (Write)** auf der Happens-Before-Zeitachse.
- Alternativ sieht er einen komplett ungeordneten Schreibzugriff.

## Was definiert die **Synchronization Order (SO)** im Java Memory Model und was ist der Trade-off?

- Eine globale, totale Ordnung **aller Synchronization Actions (SAs)**.
- Alle Threads sehen sämtliche SAs in exakt derselben Reihenfolge. (Innerhalb eines Threads folgen SAs der Program Order).
- **Trade-off**: Bringt absolute Konsistenz auf Kosten **massiver Performance-Einbussen** (sollte minimiert werden).

## Wie ist ein **Data Race** im Java Memory Model definiert und wie behandelt Java dies im Vergleich zu C++?

- Ein Data Race ist der Lesezugriff auf eine Variable **ohne gültige Happens-Before-Beziehung**.
- In Java ist dies **explizit erlaubt** (im Gegensatz zu C++, wo es zu *Undefined Behavior* oder Abstürzen führt).

## Welche Best Practice gilt für den Umgang mit **Data Races** und Synchronisation in Java?

- Data Races **niemals absichtlich nutzen**.
- Immer die **einfachste Lösung** (`synchronized`) präferieren.
- Komplexere Ansätze wie `volatile` nur bei extremer Performance-Kritikalität einsetzen.
