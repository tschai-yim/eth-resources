#import "lib.typ": *

== Differenzieren

#definition[
  *Ableitung der Umkehrfunktion*
  *Ziel:* Die Ableitung der Umkehrfunktion $f^(-1)$ an einer Stelle $y_0$ bestimmen, ohne $f^(-1)(y)$ explizit zu kennen.

  #v(0.5em)
  *Voraussetzungen:*

  - $f$ ist eine auf einem Intervall $I$ stetige und streng monotone Funktion (und damit umkehrbar).
  - $f$ ist in $x_0 in I$ differenzierbar.
  - $f'(x_0) != 0$.


  #v(0.5em)
  *Formel:*
  Sei $y_0 = f(x_0)$. Dann ist die Umkehrfunktion $f^(-1)$ an der Stelle $y_0$ differenzierbar und es gilt:

  $
    (f^(-1))'(y_0) = (1)/(f'(x_0)) = (1)/(f'(f^(-1)(y_0)))
  $

]

#definition[
  *Quotientenregel*
  *Voraussetzungen:*

  - Die Funktionen $u(x)$ und $v(x)$ sind an der Stelle $x$ differenzierbar.
  - Die Nennerfunktion $v(x) != 0$.


  #v(0.5em)
  *Formel:*

  $
    f'(x) = ((u(x))/(v(x)))' = (u'(x)v(x) - u(x)v'(x))/([v(x)]^2)
  $


]

#definition[
  *Ableitung von $x^x$*
  *Trick: Identität $a = e^(ln(a))$ nutzen*
  Jeder positive Ausdruck kann als Potenz der e-Funktion geschrieben werden.

  #v(0.5em)
  *Vorgehen am Beispiel $f(x) = x^x$:*

  - *Umschreiben:* $f(x) = x^x = e^(ln(x^x)) = e^(x dot ln(x))$
  - *Ableiten mit Ketten- und Produktregel*

]

#definition[ *Typische Ableitungen und Stammfunktionen*
  #table(
    columns: (1fr, 1fr),
    align: (left, left),
    stroke: none,
    [*Stammfunktion $F(x)$*], [*Funktion $F' = f$*],
    [$c$], [$0$],
    [$x^a$], [$a dot x^(a-1)$],
    [$a^(c x)$], [$a^(c x) dot c ln a$],
    [$x^x$], [$x^x (1 + ln x) quad x>0$],
    [$(x^x)^x$], [$(x^x)^x (x + 2x ln(x)) quad x>0$],
    [$x^((x^x))$], [$x^((x^x))(x^(x-1) + ln x dot x^x(1 + ln x))$],
    [$(1)/(a+1) x^(a+1)$], [$x^a$],
    [$(1)/(a(n+1))(a x+b)^(n+1)$], [$(a x+b)^n$],
    [$(x^(alpha+1))/(alpha+1)$], [$x^alpha, alpha != -1$],
    [$sqrt(x)$], [$(1)/(2sqrt(x))$],
    [$root(n, x)$], [$(1)/(n) x^((1)/(n)-1)$],
    [$(2)/(3)x^((3)/(2))$], [$sqrt(x)$],
    [$(n)/(n+1)x^((n+1)/(n))$], [$root(n, x)$],
    [$e^x$], [$e^x$],
    [$ln|x|$], [$(1)/(x)$],
    [$log_a|x|$], [$(1)/(x ln a) = log_a(e)(1)/(x)$],
    [$sin(x)$], [$cos(x)$],
    [$cos(x)$], [$-sin(x)$],
    [$tan(x)$], [$(1)/(cos^2(x)) = 1 + tan^2(x)$],
    [$cot(x)$], [$-(1)/(sin^2(x))$],
    [$arcsin(x)$], [$(1)/(sqrt(1-x^2))$],
    [$arccos(x)$], [$-(1)/(sqrt(1-x^2))$],
    [$arctan(x)$], [$(1)/(1+x^2)$],
  )
]

#definition[ *Typische Ableitungen und Stammfunktionen*
  #table(
    columns: (1fr, 1fr),
    align: (left, left),
    stroke: none,
    [*Stammfunktion $F(x)$*], [*Funktion $F' = f$*],
    [$sinh(x)$], [$cosh(x)$],
    [$cosh(x)$], [$sinh(x)$],
    [$tanh(x)$], [$(1)/(cosh^2(x)) = 1 - tanh^2(x)$],
    [$arsinh(x)$], [$(1)/(sqrt(1+x^2))$],
    [$arcosh(x)$], [$(1)/(sqrt(x^2-1))$],
    [$artanh(x)$], [$(1)/(1-x^2)$],
    [$(1)/(f(x))$], [$-(f'(x))/((f(x))^2)$],
    [$(1)/(a) ln|a x+b|$], [$(1)/(a x+b)$],
    [$(a x)/(c) - (a d-b c)/(c^2) ln|c x+d|$], [$(a x+b)/(c x+d)$],
    [$(1)/(2a) ln|(x-a)/(x+a)|$], [$(1)/(x^2-a^2)$],
    [$(x)/(2)f(x) + (a^2)/(2) ln(x+f(x))$], [$sqrt(a^2+x^2)$],
    [$(x)/(2)sqrt(a^2-x^2) + (a^2)/(2)arcsin((x)/(|a|))$], [$sqrt(a^2-x^2)$],
    [$(x)/(2)f(x) - (a^2)/(2) ln(x+f(x))$], [$sqrt(x^2-a^2)$],
    [$ln(x+sqrt(x^2 plus.minus a^2))$], [$(1)/(sqrt(x^2plus.minus a^2))$],
    [$arcsin((x)/(|a|))$], [$(1)/(sqrt(a^2-x^2))$],
    [$(1)/(a)arctan((x)/(a))$], [$(1)/(x^2+a^2)$],
    [$-(1)/(a)cos(a x+b)$], [$sin(a x+b)$],
    [$(1)/(a)sin(a x+b)$], [$cos(a x+b)$],
    [$-ln|cos(x)|$], [$tan(x)$],
    [$ln|sin(x)|$], [$cot(x)$],
    [$ln|tan((x)/(2))|$], [$(1)/(sin(x))$],
    [$ln|tan((x)/(2) + (pi)/(4))|$], [$(1)/(cos(x))$],
    [$(1)/(2)(x - sin(x)cos(x))$], [$sin^2(x)$],
    [$(1)/(2)(x + sin(x)cos(x))$], [$cos^2(x)$],
    [$tan(x) - x$], [$tan^2(x)$],
    [$-cot(x) - x$], [$cot^2(x)$],
    [$x arcsin(x) + sqrt(1-x^2)$], [$arcsin(x)$],
    [$x arccos(x) - sqrt(1-x^2)$], [$arccos(x)$],
  )
]

#definition[ *Typische Ableitungen und Stammfunktionen*
  #table(
    columns: (1fr, 1fr),
    align: (left, left),
    stroke: none,
    [*Stammfunktion $F(x)$*], [*Funktion $F' = f$*],
    [$x arctan(x) - (1)/(2)ln(1+x^2)$], [$arctan(x)$],
    [$ln(cosh(x))$], [$tanh(x)$],
    [$ln|f(x)|$], [$(f'(x))/(f(x))$],
    [$x(ln|x| - 1)$], [$ln|x|$],
    [$(1)/(n+1)(ln|x|)^(n+1) quad n != -1$], [$(1)/(x)(ln x)^n$],
    [$(1)/(2n)(ln x^n)^2 quad n != 0$], [$(1)/(x)ln x^n$],
    [$ln|ln|x|| quad x>0, x != 1$], [$(1)/(x ln x)$],
    [$(1)/(b ln a) a^(b x)$], [$a^(b x)$],
    [$(c x-1)/(c^2) e^(c x)$], [$x e^(c x)$],
    [$(x^(n+1))/(n+1)(ln x - (1)/(n+1)) quad n != -1$], [$x^n ln x$],
    [$(e^(c x))/(a^2+c^2)(c sin(a x+b) - a cos(a x+b))$], [$e^(c x) sin(a x+b)$],
    [$(e^(c x))/(a^2+c^2)(c cos(a x+b) + a sin(a x+b))$], [$e^(c x) cos(a x+b)$],
    [$(sin^2(x))/(2)$], [$sin(x)cos(x)$],
  )
]

#definition[
  *Taylor-Approximation*
  Ziel: Eine Funktion $f(x)$ in der Nähe eines Punktes $x = a$ durch ein Polynom („Taylorpolynom“) annähern.

  Nützlich wenn: Die Funktion ist schwer zu berechnen, aber man kennt Ableitungen an einer Stelle $a$ – z. B. zur Näherung oder zur Vereinfachung. \
  *Grundidee:*
  Ersetze $f(x)$ in der Nähe von $x = a$ durch ein Polynom:
  $f(x) approx T_n(x) = f(a) + f'(a)(x - a) + (f''(a))/(2!)(x - a)^2 + dots + (f^((n))(a))/(n!)(x - a)^n$


  - *Wähle den Entwicklungspunkt $a$* Meist $a = 0$ (→ *Maclaurin-Polynom*), sonst beliebig.
  - *Berechne die Ableitungen $f'(x)$, $f''(x)$, … bis zur $n$-ten Ordnung*
  - *Setze $x = a$ in jede Ableitung ein* → ergibt die Werte $f(a)$, $f'(a)$, $f''(a)$, …, $f^((n))(a)$
  - *Baue das Taylorpolynom $T_n(x)$ mit diesen Werten auf* $T_n(x) = sum_(k=0)^n (f^((k))(a))/(k!) (x - a)^k$
  - *Optional:* Gib den Approximationsfehler $R_n(x)$ an (Restglied). Für analytische Funktionen gilt:  $ f(x) = T_n(x) + R_n(x), quad "mit " R_n(x) = (f^((n+1))(xi))/((n+1)!)(x - a)^(n+1)
    quad "für ein " xi in (a, x) $


]

