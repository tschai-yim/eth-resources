## Grundlagen & Definitionen

- **Gewichteter Graph**: $G=(V, E)$ mit Kostenfunktion $c: E \to \mathbb{R}$.
- **Spannbaum (Spanning Tree)**: Kantenmenge $T \subseteq E$, verbindet alle Knoten (zusammenhängend), kreisfrei.
    - Graph mit $n$ Knoten $\implies$ Spannbaum hat $n-1$ Kanten.
- **Minimaler Spannbaum (MST)**: Spannbaum $T$ mit minimalem Gesamtgewicht $\sum w(e)$.
- **Wald (Forest)**: Ungerichteter Graph ohne Kreise; Komponenten sind Bäume .[^ex12_2_forest]
    - **$\ell$-Forest**: Genau $\ell$ Zusammenhangskomponenten .[^ex12_2_forest]
    - Spannbaum = 1-Forest.
- **Sichere Kante (Safe Edge)**: Kante, die in allen MSTs vorkommt.

## Eigenschaften & Theoreme

### Schnittprinzip (Cut Property)

Basis für Korrektheit aller MST-Algorithmen.

- **Aussage**: Für jeden Schnitt ($S, V \setminus S$) ist die **minimale Kante** $e$, die den Schnitt kreuzt, **sicher**.
- **Beweis (Widerspruch)**:
    - Annahme: Minimale Schnittkante $e$ ist in keinem MST. Sei $T$ ein MST ohne $e$.
    - Füge $e$ zu $T$ hinzu $\to$ Es entsteht genau ein Kreis.
    - Da $e$ den Schnitt kreuzt, muss der Kreis den Schnitt an einer **zweiten Kante** $e'$ kreuzen (um in den Teilgraphen $S$ zurückzukehren).
    - Da $e$ minimal bzgl. Schnitt $\implies w(e) < w(e')$.
    - Ersetze $e'$ durch $e$ $\to$ $T' = (T \setminus \{e'\}) \cup \{e\}$ ist Spannbaum mit geringerem Gewicht $\implies T$ war kein MST (Widerspruch).

### Kreiseigenschaft & Heavy Edges

- **Schwere Kante (Heavy Edge)**: Kante $e$ ist strikt schwerste Kante in einem Kreis $C$ .[^ex12_5_heavy]
- **Leichte Kante (Light Edge)**: Kante existiert in mindestens einem MST .[^ex12_5_light]
- **Theorem (Äquivalenz)**: Eine Kante ist **heavy** $\iff$ sie ist **nicht light** (also in **keinem** MST enthalten) ..[^ex12_5_heavy_not_light][^ex12_5_not_heavy_is_light]

### Eindeutigkeit & Redundanz

- **Eindeutigkeit**: Kantengewichte paarweise verschieden $\implies$ MST **eindeutig** .[^ex12_3_unique]
- **Redundante Kanten**: Kante existiert, falls eine andere mit gleichem Gewicht existiert.
    - **$k$-redundant**: Genau $k$ solche Paare .[^ex12_4_redundant]
    - Max. $2^k$ verschiedene MSTs möglich .[^ex12_4_k_redundant_msts]

### Invarianz unter Addition

- Addition einer Konstante $k$ auf alle Gewichte ändert MST-Struktur **nicht**.
- Grund: Jeder Spannbaum hat $n-1$ Kanten; Gesamtgewicht steigt bei allen um exakt $(n-1)k$ .[^ex11_5_constant_add]

## Algorithmen

### Borůvka Algorithmus

Parallelisierbar, komponenten-basiert.

- **Ablauf**:
    1. Start: $n$ Komponenten.
    2. Wähle für **jede** Komponente die günstigste ausgehende Kante.
    3. Füge Kanten hinzu, verschmelze Komponenten.
    4. Wiederhole bis 1 Komponente übrig.
- **Laufzeit**: $O(m \log n)$.
    - $O(m)$ pro Phase (Kanten scannen).
    - Jede Phase halbiert Komponenten-Anzahl $\implies \log n$ Phasen.

### Prim Algorithmus

Lokal wachsend (Startknoten), ähnlich Dijkstra.

- **Ablauf**:
    1. $S = \{s\}$.
    2. Wähle minimale Kante zwischen $S$ und $V \setminus S$ (Cut Property).
    3. Füge Knoten zu $S$, update Nachbarn.
- **Datenstruktur**: Min-Heap speichert $d[v] = \min \{ c(u,v) \mid u \in S \}$ (Anschlusskosten, nicht Pfadlänge!) .[^lecture12_prim_diff]
- **Laufzeit**: $O(m \log n)$ (Binary Heap).
    - **Zusammensetzung**: Jeder Knoten wird 1x entnommen ($n \log n$), jede Kante führt ggf. zu Key-Update ($m \log n$).

### Kruskal Algorithmus

Global, kanten-basiert.

- **Ablauf**:
    1. Sortiere Kanten aufsteigend.
    2. Iteriere Kanten $(u,v)$:
        - Prüfe mit Union-Find: Sind $u, v$ getrennt? (`find(u) != find(v)`)
        - **Ja**: `union(u, v)` (Kante hinzufügen).
        - **Nein**: Verwerfen (Kante schliesst Kreis).
- **Laufzeit**: $O(m \log m)$ (Sortierung dominiert).

### Vergleich

| Algorithmus | Strategie | Fokus | Laufzeit |
| :--- | :--- | :--- | :--- |
| **Borůvka** | Komponenten verschmelzen | Global / Parallel | $O(m \log n)$ |
| **Prim** | Baum wachsen lassen | Lokal | $O(m \log n)$ |
| **Kruskal** | Kanten sortieren | Global | $O(m \log m)$ |

## Datenstruktur: Union-Find (für Kruskal)

Verwaltung disjunkter Mengen (Zusammenhangskomponenten).

### Operationen

1. `make(v)`: Neue Menge $\{v\}$.
2. `find(v)` / `same(u, v)`: Repräsentant finden / Gleichheit prüfen.
3. `union(u, v)`: Mengen vereinigen.

### Implementierung (Listen-basiert & Weighted Union)

- **Ansatz**: Knoten als Listen verwalten. Array `rep[u]` zeigt auf Repräsentant.
- **Problem naiv**: Einfaches Umhängen $\to O(n)$ pro Union.
- **Optimierung "Weighted Union"**:
    - **Grössenvergleich**: Vergleiche die Anzahl der Elemente (Länge der Liste `members` oder separater Zähler beim Repräsentanten).
    - **Strategie**: Aktualisiere immer die Repräsentanten der **kleineren** Menge und hänge sie an die grössere.
    - **Analyse**: Ein Knoten ändert seinen Repräsentanten nur, wenn seine Menge in eine grössere integriert wird $\implies$ Grösse verdoppelt sich .[^lecture13_union_proof]
    - Ein Knoten kann max. $\log_2 n$ mal "der kleinere" sein.
- **Laufzeit**:
    - Amortisiert $O(m \log n)$ für $m$ Operationen.

## Spezielle Techniken

### Clustering

- **Ziel**: $k$ Komponenten mit min. Gewicht.
- **Lösung**: MST berechnen, $k-1$ **schwerste** Kanten entfernen.

### Steiner Tree Variationen ($k$-Fibre Links)

- **Problem**: $k$ Kanten "gratis" nutzen, um Graph zu verbinden.
- **Lösung (via Kruskal)**:
    - Ziel: Minimaler $(k+1)$-Forest.
    - Stoppe Kruskal nach $n - (k+1)$ hinzugefügten Kanten .[^ex12_2_solution]
    - **Äquivalenz**: Das ist exakt dasselbe wie MST berechnen und $k$ schwerste Kanten entfernen (da Kruskal von klein nach gross arbeitet, fehlen am Ende automatisch die schwersten).

### Kanten-Kontraktion

- **Konzept**: Kante $e=\{u,v\}$ entfernen, $u,v$ verschmelzen.
- **Theorem**: $e \in MST(G) \iff MST(G) = MST(G_{kontrahiert}) \cup \{e\}$ .[^ex12_4_contraction]

[^ex12_2_forest]: **Definition (Forest):** An undirected graph is said to be a forest if it does not contain any cycle. In other words, a graph is a forest if and only if its connected components are trees. We say that it is an $\ell$-forest if it has $\ell$ connected components. Note that a graph is a 1-forest if and only if it is a tree.
[^ex12_5_heavy]: **Definition (Heavy Edge):** We say an edge $e \in E$ is heavy if there exists a cycle $C \subseteq E$ so that $e \in C$ is the (strictly) heaviest edge in $C$, i.e., $w_e > w_f$ for all $f \in C$ with $f \neq e$.
[^ex12_5_light]: **Definition (Light Edge):** We say an edge is light if there exists a minimum spanning tree $T \subseteq E$ of $G$ which contains $e$.
[^ex12_5_heavy_not_light]: **Claim:** Show that a heavy edge cannot be light.
[^ex12_5_not_heavy_is_light]: **Claim:** Show that an edge which is not heavy, must be light. Conclude that an edge is heavy if and only if it is not light.
[^ex12_3_unique]: **Theorem (Uniqueness of MST):** [...] for a connected graph, if the weights of the edges are pairwise distinct, the minimum spanning tree is unique.
[^ex12_4_redundant]: **Definition (Redundant Edge):** An edge is called redundant if there exists another edge with the same weight. A graph is $k$-redundant if it has exactly $k$ redundant edges. More formally this means that $|\{e \in E \mid \exists e' \in E . e \neq e' \land w(e) = w(e')\}| = k$.
[^ex12_4_k_redundant_msts]: **Claim:** Any $k$-redundant graph has at most $2^k$ distinct MSTs.
[^ex11_5_constant_add]: **Fact (Invariant under Addition):** In a graph with $n$ vertices, every spanning tree has $n − 1$ edges. Thus the weight of every spanning tree is increased by exactly $(n − 1) \cdot k$. Therefore, the minimum spanning trees remains the same.
[^lecture12_prim_diff]: **Fact (Prim Update Rule):** $d[v] \leftarrow \min \{ d[v], c(v^*, v) \}$. (Unterschied zu Dijkstra: dort $d[v^*] + c(v^*, v)$).
[^lecture13_union_proof]: **Proof (Union-Find Amortized):** Betrachte Anzahl der Änderungen des Repräsentanten (`rep[u]`) für einen festen Knoten $u$ ($N_u$). `rep[u]` ändert sich nur, wenn $u$ in der *kleineren* Menge ist. Wenn $u$ in der kleineren Menge ist, *verdoppelt* sich die Grösse der ZHK, in der $u$ liegt, mindestens. [...] $\Rightarrow N_u \le \log_2 n$.
[^ex12_2_solution]: **Fact (Kruskal for k-Forests):** finding a minimum spanning $(k + 1)$-forest of $G$ [...] can be done using a slight modification of Kruskal's algorithm. [...] Instead of completing Kruskal's procedure until adding $n − 1$ edges, we stop after adding $n − k − 1$ edges from $E$.
[^ex12_4_contraction]: **Fact (MST Contraction):** if $T$ is an MST of $G$ and $e \in T$, then $T_e$ must be an MST of $G_e$ \[where $G_e$ is the graph obtained by contracting $e$].
