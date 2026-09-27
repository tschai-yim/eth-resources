## Problemstellung & Modell

- **Szenario**: Lineare Suche in einer Liste. Die Daten selbst ändern sich nicht, aber die **Struktur** passt sich an, um effiziente Zugriffe zu ermöglichen.
- **Input**: Eine Anfragefolge $Q = q_1, \dots, q_n$.
- **Kostenmodell**: Zugriff auf das Element an Position $i$ kostet $i$.
- **Ziel**: Minimierung der Gesamtkosten für die gesamte Anfragefolge.

## Algorithmen im Vergleich

### Statisch Optimaler Algorithmus (Static Optimal)

- **Strategie**: Sortiert die Liste absteigend nach den absoluten Zugriffshäufigkeiten ($f_i$) der Elemente.
- **Kosten**: $\sum i \cdot f_i$.
- **Nachteil**: Erfordert **Hellsicht** (Clairvoyance) – das Wissen über die zukünftige Verteilung der Anfragen, was in der Praxis oft unrealistisch ist.

### Move-to-Front Heuristik (MtF)

- **Typ**: **Online-Algorithmus** (kein Wissen über die Zukunft nötig).
- **Funktionsweise**:
    1. Element an Position $i$ wird gesucht (Kosten $i$).
    2. Das gefundene Element wird an die **erste Stelle** (Listenanfang) verschoben.
    3. Alle Elemente davor rücken eine Position nach hinten.
- **Vorteil**: Passt sich dynamisch an lokale Häufungen in der Anfragefolge an (Temporal Locality).

## Analyse (Competitive Analysis)

- **Vergleich**: Man vergleicht die Kosten des Online-Algorithmus ($C_{MtF}$) mit denen des optimalen statischen Algorithmus ($C_{Opt}$).
- **Resultat**: MtF ist **2-kompetitiv** gegenüber dem statischen Optimum .[^lecture13_mtf_theorem]
    - Die Kosten sind höchstens doppelt so hoch (plus ein vernachlässigbarer additiver Term).
- **Beweisskizze (Paarweise Kosten)**:
    - Betrachtet die Kosten $C_{ij}$: Wie oft muss Element $i$ übersprungen werden, wenn $j$ gesucht wird?
    - **Beobachtung**: Zwischen zwei Zugriffen auf $j$ kann $i$ nur **einmal** "im Weg" liegen (vor $j$ stehen).
    - Sobald $i$ "im Weg" lag und übersprungen wurde, ändert sich die relative Ordnung nicht, es sei denn, $i$ wird selbst angefragt (und wandert dann an die Spitze, ist also nicht mehr im Weg).
    - Daraus folgt die Schranke $\le 2 \cdot \text{Optimale Kosten}$.

[^lecture13_mtf_theorem]: **Theorem (Move-to-Front Competitiveness):** Die Kosten von Move-to-Front sind höchstens **doppelt so hoch** wie die des optimalen statischen Algorithmus (plus vernachlässigbarer additiver Term). $C_{MtF} \le 2 \cdot C_{opt} + \text{Konstante}$.
