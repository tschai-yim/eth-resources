## Problemdefinition & Motivation

Ziel: Ermittlung der kürzesten Pfade zwischen **jedem Paar** von Knoten $(u, v)$ in Graph $G=(V, E)$ mit Kosten $c$.

- **Problemstellung**: Finde Distanz $d(u,v)$ für alle $u, v \in V$ .[^def1.1]
- **One-to-One Problematik**: Asymptotisch nicht schneller lösbar als **SSSP** (Single-Source Shortest Path: Ein Startknoten zu allen anderen).
- **Naive Ansätze** ($n \times$ SSSP-Algorithmus):
    - **Ungewichtet**: $n \times$ Breitensuche (BFS) $\to O(n(m+n))$.
    - **Nicht-negative Gewichte ($c \ge 0$)**: $n \times$ Dijkstra $\to O(n(m+n)\log n)$.
        - Sehr effizient, kaum verbesserbar.
    - **Allgemeine Gewichte ($c \in \mathbb{R}$)**: $n \times$ Bellman-Ford $\to O(n^2 m)$.
        - Langsam bei dichten Graphen (bis $O(n^4)$).

## Floyd-Warshall Algorithmus

Basierend auf **Dynamischer Programmierung (DP)**. Ideal für **dichte Graphen** oder simple Implementierung.

### Funktionsweise

- **Knotennummerierung**: $1$ bis $n$.
- **Teilproblem $d_{u,v}^k$**: Kürzester Weg $u \to v$ nur über **Zwischenknoten** aus Menge $\{1, \dots, k\}$ .[^def1.2]
- **Rekursion** (iteriert über $k, u, v$):
    - Option A: Knoten $k$ nicht nutzen (Wert aus $k-1$).
    - Option B: Knoten $k$ nutzen (Pfad $u \to k \to v$).
    - $d_{u,v}^k = \min(d_{u,v}^{k-1}, \, d_{u,k}^{k-1} + d_{k,v}^{k-1})$.
- **Basisfall ($k=0$)**:
    - $d_{u,u}^0 = 0$.
    - $d_{u,v}^0 = c(u,v)$ (falls Kante existiert), sonst $\infty$.

### Analyse & Eigenschaften

- **Laufzeit**: $O(n^3)$.
- **Speicherplatz**:
    - Naiv: $O(n^3)$.
    - **In-Place Optimierung**: $O(n^2)$ durch Weglassen des Index $k$: $d[u][v] \leftarrow \min(d[u][v], d[u][k] + d[k][v])$.
- **Rekonstruktion**: Speichern des Knotens $k$ (aus Minimum-Wahl) in Matrix `next[u][v]` für Backtracking.

### Negative Zyklen

Voraussetzung: **Keine negativen Zyklen** (Algorithmus erkennt diese aber).

- **Erkennung**: Negativer Zyklus vorhanden $\iff \exists v: d_{v,v} < 0$ am Ende .[^thm1.3]
- **Implikation**: Falls Zyklus erreichbar $\implies$ kürzester Weg undefiniert ($-\infty$).

## Johnson Algorithmus

Asymptotisch effizienter als Floyd-Warshall bei **dünnen Graphen**.

### Kernidee: Reweighting (Umgewichtung)

Ziel: Nutzung von schnellem Dijkstra ($O(m \log n)$) trotz negativer Kanten (wo sonst Bellman-Ford nötig wäre).

- **Problem naiver Konstanten-Addition**: Verfälscht Pfadpräferenzen (lange Pfade werden stärker benachteiligt).
- **Lösung (Potentiale)**:
    - Zuweisung Potential $h(v)$ pro Knoten.
    - Neue Kosten: $\hat{c}(u,v) = c(u,v) + h(u) - h(v)$.
    - **Teleskopsumme**: Für Pfad $s \to t$ gilt $\hat{c}(P) = c(P) + h(s) - h(t)$.
    - Da $h(s), h(t)$ fix, bleibt kürzester Pfad unter $\hat{c}$ identisch zu $c$.

### Ablauf

1. **Virtueller Knoten**: $z$ mit 0-Kosten-Kanten zu allen $v \in V$ hinzufügen.
2. **Potentialberechnung**: **Bellman-Ford** von $z$ starten $\to h(v) = \text{dist}(z, v)$.
    - *Erkennt negative Zyklen.*
    - Garantiert $\hat{c}(u,v) \ge 0$ (gemäss Dreiecksungleichung).
3. **Dijkstra**: $n \times$ Dijkstra mit Gewichten $\hat{c}$.
4. **Rückrechnung**: $d(u,v) = \hat{d}(u,v) - h(u) + h(v)$.

### Laufzeit

- **Gesamt**: $O(n(m+n) \log n)$ (dominiert durch $n \times$ Dijkstra).
- Bei dichten Graphen ($m \approx n^2$): $O(n^3 \log n)$ (langsamer als Floyd-Warshall).

## Vergleich der Algorithmen

| Algorithmus                 | Kantenart          | Laufzeit                    | Geeignet für                    |
| :-------------------------- | :----------------- | :-------------------------- | :------------------------------ |
| **$n \times$ BFS**          | Ungewichtet        | $O(nm + n^2)$               | Ungewichtete Graphen            |
| **$n \times$ Dijkstra**     | $c \ge 0$          | $O(nm \log n + n^2 \log n)$ | Gewichtet, nicht-negativ        |
| **Floyd-Warshall**          | $c \in \mathbb{R}$ | $O(n^3)$                    | **Dichte** Graphen, Simpel      |
| **Johnson**                 | $c \in \mathbb{R}$ | $O(n(m+n) \log n)$          | **Dünne** Graphen ($m \ll n^2$) |
| **$n \times$ Bellman-Ford** | $c \in \mathbb{R}$ | $O(n^2 m)$                  | (Selten genutzt)                |

[^def1.1]: **Definition 1.1** (All-Pairs-Shortest-Path-Problem). Gegeben sei ein Graph $G = (V, E)$ mit einer Kostenfunktion $c: E \to \mathbb{R}$, wobei $|V| = n$ und $|E| = m$ ist. Für jedes Paar $u, v \in V$ wollen wir einen kürzesten $u$-$v$-Weg finden, also einen Weg von $u$ nach $v$ mit minimalen Kosten.
[^def1.2]: **Definition 1.2** (Teilproblem des Floyd-Warshall-Algorithmus). Sei $G = (V, E)$ ein gerichteter Graph mit Knotenmenge $V = \{1, \dots, n\}$ und $1 \le i \le n$ und mit Kantenkosten $c(e) \in \mathbb{R}, e \in E$. Für $u, v \in V$ sei $d_{u,v}^i$ die Länge eines kürzesten Weges von $u$ nach $v$, dessen Zwischenknoten (das heisst alle Knoten ausser dem Startknoten $u$ und dem Endknoten $v$) aus der Menge $\{1, \dots, i\}$ stammen.
[^thm1.3]: **Theorem 1.3.** Ein Graph $G = (V, E)$ enthält genau dann einen negativen Zyklus, wenn es einen Knoten $v \in V$ gibt mit $d_{v,v}^n < 0$.
