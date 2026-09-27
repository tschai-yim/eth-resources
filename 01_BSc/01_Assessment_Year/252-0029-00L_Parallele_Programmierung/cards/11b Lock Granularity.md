## Was besagt das **KISS-Prinzip** (Keep It Simple, Stupid) im Kontext der Nebenläufigkeit?

- Bevorzugung der **einfachsten Locks**.
- Minimierung der Anzahl **gleichzeitig genutzter Variablen**.

## Welche fünf Stufen der Synchronisation bilden **The Five-Fold Path**?

- **Coarse-grained**
- **Fine-grained**
- **Optimistic**
- **Lazy**
- **Lock-free**

## Warum verwendet das Laufbeispiel (Sequential List Based Set) zwingend die **Spezialknoten** Head und Tail?

- Der **Head** (\\( -\infty \\)) und der **Tail** (\\( +\infty \\)) dienen als Begrenzungen.
- Sie verhindern Fehler (**Rand-Exceptions**) am Anfang und Ende der Liste.

## Was ist **Coarse-Grained Locking** und welche Vor- und Nachteile hat es?

- **Konzept**: Ein einziges grosses Lock (**Big Fat Lock**) schützt die gesamte Datenstruktur.
- **Vorteil**: Extrem simple Implementierung.
- **Nachteil**: Erzeugt einen extremen **Sequential Bottleneck** (Flaschenhals).
    - Gesamte Struktur wird während der Traversierung (Erwartungswert \\( O(n/2) \\) Elemente) physisch blockiert.

## Wie limitiert **Amdahl's Law** das **Coarse-Grained Locking**?

- Es führt zu einer massiven **Speedup-Einschränkung**.
- *Beispiel*: Wenn \\( 20\% \\) der Zeit im Lock verbracht wird, beträgt der maximale Speedup \\( 5x \\) (unabhängig davon, wie viele Threads verfügbar sind).

## Was ist die Grundidee von **Fine-Grained Locking** und welche **Lösch-Gefahr** besteht beim naiven Locken?

- **Idee**: Objekt-Aufteilung in kleine Teile mit **separaten Locks** (z.B. pro Knoten).
- **Lösch-Gefahr**: Naives Locken einzelner Knoten führt zu **Elementverlust**.
    - *Beispiel*: Thread A löscht Knoten `c`, während Thread B zeitgleich `b` löscht.
    - *Ursache*: Zeitgleiches Schreiben eines Knotens und Lesen des nächsten Knotens durch verschiedene Threads.

## Wie löst das **Hand-over-hand locking** die Lösch-Gefahr bei verlinkten Listen?

- Listen-Durchlauf erfolgt durch "Hangeln".
- Es sind **immer exakt zwei Knoten** gleichzeitig gelockt.
- Das Lock-Paar besteht aus dem Vorgänger (**Pred**) und dem aktuellen Knoten (**Curr**).

## Welche zwei wesentlichen Nachteile hat das **Hand-over-hand locking**?

- Potenziell sehr lange **`acquire()`/`release()`-Sequenzen** (benötigt \\( O(n) \\) Locks pro Suche).
- **Überholen unmöglich**: Ein langsamer Thread am Listenanfang blockiert alle nachfolgenden Threads physisch.

## Was ist die Grundidee der **Optimistic Synchronization** und welche zwei **Validierungs-Bedingungen** müssen erfüllt sein?

- **Idee**: Die Suche (`find()`) erfolgt **komplett ungelockt**. Danach werden die Zielknoten gelockt und **validiert**.
- **Validierungs-Bedingungen** (beide zwingend):
    - **Reachable**: Knoten ist ungelöscht (vom Head aus erreichbar).
    - **Connected**: Es wurde kein Element dazwischen eingefügt (`pred.next == curr`).
- **Sicherheit**: Sind beide Bedingungen erfüllt, ist ein Einfügen/Löschen durch Dritte unmöglich.

## Welche Vor- und Nachteile bietet die **Optimistic Synchronization**?

- **Vorteile**:
    - Traversieren ohne **Contention** (Datenstau).
    - Suche ist komplett **wait-free** (wartefrei).
- **Nachteile**:
    - Zwingend **doppeltes Traversieren** nötig (Suche + Validierung ab Head).
    - **Not starvation-free**: Endloses Pech bei anhaltenden Validierungs-Konflikten ist möglich.
    - Die `contains()` Methode erfordert weiterhin Locks.

## Was ist die Grundidee der **Lazy Synchronization** (Lazy List) und wie lautet die **zentrale Invariante**?

- **Idee**: Vermeidung doppelter Traversierung durch **Atomic Markers**. Entkoppelt strukturelle Updates von der Thread-Erkennung.
- Nutzt ein **Mark-Bit** als Flag zur Signalisierung der **logischen Löschung**.
- **Zentrale Invariante**: Jeder **unmarkierte** Knoten ist garantiert vom Head und seinem Vorgänger aus erreichbar.

## Wie ist der exakte Ablauf eines Löschvorgangs (`remove(c)`) bei der **Lazy Synchronization**?

- **Schritt 1**: Locken von Vorgänger (`b` / `pred`) und Zielknoten (`c` / `curr`).
- **Schritt 2 (Validierung)**: Zwingende Prüfung, ob `b` oder `c` bereits ein Mark-Bit haben.
- **Schritt 3 (Falls unmarkiert)**:
    - **Logical delete**: Mark-Bit von `c` setzen.
    - **Physical delete**: Knoten `c` physisch entfernen (Pointer umhängen). Darf auch später "lazy" durch andere Threads passieren.

## Welche Vorteile bietet die **Lazy Synchronization** (Lazy List) im Vergleich zur Optimistic Synchronization?

- Erfordert nur noch ein **einmaliges Listen-Scannen**.
- Erlaubt einen automatischen Schleifen-Neustart bei Konflikten/Markierungen.
- Die Methode `contains()` ist **komplett wait-free** (Marker dienen als Serialisierungspunkt, gänzlich ohne Locks).

## Warum verwendet man **Skip Lists** anstelle von klassisch balancierten Bäumen in der Nebenläufigkeit?

- Globales **Rebalancing** von balancierten Bäumen (wie AVL oder Red-Black) ist parallel **extrem schwer umsetzbar**.
- Lazy Skip Lists bieten eine elegante, funktionierende Praxis-Datenstruktur für dieses Problem.

## Wie funktioniert der Aufbau und die Funktionsweise einer **Skip List**?

- Nutzt einen **Las Vegas Style Algorithmus** (korrekte probabilistische Lösung, Laufzeit zufällig).
- Ist eine **Sorted multi-level list**: Obenliegende Level haben exponentiell weniger Knoten.
- Die **Node-Höhe** wird beim Einfügen zufällig gezogen (z.B. \\( \mathbb{P}(height = n) = 0.5^n \\)).
- **Skip list property**: Höhere Level sind strikte Teillisten der tieferen Level.

## Wie funktionieren die Operationen Searching, Add und Contains bei einer **Skip List**?

- **Searching**: Logarithmische Suche (Erwartungswert \\( O(\log n) \\)) durch Level-Sprünge nach unten.
- **Add**: Ungelockte Vorgänger-Suche \\( \rightarrow \\) Locken **aller** Vorgänger bis zur Zielhöhe \\( \rightarrow \\) Validierung \\( \rightarrow \\) Einfügen.
- **Contains**: Sequenzielle Iteration mit Prüfung auf fehlende Markierung und vollständige Verlinkung. Ist komplett **wait-free**.

## Welche praktischen Nachteile haben **Skip Lists**?

- Die Implementierung ist **sehr fehleranfällig**.
- Sie haben einen **hohen Speicherbedarf** (benötigen Arrays von Turm-Pointern pro Knoten).
