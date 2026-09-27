## Grundlagen der Skalierbarkeit

- **Ziel von Parallelität**: Beschleunigungs-Gewinn (z.B. Echtzeit-Rendering mit $30$ FPS).
- **Zentrale Regel**: **Schnell $\neq$ Effizient**. Schnellerer Lauf durch mehr Kerne garantiert keine effiziente Hardware-Nutzung.
- **Skalierungs-Grenzen** (Verhindern linearen Speedup):
    - **Sequenzieller Programmteil (Amdahl's Law)**: Minimale Anteile (z.B. $1\%$) dominieren bei vielen Kernen $\rightarrow$ zerstören Skalierbarkeit.
    - **Datenstrukturen und Algorithmen**: Falsche Strukturen (z.B. Linked Lists) erzwingen Sequenzialisierung. Parallele Strukturen (z.B. Bäume) zwingend nötig.
    - **Work Distribution (Granularität)**: Zu grobe Tasks erzeugen **Load Imbalance** (ein Kern arbeitet, andere im Leerlauf).
    - **Work Scheduling**: Manuelles Task-Zuweisen erzeugt massiven Overhead.
    - **Overhead und Barrieren**: Context Switches und Lock-Konflikte (**Contention**) um geteilte Ressourcen vernichten Parallelität.
    - **Memory Access**: Geteilter Speicherzugriff aller Kerne macht **Memory Bandwidth** (Speicherbandbreite) zum Flaschenhals.

## Metriken der parallelen Ausführung

- **$T_1$ (Sequential Execution Time)**: Laufzeit auf Single-Core.
    - **Korrekte Baseline**: Zwingend **optimiertes sequenzielles Programm** (fairer Vergleich).
    - Künstlich schlechte Baselines (z.B. serialisierter Parallel-Algorithmus) verfälschen Speedup nach oben.
- **$T_p$ (Parallel Execution Time)**: Laufzeit auf $p$ Prozessoren.
- **Speedup ($S_p$)**: Beschleunigungsfaktor ($S_p = T_1 / T_p$).
    - **Linearer Speedup** ($S_p = p$): Perfekte Skalierung (Realität: extrem selten).
    - **Sub-linearer Speedup** ($S_p < p$): Normalfall (Performance-Verlust durch Overhead).
    - **Super-linearer Speedup** ($S_p > p$): Selten ("Hexerei"), oft durch vorteilhafte Cache-Effekte.
- **Efficiency ($E$)**: Hardware-Auslastungsgrad ($E = S_p / p$).
    - Effizienz **sinkt drastisch** bei mehr Hardware.
    - *Beispiel*: $T_1 = 10$s ($20\%$ seq., $80\%$ par.). Auf $8$ Kernen: seq. bleibt $2$s, par. skaliert auf $1$s $\rightarrow T_8 = 3$s. Speedup $S_8 = 3.33$. Effizienz $E \approx 40\%$.
    - Praxis-Zielwert: $> 50\%$.

## Amdahl's Law (Pessimistische Sicht)

- **Fokus**: Problemgrösse (Arbeitsmenge) bleibt **konstant** $\rightarrow$ Ziel: reine Zeitersparnis.
- **Kernaussage**: Maximaler Speedup limitiert durch **nicht-parallelisierbaren (sequenziellen) Anteil** ($f$).
- **Formel**: $S_p \leq \frac{1}{f + \frac{1-f}{p}}$
    - $f$: Sequenzieller Anteil (z.B. $0.2$ für $20\%$).
    - $1-f$: Parallelisierbarer Anteil.
    - $p$: Anzahl Prozessoren.
- **Limitierung ($p \to \infty$)**: Paralleler Rechenteil geht gegen Null. Obergrenze des Speedups: $S_\infty \leq \frac{1}{f}$.
- **Fazit**: Reduktion des sequenziellen Codes extrem wertvoll (definiert maximal möglichen Speedup).

<img src="media/03_Amdahl's_Law.png" alt="03 Amdahl's Law" width="600">

## Gustafson's Law (Optimistische Sicht)

- **Fokus**: Laufzeit (Zeitfenster) bleibt **konstant** (z.B. fix $0.033$s pro Frame).
- **Kernaussage**: Mehr Prozessoren lösen **grösseres Problem** in gleicher Zeit (z.B. bessere Grafik-Effekte statt mehr FPS).
- Paralleler Programmteil skaliert linear mit der Problemgrösse.
- **Formel**: $S_p = p - f(p - 1)$
- **Fazit**: Speedup wächst annähernd linear mit Prozessoren-Anzahl $p$ (entspricht HPC-Praxis und Marketing-Versprechen).

<img src="media/03_Gustafson's_Law.png" alt="03 Gustafson's Law" width="600">
