= 12 Useful Formulas

== Trigonometry

#[
  #set math.frac(style: "horizontal")
  #table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
    inset: 2pt,
    align: center,
    stroke: none,
    [*Deg*], [$360 degree$ / $0degree$], [$30degree$], [$45degree$], [$60degree$], [$90degree$],
    [*Rad*], [$2pi$ / $0$], [$pi"/"6$], [$pi/4$], [$pi/3$], [$pi/2$],
    [*sin*], [$0$], [$1/2$], [$sqrt(2)/2$], [$sqrt(3)/2$], [$1$],
    [*cos*], [$1$], [$sqrt(3)/2$], [$sqrt(2)/2$], [$1/2$], [$0$],
    [*tan*], [$0$], [$1/sqrt(3)$], [$1$], [$sqrt(3)$], [$infinity$],
  )
]

#v(-5pt)
$ sin(alpha) = "opp"/"hyp", quad cos(alpha) = "adj"/"hyp", quad tan(alpha) = "opp"/"adj" = sin(alpha)/cos(alpha) $
#v(-3pt)

- *Pythagoras*: $sin^2(x) + cos^2(x) = 1$
- *Symmetry*: $sin(-x) = -sin(x)$, $cos(-x) = cos(x)$
- *Phase*: $sin(x + pi/2) = cos(x)$
- *Addition*: $sin(x plus.minus y) = sin(x) cos(y) plus.minus cos(x) sin(y)$ \
  $cos(x plus.minus y) = cos(x) cos(y) minus.plus sin(x) sin(y)$

== Quadratic Formula

- For $a x^2 + b x + c = 0$ ($a != 0$): $x_(1, 2) = (-b plus.minus sqrt(b^2 - 4 a c)) / (2 a)$
- *Discriminant* $D = b^2 - 4 a c$:
  - $D > 0$: 2 real solutions.
  - $D = 0$: 1 real solution (multiplicity 2).
  - $D < 0$: 2 complex solutions (conjugate pairs).

== Binomials

- $(a + b)^2 = a^2 + 2a b + b^2$, $(a - b)^2 = a^2 - 2a b + b^2$
- $(a + b)(a - b) = a^2 - b^2$
- *Theorem*: $(a+b)^n = sum_(k=0)^n binom(n, k) a^(n-k) b^k$
- *Coefficient*: $binom(n, k) = n! / (k! (n-k)!)$.

== Sums

#set math.frac(style: "horizontal")
- *Gaussian Sum*: $sum_(i=1)^n i = (n(n+1))/2$.
- *Sum of Cubes*: $sum_(i=1)^n i^3 = (n^2(n+1)^2)/4$.
