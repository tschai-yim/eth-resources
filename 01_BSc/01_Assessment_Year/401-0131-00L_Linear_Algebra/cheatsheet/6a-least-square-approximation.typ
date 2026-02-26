#import "lib.typ": *

= 6a Least Squares Approximation

- *Problem*: Find $hat(x) = "argmin"_x norm(A x - b)^2$. ($circle.dotted^2$ irrelevant as monotonic)
#fact(number: "6.1.1")[
  Minimizer is *sol. of normal equation*. When $A$ has *indep. columns* the *unique* minimizer $hat(x)$ is:
  $hat(x) = (A^T A)^(-1) A^T b$
]

== Applications: Data Fitting

- *Goal*: Fit line $b approx alpha_0 + alpha_1 t$ to points $(t_k, b_k)$.
- *Matrix Setup*: Unknowns $hat(x) = (alpha_0, alpha_1)^T$, Known $A = [bold(1) | bold(t)]$ and $b$.

#lemma(number: "6.1.2")[
  Cols of $A = [bold(1) | bold(t)]$ are *dependent* $<=>$ $t_i = t_j$ for all $i != j$.
]

- *Trick*: Shift to center $t^"new"_k = t_k - "mean"(t)$ (makes $A^T A$ diagnoal)

#remark(number: "6.1.3")[
  If cols pairwise orthogonal ($sum t_k = 0$), $A^T A$ is diagonal. Coefficients calculation is independent:
  $ vec(alpha'_0, alpha_1) = vec(1/m sum b_k, (sum t_k b_k) "/" (sum t_k^2)) "and" alpha_0 = alpha'_0 - alpha_1"mean"(t) $
]

- *Polynomial Fitting*: Fit curves (e.g. $b approx alpha_0 + alpha_1 t + alpha_2 t^2$).
  - Problem is *linear* in coefficients: $A = [bold(1) | bold(t) | bold(t)^2 | dots ]$
  