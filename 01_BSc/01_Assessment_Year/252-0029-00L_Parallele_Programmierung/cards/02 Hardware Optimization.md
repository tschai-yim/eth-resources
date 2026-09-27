## Welches Ziel verfolgt die **Code-Effizienz** im Kontext der Hardware?

- Optimale **Hardware-Auslastung**
- Gilt auch für **Single Core**-Systeme

## Warum hat ein Programmierer **keine direkte Kontrolle** über Hardware-Optimierungen (wie Pipelining oder Caching)?

- Sie sind **nicht manuell erzwingbar**
- Die Mechanismen laufen automatisch **CPU-intern** ab

## Wie kann man Hardware-Optimierungen der CPU als Programmierer dennoch begünstigen?

- Durch die **Code-Struktur** (Design-Verantwortung)
- **Beispiele**:
    - Simple Loops
    - Günstige Datenstrukturen

## Was besagte **Moore's Law** bezüglich der Leistungssteigerung bis in die frühen 2000er Jahre?

- Kleinere Transistoren \\(\rightarrow\\) **mehr Transistoren**
- Ermöglichte höhere **Taktfrequenzen**
- **Resultat**: Sequenzielle Programme wurden automatisch schneller

## Welche drei architektonischen Grenzen (**Walls**) beendeten die Ära der automatischen sequenziellen Beschleunigung?

- **Power / Heat Wall**
- **ILP Wall**
- **Memory Wall**

## Was versteht man unter der **Power / Heat Wall** bei CPUs?

- Zu hoher **Energieverbrauch**
- Daraus resultierende **Überhitzung** des Chips

## Was versteht man unter der **ILP Wall** (Instruction Level Parallelism)?

- Die Grenzen bei der **automatischen Extraktion** von Parallelität aus sequenziellem Code

## Was versteht man unter der **Memory Wall**?

- Die **CPU-Geschwindigkeit** überholte die **Hauptspeicher-Zugriffszeit** massiv
- Speicherzugriffe wurden zum Flaschenhals

## Was kennzeichnet die Architektur der **Multi-Core Ära** (Post-2003)?

- Leistungssteigerung durch mehrere Kerne (**Multi-Core Architectures**)
- **Independent Execution**: Unabhängige Cores besitzen jeweils einen eigenen **Instruction Stream**

## Welche zwingende Konsequenz hat die **Multi-Core Ära** für die Softwareentwicklung?

- Sequenzieller Code profitiert nicht mehr automatisch
- **Manuelle Parallelisierung** (mittels Threads/Tasks) ist zwingend nötig

## Was sind **CPU Caches** und wie sind sie hierarchisch aufgebaut?

- Schnelle, kleine **Zwischenspeicher**
- Speichern partielle **Kopien des Speichers**
- Hierarchie: **L1, L2, L3** (L1 ist z.B. 5x schneller als L2, L2 30x schneller als Hauptspeicher)

## Welches Latenz-Problem der **Von Neumann Architektur** lösen CPU Caches?

- **Problem**: Code und Daten liegen im selben, langsamen Speicher
- Langsame Zugriffe erzeugen **Stalls** (CPU-Leerlauf)
- **Lösung**: Caches überbrücken diese Wartezeiten

## Wie funktioniert der Datenzugriff bei einem **Cache Hit** und einem **Cache Miss**?

- **Cache Hit**: Angefragte Daten werden direkt im Cache gefunden
- **Cache Miss**: Daten fehlen \\(\rightarrow\\) Ein ganzer Datenblock (**Cache Line**) wird in den Cache geladen

## Was beschreibt das Konzept der **Data Locality** (Datenlokalität)?

- Die **räumliche** oder **zeitliche Nähe** von Datenzugriffen
- **Regel**: Die Datenstruktur diktiert die Caching-Effizienz

## Wie beeinflusst der **Stride** (Schrittweite) im Code die Caching-Effizienz?

- **Stride = 1** (sequenziell): Viele Cache Hits \\(\rightarrow\\) maximale Performance
- **Stride > 1** (grosse Sprünge): Ständige Cache Misses \\(\rightarrow\\) massive Laufzeiteinbussen

## Welche Auswirkung hat die Multi-Core Synchronisation (z.B. Java `synchronized`) auf die CPU Caches?

- Hardware/OS gleicht die Caches untereinander ab
- Erzwingt einen **Cache-Flush** (Rückschreiben) in den Hauptspeicher

## Wofür steht **SIMD** in der Hardware-Architektur?

- **Single Instruction, Multiple Data** (Vectorization)

## Wie funktioniert der Hardware-Mechanismus hinter **SIMD** (Vectorization)?

- Eine einzelne Instruktion wird dekodiert
- Auf **mehrere Execution Units (ALUs)** verteilt
- **Parallel berechnet** (z.B. Vektor-Addition)

## Wie werden **Vector Instructions** (z.B. `movdqa`, `paddd`) auf Code-Ebene erzeugt?

- Durch **automatische Compiler-Übersetzung** von einfachen Loops

## Welche Einschränkung besitzt die **Vectorization** (SIMD)?

- Sie ist rein **opportunistisch**
- Bricht bei **komplexer Logik** (z.B. `if` innerhalb eines Loops) ab
- Code muss zwingend simpel gehalten werden

## Was ist das Konzept von **Instruction Level Parallelism (ILP)**?

- Die CPU extrahiert **unabhängige Instruktionen** aus dem Instruction Stream, um sie parallel auszuführen

## Welche vier Mechanismen nutzt die CPU für den **Instruction Level Parallelism (ILP)**?

- **Superscalar Execution**
- **Instruction Prefetching**
- **Speculative Execution**
- **Reordering**

## Was ist die **Superscalar Execution** im Kontext von ILP?

- Die Zuteilung von Instruktionen auf **mehrere ALUs** im **selben Taktzyklus**

## Was ist **Instruction Prefetching** im Kontext von ILP?

- Das **vorausschauende Laden** von Instruktionen in den Cache

## Was ist **Speculative Execution** im Kontext von ILP?

- Das **verdachtsbasiert Ausführen** von Bedingungs-Zweigen (z.B. `if`/`else`), bevor die Bedingung final ausgewertet ist

## Was ist **Reordering** im Kontext von ILP?

- Das **Umordnen der Ausführungsreihenfolge** von Instruktionen durch den Compiler oder die CPU

## Welche Gefahr birgt das **Reordering** in einer Multithreading-Umgebung?

- Es zerstört die **logische Korrektheit** bei geteilten Ressourcen
- **Beispiel**: Ein "Done"-Flag wird umgeordnet und vor dem eigentlichen Resultat auf `true` gesetzt

## Wie verhindert man Fehler durch **Reordering** in nebenläufigem Code?

- **Zugriffsschutz** via **Synchronisation** ist zwingend erforderlich (z.B. `synchronized`)

## Was ist das Grundkonzept von **Pipelining**?

- Die **fliessbandartige Verarbeitung** von CPU-Instruktionen

## Aus welchen 5 Stufen (**Pipeline-Stages**) besteht das Pipelining klassischerweise?

1. **Instruction Fetch**: Instruktion laden
2. **Instruction Decode**: Bit-Sequenz übersetzen & verteilen
3. **Execution**: Berechnung auf ALUs
4. **Memory Access**: Speicher lesen/schreiben
5. **Writeback**: Resultate in Register speichern

## Wie definieren sich die Metriken **Throughput** (Durchsatz) und **Latency** (Latenz) beim Pipelining?

- **Throughput**: Abgeschlossene Instruktionen pro Zeit (höher = besser)
- **Latency**: Dauer einer einzelnen Instruktion (tiefer = besser)

## Was unterscheidet eine **Balanced Pipeline** von einer **Unbalanced Pipeline**?

- **Balanced Pipeline**: Alle Stufen sind gleich lang \\(\rightarrow\\) **konstante Latenz**
- **Unbalanced Pipeline**: Langsame Stufen erzeugen Rückstaus (**Stalls**) \\(\rightarrow\\) Latenz wächst unendlich

## Wie wird das Problem von Stalls in einer **Unbalanced Pipeline** gelöst?

- Durch die **Aufteilung langsamer Stufen** in feingranulare Sub-Stufen

## Welchen **Trade-off** (Kompromiss) geht man beim Pipelining ein?

- Pipelining maximiert den **Throughput**
- Erhöht aber gleichzeitig die **Latency** eines einzelnen Durchlaufs (bedingt durch den ständigen Übergabe-Overhead zwischen den Stufen)
