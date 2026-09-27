## Welche Komplexität entsteht durch den Einsatz von **Shared Memory**?

- Führt zu einem **Shared State** (geteilter Zustand).
- Erfordert zwingend **Locks**.
- Erzeugt die Gefahr von **Race Conditions**.

## Wie ist die Architektur bei **Distributed Memory** (Verteilter Speicher) aufgebaut?

- Jeder Prozess besitzt seinen eigenen, **physisch getrennten Speicher**.
- Die Verbindung der Prozesse erfolgt über ein **Interconnect Network**.

## Welche zwei Architektur-Ansätze gibt es zur **Vermeidung von geteiltem Zustand** bei der Parallelisierung?

- **Functional Programming**:
    - Zustand ist strikt **unveränderlich (Immutable)**.
    - Keine Synchronisation nötig.
- **Message Passing**:
    - Zustand ist **isoliert und veränderbar (Isolated Mutable State)**.

## Welche Regeln und Performance-Eigenschaften gelten für die Kommunikation im **Message Passing**?

- **Kein Lesezugriff** auf Variablen anderer Threads.
- Kooperation erfolgt exklusiv über **Nachrichten (Messages)**.
    - *Beispiel Verteilte Bank*: Jeder Thread führt lokales Budget, Überweisungen geschehen als Nachrichten.
- **Performance**:
    - Nachrichtenversand ist extrem teuer.
    - Datenaustausch muss zwingend **grobgranular (coarse granularity)** sein.

## Wie funktioniert das **Synchronous** (Synchrone) Senden im Message Passing?

- **Zwingende Blockierung** des Senders.
- Warten bis zur kompletten Annahme durch den Empfänger.
- *Analogie*: Kühlschranklieferung (physische Übergabe zwingend nötig).

## Wie funktioniert das **Asynchronous** (Asynchrone) Senden im Message Passing?

- Sofortiges Weiterarbeiten nach dem Versand (**fire-and-forget**).
- Die Nachricht wird in einem **Puffer** beim Empfänger zwischengespeichert.
- *Analogie*: Postkarte in einen Briefkasten einwerfen.

## Was ist das **Message Passing Interface (MPI)** und wo wird es eingesetzt?

- **Definition**: HPC-Standard-API/-Bibliothek (verfügbar in C, C++, Java, Python).
- Verbirgt Hardware- und Netzwerkspezifika und ist **hochgradig portabel**.
- Nutzt exakt dieselben Konzepte wie moderne KI/Deep Learning Frameworks (z.B. **CCL / NCCL** von Nvidia).

## Was sind **Communicators** in MPI und was ist `MPI_COMM_WORLD`?

- **Communicator**: Ein Objekt zur **Gruppierung von Prozessen** (bildet einen Kommunikationskontext).
- **`MPI_COMM_WORLD`**:
    - Der vordefinierte Standard-Kommunikator.
    - Enthält initial **alle** Anwendungsprozesse.

## Was beschreibt der **Rank** in MPI und welche zentrale Eigenschaft besitzt er?

- Eine **eindeutige Prozess-ID** innerhalb eines Communicators (von \( 0 \) bis \( p-1 \)).
- **Zentrale Eigenschaft**: Ein Prozess kann in mehreren Communicators existieren und dabei **völlig unterschiedliche Ranks** besitzen.

## Welches Paradigma beschreibt **SPMD** in MPI und wie wird der Kontrollfluss gesteuert?

- **SPMD (Single Program Multiple Data)**:
    - Ausführung von exakt **demselben kompilierten Quellcode** auf allen Prozessen.
- **Kontrollfluss**:
    - Steuerung (z.B. `if`/`else`) geschieht basierend auf der eigenen **Rank-ID**.

## Welche drei MPI-Basisfunktionen werden für die **Initialisierung und Prozess-Informationen** zwingend benötigt?

- **`MPI_INIT`**: Initialisiert die Bibliothek (muss **zwingend der erste Aufruf** sein).
- **`MPI_COMM_SIZE`**: Liefert die Gesamtanzahl der Prozesse in einem bestimmten Communicator.
- **`MPI_COMM_RANK`**: Liefert die eigene Prozess-ID (Rank) innerhalb eines bestimmten Communicators.

## Welche drei MPI-Basisfunktionen steuern die **Nachrichtenübertragung und Beendigung**?

- **`MPI_SEND`**: Blockierender Nachrichtenversand.
- **`MPI_RECV`**: Blockierender Nachrichtenempfang.
- **`MPI_FINALIZE`**: Räumt den internen Systemzustand auf (muss **zwingend der letzte Aufruf** sein).

## Welche elementaren **Argumente** benötigen `Send` und `Recv` Funktionen in MPI?

- Speicherort (`buf`), Start-Index (`offset`) und Menge (`count`).
- **Datentyp (`datatype`)**:
    - Nur Basis-Typen (Int, Double).
    - Keine komplexen Java-Objekte (manuelle Serialisierung ist nötig).
- Ziel-Rank (`dest`) beim Senden bzw. Quell-Rank (`src`) beim Empfangen.
- **Message Tag** (`tag`).

## Was sind **Message Tags** in MPI und wofür werden sie genutzt?

- Eine **ID-Nummer** zur Unterscheidung von Nachrichten.
- Nötig, wenn gleiche Prozesse verschiedene Arten von Daten austauschen.
- *Beispiel*: Tag 1 = "Position", Tag 2 = "Farbe".

## Welche zwei **Wildcards** gibt es beim Empfangen von Nachrichten in MPI?

- **`MPI_ANY_SOURCE`**: Empfängt die nächste Nachricht von einem **beliebigen Prozess**.
- **`MPI_ANY_TAG`**: Akzeptiert eine Nachricht **unabhängig von ihrem Tag**.

## Wie unterscheidet sich die Begriffliche Trennung von **Synchronous/Asynchronous** und **Blocking/Non-blocking**?

- **Synchronous / Asynchronous**:
    - Globale Netzwerksicht.
    - Beschreibt die Synchronisation **zwischen Sender und Receiver**.
- **Blocking / Non-blocking**:
    - Lokale RAM-Sicht.
    - Beschreibt die Handhabung **zwischen Thread und lokalem Puffer**.

## Wie verhält sich die lokale Puffer-Synchronisation beim **Blocking** in MPI?

- Die Funktion blockiert den Thread.
- Rückkehr erfolgt erst bei **sicherem Überschreiben oder Lesen** des lokalen Puffers.
- **Achtung**: Bedeutet beim Senden nicht zwingend, dass die Nachricht bereits beim Empfänger angekommen ist.

## Wie verhält sich die lokale Puffer-Synchronisation beim **Non-blocking** in MPI und welche zwingende Regel gilt?

- Die Funktion (**`Isend`** / **`Irecv`**) kehrt sofort zurück (**immediate return**).
- **Zwingende Regel**: Der referenzierte Puffer ist während der Übertragung **strikt unantastbar**.
- Eine **manuelle Abschlussprüfung** der Übertragung ist zwingend nötig (meist via **`Waitall`**).

## Welchen massiven Performance-Vorteil bietet **Non-blocking** in MPI?

- Es erlaubt **Streaming / Pipelining**.
- Berechnung und Kommunikation können sich **zeitlich überlappen**.
- Führt zu einer massiven Laufzeitreduktion (ist essenziell für KI-Anwendungen).

## Welche Gefahr besteht beim standardmässigen **Default-Send (`MPI_Send`)** bezüglich Deadlocks?

- Die Synchronität ist **implementationsabhängig**.
    - Kleine Nachrichten: System puffert meist \(\rightarrow\) asynchron.
    - Grosse Nachrichten: Keine Pufferung möglich \(\rightarrow\) zwingend synchron.
- **Dringende Warnung**: Man darf sich bezüglich Deadlock-Freiheit niemals auf eine Asynchronität von `MPI_Send` verlassen.

## Wie entstehen **zyklische Deadlocks** beim Message Passing?

- Entstehen durch naives Code-Muster auf allen Knoten:
    1. Senden an Nachbar (`Send(rechts)`).
    2. Empfangen von Nachbar (`Recv(links)`).
- **Problem**: Bei grossen Nachrichten sind alle Systempuffer voll. Jeder wartet darauf, dass der Nachbar den Puffer leert \(\rightarrow\) **garantierter Deadlock**.

## Welche Best Practices lösen das Problem von **zyklischen Deadlocks** in MPI?

- **Ansatz 1**: Code-Umordnung (Odd/Even-Struktur) oder Nutzung der kombinierten Funktion `MPI_Sendrecv`.
- **Beste strukturelle Lösung**:
    - Immer **Non-blocking** (**`Isend`** / **`Irecv`**) verwenden.
    - Gepaart mit **`Waitall`** am Ende ausführen.
    - Dies verhindert Deadlocks architektonisch komplett.
- **Absolute Regel**: **`Bsend`** (Buffered Send) in der Praxis niemals nutzen.

## Welche physikalischen Grenzen definieren den modernen **HPC-Kontext** (High Performance Computing)?

- **Dennard Scaling** ist beendet (Schmelzgefahr bei \( >200 \) Watt pro Chip).
- **Moore's Law** hat sich drastisch verlangsamt.
- Grösste aktuelle Herausforderung: **Data Management**. Die reine Datenverschiebung ist der grösste Energiefresser.

## Wie sieht die Zukunft der Architekturen im **HPC-Kontext** aus?

- Klassische **Von-Neumann-Architekturen** sind zu ineffizient (\( 70 \) pJ pro Instruktion).
- Fokus verlagert sich auf **Dataflow Architekturen** (\( 1-3 \) pJ pro Instruktion).
- Der **Datenfluss** steht im Zentrum des Designs, nicht mehr der Instruktionsfluss.
