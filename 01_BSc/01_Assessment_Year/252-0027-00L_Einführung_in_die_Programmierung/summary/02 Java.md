## Ausdrücke und Operatoren

- Ein **Ausdruck (`expression`)** ist eine Kombination aus Werten, Variablen und Operatoren, die zu einem einzigen Wert ausgewertet wird.
- **Arithmetische Operatoren**:
    - `+` (Addition), `-` (Subtraktion), `*` (Multiplikation).
    - **`/` (Division)**: Bei ganzen Zahlen (`int`) wird das Ergebnis abgeschnitten (z.B. `5 / 2` ergibt `2`).
    - **`%` (Modulo)**: Gibt den Rest einer Ganzzahldivision zurück (z.B. `5 % 2` ergibt `1`).
- **Regeln für die Auswertung**:
    - **Präzedenz (Rangordnung)**: Bestimmt, welche Operatoren zuerst ausgeführt werden. "Punkt vor Strich" (`*`, `/`, `%` vor `+`, `-`, `&&` vor `||`).
    - **Assoziativität**: Bestimmt die Reihenfolge bei Operatoren mit gleicher Präzedenz. Die meisten arithmetischen Operatoren sind **linksassoziativ** (Auswertung von links nach rechts, z.B. `10 - 5 - 2` ist `(10 - 5) - 2`).
    - Klammern `()` können verwendet werden, um die Auswertungsreihenfolge explizit festzulegen.
- **Typumwandlung (`Type Cast`)**:
    - **Implizit**: Bei gemischten Ausdrücken wird der "kleinere" Typ automatisch in den "grösseren" umgewandelt (z.B. `int` zu `double`). `4.0 / 2` ergibt `2.0`.
    - **Explizit**: Manuelle Umwandlung mit dem **Cast-Operator** `(type)`. Z.B. `(double) 19 / 5` ergibt `3.8`.
