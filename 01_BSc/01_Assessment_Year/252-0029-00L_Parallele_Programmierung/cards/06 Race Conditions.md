## Welche vier Strategien gibt es zur Verwaltung von Zuständen/Daten bei Nebenläufigkeit?

- **Thread-local**: Keine geteilten Daten (eigene Kopie pro Thread). Ist die **beste Lösung**, da sie Probleme komplett verhindert.
- **Immutability** (Unveränderlichkeit): Nur Lesezugriffe (keine Änderungen). Gleichzeitiges Lesen ist absolut sicher.
- **Isolated mutability**: Daten sind veränderbar, aber strikt auf einen Thread beschränkt (z.B. Array-Subbereiche bei Fork-Join).
- **Mutable/Shared data**: Daten sind veränderbar und geteilt \\( \rightarrow \\) **Zwingend schützen** (maximal ein Thread darf Zugriff haben).

## Was bedeutet **Mutual Exclusion** (Wechselseitiger Ausschluss)?

- Maximal **ein Thread** darf sich gleichzeitig in der **Critical Section** (kritischer Codebereich) aufhalten.

## Warum benötigen **Locks** zwingend die Hilfe vom Betriebssystem (OS) oder der Hardware?

- Locks erfordern **atomare Hardware-Instruktionen**.
- **Safety**: Die Hardware garantiert, dass maximal ein Thread in der Critical Section ist.
- **Liveness**: Garantiert den rechtzeitigen Zugriff für wartende Threads (verhindert ewiges Warten).

## Was sind externe **Locks** (`java.util.concurrent.locks`) und welche Vorteile bieten sie gegenüber `synchronized`?

- Erfordern ein manuelles `lock()` und `unlock()`.
- Sind **flexibler** als `synchronized` (z.B. methodenübergreifend anwendbar).
- Bieten **`tryLock()`**: Ein Lock-Versuch ohne Blockieren (auch mit Timeout möglich).

## Warum müssen externe **Locks** zwingend in einem `try-finally`-Block freigegeben werden?

- Verhindert ein **ewiges Blockieren** anderer Threads.
- Die Freigabe im `finally`-Block garantiert, dass das Lock auch dann sicher gelöst wird, wenn im Code eine **Exception** auftritt.

```java
lock.lock();
try {
    // Critical Section
} finally {
    lock.unlock(); // Immer sichergestellt
}
```

## Was sind **Reentrant Locks** (Rekursive Locks) und wie funktionieren sie intern?

- Derselbe Thread darf das gleiche Lock **mehrfach anfordern**.
- Nutzt einen **internen Counter**:
    - Aufruf: Counter \\( +1 \\).
    - Freigabe: Counter \\( -1 \\).
- Das Lock ist erst bei Counter \\( 0 \\) für andere Threads frei.
- (Sowohl `synchronized` als auch `ReentrantLock` nutzen dieses Prinzip).

## Welchen konkreten Vorteil bieten **Reentrant Locks** bei der Ausführung von Objekt-Methoden?

- Verhindern **Deadlocks** bei internen Methodenaufrufen.
- (Beispiel: Eine gelockte Methode `withdraw()` kann problemlos eine weitere gelockte Methode `setBalance()` desselben Objekts aufrufen).

## Was ist ein **Data Race** (Low-level Race Condition)?

- Ein gleichzeitiger, **ungeschützter Speicherzugriff** auf dieselbe Variable, bei dem mindestens ein Zugriff ein Schreibzugriff ist (Read/Write oder Write/Write).
- Passiert auf CPU-/Memory-Ebene.
- Ist **immer ein Bug** (korrumpiert Daten lautlos).
- **Achtung**: Wirft **keine Hardware-Exception**.

## Was ist ein **Bad Interleaving** (High-level Race Condition)?

- Ein **logischer Fehler** durch ungünstige Unterbrechung (**Interleaving**) des Schedulers.
- Es gibt **kein Data Race** (die Einzelzugriffe sind korrekt gelockt).
- Ein **inkonsistenter Zwischenzustand** wird sichtbar und verletzt Invarianten.
- *Beispiel*: Unterbrechung zwischen den Aufrufen von `pop()` und `push()` bei einem Bounded Stack.
    - *Lösung*: Gesamte `peek()`-Methode in eine eigene Critical Section packen.

## Was besagen die Prinzipien **Keine Data Races** und **Consistent Locking** für nebenläufigen Code?

- **Keine Data Races**: Der Zugriff auf dieselbe Speicheradresse darf **nie ungeschützt** sein (notwendig, aber nicht ausreichend).
- **Consistent Locking**:
    - Jede zu schützende Variable erfordert ein **eindeutiges Lock** (guarded).
    - Dasselbe Lock muss zwingend für Lese- **und** Schreibzugriffe verwendet werden.

## Was ist der Unterschied zwischen **Coarse-grained** und **Fine-grained Lock Granularity**?

- **Coarse-grained** (Grobgranular): Ein Lock für viele Objekte (z.B. ganzes Array).
    - *Vorteil*: Simpel.
    - *Nachteil*: Schlechte Performance (unnötiges Blockieren).
- **Fine-grained** (Feingranular): Ein Lock pro Element.
    - *Vorteil*: Hohe Parallelität.
    - *Nachteil*: Komplex, hohe **Deadlock-Gefahr**.
- **Regel**: Immer mit **Coarse-grained starten** und nur bei Performance-Problemen feiner werden.

## Wie wählt man die optimale Länge einer **Critical Section** (Critical Section Granularity)?

- **Zu lang**: Performance-Verlust durch unnötige Blockaden.
- **Zu kurz**: Bugs durch sichtbare Zwischenzustände (**Bad Interleavings**).
- **Regel**: Gross genug für die Korrektheit, aber **keine teuren I/O- oder Rechenoperationen** innerhalb des Blocks platzieren.

## Was besagt das Prinzip **Atomicity First** bezüglich des Entwurfs von nebenläufigem Code?

- **Zuerst**: Algorithmus und Invarianten definieren (Was muss zwingend atomar sein?).
- **Danach**: Erst im zweiten Schritt die konkrete Locking-Strategie entwerfen.

## Warum sollte man bevorzugt **Standard-Bibliotheken** für nebenläufige Datenstrukturen verwenden?

- Eigene komplexe Strukturen sind extrem fehleranfällig (sollten nur für Lernzwecke gebaut werden).
- Erprobte Klassen (z.B. **`ConcurrentHashMap`**) verwenden, um subtile Concurrency-Bugs zu vermeiden.
