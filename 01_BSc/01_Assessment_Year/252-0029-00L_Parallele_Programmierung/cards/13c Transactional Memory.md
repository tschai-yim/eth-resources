## Welche drei **Laufzeit-Blockade-Probleme** haben herkömmliche Locks bei der Thread-Verwaltung?

- **Deadlocks:** Zirkuläres Warten durch inkonsistente Lock-Reihenfolge.
- **Convoying:** Datenstau durch pausierte Threads, welche wichtige Ressourcen halten.
- **Priority Inversion:** Ein niedrig priorisierter Thread hält ein Lock und wird von der CPU verdrängt. Ein hoch-priorisierter Thread, der das Lock benötigt, hängt dadurch endlos fest (z.B. beim Mars Rover).

## Welche drei **Design- und Architektur-Probleme** haben herkömmliche Locks?

- **Fehlende Kompositionalität:** Sichere Einzeloperationen lassen sich nicht gefahrlos zu grösseren sicheren Operationen verknüpfen.
- **Pessimistischer Ansatz:** Erzeugt einen permanenten Performance-Overhead, auch wenn gar keine echte Konkurrenz (**Contention**) besteht.
- **Fehlende Assoziation:** Die Bindung zwischen Lock und Variable existiert meist nur als ungeschützte Programmierkonvention im Kopf des Entwicklers.

## Welche Schwächen haben **Lock-Free** Algorithmen und **CAS (Compare-And-Swap)** in der Praxis?

- **Unbounded Queues:** Erfordern zwingend mehrere Pointer-Updates (z.B. Element einfügen und gleichzeitig Tail verschieben).
- **CAS-Limitation:** CAS ändert systembedingt immer nur **eine einzige Variable** \(\rightarrow\) ein temporär inkonsistenter Zwischenzustand wird für Dritte sichtbar.
- **DCAS (Double-CAS):** Würde das Problem theoretisch lösen, existiert in moderner Hardware jedoch nicht.

## Welches Architektur-Problem demonstriert das **Bank-Account Problem** (Transfer) bei der Nutzung von Locks?

- **Ausgangslage:** Gleichzeitiges Abheben (`withdraw`) und Einzahlen (`deposit`).
- **Gefahr:** Naive Locks führen bei gekreuzten Transfers unweigerlich zu **Deadlocks**.
- **Folgeproblem (Code Duplication):** Zur Deadlock-Vermeidung ist eine globale ID-Sortierung nötig. Dies erzeugt extremen Overhead (z.B. 10 Zeilen Synchronisations-Code für 2 Zeilen eigentliche Logik).

## Was ist die **Grundidee** von Transactional Memory (TM) und wie funktioniert der **deklarative Ansatz**?

- **Grundidee:** Explizite Definition von **atomaren Code-Blöcken** (z.B. `atomic { ... }`).
- **Deklarativer Ansatz:** Der Programmierer definiert nur das **Was** (welcher Code atomar sein soll).
- Das System bestimmt das **Wie** \(\rightarrow\) ein manuelles Lock-Management entfällt komplett.

## Welche drei primären **Vorteile** bietet Transactional Memory (TM) gegenüber herkömmlichen Locks?

- **Kompositionalität:** Atomare Blöcke lassen sich absolut gefahrlos ineinander verschachteln.
- **Optimistisch:** TM fokussiert sich auf den konfliktfreien Fall. Der Overhead entsteht primär erst bei echten Konflikten.
- **Analogie zur Garbage Collection:** Komplexe Systemverwaltung (Synchronisation) wird an das Framework ausgelagert.

## Welche der **ACID-Eigenschaften** (aus Datenbanken) fehlen bei Transactional Memory und welche sind vorhanden?

- **Fehlt: D (Durability):** TM ist RAM-basiert \(\rightarrow\) Datenverlust bei Stromausfall.
- **Atomarität:** Alle Block-Änderungen werden global in einem einzigen, unteilbaren Schritt sichtbar.
- **Isolation:** Die Ausführung ist komplett isoliert (simuliert einen globalen **Snapshot**).
- **Serialisierbarkeit:** Parallele Ausführungen wirken nach aussen strikt sequenziell (entspricht der Linearisierbarkeit).

## Wie funktioniert die **Concurrency Control (CC)** und das Konfliktmanagement bei Transactional Memory?

- Das System führt ein permanentes Tracking aller Lese- und Schreiboperationen durch.
- **Konflikt:** Entsteht, wenn ein gelesener Wert vor dem eigenen Commit durch eine andere Transaktion überschrieben wird.
- **Lösung:** Die Transaktion bricht sofort (oder beim Commit) ab (**Abort**) und startet vollautomatisch neu (**Retry**).

## Was ist das **Zombie-Problem** bei Transactional Memory und wie wird es gelöst?

- **Problem:** Das Lesen von teilweise unfertigen Zuständen (z.B. veraltetes `a` und bereits modifiziertes `b`).
- **Folge:** Schwerwiegende Logikfehler im Code, wie z.B. **Division by Zero** bei `1 / (a-b)` \(\rightarrow\) Programmabsturz.
- **Lösung:** Das TM-System erzwingt zwingend stets eine konsistente Datensicht (z.B. durch einen sofortigen **Early Abort** bei der Entdeckung eines Konflikts).

## Wie funktioniert **Hardware TM (HTM)** und was ist dessen grösster Nachteil?

- Nutzt **CPU-Caches** (L1/L2) zur Speicherung der Snapshots und zur Konflikterkennung.
- **Vorteil:** Ist in der Ausführung extrem schnell.
- **Nachteil:** Besitzt strikte Hardware-Ressourcenlimits. Grosse Transaktionen führen zu permanenten Platz-bedingten Aborts (Beispiel: **Intel RTM** wurde oft wegen Bugs und Komplexität wieder deaktiviert).

## Wie funktioniert **Software TM (STM)** und was ist dessen grösster Nachteil?

- Die Implementierung erfolgt rein über die **Programmiersprache oder eine Bibliothek**.
- **Vorteil:** Erlaubt eine unlimitierte Transaktionsgrösse (nur durch RAM begrenzt).
- **Nachteil:** Erzeugt einen spürbaren **Performance-Overhead** durch die Software-Verwaltung.

## Wie unterscheiden sich **Strong Isolation** und **Weak Isolation** bei Transactional Memory?

- **Strong Isolation:** Das TM-System schützt Speicherzugriffe auch **ausserhalb** von deklarierten atomaren Blöcken (langsam und extrem schwer implementierbar).
- **Weak Isolation:** Ungeschützte Zugriffe ausserhalb von atomaren Blöcken sind strikt verboten und führen zu undefiniertem Verhalten (Dies ist der **Praxis-Standard**).

## Wie verhalten sich **Flat Nesting** und **Closed Nesting** bei verschachtelten Transaktionen?

- **Flat Nesting:** Das System ignoriert innere Blöcke. Ein Fehler im innersten Block erzwingt einen **Komplett-Abort** der gesamten äussersten Transaktion.
- **Closed Nesting:** Erlaubt einen isolierten Abort und Retry von ausschliesslich inneren Blöcken, **ohne** die Haupttransaktion zu zerstören.

## Aus welchen **Grundkomponenten** (Status, Uhr, Variablen) besteht ein **Clock-based STM**?

- **Thread-Status:** Ein Thread ist entweder *active*, *aborted* oder *committed*.
- **Globale logische Uhr:** Ein monoton steigender Zähler für das gesamte System.
- **Variablen-Versionsnummern:** Jeder Wert besitzt einen Timestamp der letzten Modifikation.

## Welche **lokalen Sets und Startwerte** legt eine Transaktion in einem Clock-based STM beim Start an?

- **Birthdate:** Speicherung der globalen Systemzeit zum exakten Startzeitpunkt.
- **Read-Set:** Unsichtbare Protokollierung aller Lesezugriffe (zur späteren Konflikterkennung).
- **Write-Set:** Lokaler Zwischenspeicher für eigene, noch nicht publizierte Änderungen (verhindert das Verschmutzen des globalen Zustands).

## Wie läuft eine **Read-** und **Write-Operation** *während* einer Transaktion in einem Clock-based STM ab?

- **Write:** Modifikationen erfolgen **exklusiv** in der lokalen Kopie (**Write-Set**).
- **Read:**
    1. Wert im eigenen **Write-Set**? \(\rightarrow\) Eigene (unpublizierte) Version retournieren.
    2. Sonst: Ist der Variablen-Timestamp \(\le\) Birthdate? \(\rightarrow\) In **Read-Set** kopieren und retournieren.
    3. Timestamp ist jünger (wurde fremd-geändert)? \(\rightarrow\) Sofortige **Abort Exception**.

## Aus welchen sechs Schritten besteht der **Commit-Vorgang** in einem Clock-based STM?

*(Hinweis: Nutzt intern ironischerweise zwingend wieder Locks)*

1. **Lock** aller betroffenen Objekte aus dem Read-/Write-Set (stets in globaler Reihenfolge zur Deadlock-Verhinderung).
2. **Validierung:** Prüfung, ob alle Timestamps im Read-Set immer noch \(\le\) Birthdate sind.
3. Bei Konflikt \(\rightarrow\) Locks freigeben, **Abort**.
4. Bei Erfolg \(\rightarrow\) Globale Uhr inkrementieren.
5. Lokales Write-Set in den globalen Speicher publizieren (Timestamp der Variablen auf neue Zeit setzen).
6. **Locks freigeben**.

## Wie funktioniert die **ScalaSTM** Implementierung in Java und welche **Isolationstiefe** nutzt sie?

- Nutzt einen referenzbasierten Schutz via **`Ref.View<Integer>`**. Nur diese speziellen Variablen werden vom STM überwacht.
- Deklaration erfolgt per: `STM.atomic(new Runnable() { ... })`.
- **Isolationstiefe (Weak Isolation):** Es besteht zwingende Eigenverantwortung. `Ref`-Variablen dürfen **niemals** ausserhalb eines `atomic`-Blocks modifiziert werden.

## Was bewirkt die Funktion **`STM.retry()`** und unter welcher **Bedingung** wacht der Thread wieder auf?

- Sie dient als STM-Ersatz für Conditional Variables (z.B. `wait()`).
- **Semantik:** Führt einen sofortigen Abort, ein Rollback und ein Pausieren des aktuellen Threads aus.
- **Weck-Bedingung:** Ein automatischer Neustart der Transaktion geschieht **nur**, wenn Dritte eine Variable verändern, die sich im **Read-Set** des pausierten Threads befindet.

## Wie löst Transactional Memory das **Dining Philosophers** Problem und was ist der **Nachteil** dabei?

- **Lösung:** Das Problem ist trivial lösbar. Das TM-System garantiert absolute Deadlock-Freiheit durch automatische Aborts.
- **Nachteil (Ineffizienz):** Der Thread weckt fälschlicherweise durch `STM.retry()` bereits auf, wenn nur *eine* Gabel frei wird (obwohl zwei nötig sind) \(\rightarrow\) dies führt zu sofortigen **Re-Aborts**.

```java
STM.atomic(new Runnable() {
    public void run() {
        if (left.inUse.get() || right.inUse.get()) STM.retry();
        left.inUse.set(true);
        right.inUse.set(true);
    }
});
```

## Welche zwei fundamentalen **Limitationen** besitzt Transactional Memory (TM)?

- Es ist sehr schwierig, die Performance von nativen, optimierten Locks zu erreichen.
- **I/O Operationen** (Konsole, Netzwerk, Dateisystem) sind **strikt verboten**, da externe Effekte bei einem Transaktions-Abort nicht einfach "zurückgerollt" werden können.
