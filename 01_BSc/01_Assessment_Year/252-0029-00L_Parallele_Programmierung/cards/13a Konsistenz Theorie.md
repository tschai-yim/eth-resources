## Wie unterscheidet sich der Objekt-Zustand und die Analyse bei der **sequenziellen Ausführung** im Vergleich zur Nebenläufigkeit?

- Ein sinnvoller Objekt-Zustand existiert **nur zwischen Methodenaufrufen**.
- Methoden sind komplett **isoliert** analysierbar.
- Besitzt eine **Globale Uhr** (Global clock).

## Was charakterisiert die **nebenläufige Ausführung (Concurrent)** bezüglich Methodenaufrufen und Objekt-Zustand?

- Methodenaufrufe **überlappen** zeitlich.
- Das Objekt ist eventuell **nie** im Ruhezustand (**Quiescence**).
- Die Berücksichtigung **aller** Interaktionen ist zwingend.
- Nutzt individuelle **Objekt-/Thread-Uhren**.

## Wie ist ein **Methodenaufruf (Method Call)** in formellen Historien definiert und was bedeutet **Pending**?

- Das Intervall zwischen **Aufruf (Invocation)** und **Rückkehr (Response)**.
- Dazwischen: Aufruf gilt als **Pending** (ausstehend).

## Was ist eine **History \\( H \\)** in der Nebenläufigkeit?

- Eine Sequenz korrespondierender Invocations und Responses.
- Erfordert Übereinstimmung bei Thread-ID und Objekt-Name.

## Wie unterscheiden sich die **Object projection** (\\( H|q \\)) und **Thread projection** (\\( H|B \\)) in Historien?

- **Object projection \\( H|q \\)**: Beschränkt Historie \\( H \\) exklusiv auf Events des Objekts \\( q \\).
- **Thread projection \\( H|B \\)**: Beschränkt Historie \\( H \\) exklusiv auf Events des Threads \\( B \\).

## Was ist eine **Complete subhistory**?

- Eine Historie \\( H \\) ohne jegliche **Pending**-Aufrufe.

## Welche vier **Eigenschaften** (Sequential, Well formed, Equivalent, Legal) können Historien haben?

- **Sequential**: Keinerlei Überlappung von Methoden (ein einzelnes Pending am Ende ist erlaubt).
- **Well formed**: Jede Thread-Projektion ist sequenziell (keine Überlappung innerhalb desselben Threads; strikter Wechsel von Invocation und Response).
- **Equivalent**: Zwei Historien \\( H \\) und \\( G \\) sind äquivalent bei identischen Thread-Projektionen (\\( H|A = G|A \\)).
- **Legal**: Jede Objekt-Projektion respektiert die sequenziellen Spezifikationen (Pre-/Postconditions).

## Wie ist die **Precedence (\\( \to\_H \\))** zwischen zwei Methoden definiert und was impliziert sie?

- Methode \\( m\_0 \\) **geht voraus (precedes)** \\( m\_1 \\) (\\( m\_0 \to\_H m\_1 \\)): *Response* von \\( m\_0 \\) geschieht vor *Invocation* von \\( m\_1 \\).
- Impliziert eine **partielle Ordnung** (total bei sequenzieller Historie).
- Ohne diese Ordnung **überlappen** Methoden.

## Was ist die Basis-Definition von **Linearisierbarkeit (Linearizability)** bei Methoden?

- Die Methode erscheint **instantan (atomar)** zu einem exakten Zeitpunkt *zwischen* Invocation und Response.

## Wie wird die Linearisierbarkeit bei einer Historie \\( H \\) mit **Pending-Aufrufen formell erweitert**?

- Historie \\( H \\) ist linearisierbar bei möglicher Erweiterung zu Historie \\( G \\).
- *Erweiterungs-Regeln für Pending-Aufrufe*:
    - **Took effect (Effekt erzielt)**: Zustandsänderung wurde für andere sichtbar (z.B. eingefügtes Element von anderem Thread gelesen) \\( \rightarrow \\) **fiktive Response ergänzen**.
    - **Did not take effect (Kein Effekt)**: Keine sichtbare Änderung \\( \rightarrow \\) **verwerfen** (simuliert Thread-Absturz).
- \\( G \\) muss äquivalent zu einer **legalen sequenziellen Historie \\( S \\)** sein.

## Welche zwingende Bedingung bezüglich der **Echtzeitordnung** (Real-time order) gilt für die Linearisierbarkeit?

- Formel: \\( \to\_G \subset \to\_S \\)
- Die legale sequenzielle Historie \\( S \\) respektiert die absolute **Echtzeitordnung** von \\( G \\) strikt.
- Es gibt kein Umdrehen realer Abläufe.

## Was sind **Linearisierungspunkte (Linearization Points)** und wie werden sie in Code umgesetzt?

- Der logische Zeitpunkt, an dem der Effekt einer Methode für alle anderen Threads **global sichtbar** wird.
- **Essenzielle Regel**: Genau **eine atomare Instruktion** pro Ausführungspfad macht den Gesamteffekt sichtbar (garantiert Atomizität der Methode).
- *Beispiel Lock-basiert*: `lock.unlock()`.
- *Beispiel Lock-free*: Erfolgreicher `compareAndSet()` (CAS) oder `return null`.

## Worauf muss bei der Prüfung von Traces auf Linearisierbarkeit besonders geachtet werden?

- Die Korrektheit wird via überlappenden Linien-Diagrammen bewertet.
- **Wichtig**: Die Semantik der Datenstruktur muss beachtet werden.
- *Beispiel*: Bei einer FIFO-Queue muss ein Element zuerst raus, dessen `enqueue` in Echtzeit zuerst via Response **abgeschlossen** war.

## Was besagt das **Composability Theorem** und was ist die Konsequenz für die Modularität?

- **Theorem**: Eine Historie \\( H \\) ist exakt dann linearisierbar, wenn jede Objekt-Projektion \\( H|x \\) linearisierbar ist.
- **Konsequenz (Modularität)**:
    - Linearisierbarkeit ist komplett **isoliert** pro Objekt beweisbar.
    - Erlaubt gefahrloses **Kombinieren (Composing)** unabhängiger Objekte (verhindert System-Deadlocks im Gegensatz zu Standard-Locks).

## Warum ist die Linearisierbarkeit für Hardware oft ungeeignet und motiviert die **Sequenzielle Konsistenz**?

- Linearisierbarkeit ist für Hardware und Caches **zu teuer und ineffizient**.
- **Sequenzielle Konsistenz** erlaubt Hardware-Optimierungen und modelliert Multiprozessor-Architekturen besser.

## Wie ist **Sequenzielle Konsistenz (Sequential Consistency)** definiert und wie unterscheidet sie sich von Linearisierbarkeit bezüglich der Zeitordnung?

- **Definition**: Historie \\( H \\) ist sequenziell konsistent bei Äquivalenz zu einer legalen sequenziellen Historie \\( S \\).
- **Unterschiede zur Linearisierbarkeit**:
    - **Keine Echtzeitordnung** (\\( \to\_G \subset \to\_S \\) entfällt).
    - Operationen **verschiedener Threads** sind auf der Zeitachse gedanklich beliebig verschiebbar.
    - Die Programmordnung (Program order) **innerhalb desselben Threads** bleibt zwingend erhalten (kein Vertauschen eigener Befehle).

## Was ist das Hauptproblem der **fehlenden Kompositionalität** (Not a local property) bei der Sequenziellen Konsistenz?

- Sequenzielle Konsistenz ist **nicht modular**.
- Isoliert korrekte Objekte (z.B. zwei FIFO-Queues) erzeugen bei Kombination und Verschiebung oft **Kreisabhängigkeiten (Zyklen)**.
- Das Gesamtsystem wird dadurch inkorrekt.

## Wie ist **Quiescent Consistency** definiert und wie verhält sie sich theoretisch zur sequenziellen Konsistenz?

- **Definition**: Die Echtzeitordnung gilt **nur** zwischen absoluten Ruhephasen (**Periods of Quiescence**, Zeiten ohne aktive Methodenaufrufe).
- **Eigenschaft**: Beliebige Umordnung von Operationen *zwischen* Ruhephasen ist erlaubt (auch innerhalb desselben Threads).
- Theoretisch **inkomparabel** zur sequenziellen Konsistenz (weder strikt stärker noch schwächer).

## Warum verursachen Caches in moderner Hardware Probleme bezüglich der Speicherkonsistenz?

- Strikte Konsistenz in moderner Hardware ist **zu teuer und langsam**.
- Die CPU nutzt **Caches** statt direktem RAM-Zugriff.
- Dies führt zu verzögerten Writes in den Hauptspeicher (Analogie: *Brief einwerfen* \\( \rightarrow \\) sofortiges Weiterarbeiten statt Warten auf Zustellung).

## Wie lässt sich Speichersynchronisation bei Hardware erzwingen (implizit vs. explizit)?

- Hardware ordnet Zugriffe für Performance standardmässig um.
- **Explizite Synchronisation**: Nutzt Hardware-Befehle (**Memory Barriers**), um Caches zu leeren und Ordnung zu erzwingen.
- **Implizite Synchronisation**: Nutzt High-Level Sprachmittel (z.B. **`volatile`** in Java). Garantiert Aktualität und verbietet Compiler-Reorderings sowie Schleifen-Optimierungen.
