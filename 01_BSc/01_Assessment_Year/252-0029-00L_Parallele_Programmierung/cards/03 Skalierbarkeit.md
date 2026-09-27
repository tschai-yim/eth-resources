## Was ist das **Ziel** von Parallelität und welche **zentrale Regel** gilt für die Effizienz?

- **Ziel**: Beschleunigungs-Gewinn (z.B. Echtzeit-Rendering mit \\( 30 \\) FPS)
- **Zentrale Regel**: **Schnell \\( \neq \\) Effizient**
- Ein schnellerer Lauf durch mehr Kerne garantiert keine effiziente Hardware-Nutzung

## Warum begrenzen der **sequenzielle Programmteil** und **Datenstrukturen** die Skalierbarkeit?

- **Sequenzieller Programmteil (Amdahl's Law)**: Minimale Anteile (z.B. \\( 1\% \\)) dominieren bei vielen Kernen und zerstören die Skalierbarkeit
- **Datenstrukturen und Algorithmen**: Falsche Strukturen (z.B. Linked Lists) erzwingen eine Sequenzialisierung
    - Parallele Strukturen (z.B. Bäume) sind zwingend nötig

## Wie behindern **Work Distribution** und **Work Scheduling** die Skalierbarkeit?

- **Work Distribution (Granularität)**: Zu grobe Tasks erzeugen eine **Load Imbalance**
    - Ein Kern arbeitet, während andere im Leerlauf sind
- **Work Scheduling**: Das manuelle Zuweisen von Tasks an Prozessoren erzeugt massiven Overhead

## Wie behindern **Overhead** und **Memory Access** die Skalierbarkeit?

- **Overhead und Barrieren**: Context Switches und Lock-Konflikte (**Contention**) um geteilte Ressourcen vernichten Parallelität
- **Memory Access**: Der geteilte Speicherzugriff aller Kerne macht die **Memory Bandwidth** (Speicherbandbreite) zum Flaschenhals

## Wie ist die Metrik **\\( T_1 \\)** (Sequential Execution Time) definiert und was ist die **korrekte Baseline**?

- **Definition**: Laufzeit auf einem Single-Core
- **Korrekte Baseline**: Zwingend ein **optimiertes sequenzielles Programm** (für einen fairen Vergleich)
- Künstlich schlechte Baselines (z.B. ein serialisierter Parallel-Algorithmus) verfälschen den errechneten Speedup nach oben

## Wie berechnet man den **Speedup** (\\( S_p \\)) in der parallelen Ausführung?

- Er beschreibt den Beschleunigungsfaktor des Systems
- **Formel**: \\( S_p = \frac{T_1}{T_p} \\)
- \\( T_p \\) ist dabei die Laufzeit auf \\( p \\) Prozessoren (Parallel Execution Time)

## Welche **drei Arten von Speedup** gibt es in der parallelen Ausführung?

- **Linearer Speedup** (\\( S_p = p \\)): Perfekte Skalierung (in der Realität extrem selten)
- **Sub-linearer Speedup** (\\( S_p < p \\)): Der Normalfall (Performance-Verlust durch Overhead)
- **Super-linearer Speedup** (\\( S_p > p \\)): Sehr selten, entsteht oft durch vorteilhafte Cache-Effekte

## Wie ist die **Efficiency** (\\( E \\)) definiert und wie verhält sie sich bei Skalierung?

- Definiert den Hardware-Auslastungsgrad
- **Formel**: \\( E = \frac{S_p}{p} \\)
- Die Effizienz **sinkt drastisch** bei mehr Hardware/Kernen (Praxis-Zielwert: \\( > 50\% \\))
- *Beispiel*:
    - \\( T_1 = 10 \\)s (\\( 20\% \\) seq., \\( 80\% \\) par.)
    - Auf \\( 8 \\) Kernen: seq. bleibt \\( 2 \\)s, par. sinkt auf \\( 1 \\)s \\( \rightarrow T_8 = 3 \\)s
    - Resultat: Speedup \\( S_8 = 3.33 \\rightarrow E \approx 40\% \\)

## Worauf fokussiert **Amdahl's Law** und was ist seine **Kernaussage**?

- **Fokus**: Die Problemgrösse (Arbeitsmenge) bleibt **konstant** (Ziel: reine Zeitersparnis)
- **Kernaussage**: Der maximale Speedup wird durch den **nicht-parallelisierbaren (sequenziellen) Anteil** (\\( f \\)) limitiert
- Betrachtet die Skalierbarkeit aus einer **pessimistischen Sicht**

## Wie lautet die **Formel** für **Amdahl's Law** und wo liegt die **Obergrenze** (\\( p \to \infty \\))?

- **Formel**: \\( S_p \le \frac{1}{f + \frac{1-f}{p}} \\)
    - \\( f \\): Sequenzieller Anteil (z.B. \\( 0.2 \\) für \\( 20\% \\))
    - \\( p \\): Anzahl Prozessoren
- **Limitierung (\\( p \to \infty \\))**: Der parallele Rechenteil geht gegen Null
- **Obergrenze**: \\( S_\infty \le \frac{1}{f} \\) (Die Reduktion des sequenziellen Codes ist daher extrem wertvoll)

## Worauf fokussiert **Gustafson's Law** und was ist seine **Kernaussage**?

- **Fokus**: Die Laufzeit (Zeitfenster) bleibt **konstant** (z.B. fix \\( 0.033 \\)s pro Frame)
- **Kernaussage**: Mehr Prozessoren lösen ein **grösseres Problem** in der gleichen Zeit (z.B. bessere Grafik-Effekte statt mehr FPS)
- Betrachtet Skalierbarkeit aus einer **optimistischen Sicht**

## Wie lautet die **Formel** für **Gustafson's Law** und wie skaliert der Speedup?

- **Formel**: \\( S_p = p - f(p - 1) \\)
- Der parallele Programmteil skaliert **linear** mit der Problemgrösse
- Der Speedup wächst dadurch annähernd linear mit der Prozessoren-Anzahl \\( p \\)
