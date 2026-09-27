## Was ist das **Ziel** des **Konsensus** in der Nebenläufigkeit?

- Koordination mehrerer Threads zur Einigung auf exakt **denselben Wert**.
- Es ist das Fundament aller non-trivialen parallelen Algorithmen.

## Wie sieht das **Interface** für einen **Konsensus** in Java aus?

- `public interface Consensus<T> { T decide(T value); }`

## Welche drei zwingenden **Anforderungen** muss ein **Konsensus-Protokoll** erfüllen?

- **Wait-free**: Rückkehr der Methode für jeden Thread in endlicher Zeit (kein Blockieren bei Thread-Absturz).
- **Consistent**: Exakt dasselbe Resultat für alle Threads (Gewinner-Wert).
- **Valid**: Entschiedener Wert stammt zwingend aus den ursprünglichen Input-Werten (keine erfundenen Werte).

## Wie ist die **Consensus Number** (Konsensus-Zahl) definiert?

- Die maximale Anzahl \\(n\\) an Threads, die mit einer Objektklasse \\(C\\) (plus beliebig vielen Read/Write-Registern) **wait-free** synchronisierbar sind.

## Wie ist die **Konsensus-Hierarchie** (Zahlen 1, 2 und \\(\infty\\)) aufgeteilt?

- **Konsensus-Zahl 1**: Standard Read/Write Register (atomares Lesen/Schreiben einzelner Variablen).
- **Konsensus-Zahl 2**: FIFO Queues, LIFO Stacks, `getAndSet()`, `getAndIncrement()`, `Test-And-Set`.
- **Konsensus-Zahl \\(\infty\\)**: `Compare-And-Set` (CAS), `Load-Linked/Store-Conditional` (LL/SC), Multiple Assignment (atomares gleichzeitiges Zuweisen mehrerer Variablen).

## Wie beweist man (By Construction), dass **CAS** die **Konsensus-Zahl \\(\infty\\)** besitzt?

- **Setup**: Shared `AtomicIntegerArray proposed` und globales `AtomicInteger r = -1`.
- **Ablauf**: Thread schreibt eigenen Wert in `proposed[id]`.
- **Entscheidung**: Ausführung von `r.compareAndSet(-1, id)`.
- **Resultat**:
    - **Gewinner** (`true`): Retourniert eigenen Wert aus `proposed[id]`.
    - **Verlierer** (`false`): Liest Gewinner-ID aus `r`, retourniert `proposed[Gewinner-ID]`.
- **Erfüllt**: **Wait-free** (kein Warten), **Valid** (nur Array-Werte), **Consistent** (gleicher Gewinner für alle).

## Wie lautet der **Widerspruchsbeweis**, dass eine **Wait-free FIFO Queue** nicht aus Registern gebaut werden kann?

- **Annahme**: Existenz einer Wait-free Queue basierend auf Registern.
- **Konstruktion**: 2-Thread Consensus via Queue (2 Bälle: rot, schwarz).
- **Protokoll**: Ball ziehen. Rot gewinnt (entscheidet eigenen Wert), Schwarz verliert (liest Gewinner-Wert aus Shared Array).
- **Widerspruch**: Erfolgreicher 2-Thread Consensus ist so nur mit Registern möglich. Register besitzen jedoch strikt Konsensus-Zahl \\(1\\).

## Was ist das **Ziel** des Unmöglichkeitsbeweises für **atomare Register**?

- Der mathematische Beweis, dass atomare Read/Write Register maximal \\(1\\) Thread **wait-free** synchronisieren können (Konsensus-Zahl \\(1\\)).

## Durch welche **Reduktion** wird das Problem im Unmöglichkeitsbeweis für atomare Register vereinfacht?

- Limitierung auf **\\(2\\) Threads** (A und B). Scheitern bei \\(2\\) impliziert Scheitern bei \\(n\\).
- Reduktion auf **Binary Consensus** (Input/Output strikt \\(0\\) oder \\(1\\)).
- **Äquivalenz**: 2-Thread Binary Consensus ist nachweislich gleich mächtig wie 2-Thread Integer Consensus (via Shared Array abbildbar).

## Wie ist der **Zustands-Baum (Execution Tree)** in der Konsensus-Theorie aufgebaut?

- Ausführungs-Modellierung als Binärbaum.
- **Knoten**: Globaler Zustand (lokale/globale Variablen, Program Counter).
- **Kanten**: Schritt von Thread A (links) oder Thread B (rechts).

## Wie unterscheiden sich **univalente** und **bivalente** Zustände (**Valenz**) im Zustands-Baum?

- **Univalent** (\\(0\\)-valent / \\(1\\)-valent): Endgültige Protokoll-Entscheidung ist unveränderlich fixiert, unabhängig vom Scheduling (Baum-Blätter sind zwingend univalent).
- **Bivalent**: Resultat (\\(0\\) oder \\(1\\)) ist noch offen, abhängig vom weiteren Scheduling.

## Warum ist der **Initialzustand** eines Konsensus-Protokolls zwingend **bivalent** (Theorem 1)?

- Start A(\\(0\\)) und B(\\(1\\)).
- Bei alleinigem Lauf von A ist das Resultat zwingend \\(0\\) (**Wait-free**).
- Bei alleinigem Lauf von B ist das Resultat zwingend \\(1\\).
- Die Entscheidung ist somit anfangs offen \\(\rightarrow\\) der Zustand ist **bivalent**.

## Wie ist der **kritische Zustand (Critical State)** in einem Zustands-Baum definiert?

- Es ist der **letzte bivalente Zustand**.
- **Alle** direkten Folgezustände (Kinder) sind univalent \\(\rightarrow\\) es ist der Ort der finalen Entscheidung.

## Warum gibt es im Zustands-Baum **immer mindestens einen kritischen Zustand** (Theorem 2)?

- Der Baum ist zwingend von endlicher Tiefe (**Wait-freedom**).
- Ein Abstieg über bivalente Knoten stösst unausweichlich irgendwann auf eine **univalente Grenze**.

## Was ist die **Ausgangslage** für die Fallunterscheidung im **Widerspruchsbeweis (Critical State)**?

- Man befindet sich im kritischen Zustand.
- Schritt A \\(\rightarrow\\) führt zwingend zu Entscheidung \\(0\\).
- Schritt B \\(\rightarrow\\) führt zwingend zu Entscheidung \\(1\\).

## Warum führt die Nutzung von **rein lokalen Variablen** im kritischen Zustand zu einem **Widerspruch**?

- A rechnet rein lokal, stirbt sofort. B läuft solo weiter.
- Die lokale Änderung ist für B unsichtbar. Der globale Zustand ist für B identisch zum Zustand vor As Schritt.
- B entscheidet blind \\(1\\), obwohl der Pfad eigentlich \\(0\\) verlangt \\(\rightarrow\\) **Widerspruch**. (Nutzung geteilter Register ist zwingend).

## Warum führt eine reine **Read-Operation** im kritischen Zustand zu einem **Widerspruch**?

- A liest ein Shared Register und stirbt sofort.
- **Problem**: Reines Lesen ändert den globalen Zustand nicht. Der Zustand bleibt für B unverändert.
- B entscheidet blind \\(1\\), obwohl der Pfad \\(0\\) verlangt \\(\rightarrow\\) **Widerspruch**. (Gilt symmetrisch für B).

## Warum führt eine **Write-Operation auf verschiedene Register** im kritischen Zustand zu einem **Widerspruch**?

- A schreibt Register 1, B schreibt Register 2.
- **Problem**: Die Ausführungs-Reihenfolge ist irrelevant. Der Endzustand ist absolut identisch (beide Register sind beschrieben).
- Ein aufwachender Thread kann die Reihenfolge nicht erkennen, der Gewinner ist unbestimmbar \\(\rightarrow\\) **Widerspruch**.

## Warum führt eine **Write-Operation auf dasselbe Register** im kritischen Zustand zu einem **Widerspruch**?

- A schreibt Register 1, B schreibt Register 1.
- **Problem**: B überschreibt A komplett. Bei As Tod sieht der Zustand nach einem alleinigem Schreiben durch B aus.
- Die Zustände "B überschreibt A" und "B schreibt als Erster" sind absolut ununterscheidbar \\(\rightarrow\\) **Widerspruch**.

## Was ist die finale **Schlussfolgerung** aus dem Widerspruchsbeweis im kritischen Zustand?

- Keine Read/Write-Kombination löst einen bivalenten Zustand verlässlich auf (unter der Bedingung **Wait-freedom**).
- Reines Shared Memory (Konsensus-Zahl 1) ist mathematisch **unzureichend für 2-Thread Consensus**.
