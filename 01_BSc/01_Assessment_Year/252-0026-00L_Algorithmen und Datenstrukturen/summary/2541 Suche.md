## Grundlagen der Suche

- **Problemstellung**: In einem Array ein bestimmtes Element finden.
- **Effizienz**: Hängt **entscheidend** von der **Sortierung** der Daten ab.
- **Elementare Operation**: Der **Vergleich** (z.B. $b = A[k]$, $b < A[m]$) bei vergleichsbasierten Algorithmen.

> **Definition 1.1 (Suche)** (Skript Suchen und Sortieren)
> Gegeben seien ein Array A mit n Einträgen (bei uns: Zahlen) und ein Element b. Gesucht ist ein Index k mit A\[k] = b, oder die Rückgabe "nicht gefunden", falls b nicht in A enthalten ist.

## Suchen in unsortierten Daten: Lineare Suche

### Algorithmus: Lineare Suche (Linear Search)

- **Prinzip**: Durchläuft das Array von Anfang bis Ende und vergleicht jedes Element mit dem gesuchten Wert $b$.
- **Laufzeit**:
    - **Worst Case**: $\Theta(n)$ (Element ist am Ende oder nicht vorhanden).
- **Optimalität**:
    - **Beweisbar nicht besser** für unsortierte Daten.
    - **Untere Schranke**: $\Omega(n)$.
    - **Argumentation**: Jedes Element muss min. 1x betrachtet werden, sonst könnte ein unbetrachtetes Element das gesuchte sein.
    - **Wichtig**: Die Optimalität bezieht sich **ausschliesslich auf vergleichsbasierte Algorithmen**.

## Suchen in sortierten Daten: Binäre Suche

- **Voraussetzung**: Daten sind sortiert (z.B. $A \le A \le \dots \le A[n]$).
- **Amortisation**: Das einmalige Sortieren lohnt sich bei vielen nachfolgenden Suchvorgängen, da diese exponentiell beschleunigt werden (von $n$ auf $\log n$).

### Algorithmus: Binäre Suche (Binary Search)

- **Grundidee**: **Divide and Conquer**-Ansatz.
    1. Vergleiche $b$ mit dem **mittleren Element** $A[m]$.
    2. Halbiere den Suchbereich je nach Ergebnis:
        - $b = A[m]$: Gefunden.
        - $b < A[m]$: Suche in **linker Hälfte** weiter.
        - $b > A[m]$: Suche in **rechter Hälfte** weiter.
- **Implementierung**: Rekursiv oder iterativ (mit Pointern für Suchbereichsgrenzen); der Algorithmus ist identisch.

### Laufzeitanalyse

- **Rekurrenzgleichung**: $T(n) \le T(n/2) + d$.
    - $T(n/2)$, da nur **ein** rekursiver Pfad verfolgt wird.
    - $d$ für konstante Operationen pro Schritt (Mitte berechnen, 1 Vergleich).
- **Lösung**: $T(n) \in O(\log n)$.
- Extrem schnell, z.B. $\log_2(10^9) \approx 30$.

### Optimalität

- **Optimal** für **vergleichsbasierte Algorithmen** auf sortierten Daten.
- **Untere Schranke**: $\Omega(\log n)$.
- **Beweisidee mittels Entscheidungsbaum** (Decision Tree):
    - **Aufbau**:
        - Jeder vergleichsbasierte Algorithmus ist als Binärbaum darstellbar.
        - **Innere Knoten**: Vergleiche.
        - **Blätter**: Ergebnisse ($n$ Indizes + "nicht gefunden").
    - **Analyse**:
        - Die **Worst-Case-Laufzeit** entspricht der **Höhe des Baums $h$**.
        - Der Baum muss mindestens **$n+1$ Blätter** für alle möglichen Ergebnisse haben.
        - Ein Binärbaum der Höhe $h$ hat **höchstens $2^h$ Blätter**.
    - **Herleitung**:
        - Somit ist die Laufzeit mindestens $\Omega(\log n)$.
