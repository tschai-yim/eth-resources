#import "lib.typ": *

= HOW TO

== Grenzwerte

#definition[
  *Trick für Grenzwert $x -> 0$*
  Taylor-Entwicklung um x = 0. $f(x) = dots + O(x^(dots))$.
]

#definition[
  *Grenzwert-Tricks*
  Ansätze für unbestimmte Ausdrücke wie $(0)/(0)$, $(infinity)/(infinity)$, $infinity - infinity$, $1^infinity$, etc.


  - *Höchste Potenz ausklammern:* Der Standardansatz für rationale Funktionen (Brüche von Polynomen) bei $x -> infinity$. Klammere die höchste Potenz von $x$ in Zähler und Nenner aus und kürze anschließend. \
  $lim_(x -> infinity) (3x^2 + 1)/(5x^2 - x) = lim_(x -> infinity) (x^2(3 + (1)/(x^2)))/(x^2(5 - (1)/(x))) = (3)/(5)$

  - *Mit Konjugiertem erweitern:* Sehr nützlich bei Ausdrücken mit Wurzeln, die oft zu $infinity - infinity$ führen. Multipliziere und dividiere mit dem konjugierten Ausdruck, um die 3. binomische Formel $(a-b)(a+b)=a^2-b^2$ anzuwenden. \
  $lim_(x -> infinity) (sqrt(x^2+x) - x) = lim_(x -> infinity) ((sqrt(x^2+x) - x)(sqrt(x^2+x) + x))/(sqrt(x^2+x) + x) = lim_(x -> infinity) (x^2+x-x^2)/(sqrt(x^2+x) + x) = (1)/(2)$

  - *Trick mit der e-Funktion:* Der Standardansatz für Grenzwerte vom Typ $1^infinity$, $0^0$ oder $infinity^0$. Nutze die Identität $f(x)^(g(x)) = e^(g(x) ln(f(x)))$ und berechne dann den Grenzwert des Exponenten.

  - *Einschließungssatz (Sandwich-Theorem):* Ideal, wenn eine Funktion von zwei anderen Funktionen eingeklemmt wird, die gegen denselben Grenzwert streben. Wenn $g(x) <= f(x) <= h(x)$ gilt und $lim g(x) = lim h(x) = L$, dann folgt $lim f(x) = L$. Oft bei oszillierenden Funktionen wie $sin((1)/(x))$ verwendet.

  - *Bekannte Grenzwerte nutzen:* Manchmal kann ein komplexer Grenzwert auf einen bekannten zurückgeführt werden, z.B. $lim_(x -> 0) (sin(x))/(x) = 1$.

  - *L'Hospital \& Taylor-Entwicklung:* Für kompliziertere Fälle, siehe die entsprechenden Boxen.

]

#definition[
  *Wichtige Grenzwerte*
  #table(
    columns: (1fr, 1fr),
    align: left + horizon,
    stroke: none,
    [$lim_(x->infinity) (1)/(x) = 0$], [$lim_(x->infinity) 1 + (1)/(x) = 1$],
    [$lim_(x->infinity) e^x = infinity$], [$lim_(x->-infinity) e^x = 0$],
    [$lim_(x->infinity) e^(-x) = 0$], [$lim_(x->-infinity) e^(-x) = infinity$],
    [$lim_(x->infinity) (e^x)/(x^m) = infinity$], [$lim_(x->-infinity) x e^x = 0$],
    [$lim_(x->infinity) ln(x) = infinity$], [$lim_(x-> 0) ln(x) = -infinity$],
    [$lim_(x->infinity) (1+x)^((1)/(x)) = 1$], [$lim_(x-> 0) (1+x)^((1)/(x)) = e$],
    [$lim_(x->infinity) (1 + (1)/(x))^b = 1$], [],
    [$lim_(x->infinity) x^a q^x = 0, forall 0 <= q < 1$], [$lim_(n->infinity) n^((1)/(n)) = 1$],
    [$lim_(x-> plus.minus infinity) (1 + (1)/(x))^x = e$], [$lim_(x->infinity) (1 - (1)/(x))^x = (1)/(e)$],
    [$lim_(x-> plus.minus infinity) (1 + (k)/(x))^(m x) = e^(k m)$], [$lim_(x-> 0) (sin x)/(x) = 1$],
    [$lim_(x-> 0) (1)/(cos(x)) = 1$], [$lim_(x-> 0) (cos x - 1)/(x) = 0$],
    [$lim_(x-> 0) (ln(1-x))/(x) = -1$], [$lim_(x-> 0^+) x log x = 0$],
    [$lim_(x-> 0) (1-cos x)/(x^2) = (1)/(2)$], [$lim_(x-> 0) (e^x-1)/(x) = 1$],
    [$lim_(x-> 0) (x)/(arctan x) = 1$], [$lim_(x->infinity) arctan x = (pi)/(2)$],
    [$lim_(x->infinity) ((x)/(x+k))^x = e^(-k)$], [$lim_(x-> 0) (e^x-1)/(x) = 1$],
    [$lim_(x-> 0) (a^x-1)/(x) = ln(a) forall a > 0$], [$lim_(x-> 0) (e^(a x)-1)/(x) = a$],
    [$lim_(x-> 0) (ln(x+1))/(x) = 1$], [$lim_(x-> 1) (ln(x))/(x-1) = 1$],
    [$lim_(x->infinity) (ln(x))/(x) = 0$], [$lim_(x->infinity) (log(x))/(x^a) = 0$],
    [$lim_(x->infinity) root(x, x) = 1$], [$lim_(x->infinity) (2x)/(2^x) = 0$],
    [$lim_(x-> pi/2^-) tan x = +infinity$], [$lim_(x-> pi/2^+) tan x = -infinity$],
    [$lim_(x->infinity) (sin x)/(x) = 0$], [$lim_(x-> 0^+) x ln x = 0$],
  )
]

