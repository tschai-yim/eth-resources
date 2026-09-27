## Grundlagen der Graphentheorie

- **Graphdefinition:** $G=(V, E)$ mit nicht-leerer Knotenmenge $V$ und Kantenmenge $E$ .[^def1_ex8][^def_script_graph]
    - **Formale Definition:** $E$ ist eine Menge von zweielementigen Teilmengen von $V$, d.h. $E \subseteq \{\{u, v\} \mid u, v \in V, u \neq v\}$.
    - **Standard:** Ungerichtet, keine Schleifen (*self-loops*), keine Mehrfachkanten (*multigraphs*).
- **Knotengrad (*degree*, $\deg(v)$):** Anzahl der anliegenden Kanten an $v$ .[^def1_ex8][^def_script_degree]
- **Handschlaglemma:**
    - Summe aller Grade = $2 \cdot |E|$ (doppelte Kantenanzahl) .[^handshake_script]
    - **Implikation:** Summe der Grade stets gerade $\to$ Anzahl Knoten mit ungeradem Grad immer gerade (relevant für Existenzbeweise).

## Wege, Pfade und Zyklen

### Offene Folgen (Nicht-Schlaufen)

- **Weg (*walk*):** Knotenfolge $(v_0, \dots, v_k)$, verbunden durch Kanten. Wiederholungen von Knoten/Kanten erlaubt .[^def1_ex8][^def_script_walk]
- **Pfad (*path*):** Weg, bei dem alle Knoten **unterschiedlich** sind ($v_i \neq v_j$) .[^def1_ex8]

### Geschlossene Folgen (Schlaufen)

- **Zyklus (*closed walk*):** Weg mit $v_{start} = v_{end}$ und Länge $\ge 2$. Wiederholungen erlaubt .[^def2_ex8]
    - *Bedingung:* Endknoten hat (unter Berücksichtigung der Kantenwiederholungen im Weg) einen geraden Grad bezüglich des Weges .[^claim_script_closedwalk]
- **Kreis (*cycle*):** Zyklus, bei dem alle inneren Knoten unterschiedlich sind (Länge $\ge 3$) .[^def1_ex8]

### Zusammenhang & Erreichbarkeit

- **Erreichbarkeit (*reachability*):** Existenz eines Weges zwischen $u$ und $v$ (Äquivalenzrelation: *u reaches v*) .[^def1_ex8]
- **Zusammenhangskomponente (*connected component*):** Äquivalenzklasse der Erreichbarkeit .[^def1_ex8]
- **Zusammenhängend (*connected*):** Graph besteht aus nur einer Komponente (jeder erreicht jeden) ...[^def1_ex8][^def3_ex8]

## Spezielle Graphenstrukturen & Eigenschaften

### Schnittknoten und Brücken

- **Schnittknoten (*cut vertex*):** Entfernung macht Graph unzusammenhängend .[^def4_ex8]
    - *Eigenschaft:* Ein Nicht-Schnittknoten (mit $\deg(v) \ge 2$) liegt zwingend auf einem Kreis.
- **Brücke (*cut edge*):** Entfernung macht Graph unzusammenhängend .[^def5_ex8]
    - *Eigenschaft:* Eine Nicht-Brücke liegt zwingend auf einem Kreis.

### Bäume (*Trees*)

- **Definition:** Zusammenhängend und kreisfrei .[^def1_ex8]
- **Eigenschaften:**
    - $n$ Knoten $\Leftrightarrow n-1$ Kanten.
    - $n \ge 2 \Leftrightarrow$ Mindestens zwei Blätter.
- **Beweisstrategie (Induktion):** Blatt **entfernen** ($n+1 \to n$) meist einfacher als Hinzufügen.

### Spezielle Graphentypen

- **Vollständiger Graph (*complete graph*, $K_n$):** Enthält alle möglichen Kanten zwischen unterschiedlichen Knoten ($\{\{u, v\} \mid u, v \in V, u \neq v\}$) .[^ex9_1]
- **Disjunkte Vereinigung (*disjoint union*):** $G_1 \cup \dots \cup G_k$ mit $V = V_1 \cup \dots \cup V_k$ (paarweise disjunkt) und $E = E_1 \cup \dots \cup E_k$ .[^ex9_1]
- **Bipartit:** Knotenmenge teilbar in $V_1, V_2$, Kanten nur *zwischen* den Mengen .[^def2_ex9]
    - *Äquivalenz:* Kein Kreis ungerader Länge .[^thm1_ex9]
- **Transitiv:** $\{u,v\}, \{v,w\} \in E \implies \{u,w\} \in E$ .[^ex9_1]
    - *Struktur:* Disjunkte Vereinigung von vollständigen Graphen.

## Eulerwege und Hamiltonpfade

| Eigenschaft | Eulerweg / -zyklus | Hamiltonpfad / -kreis |
| :--- | :--- | :--- |
| **Definition** | Jede **Kante** genau einmal | Jeder **Knoten** genau einmal |
| **Komplexität** | Effizient lösbar ($O(n+m)$) | NP-schwer (kein polynomieller Algo bekannt) |

### Konditionen für Eulerwege

- **Eulerscher Graph:** Graph, der einen geschlossenen Eulerweg (Eulerzyklus) enthält .[^def1_ex9]
- **Eulerzyklus (geschlossen):** Existiert $\Leftrightarrow$ Graph zusammenhängend (bis auf isolierte Knoten) + **alle** Knotengrade sind gerade .[^thm_script_euler]
- **Offener Eulerweg:** Existiert $\Leftrightarrow$ Graph zusammenhängend (bis auf isolierte Knoten) + **genau 2** Knoten haben ungeraden Grad (Start/Ende) .[^script_p3]
- **Kein Eulerweg:** Wenn mehr als 2 Knoten ungeraden Grad haben.

## Algorithmen & Datenstrukturen

### Graphen-Repräsentation (Laufzeiten)

Sei $n = |V|$ und $m = |E|$.

| Operation / Eigenschaft     | Adjazenzmatrix ($n \times n$)            | Adjazenzlisten (Array von Listen)  |
| :-------------------------- | :--------------------------------------- | :--------------------------------- |
| **Speicherbedarf**          | $\Theta(n^2)$                            | $\Theta(n + m)$                    |
| **Kante testen $(u, v)$**   | $O(1)$                                   | $O(1 + \min(\deg(u), \deg(v)))$    |
| **Nachbarn finden $(u)$**   | $\Theta(n)$                              | $O(1 + \deg(u))$                   |
| **Alle Kanten enumerieren** | $\Theta(n^2)$                            | $O(n+m)$ [^claim_script_enumedges] |
| **Euler-Algorithmus**       | $O(n \cdot m)$ [^claim_script_adjmatrix] | $O(n+m)$ [^claim_script_adjlist]   |

### Euler-Algorithmus (Hierholzer-Idee / Rekursives Backtracking)

**Ablauf:**
1. Starte `EulerWalk(u)`.
2. Iteriere über Nachbarn: Markiere unbesuchte Kante $\{u,v\}$ und rufe `EulerWalk(v)` rekursiv auf.
3. **Backtracking:** Füge $u$ zur Ergebnisliste hinzu, *nachdem* Rekursion zurückkehrt.
4. Ergebnis ist Liste (ggf. umgekehrt).

**Analyse:**
- **Invariante (ALL-EVEN):** Jeder Knoten hat gerade Anzahl unmarkierter Kanten. Gilt vor und nach `EulerWalk` für **alle** Knoten (Resultat ist geschlossener Weg) .[^claim_script_invariant]
- **Korrektheit:** Visualisierung "Hase und Igel" am Rekursionsbaum .[^lemma_script_correct]
    - *Hase:* Durchläuft Kanten (rekursive Aufrufe).
    - *Schildkröte:* Springt zwischen Blättern des Rekursionsbaums $\hat{=}$ Verweilen am selben Knoten im Graphen .[^claim_script_tortoise]

### Definition 1

Too big for footnotes.

> **Definition 1.** Let $G = (V, E)$ be a graph.
> -   For $v \in V$, the **degree** $\deg(v)$ of $v$ (german "Knotengrad") is the number of edges that are incident to $v$.
> -   A sequence of vertices $(v_0, v_1, \dots, v_k)$ (with $v_i \in V$ for all $i$) is a **walk** (german "Weg") if $\{v_i, v_{i+1}\}$ is an edge for each $0 \le i \le k - 1$. We say that $v_0$ and $v_k$ are the **endpoints** (german "Startknoten" and "Endknoten") of the walk. The **length** of the walk $(v_0, v_1, \dots, v_k)$ is $k$.
> -   A sequence of vertices $(v_0, v_1, \dots, v_k)$ is a **closed walk** (german "Zyklus") if it is a walk, $k \ge 2$ and $v_0 = v_k$.
> -   A sequence of vertices $(v_0, v_1, \dots, v_k)$ is a **path** (german "Pfad") if it is a walk and all vertices are distinct (i.e., $v_i \neq v_j$ for $0 \le i < j \le k$).
> -   A sequence of vertices $(v_0, v_1, \dots, v_k)$ is a **cycle** (german "Kreis") if it is a closed walk, $k \ge 3$ and all vertices (except $v_0$ and $v_k$) are distinct.
> -   An **Eulerian walk** (german "Eulerweg") is a walk that contains every edge exactly once.
> -   A **closed Eulerian walk** (german "Eulerzyklus") is a closed walk that contains every edge exactly once.
> -   A **Hamiltonian path** (german "Hamiltonpfad") is a path that contains every vertex.
> -   A **Hamiltonian cycle** (german "Hamiltonkreis") is a cycle that contains every vertex.
> -   For $u, v \in V$, we say $u$ **reaches** $v$ (or $v$ is **reachable** from $u$; german "u erreicht v") if there exists a walk with endpoints $u$ and $v$, or equivalently, there exists a path with endpoints $u$ and $v$.
> -   A **connected component** of $G$ (german "Zusammenhangskomponente") is an equivalence class of the (equivalence) relation defined as follows: Two vertices $u, v \in V$ are equivalent if $u$ reaches $v$.
> -   A graph $G$ is **connected** (german "zusammenhängend") if for every two vertices $u, v \in V$, $u$ reaches $v$, or equivalently, if there is only one connected component.
> -   A graph $G$ is a **tree** (german "Baum") if it is connected and has no cycles.

[^def1_ex8]: See chapter [[#Definition 1]]
[^def_script_graph]: **Definition:** A graph $G = (V, E)$ consists of a finite vertex set $V$ and finite edge set $E$ such that each edge $e \in E$ is an unordered pair $e = \{u, v\}$ of distinct vertices $u, v \in V$. Typically, we require that $V$ is not the empty set.
[^def_script_degree]: **Definition:** If a graph $G = (V, E)$ contains an edge $e = \{u, v\} \in E$, we call the vertices $u, v$ *adjacent* in $G$ and we say $e$ is *incident* to $u$ and $v$. The degree of a vertex $u$, denote $\deg(u)$, is the number of edges that $u$ is incident to in $G$.
[^handshake_script]: **Handshake lemma:** For every graph $G = (V, E)$, $\sum_{v \in V} \deg(v) = 2|E|$.
[^def_script_walk]: **Definition:** A *walk of length $\ell$* is a sequence of $\ell + 1$ vertices $v_0, \dots, v_\ell$ such that consecutive ones are adjacent, i.e., $\{v_i, v_{i+1}\} \in E$.
[^def2_ex8]: **Definition 2.** A cycle is a sequence of vertices $v_1, \dots, v_k, v_{k+1}$ with $k \ge 3$ such that all $v_1, \dots, v_k$ are distinct, $v_1 = v_{k+1}$ and such that any two consecutive vertices are adjacent. We say that such a cycle has length $k$.
[^claim_script_closedwalk]: **Claim:** A walk $W = (v_0, \dots, v_\ell)$ is closed if and only if $\deg_W(v_\ell)$ is even.
[^def3_ex8]: **Definition 3.** A graph is *connected* if there is a walk between every pair of vertices. It is called *disconnected* otherwise.
[^def4_ex8]: **Definition 4.** A vertex $v$ in a connected graph is called a *cut vertex* (or *articulation point*) if the subgraph obtained by removing $v$ (and all its incident edges) is disconnected.
[^def5_ex8]: **Definition 5.** An edge $e$ in a connected graph is called a *cut edge* (or *bridge*) if the subgraph obtained by removing $e$ (but keeping all the vertices) is disconnected.
[^ex9_1]: **Exercise 9.1**
    - **complete** when its set of edges is $\{\{u, v\} \mid u, v \in V, u \neq v\}$;
    - the **disjoint union** of $G_1 = (V_1, E_1), \dots, G_k = (V_k, E_k)$ iff $V = V_1 \cup \dots \cup V_k$, $E = E_1 \cup \dots \cup E_k$, and $V_1, \dots, V_k$ are pairwise disjoint.
    - Show that an undirected graph $G$ is **transitive** \[when for any two edges $\{u, v\}$ and $\{v, w\}$ in $E$, the edge $\{u, w\}$ is also in $E$] if and only if it is a disjoint union of complete graphs.
[^def2_ex9]: **Definition 2.** A graph $G = (V, E)$ is *bipartite* if it is possible to partition the vertices in two sets $V_1$ and $V_2$ (i.e. $V_1 \cap V_2 = \emptyset$ and $V_1 \cup V_2 = V$) such that every edge $\{u, v\} \in E$ has one endpoint in $V_1$ and the other in $V_2$.
[^thm1_ex9]: **Theorem 1.** A graph is bipartite if and only if it does not contain any cycle of odd length.
[^def1_ex9]: **Definition 1.** We say that a graph $G$ is *Eulerian* if it contains a closed Eulerian Walk (Eulerzyklus).
[^thm_script_euler]: **Theorem:** A connected graph has a closed Eulerian walk if and only if all vertex degrees are even.
[^script_p3]: **Claim:** If there exists a Eulerian walk, then all but at most two vertex degrees must be even.
[^claim_script_enumedges]: **Claim:** The running time to enumerate all edges of $G$ given its adjacency list representation is $O(n + m)$.
[^claim_script_adjmatrix]: **Claim:** `Walk(u)` can be implemented to have running time $O(n \cdot m)$ if $G$ is represented by its adjacency matrix.
[^claim_script_adjlist]: **Claim:** `Walk(u)` can be implemented to have running time $O(n + m)$ for the adjacency list representation $A$ of $G$.
[^claim_script_invariant]: **Claim:** If ALL-EVEN holds before running `Walk(u)`, then it also holds after `Euler(G)` has finished. Furthermore, the walk $W$ marked by `Euler(G)` is closed. (Where ALL-EVEN: every vertex is incident to an even number of unmarked edges).
[^lemma_script_correct]: **Lemma:** For a connected graph $G$ without odd degree vertices, `Euler(G)` computes a closed Eulerian walk.
[^claim_script_tortoise]: **Claim:** The root and the first leaf of $T$ correspond to the same vertex in $G$. Furthermore, for every leaf $i$ besides the first leaf, the lowest common ancestor of leaf $i - 1$ and leaf $i$ corresponds to the same vertex in $G$ as leaf $i$.
