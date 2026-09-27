## Grundlagen

- **Gerichteter Graph (*Directed Graph*)**: $G=(V,E)$ mit Kanten als geordnete Paare $(u, v)$. Richtung essenziell (Einbahnstrassen, Abhängigkeiten). [^def_directed_graph]
- **Terminologie**:
    - **Nachfolger / Vorgänger**: Bei $(u,v)$ ist $v$ Nachfolger von $u$, $u$ Vorgänger von $v$.
    - **Grad (*Degree*)**:
        - **Eingangsgrad** ($\deg_{in}(u)$): Anzahl eingehender Kanten.
        - **Ausgangsgrad** ($\deg_{out}(u)$): Anzahl ausgehender Kanten. [^def_degrees]
    - **Spezielle Knoten**:
        - **Quelle (*Source*)**: $\deg_{in}(u) = 0$.
        - **Senke (*Sink*)**: $\deg_{out}(u) = 0$.
- **Gerichteter Zyklus**: Weg $v_0 \to \dots \to v_k$ mit $v_0 = v_k$ und $k \ge 1$.

## Topologische Sortierung

- **Konzept**: Lineare Anordnung der Knoten $V$, sodass für jede Kante $(u,v)$ $u$ vor $v$ steht.
- **Existenzbedingung**: Möglich $\iff$ Graph enthält **keinen gerichteten Zyklus** (*Directed Acyclic Graph*, DAG). [^thm_topo_sort]
    - *Implikation*: Jeder endliche DAG besitzt $\ge 1$ Senke.
- **Algorithmus zur Erstellung (Konstruktiver Beweis)**:
    1. Suche Knoten $v$ mit $\deg_{out}(v) = 0$ (Senke).
    2. Setze $v$ an letzte verfügbare Position der Sortierung.
    3. Entferne $v$ und inzidente Kanten aus $G$.
    4. Rekursion auf Restgraph.

## Repräsentation & Laufzeitanalyse

Laufzeitabhängigkeit von Datenstruktur ($n = |V|, m = |E|$).

- **Definitionen**:
    - **Adjazenzmatrix**: $n \times n$ Matrix $A$. $A_{uv} = 1$ falls $(u,v) \in E$, sonst $0$.
    - **Adjazenzliste**: Array der Grösse $n$. `Adj[u]` enthält verkettete Liste aller Nachfolger von $u$.

| Operation | Adjazenzmatrix | Adjazenzliste |
| :--- | :--- | :--- |
| **Speicherbedarf** | $\Theta(n^2)$ | $\Theta(n + m)$ |
| **Kante testen $(u,v)$** | $O(1)$ | $O(1 + \deg_{out}(u))$ |
| **Alle Nachfolger von $u$** | $\Theta(n)$ | $O(1 + \deg_{out}(u))$ |

- **Traversierungskosten (DFS/BFS)**:
    - Matrix: $\Theta(n^2)$ (Scan ganzer Zeilen nötig).
    - Liste: $\Theta(n + m)$ (Summe aller Grade = $m$ gemäss Handschlaglemma).

## Tiefensuche (DFS - Depth First Search)

Rekursives "Absteigen" in den Graphen.

### Algorithmus & Zeitstempel

- **Ablauf**: `Visit(u)` markiert $u$, ruft rekursiv `Visit(v)` für unmarkierte Nachfolger $v$ auf.
- **Zeitstempel (Globaler Zähler $T$)**:
    - **Pre-Number (`pre[u]`)**: Zeitpunkt des Betretens (Start `Visit`).
    - **Post-Number (`post[u]`)**: Zeitpunkt des Verlassens (Ende `Visit`).
- **Intervalle**: $I_u = [\text{pre}[u], \text{post}[u]]$. Repräsentiert Rekursionsdauer.
    - $I_v \subset I_u \implies v$ ist Nachfahre von $u$.
    - $I_v \cap I_u = \emptyset \implies$ Disjunkte Teilbäume.

### Kantenklassifizierung

Klassifikation einer Kante $(u,v)$ anhand der Intervalle (im DFS-Baum/Wald).

| Typ | Intervall-Bedingung | Bedeutung / Struktur |
| :--- | :--- | :--- |
| **Baumkante** (*Tree*) | $v$ unbesucht bei Aufruf | $u$ ruft $v$ direkt auf (Teil des DFS-Baums). |
| **Rückwärtskante** (*Back*) | $I_u \subset I_v$ | $v$ ist Vorfahre von $u$. **Zeigt Zyklus an.** [^obs_back_edge] |
| **Vorwärtskante** (*Forward*) | $I_v \subset I_u$ | $v$ ist Nachfahre (aber nicht direktes Kind). |
| **Querkante** (*Cross*) | $I_v$ liegt vor $I_u$ | Kante zwischen Zweigen (von rechts nach links). |

### Anwendung Topologische Sortierung

- **Reverse Post-Order**: Sortierung der Knoten nach `post[u]` absteigend.
- **Gültigkeit**: In DAGs (keine Back-Edges) gilt für alle Kanten $(u,v)$: $\text{post}(u) > \text{post}(v)$.

## Breitensuche (BFS - Breadth First Search)

Iterative Bestimmung kürzester Pfade in **ungewichteten** Graphen.

### Algorithmus

- **Datenstruktur**: Queue (FIFO).
- **Initialisierung**: Queue $Q = \{s\}$, $\text{dist}[s]=0$, alle anderen $\text{dist}=\infty$.
- **Iteration**:
    1. Entnehme $u$ aus $Q$.
    2. Für alle Nachfolger $v$:
        - Falls $v$ **unbesucht** ($\text{dist}[v] = \infty$):
            - $\text{dist}[v] \leftarrow \text{dist}[u] + 1$.
            - Füge $v$ zu $Q$ hinzu.
- **Logik**: Da Kanten keine Gewichte haben, ist der *erste* Besuch eines Knotens zwingend über einen kürzesten Pfad. Kein `min` Update nötig.

### Level-Sets

- **Definition $S_k$**: Menge aller Knoten mit Distanz $k$ zu $s$. [^def_level_sets]
- **Korrektheit**: Die Queue verarbeitet Knoten strikt nach aufsteigender Distanz (erst alle aus $S_k$, dann $S_{k+1}$). [^thm_bfs_correct]

[^def_directed_graph]: **Definition (Gerichteter Graph):** $G=(V,E)$ fast wie ungerichteter Graph, ausser: Kanten sind **geordnete Paare**. $u \to v$ entspricht $e=(u,v) \in E$. (Handnotizen Lecture 10, S. 3)
[^def_degrees]: **Begriffe:** $v$ ist Nachfolger von $u$, $u$ ist Vorgänger von $v$. $\deg_{in}(u) =$ **Eingangsgrad**, $\deg_{out}(u) =$ **Ausgangsgrad**. Quelle $u$: $\deg_{in}(u)=0$. Senke $v$: $\deg_{out}(v)=0$. (Handnotizen Lecture 10, S. 3)
[^thm_topo_sort]: **Behauptung:** $\exists$ topo. Sort. $\iff \nexists$ ger. Zyklus. (Handnotizen Lecture 10, S. 5)
[^obs_back_edge]: **Beobachtung (1):** $\exists$ back Kante $\implies \exists$ gerichteter Zyklus. (Handnotizen Lecture 10, S. 12)
[^def_level_sets]: **Level k:** $S_k := \{ v \in V \mid \text{dist}(s,v) = k \}$. Kante von $S_k$ nach $S_{k'} \implies k' \le k+1$. (Handnotizen Lecture 11, S. 3)
[^thm_bfs_correct]: **Behauptung:** $\forall k \in \mathbb{N}_0 . S_k = R_k = \{ v \mid t_k \le \text{leave}[v] < t_{k+1} \}$. (Handnotizen Lecture 11, S. 7)
