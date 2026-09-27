#import "lib.typ": *

== Konvergenz von Funktionenfolgen

#definition[
  *Punktweise Konvergenz*
  *Definition:* Eine Funktionenfolge $(f_n)_(n in NN)$ konvergiert *punktweise* auf einer Menge $D subset.eq RR$ gegen eine Funktion $f$, wenn gilt:

  $
    forall x in D: quad lim_(n -> infinity) f_n(x) = f(x)
  $

  Man betrachtet dabei jeden Punkt $x$ *einzeln*. \
  Der Grenzwert $f$ kann unstetig sein, auch wenn alle $f_n$ stetig sind.

  #v(0.5em)
  *Typisches Vorgehen:*

  - Wähle beliebiges $x in D$
  - Berechne $lim_(n -> infinity) f_n(x)$
  - Setze $f(x) := lim f_n(x)$


]

#definition[
  *Gleichmäßige Konvergenz*
  *Definition:* Eine Funktionenfolge $(f_n)$ konvergiert *gleichmäßig* auf $D$ gegen $f$, wenn gilt:

  $
    forall epsilon > 0 exists N in NN: forall n >= N forall x in D: |f_n(x) - f(x)| < epsilon
  $

  Der Abstand $|f_n(x) - f(x)|$ ist dann *für alle $x$ gleichzeitig* kleiner als $epsilon$. \
  Dies ist eine *stärkere* Eigenschaft als punktweise Konvergenz.

  #v(0.5em)
  *Typisches Vorgehen:*

  - Zeige zunächst punktweise Konvergenz
  - Untersuche $|f_n(x) - f(x)|$ unabhängig von $x$
  - Finde $N = N(epsilon)$ so, dass die Bedingung erfüllt ist


  #v(0.5em)
  *Alternative Bedingung:*

  $
    lim_(n -> infinity) sup_(x in D) |f_n(x) - f(x)| = 0
  $

  *Merksatz:* Gleichmäßige Konvergenz $=>$ punktweise Konvergenz, aber nicht umgekehrt!
]

