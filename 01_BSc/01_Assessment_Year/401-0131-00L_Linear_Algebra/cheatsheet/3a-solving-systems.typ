#import "lib.typ": *

= 3a Solving Linear Equations Ax = b

#definition(number: "3.1")[
  *System of Linear Equations*: $m$ sum equations, $n$ variables.
  /* $ a_(1 1)x_1 + dots + a_(1 n)x_n = b_1 \
  dots.v \
  a_(m 1)x_1 + dots + a_(m n)x_n = b_m $
  $a_(i j), b_i$ are known reals; $x_i$ are unknown.*/
]

- *Matrix-Vector Form*: $A x = b$ where $A in RR^(m times n)$, $x in RR^n$, $b in RR^m$
- *Row Picture*: Rows $u_i^T$ of $A$ define *hyperplanes* $u_i^T x = b_i$.
   - Solution is the *intersection point* of all $m$ hyperplanes.
- *Column Pic.*: Find coeff. $x_j$ for *linear combination* $b = sum x_j a_(dot j)$
   - Solution exists $<=> b in C(A)$ (Column Space).
