## Grundlagen der Algorithmik

- **Algorithmus**: Vollständige, präzise Beschreibung einer Sequenz **elementarer Operationen** zur Problemlösung.
    - **Elementare Operation**: Problemabhängig definiert (z.B. Ziffernmultiplikation, Vergleich, eine Frage).
    - **Beschreibung**: Als Text, Pseudocode oder Bild.
- **Ziele der Algorithmik**:
    - **Entwurf**: Finden von Lösungsstrategien.
    - **Analyse**: Untersuchung von Algorithmen hinsichtlich:
        - **Korrektheit**: Löst das Problem für alle gültigen Eingaben? (Ideal: **Beweis**).
        - **Kosten (Komplexität)**: Ressourcenbedarf (z.B. Zeit, Speicherplatz).
    - **Optimierung**: Zentrale Frage: **"Geht es besser?"**; Ziel: Effizientester Algorithmus.
- **Analysefokus**: Meist **Worst Case**: Szenario mit maximalen Kosten.

## Entwurfsparadigmen für Algorithmen

- **Divide and Conquer (Teile und Herrsche)**:
    - **Prinzip**: Problem in kleinere, unabhängige Teilprobleme zerlegen, diese (rekursiv) lösen und Ergebnisse kombinieren.
    - **Beispiel (Karazuba-Algorithmus)**: Multiplikation von $n$-stelligen Zahlen auf **drei** Multiplikationen von $n/2$-stelligen Zahlen zurückführen (statt vier).
- **Induktiver / Rekursiver Ansatz**:
    - **Prinzip**: Problem der Grösse $n$ durch Rückgriff auf Lösung für Grösse $n-1$ lösen.
    - **Beispiel (Starsuche)**: Star-Kandidaten unter $n-1$ Personen finden, dann Status mit Person $n$ klären.
- **Iterative Suchstrategien**:
    - **Prinzip**: Bei Suchproblemen mit unbekannter Distanz $k$ den Suchradius schrittweise erweitern.
    - **Beispiel (Pasture Break)**:
        - **Lineare Erhöhung** (1, 2, 3, ...): Kosten quadratisch ($O(k^2)$).
        - **Exponentielle Erhöhung** (1, 2, 4, ...): Kosten linear ($O(k)$).

## Problemstellungen & Optimierung im Detail

### Starsuche

- **Definition Star**: Person, die von allen gekannt wird, aber selbst niemanden kennt.
- **Eigenschaft**: Es kann **maximal einen Star** geben.
- **Naiver Ansatz**: Jeder fragt jeden $\implies F(n) = n(n-1) \in O(n^2)$ Fragen.
- **Induktiver Ansatz**:
    1. Person $p_n$ eliminieren (0 Fragen).
    2. Rekursiv Star-Kandidat $p_s$ unter den $n-1$ Personen finden (Kosten: $F(n-1)$).
    3. **Fall A (Kandidat $p_s$ gefunden)**: Beziehung zwischen $p_s$ und $p_n$ prüfen (2 Fragen).
    4. **Fall B (kein Star oder $p_s$ scheitert)**: Prüfen, ob $p_n$ der Star ist ($2(n-1)$ Fragen).
    - **Best Case**: Fall B tritt nie ein. $F(n) = F(n-1)+2 \implies F(n) \in O(n)$.
    - **Worst Case**: Fall B tritt immer ein. $F(n) = F(n-1)+2(n-1) \implies F(n) \in O(n^2)$.
- **Verbesserter Algorithmus**:
    - **Idee**: Sicherstellen, dass Fall B nie eintritt, indem garantiert ein Nicht-Star eliminiert wird.
    - **Neuer Schritt 0**: Frage $p_i$, ob er $p_j$ kennt (1 Frage).
        - "Ja" $\implies$ $p_i$ ist kein Star.
        - "Nein" $\implies$ $p_j$ ist kein Star.
    - Mit 1 Frage garantiert Nicht-Star zur Eliminierung finden.
    - **Analyse**: Der teure Fall B entfällt. Rekurrenz: $F(n) = F(n-1) + 1_{\text{Eliminierung}} + 2_{\text{Test}} = F(n-1)+3$.
    - **Lösung**: $F(n) = 3n-4 \in O(n)$.

### Multiplikation ganzer Zahlen

- **Schulmethode**: Benötigt $n^2$ Ziffernmultiplikationen $\implies O(n^2)$.
- **Karazuba-Algorithmus (1960)**:
    - **Trick** für $x=a \cdot 10^{n/2}+b, y=c \cdot 10^{n/2}+d$: $ad+bc = (a+b)(c+d) - ac - bd$.
    - **Analyse**: Führt zu 3 Multiplikationen auf halber Länge. Rekurrenz: $M(n) = 3 \cdot M(n/2)$.
    - **Lösung**: $M(n) \in O(n^{\log_2 3}) \approx O(n^{1.58})$.

### Pasture Break (Kuh am Zaun)

- **Problem**: Lücke in Zaun mit unbekannter Distanz $k$ und Richtung finden.
- **Lineare Suche**: Suchdistanz linear erhöhen (1, 2, 3, ...).
    - Kosten: $\sum_{i=1}^k 4i \approx 2k^2 \implies O(k^2)$.
- **Exponentielle Suche**: Suchdistanz verdoppeln (1, 2, 4, 8, ...).
    - Kosten: $< 9k \implies O(k)$.
