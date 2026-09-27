## Zustandsverwaltung (Managing State)

- **Strategien für Variablen/Daten**:
    1. **Thread-local**: Keine geteilten Daten (eigene Kopie pro Thread). **Beste Lösung** (verhindert Probleme komplett).
    2. **Immutability** (Unveränderlichkeit): Nur Lesezugriffe (keine Änderungen). Gleichzeitiges Lesen absolut sicher.
    3. **Isolated mutability**: Veränderbar, aber strikt auf einen Thread beschränkt (z.B. Array-Subbereiche bei Fork-Join).
    4. **Mutable/Shared data**: Veränderbar und geteilt $\rightarrow$ **Zwingend schützen** (maximal ein Thread Zugriff).

## Mutual Exclusion und Locks

- **Mutual Exclusion (Wechselseitiger Ausschluss)**: Maximal ein Thread in der **Critical Section** (kritischer Codebereich).
- **Zwingend: Hilfe vom OS / Hardware**:
    - Locks benötigen atomare Hardware-Instruktionen.
    - **Safety**: Garantiert maximal einen Thread in der Critical Section.
    - **Liveness**: Garantiert rechtzeitigen Zugriff für wartende Threads (kein ewiges Warten).
- **Externe Locks (`java.util.concurrent.locks`)**:
    - Manuelles `lock()` und `unlock()`.
    - Flexibler als `synchronized` (z.B. methodenübergreifend).
    - **`tryLock()`**: Lock-Versuch ohne Blockieren (Timeout möglich).
    - **Absolute Pflicht**: Freigabe **immer** im `try-finally`-Block. Verhindert ewiges Blockieren bei Exceptions.
- **Reentrant Locks (Rekursive Locks)**:
    - Selber Thread darf gleiches Lock mehrfach anfordern (interner Counter).
    - Aufruf: Counter $+1$. Freigabe: Counter $-1$. Lock erst bei $0$ für andere frei.
    - **Vorteil**: Verhindert Deadlocks bei internen Methodenaufrufen (z.B. `withdraw()` ruft `setBalance()` auf).
    - `synchronized` und `ReentrantLock` sind reentrant.

## Arten von Race Conditions

- **Data Race (Low-level Race Condition)**:
    - Gleichzeitiger ungeschützter Speicherzugriff (Read/Write oder Write/Write) auf dieselbe Variable.
    - Passiert auf CPU-/Memory-Ebene.
    - Ist **immer ein Bug** (korrumpiert Daten lautlos, **wirft keine Hardware-Exception!**).
- **Bad Interleaving (High-level Race Condition)**:
    - **Kein Data Race** (Einzelzugriffe sind perfekt gelockt).
    - Logischer Fehler durch ungünstige Unterbrechung (**Interleaving**) des Schedulers.
    - **Inconsistent intermediate state** (inkonsistenter Zwischenzustand) wird sichtbar $\rightarrow$ verletzt Invarianten.
    - *Beispiel Bounded Stack `peek()`*: Ruft intern geschütztes `pop()` und `push()` auf. Unterbrechung genau dazwischen zerstört LIFO-Reihenfolge oder verfälscht Füllstand. *Lösung*: Gesamte `peek()`-Methode in Critical Section packen.

## Guidelines für Nebenläufigkeit

- **Guideline #0 (Keine Data Races)**: Zugriff auf selbe Speicheradresse nie ungeschützt (notwendig, aber nicht ausreichend).
- **Guideline #1 (Consistent Locking)**:
    - Jede zu schützende Variable erfordert **ein eindeutiges Lock (guarded)**.
    - Dasselbe Lock für Lese- und Schreibzugriffe verwenden.
- **Guideline #2 (Lock Granularity - Lock-Grösse)**:
    - **Coarse-grained** (Grobgranular): Ein Lock für viele Objekte (z.B. ganzes Array).
        - *Pro*: Simpel. *Contra*: Schlechte Performance (unnötiges Blockieren).
    - **Fine-grained** (Feingranular): Ein Lock pro Element.
        - *Pro*: Hohe Parallelität. *Contra*: Komplex, hohe Deadlock-Gefahr.
    - **Regel**: Mit **Coarse-grained starten**, nur bei Performance-Problemen feiner werden.
- **Guideline #3 (Critical Section Granularity - Länge der Section)**:
    - **Zu lang**: Performance-Verlust durch Blockaden.
    - **Zu kurz**: Bugs durch sichtbare Zwischenzustände (**Bad Interleavings**).
    - **Regel**: Gross genug für Korrektheit, aber **keine teuren I/O- oder Rechenoperationen** im Block.
- **Guideline #4 (Atomicity First)**:
    - **Zuerst** Algorithmus/Invarianten definieren (was muss atomar sein?).
    - **Danach** erst die Locking-Strategie entwerfen.
- **Standard-Bibliotheken nutzen**:
    - Erprobte Klassen (z.B. `ConcurrentHashMap`) verwenden (eigene komplexe Strukturen nur für Lernzwecke).
