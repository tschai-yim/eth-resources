#import "lib.typ": *

== Allgemeines

#definition[
  *Mitternachtsformel*
  *Formel:*
  $x_(1,2) = (-b plus.minus sqrt(b^2 - 4 a c)) / (2 a)$

  #v(0.5em)
  *Diskriminante $D = b^2 - 4 a c$:*

  - $D > 0$: Zwei verschiedene reelle Lösungen.
  - $D = 0$: Genau eine reelle Lösung (doppelte Nullstelle).
  - $D < 0$: Keine reelle Lösung (zwei konjugiert komplexe Lösungen).

]

#definition[

  *Induktion*

  To prove: ...

  Base Case: n = 1, ...

  Induction Hypothesis: Assume the property holds for some k (add condition, e.g. $k >= 1$), that is ... (statement to prove, but with $k$ instead of $n$)

  Induction Step: $k -> k + 1$

  $... = ...$ \
  $dots =^"IH" dots$ (mark where the induction hypothesis is applied)

  Thus, the statement is proven by the principle of mathematical induction for every $k$ ... (add contition)
]

#definition[
  *Polynomdivision*
  Ziel: Ein Polynom $P(x)$ durch ein anderes Polynom $D(x)$ teilen, z. B. um $P(x)$ zu faktorisieren oder Nullstellen zu finden.

  Nützlich wenn:
  Man kennt eine Nullstelle $x = a$ von $P(x)$, also $P(a) = 0$, und will $P(x)$ durch $(x - a)$ teilen.
  Oder allgemein: Man möchte ein Polynom in einfachere Faktoren zerlegen. \
  *Grundidee:*
  Man führt eine schriftliche Division ähnlich wie bei Zahlen durch:
  $P(x) = D(x) dot Q(x) + R(x)$

  Dabei ist:

  - $P(x)$ das zu teilende Polynom („Dividend“)
  - $D(x)$ das Polynom, durch das geteilt wird („Divisor“)
  - $Q(x)$ das Ergebnis der Division („Quotient“)
  - $R(x)$ der Rest der Division


  Wenn der Rest $R(x) = 0$ ist, dann ist $D(x)$ ein Teiler von $P(x)$.


  - *Polynome sortieren:*
  Beide Polynome in absteigender Potenz von $x$ schreiben. Fehlende Terme durch $0x^k$ ergänzen.
  - *Ersten Quotient-Term finden:*
  Höchsten Term des Dividenden durch höchsten Term des Divisors teilen → erster Term von $Q(x)$
  - *Zurückmultiplizieren und subtrahieren:*
  Ergebnis mit Divisor multiplizieren und vom Dividend abziehen → ergibt neuen Rest
  - *Wiederholen:*
  Mit neuem Rest weiterrechnen, bis Grad(Rest) $<$ Grad(Divisor)
  - *Endergebnis:*
  $
    P(x) = D(x) dot Q(x) + R(x)
  $


  *Hinweis:*
  Wenn $P(x)$ durch $(x - a)$ ohne Rest teilbar ist, dann ist $x = a$ eine Nullstelle von $P(x)$, und $Q(x)$ ist das reduzierte Polynom. Durch wiederholte Polynomdivision lassen sich so alle Nullstellen finden.
]

#definition[
  *Typische trigonometrische Werte*
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: center + horizon,
    stroke: none,
    fill: (x, y) => if y == 0 { rgb("f0f0f0") } else { none },
    [*Gradmass*], [*Bogenmass*], [$sin(x)$], [$cos(x)$], [$tan(x)$],
    [$0°$], [$0$], [$0$], [$1$], [$0$],
    [$30°$], [$(pi)/(6)$], [$(1)/(2)$], [$(sqrt(3))/(2)$], [$(1)/(sqrt(3))$],
    [$45°$], [$(pi)/(4)$], [$(sqrt(2))/(2)$], [$(sqrt(2))/(2)$], [$1$],
    [$60°$], [$(pi)/(3)$], [$(sqrt(3))/(2)$], [$(1)/(2)$], [$sqrt(3)$],
    [$90°$], [$(pi)/(2)$], [$1$], [$0$], [n. def.],
    [$180°$], [$pi$], [$0$], [$-1$], [$0$],
    [$270°$], [$(3pi)/(2)$], [$-1$], [$0$], [n. def.],
    [$360°$], [$2pi$], [$0$], [$1$], [$0$],
  )
]

#definition[
  *Bekannte Taylorreihen*
  Wichtige Entwicklungen um den Punkt $x_0 = 0$ (Maclaurin-Reihen).

  - $e^x = 1 + x + (x^2)/(2) + (x^3)/(3!) + (x^4)/(4!) + O(x^5)$
  - $sin(x) = x - (x^3)/(3!) + (x^5)/(5!) + O(x^7)$
  - $sinh(x) = x + (x^3)/(3!) + (x^5)/(5!) + O(x^7)$
  - $cos(x) = 1 - (x^2)/(2) + (x^4)/(4!) - (x^6)/(6!) + O(x^8)$
  - $cosh(x) = 1 + (x^2)/(2) + (x^4)/(4!) + (x^6)/(6!) + O(x^8)$
  - $tan(x) = x + (x^3)/(3) + (2x^5)/(15) + O(x^7)$
  - $tanh(x) = x - (x^3)/(3) + (2x^5)/(15) + O(x^7)$
  - $ln(1+x) = x - (x^2)/(2) + (x^3)/(3) - (x^4)/(4) + O(x^5)$
  - $(1+x)^alpha = 1 + alpha x + (alpha(alpha-1))/(2) x^2 + (alpha(alpha-1)(alpha-2))/(3!) x^3 + O(x^4)$
  - $sqrt(1+x) = 1 + (x)/(2) - (x^2)/(8) + (x^3)/(16) + O(x^4)$

]

