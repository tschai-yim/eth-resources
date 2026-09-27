## Lösungsverfahren für DGL 1. Ordnung

- **Trennung der Variablen** (Separation of Variables):
    - **Voraussetzung:** DGL der Form $y'(x) = f(x) \cdot g(y)$.
    - **Vorgehen:** $y$-Terme links, $x$-Terme rechts: $\frac{y'(x)}{g(y)} = f(x)$.
    - **Integration:** Beide Seiten nach $x$ integrieren ($\int \frac{y'(x)}{g(y)} dx = \int f(x) dx$). Durch die Substitutionsregel ($dy = y' dx$) entspricht dies dem direkten Integrieren beider Variablen: $\int \frac{1}{g(y)} dy = \int f(x) dx$.
    - **Konstanten-Trick:** Exponenzieren liefert $\pm C e^{kx} \to D e^{kx}$ ($D$ absorbiert Vorzeichen).
    - *Beispiel:* $z' = -3 + 2z \implies \int \frac{1}{2z-3} dz = \int 1 dx \implies \frac{1}{2}\ln|2z-3| = x+C \implies z(x) = \frac{3}{2} + De^{2x}$.
- **Lineare Substitution:**
    - **Voraussetzung:** DGL der Form $y' = f(ax+by+c)$ [^def_subst_linear].
    - **Vorgehen:** Inneren linearen Term als neue Variable setzen: $u = ax+by+c$.
    - **Eigenschaft:** Führt zu **autonomer** DGL (ohne explizites $x$) mit trennbaren Variablen [^def_subst_linear].
    - **Zwingend:** Nach Lösung für $u(x)$ **Rücksubstitution** nach $y(x)$ vornehmen.
    - *Beispiel:* $y' = -3x + 2y - 5 \implies u = -3x + 2y - 5 \implies u' = -3 + 2y' = -3 + 2u \implies$ (nun trennbar).
- **Substitution bei "homogen in den Variablen":**
    - **Achtung:** Nicht "homogene DGL" ($s(x)=0$).
    - **Voraussetzung:** DGL abhängig vom Verhältnis $\frac{y}{x}$, Form $y' = g(\frac{y}{x})$ [^def_subst_homogen].
    - **Vorgehen:** Ansatz $u = \frac{y}{x} \implies y = u \cdot x$.
    - Ableitung (Produktregel): $y' = u + x u'$.
    - **Trick:** Beim Gleichsetzen kürzt sich der isolierte Term $u$ zwingend weg $\implies$ resultiert in trennbarer DGL.
    - *Beispiel:* $y' = \frac{y}{x} + \frac{x^2}{y^2} \implies u + xu' = u + u^{-2} \implies xu' = u^{-2} \implies \int u^2 du = \int x^{-1} dx$.

## Lineare, inhomogene Differentialgleichungen

- **Superpositionsprinzip (Inhomogen):** Allgemeine Lösung $y = y_h + y_p$ ($y_h$ = Lösung der homogenen DGL, $y_p$ = **genau eine** partikuläre Lösung) [^thm_inhomogen_eig].
- **Strategie 1: Variation der Konstanten** (für DGL 1. Ordnung):
    - **Ansatz:** Konstante $C$ der homogenen Lösung $y_h$ durch Funktion $C(x)$ ersetzen.
    - **Kontrollschritt:** Nach Einsetzen in die DGL **müssen** sich alle Terme mit reinem $C(x)$ aufheben. Sonst Rechenfehler!
    - Verbleibende Gleichung für $C'(x)$ unbestimmt integrieren (Integrationskonstante $= 0$ setzen).
    - *Beispiel:* $y' - 2y = 3e^x \implies y_h = Ce^{2x}$. Ansatz $y_p = C(x)e^{2x} \implies C'(x)e^{2x} + 2C(x)e^{2x} - 2C(x)e^{2x} = 3e^x \implies C'(x)e^{2x} = 3e^x \implies C'(x) = 3e^{-x} \implies C(x) = -3e^{-x} \implies y_p = -3e^x$.
- **Strategie 2: Ansatzmethode / Störgliedansatz** (bei konstanten Koeffizienten):
    - **Vorteil:** Keine Integration, rein algebraisch (schneller).
    - **Vorgehen:** Störfunktion $s(t)$ formell imitieren, einsetzen, Parameter via **Koeffizientenvergleich** bestimmen [^thm_ansatz_hinweise].
    - **Standardansätze:**
        - Polynom $n$-ten Grades $\implies y_p(t) = C_0 + C_1 t + \dots + C_n t^n$. (*Beispiel:* $s(t)=t \implies y_p = C_0 + C_1 t$).
        - Exponentialfunktion $A e^{kt} \implies y_p(t) = C e^{kt}$. (*Beispiel:* $y''-y = e^{2t} \implies y_p = Ce^{2t} \implies 4C-C=1 \implies C=1/3$).
        - **Schwingung** $A\sin(\omega t) \implies y_p(t) = C_1\sin(\omega t) + C_2\cos(\omega t)$. (Ansatz braucht **zwingend** Sinus und Cosinus!).
- **Der Spezialfall (Resonanz):**
    - **Problem:** Störfunktion ist bereits Lösung des ungestörten homogenen Systems.
    - **Bedingung:** Parameter der Störfunktion ist $m$-fache Nullstelle $\lambda$ des charakteristischen Polynoms.
        - Bei Exponential $e^{kt} \implies$ prüfe auf Nullstelle $\lambda = k$.
        - Bei Polynom $\implies$ prüfe auf Nullstelle $\lambda = 0$ (Begründung: $t^n$ entspricht $t^n e^{0t}$).
        - Bei Schwingung $\sin(\omega t) \implies$ prüfe auf Nullstelle $\lambda = i\omega$.
    - **Lösung:** Standardansatz **zwingend** mit Faktor $t^m$ (bzw. $x^m$) multiplizieren.
    - *Beispiel:* $y''-3y'+2y = e^t$. Nullstellen $\lambda \in \{1, 2\}$. Störterm $e^{1t} \implies k=1$ ist einfache Nullstelle ($m=1$). $\implies$ Ansatz: $y_p(t) = C \cdot \mathbf{t^1} \cdot e^t$.

## Analytische Lösung der Logistischen DGL

- **Modell:** Beschränktes Wachstum $\frac{dP}{dt} = kP(1 - \frac{P}{L})$.
    - $kP$: Unbeschränktes Wachstum.
    - $(1 - \frac{P}{L})$: Korrekturfaktor (stoppt Wachstum bei Tragfähigkeit $L$).
- **Lösungsweg (exakt analytisch):**
    - **Substitution:** $u(t) = \frac{1}{P(t)}$.
    - Kettenregel: $u' = - \frac{1}{P^2} P'$.
    - DGL in $u$: $u' = -k(u - \frac{1}{L})$.
    - Trennung der Variablen / Integration: $u(t) = C e^{-kt} + \frac{1}{L}$.
    - **Rücksubstitution:** $P(t) = \frac{L}{1 + A e^{-kt}}$ (Konstante umbenannt).
- **Eigenschaften:**
    - **Sigmoidfunktion** (S-förmige Kurve).
    - Asymptoten: $P \to 0$ ($t \to -\infty$), $P \to L$ ($t \to \infty$).
    - Punktsymmetrisch um den Wendepunkt (bei $P = L/2$).

[^def_subst_linear]: Substitution i) Lineare Substitution: Falls eine Differentialgleichung der Form $\frac{dy}{dx} = y' = f(ax + by + c)$, mit $a, b, c \in \mathbb{R}$ gegeben ist, lässt sich diese durch die lineare Substitution $u = ax + by + c$ in eine Differentialgleichung mit trennbaren Variablen überführen. Bemerkung: Auf der rechten Seite dieser Differentialgleichung kommt die unabhängige Variable $x$ nicht mehr explizit vor. Eine solche Differentialgleichung nennen wir autonom.
[^def_subst_homogen]: ii) Substitution bei in den Variablen homogenen Diff.-gl.: Eine Differentialgleichung der Form $\frac{dy}{dx} = y' = g(\frac{y}{x})$ nennen wir homogen in den Variablen. Eine solche Differentialgleichung lässt sich mit Hilfe der Substitution $u = \frac{y}{x}$ in eine Differentialgleichung mit trennbaren Variablen überführen.
[^thm_inhomogen_eig]: Wichtige Eigenschaft linearer, inhomogener Diff.-gl.: Ist $y_p(x)$ eine partikuläre Lösung einer linearen, inhomogenen Differentialgleichung und $y_h(x)$ die allgemeine Lösung der dazugehörigen homogenen Differentialgleichung, so ist $y(x) = y_h(x) + y_p(x)$ die allgemeine Lösung der linearen, inhomogenen Differentialgleichung.
[^thm_ansatz_hinweise]: Einige Hinweise zum Ansatz für die partikuläre Lösung (Diff.-gl. beliebiger Ordnung): Falls die Störfunktion ein Polynom n-ten Grades ist, wählen wir als Ansatz für die partikuläre Lösung ein Polynom vom gleichen Grad. Falls die Störfunktion eine Schwingung ist, wählen wir als Ansatz für die partikuläre Lösung eine Schwingung der gleichen Frequenz. Falls die Störfunktion das Produkt eines Polynoms und einer Exponentialfunktion ist, wählen wir als Ansatz für die partikuläre Lösung ein Produkt eines Polynoms vom gleichen Grad mit einer Exponentialfunktion mit gleichem Exponenten.
