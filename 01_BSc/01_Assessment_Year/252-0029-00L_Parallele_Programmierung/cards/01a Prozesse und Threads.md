## Was ist ein **Prozess** im Betriebssystem und wie wird er abgegrenzt?

- Ein **laufendes OS-Programm**.
- Besitzt einen getrennten Speicherbereich (**Isolation**).
- Die OS-Trennung erfolgt durch **Memory Barriers**.
- Die Kommunikation zwischen Prozessen erfolgt via **IPC (Inter Process Communication)**.

## Was ist ein **Thread** und wie unterscheidet er sich bezüglich Speicher von einem Prozess?

- Eine **unabhängige Ausführungssequenz** innerhalb desselben Prozesses.
- Im Gegensatz zu Prozessen haben Threads **geteilten Speicher**.
- Sie nutzen einen gemeinsamen Adressraum (**Heap**).

## Welche Vor- und Nachteile haben **Threads** durch den geteilten Speicher?

- **Vorteil**: Effizienteres **Context Switching** (weniger Overhead, da kein Speicherwechsel nötig ist).
- **Nachteil/Gefahr**: Fehleranfällig bei geteilten Ressourcen (da ein gegenseitiger Schutz fehlt).

## Welche drei **Thread-Ebenen** gibt es und wie werden sie verwaltet?

- **User-Level Thread**: Verwaltung durch die Applikation oder JVM.
- **Kernel-Level Thread**: OS-Verwaltung (bei Java oft ein \\( 1:1 \\)-Mapping zu Kernel-Threads).
- **CPU-Level Thread**: Hardware-Ebene (z. B. Hyperthreading).

## Wie unterscheiden sich **Parallelität** (Parallelism) und **Nebenläufigkeit** (Concurrency)?

- **Parallelität**: **Physisch gleichzeitige** Ausführung von Aufgaben auf verschiedenen CPU-Cores.
- **Nebenläufigkeit**: Mehrere Aufgaben sind aktiv und machen **Fortschritt**, müssen aber nicht zwingend physisch gleichzeitig ausgeführt werden.

## Wie wird der **CPU-Leerlauf** bei I/O-Operationen auf Single-Core-Systemen verhindert?

- Die **I/O-Problematik** entsteht, weil die CPU beim Warten auf Peripherie (z. B. Festplatte) im Leerlauf (*idle*) ist.
- Gelöst wird dies durch **Multitasking**.
- Der **CPU Scheduler** wechselt zwischen Prozessen, um die Wartezeiten aktiv zu nutzen.

## Was passiert bei einem Prozess-**Context Switch** und warum erzeugt er grossen Overhead?

- Es erfolgt ein OS-Wechsel zwischen Prozessen.
- Der **Prozess-Kontext** muss gespeichert und geladen werden.
- Dies passiert im **PCB (Process Control Block)**, welcher Memory, CPU-Register und offene Dateien umfasst.

## In welche vier **Kategorien der Ausführung** lassen sich Systeme einteilen?

- **Sequentiell**: Weder Concurrency noch Parallelität (strikte Ausführung nacheinander).
- **Concurrent (Single Core)**: OS-Switching ist aktiv (Concurrency ja, Parallelität nein).
- **Parallel (Multi-Core, ohne Switching)**: Kontinuierliche Ausführung auf getrennten Cores.
- **Concurrent & Parallel**: Multi-Core plus OS-Switching (führt zur optimalen Auslastung).
