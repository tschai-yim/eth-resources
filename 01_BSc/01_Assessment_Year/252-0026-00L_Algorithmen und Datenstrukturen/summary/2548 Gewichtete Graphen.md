## Grundlagen gewichteter Graphen

- **Definition:** Graph $G=(V, E)$ mit **Kostenfunktion** (Gewichten) $c: E \to \mathbb{R}$.
- **Wegkosten $c(W)$:** Summe aller Kantengewichte eines Weges $W$ ($c(W) = \sum_{e \in W} c(e)$).
- **Distanz $d(u,v)$:** Kosten des **günstigsten** Weges $u \leadsto v$. [^def_weighted_dist]
    - Falls $v$ unerreichbar: $d(u,v) = \infty$.
- **Negativer Zyklus:** Zyklus $W_{cycle}$ mit $c(W_{cycle}) < 0$.
    - *Implikation:* Distanz zu Knoten auf/nach Zyklus $= -\infty$ (Kosten beliebig senkbar).
    - *Annahme:* Meist initial ausgeschlossen, damit Distanzen wohldefiniert. [^ass_neg_cycle]

## Dijkstra-Algorithmus (Nicht-negative Gewichte)

Berechnung kürzester Wege ab Startknoten $s$.

- **Voraussetzung:** Kantenkosten **nicht-negativ** ($c(e) \ge 0$).
- **Prinzip:** **Greedy**. Finalisierung der Knoten nach aufsteigender Distanz.
- **Datenstruktur:** Priority Queue (Min-Heap) für vorläufige Distanzen $d[\cdot]$.
- **Ablauf:**
    1. **Init:** $S = \emptyset$ (fertig), $d[s]=0$, sonstige $d[v]=\infty$.
    2. **Selection:** Wähle $v^* \in V \setminus S$ mit **minimalem** $d[v^*]$.
    3. **Finalisierung:** $S \leftarrow S \cup \{v^*\}$.
    4. **Relaxierung:** Für alle Nachbarn $v$ von $v^*$:
        - $d[v] \leftarrow \min(d[v], d[v^*] + c(v^*, v))$.
        - Aktualisiere Priority Queue bei Änderung.
- **Korrektheit:** Wegen $c \ge 0$ kein günstigerer "Umweg" über nicht-finalisierte Knoten ($V \setminus S$) möglich. [^thm_dijkstra]
- **Laufzeit:** $O((n + m) \log n)$ (mit Binary Heap).

## Bellman-Ford Algorithmus (Allgemeine Gewichte)

Berechnung kürzester Wege (auch bei negativen Kanten ohne negative Zyklen).

- **Problem Dijkstra:** Greedy scheitert bei negativen Kanten (lokales Optimum $\neq$ global).
- **Lösungsansatz:** Iterativ nach **Kantenanzahl**.
    - $S_{\le \ell}$: Knoten mit kürzestem Weg aus maximal $\ell$ Kanten.
    - $S_{\le 0} = \{s\}$; $S_{\le n-1} = V$ (da kreisfreie Pfade maximal $n-1$ Kanten haben).

### Algorithmus

- **Ablauf:**
    1. **Initialisierung:** $d[s] = 0$, sonstige $d[v] = \infty$.
    2. **Iteration:** Durchführung von **$n-1$ Runden**.
    3. **Relaxierung (Global):** In jeder Runde **alle Kanten** prüfen.
        - Für jede Kante $e = (u,v) \in E$:
        - **Update:** $d[v] \leftarrow \min \{ d[v], d[u] + c(u,v) \}$. [^update_bf]
- **Eigenschaften:**
    - Runde $k$: Korrekte Distanzen für Wege der Länge $\le k$.
    - Nach $n-1$ Runden: Alle kürzesten Wege gefunden. [^thm_bf_correct]
- **Laufzeit:** $O(n \cdot m)$ ($n$ Runden $\cdot$ $m$ Kanten).
    - *Vergleich:* Langsamer als Dijkstra, aber mächtiger.

### Erkennung negativer Zyklen

- **Methode:** Durchführung einer **zusätzlichen $n$-ten Iteration**.
- **Kriterium:** Verbesserung eines Wertes ($d_{neu}[v] < d_{alt}[v]$) $\implies$ erreichbarer negativer Zyklus. [^claim_neg_cycle]
- **Beweisidee:**
    - Ohne negativen Zyklus: Wege stabil nach $n-1$ Schritten.
    - Mit negativem Zyklus: Summe der Distanzen entlang Zyklus muss sinken $\to$ Widerspruch zur Stabilität.

[^def_weighted_dist]: **Distanz:** $d(u,v) := \min \{ c(W) \mid u \stackrel{W}{\leadsto} v \}$. (Handnotizen Lecture 11, S. 9)
[^ass_neg_cycle]: **Annahme:** Es gibt keine negativen Zyklen, von denen aus Knoten im Graphen erreichbar sind (sonst existiert kein kürzester Weg, Distanz wäre $-\infty$).
[^thm_dijkstra]: **Behauptung:** $d(s, v^*) = d(s, u^*) + c(u^*, v^*)$. (Dabei ist $u^* \in S, v^* \notin S$ die Kante, die $d(s, u^*) + c(u^*, v^*)$ minimiert). (Handnotizen Lecture 11, S. 14)
[^update_bf]: **Rekurrenz (Bellman-Ford Update):** $d[v] \leftarrow \min \{ d[v], \min_{u \to v} \{ d[u] + c(u,v) \} \}$. Nach Ausführung für alle $v$ entsprechen die Werte den Distanzen unter Verwendung von einem zusätzlichen Kantenschritt.
[^thm_bf_correct]: **Korrektheit Bellman-Ford:** Nach $n-1$ Iterationen der Relaxierung ("Schranken verbessern") gilt $d[v] = \text{dist}(s,v)$ für alle $v \in V$, sofern keine negativen Zyklen erreichbar sind.
[^claim_neg_cycle]: **Behauptung (Negative Zyklen):** Ein negativer Zyklus ist vom Startknoten $s$ erreichbar genau dann, wenn sich in der $n$-ten Iteration noch mindestens ein Wert $d[v]$ verbessert ($d'[v] < d[v]$).
