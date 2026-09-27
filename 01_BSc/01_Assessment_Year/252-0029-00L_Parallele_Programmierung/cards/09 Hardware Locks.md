## Was ist **Read-Modify-Write (RMW)** und welche Vor- und Nachteile hat es?

- Ein atomarer Hardware-Befehl: Lesen, Verändern und Schreiben sind **strikt ununterbrechbar**.
- **Vorteile**:
    - Erfordert nur \\(\mathcal{O}(1)\\) Speicherbedarf (unabhängig von der Thread-Anzahl).
    - Essenziell für **Lock-free Programming**.
- **Nachteil**:
    - Performance ist \\(10\\)x bis \\(100\\)x langsamer als normale Lese-/Schreibzugriffe.

## Welche drei Arten von **RMW-Befehlen** (Read-Modify-Write) gibt es?

- **Test-And-Set (TAS)**: Prüft, ob Wert \\(0\\) ist, und setzt ihn atomar auf \\(1\\).
- **Compare-And-Swap (CAS)**: Vergleicht mit einem Erwartungswert und überschreibt ihn **nur bei Übereinstimmung**. Ist mächtiger als TAS.
- **Load-Linked / Store-Conditional (LL/SC)**: Die mächtigste Variante. Im Gegensatz zu CAS schlägt sie bei simplen Inkrementen nicht fehl.

## Wie unterscheiden sich die Hardware-Spezifika von **x86** und **ARM** bei atomaren Befehlen?

- **x86 (Intel/AMD)**:
    - Nutzt **`CMPXCHG`** (Compare and Exchange).
    - Verwendet ein `LOCK`-Präfix für effiziente Cache-Locks.
- **ARM (Smartphones, Uhren)**:
    - Nutzt **`LDREX`** (Load Register Exclusive) und **`STREX`** (Store Register Exclusive).
    - Ist konzeptionell besser, in der Praxis wird wegen x86-Kompatibilität aber oft CAS genutzt.

## Über welche API und Klassen bietet **Java** High-Level Unterstützung für atomare Operationen?

- Über das Package **`java.util.concurrent.atomic`** (ab JDK 5).
- Beispiele für Klassen:
    - **`AtomicBoolean`**
    - **`AtomicInteger`**

## Welche vier **Kern-Operationen** bieten Javas atomare Klassen an?

- `get()`: Liest den aktuellen Wert.
- `set()`: Überschreibt mit einem neuen Wert (nicht bedingt atomar).
- `compareAndSet(expect, update)`: Ändert zu `update` **nur**, wenn der aktuelle Wert `expect` ist (retourniert `true` bei Erfolg).
- `getAndSet(newValue)`: Setzt `newValue` und retourniert den vorherigen Wert atomar.

## Wie setzt die **JVM** atomare Operationen intern um, da normaler Java-Bytecode keine CAS-Befehle kennt?

- Die JVM nutzt die interne Klasse **`sun.misc.Unsafe`**.
- Dies ermöglicht ein direktes OS-/Hardware-Mapping (umgeht das sichere Java-Memory-Management).
- Falls direkter Hardware-Support fehlt, erfolgt ein **lautloser Fallback** auf interne Locks.

## Wie funktioniert ein **TAS Spinlock** (Test-And-Set) und warum skaliert er schlecht?

- **Konzept**: Nutzt `while(state.getAndSet(true)) {}` zum Warten und `state.set(false)` zur Freigabe.
- **Problem**: Führt bei vielen Threads zu **logarithmischem Slowdown**.
- **Grund**: Erzeugt ein **Sequential Bottleneck** und physische **Contention** (Konkurrenz) auf dem Datenbus.
- **Barking Dogs Problem**: Ständige Schreibversuche im Spin-Loop invalidieren fortlaufend die Caches anderer Prozessoren.

## Wie löst der **TTAS Spinlock** (Test-and-Test-and-Set) das Problem von TAS und welches neue Problem entsteht?

- **Lösung**: Nutzt **Concurrent Read** als billige Leseschleife (`while(state.get()) {}`). Der teure CAS-Versuch erfolgt erst, wenn `false` gelesen wird.
- **Neues Problem**: Erzeugt bei Lock-Freigabe einen massiven **Contention-Sturm**, da alle blockierten Threads gleichzeitig ausbrechen und CAS versuchen.

## Was ist **Double-Checked Locking** und warum ist es in Java gefährlich?

- **Konzept**: Eine Generalisierung von TTAS (erst ungeschützt prüfen, bei Treffer locken und in der Critical Section erneut prüfen).
- **Gefahr**: Ist in Java wegen des **Memory Reorderings** im Java Memory Model (JMM) strikt **kaputt (broken)**.
- Erzeugt lautlose **Heisenbugs**.

## Wie funktioniert ein **Spinlock mit Exponential Backoff** und wie wird Fairness garantiert?

- **Lösung für TTAS**: Bei einem CAS-Fehlschlag pausiert der Thread kurz (`Thread.sleep()`).
- **Mechanismus**: Zufällige Wartezeit, deren Obergrenze sich bei jedem Fehlschlag verdoppelt (**exponentielles Wachstum**).
- **Fairness (Starvation Freedom)**: Eine absolute Obergrenze (**`MAX_DELAY`**) ist zwingend nötig, da sonst einzelne Threads für immer verhungern.
- **Resultat**: Exzellente Skalierung (sehr flache Performance-Kurve).

## Was ist ein **Deadlock** (Verklemmung) und warum ist er kritisch?

- **Definition**: \\(\ge 2\\) Prozesse blockieren sich gegenseitig endlos, weil sie auf Ressourcen warten, die der jeweils andere hält.
- **Bedeutung**: Das **dominante Problem** komplexer Systeme (z.B. bei Überweisungen \\(x \rightarrow y\\) vs. \\(y \rightarrow x\\)).
- In Sicherheitsbereichen (z.B. Flugzeuge) sind sie oft komplett verboten.

## Wie werden Deadlocks in einem System **formell als Graph** modelliert und bewiesen?

- **Knoten**: Repräsentieren Threads (\\(T\\)) und Ressourcen (\\(R\\)).
- **Kanten**: Repräsentieren "Warten auf" (\\(T \rightarrow R\\)) oder "Gehalten von" (\\(R \rightarrow T\\)).
- **Beweis**: Ein **Zyklus (Kreis)** im Graphen ist der mathematische Beweis für einen Deadlock.

## Wie funktioniert **Deadlock Detection** (Erkennung) zur Laufzeit und warum ist die Heilung schwierig?

- Das System sucht den Graphen zur Laufzeit aktiv nach **Zyklen** ab.
- **Heilung**: Ist meist unmöglich, da das Aufbrechen des Deadlocks einen **inkonsistenten System-Reset** (z.B. Abbruch eines Prozesses) erfordert.

## Was ist der Unterschied zwischen **Deadlock** und **Starvation**?

- **Deadlock**: Niemand macht Fortschritt (das gesamte involvierte System steht still).
- **Starvation**: Das System macht Fortschritt, aber ein einzelner Prozess verliert permanent (Unfairness).

## Wie funktioniert die Deadlock-Vermeidung durch **Two-Phase Locking mit Retry** und was ist der Nachteil?

- **Konzept**: Eine Transaktion wird bei einem Konflikt abgebrochen und alle Ressourcen werden wieder freigegeben (oft in Datenbanken genutzt).
- **Nachteil im RAM**: Für reine Software-Locks meistens **zu teuer**, da die nötige Speicherung von Zwischenzuständen (für ein Rollback) massiv Overhead erzeugt.

## Wie verhindert **Resource Ordering** (Globale Ordnung) Deadlocks mathematisch sicher?

- **Regel**: Alle Ressourcen unterliegen einer **zwingenden globalen Ordnung**.
- Threads müssen Locks **immer** in der gleichen (z.B. aufsteigenden) Reihenfolge anfordern.
- **Vorteil**: Zyklen im Graphen sind dadurch mathematisch komplett ausgeschlossen.
- **Beispiele**: Sortierung nach Account-Nummer, Unique ID oder Ebenen in einer Baumstruktur.

## Welchen Programmier-Trick nutzt man für **Resource Ordering**, wenn Objekte keine natürliche ID besitzen?

- Man vergibt bei der Instanzierung des Objekts dynamisch eine eindeutige `index`-Variable.
- Dies geschieht sicher über einen atomaren Zähler (z.B. **`AtomicLong.incrementAndGet()`**).
