## Algebra, Exponenten & Logarithmen

- **Basis-Umrechnung:** $a^x = e^{x \ln(a)}$
- **Logarithmus-Regeln:**
    - $\ln(x \cdot y) = \ln(x) + \ln(y)$
    - $\ln(x / y) = \ln(x) - \ln(y)$
    - $\ln(x^y) = y \cdot \ln(x)$
    - $\log_a(x) = \frac{\ln(x)}{\ln(a)}$
- **Wurzeln rationalisieren:** $\sqrt{a} - \sqrt{b} = \frac{a - b}{\sqrt{a} + \sqrt{b}}$
    - Standard-Trick für den Limes von Folgen (z.B. $\sqrt{n+1} - \sqrt{n}$)

## Ungleichungen, Abschätzungen & Supremum

- **Dreiecksungleichungen:**
    - $|x + y| \le |x| + |y|$
    - $|x - y| \le |x| + |y|$
    - $||x| - |y|| \le |x - y|$ (**Nach unten** - extrem wichtig)
    - $\left|\sum x_i\right| \le \sum |x_i|$ (Gilt auch für Integrale: $|\int f| \le \int |f|$)
- **Abschätzungen mit Mittelwertsatz** (da $\cos \le 1$):
    - $|\sin(x) - \sin(y)| \le |x - y|$
    - $|\cos(x) - \cos(y)| \le |x - y|$
- **Lipschitz-Stetigkeit:** $|f(x) - f(y)| \le L \cdot |x - y|$
- **Spezifische Ungleichungen:**
    - **Bernoulli-Ungleichung:** $(1 + x)^n \ge 1 + nx$ (für $x \ge -1, n \in \mathbb{N}$) $\to$ oft für Folgenbeweise
    - **Youngsche Ungleichung:** $2|xy| \le \varepsilon x^2 + \frac{1}{\varepsilon}y^2$ (für $\varepsilon > 0$)
    - **AM-GM Ungleichung:** $\sqrt{xy} \le \frac{x+y}{2}$ (für $x, y \ge 0$) $\to$ Geometrisches Mittel $\le$ Arithmetisches Mittel
- **Standard-Abschätzungen** (nützlich für Grenzwerte):
    - $e^x \ge 1 + x$ (für alle $x \in \mathbb{R}$)
    - $\ln(1+x) \le x$ (für $x > -1$)
    - $\ln(x) \le x - 1$ (für $x > 0$)
    - $|\sin(x)| \le |x|$ (für alle $x \in \mathbb{R}$)
    - $1 - \frac{x^2}{2} \le \cos(x) \le 1$ (für alle $x \in \mathbb{R}$)
- **Supremum / Infimum Regeln:**
    - $\sup(ax + b) = a \cdot \sup(x) + b$ (falls $a > 0$)
    - $\sup(ax + b) = a \cdot \inf(x) + b$ (falls $a < 0$)

## Komplexe Zahlen & Eulersche Identitäten

- **Normalform & Polarform:** $z = a + ib = r e^{i\varphi} = r(\cos\varphi + i\sin\varphi)$
- **Eigenschaften der Konjugation:**
    - $z \cdot \bar{z} = |z|^2 = a^2 + b^2$
    - **Realteil:** $\operatorname{Re}(z) = \frac{z + \bar{z}}{2}$
    - **Imaginärteil:** $\operatorname{Im}(z) = \frac{z - \bar{z}}{2i}$
- **Eulersche Formel & Identitäten:**
    - $e^{i\varphi} = \cos(\varphi) + i\sin(\varphi)$
    - **Spezielle Werte:** $e^{i\pi} = -1$, $e^{i\pi/2} = i$, $e^{3i\pi/2} = -i$
- **Satz von Moivre:** $(\cos\varphi + i\sin\varphi)^n = \cos(n\varphi) + i\sin(n\varphi) \implies (e^{i\varphi})^n = e^{in\varphi}$
- **Wurzelziehen ($n$-te Wurzeln aus $w$):**
    - $z_k = |w|^{1/n} \cdot e^{i \left(\frac{\arg(w)}{n} + \frac{2\pi k}{n}\right)}$ für $k = 0, 1, \dots, n-1$
- **Trigonometrie via Komplex** (nützlich für Ableiten/Integrieren):
    - $\cos(x) = \frac{e^{ix} + e^{-ix}}{2}$
    - $\sin(x) = \frac{e^{ix} - e^{-ix}}{2i}$
## Trigonometrie & Hyperbelfunktionen

- **Pythagoras & Identitäten:**
    - $\sin^2(x) + \cos^2(x) = 1$
    - $\cosh^2(x) - \sinh^2(x) = 1$
    - $1 + \tan^2(x) = \frac{1}{\cos^2(x)}$
- **Hyperbelfunktionen Definition:**
    - $\cosh(x) = \frac{e^x + e^{-x}}{2}$
    - $\sinh(x) = \frac{e^x - e^{-x}}{2}$
    - $\tanh x={\frac {\sinh x}{\cosh x}}={\frac {e^{x}-e^{-x}}{e^{x}+e^{-x}}}={\frac {e^{2x}-1}{e^{2x}+1}}$
- **Additionstheoreme:**
    - $\sin(x \pm y) = \sin(x)\cos(y) \pm \cos(x)\sin(y)$
    - $\cos(x \pm y) = \cos(x)\cos(y) \mp \sin(x)\sin(y)$
    - $\tan(x \pm y) = \frac{\tan(x) \pm \tan(y)}{1 \mp \tan(x)\tan(y)}$
- **Doppelwinkel** (Wichtig für Substitution/Integration):
    - $\sin(2x) = 2\sin(x)\cos(x)$
    - $\cos(2x) = \cos^2(x) - \sin^2(x) = 2\cos^2(x) - 1 = 1 - 2\sin^2(x)$
- **Quadrate auflösen** (oft bei $\int \sin^2(x)dx$ gebraucht):
    - $\sin^2(x) = \frac{1 - \cos(2x)}{2}$
    - $\cos^2(x) = \frac{1 + \cos(2x)}{2}$
- **Produkt zu Summe** (für Integrale von Produkten):
    - $\sin(x)\cos(y) = \frac{1}{2}[\sin(x+y) + \sin(x-y)]$
    - $\cos(x)\cos(y) = \frac{1}{2}[\cos(x+y) + \cos(x-y)]$
    - $\sin(x)\sin(y) = \frac{1}{2}[\cos(x-y) - \cos(x+y)]$

## Grenzwerte & Asymptotik

- **Definition von e:** $\lim_{n \to \infty} \left(1 + \frac{x}{n}\right)^n = e^x$
- **Limes mit Wurzeln:**
    - $\lim_{n \to \infty} \sqrt[n]{n} = 1$
    - $\lim_{n \to \infty} \sqrt[n]{a} = 1$ (für $a > 0$)
    - $\lim_{n \to \infty} \sqrt[n]{P(n)} = 1$ (für jedes Polynom $P(n) > 0$)
- **Standardgrenzwerte** (oft ohne L'Hôpital nutzbar, $x \to 0$):
    - $\lim_{x \to 0} \frac{\sin(x)}{x} = 1$
    - $\lim_{x \to 0} \frac{1 - \cos(x)}{x} = 0$
    - $\lim_{x \to 0} \frac{1 - \cos(x)}{x^2} = \frac{1}{2}$
    - $\lim_{x \to 0} \frac{e^x - 1}{x} = 1$
    - $\lim_{x \to 0} \frac{\ln(1+x)}{x} = 1$
- **Hierarchie des Wachstums** ($n \to \infty$):
    - $\ln(n) \ll n^p \ll a^n \ll n! \ll n^n$ (für $p>0, a>1$)
    - Der Term weiter rechts dominiert immer (Bruch geht gegen 0 oder $\infty$).

## Summen, Reihen & Taylor-Entwicklungen

- **Wichtige endliche Summen:**
    - **Gauss-Summe:** $\sum_{k=1}^n k = \frac{n(n+1)}{2}$
    - **Summe der Quadrate:** $\sum_{k=1}^n k^2 = \frac{n(n+1)(2n+1)}{6}$
    - **Summe der Kuben:** $\sum_{k=1}^n k^3 = \left( \frac{n(n+1)}{2} \right)^2 = (\sum k)^2$
    - **Geometrische Summe:** $\sum_{k=0}^n q^k = \frac{1 - q^{n+1}}{1 - q}$
    - **Teleskopsumme:** $\sum_{k=1}^N (b_k - b_{k+1}) = b_1 - b_{N+1}$
- **Konvergenzradius** bei Potenzreihen:
    - **Cauchy-Hadamard:** $R = \frac{1}{\limsup_{n \to \infty} \sqrt[n]{|c_n|}}$
    - **Quotientenkriterium:** $R = \lim_{n \to \infty} \left| \frac{c_n}{c_{n+1}} \right|$
- **Taylorpolynom 2. Ordnung** (mit Restglied):
    - $f(x) = f(x_0) + f'(x_0)(x-x_0) + \frac{1}{2}f''(x_0)(x-x_0)^2 + \frac{1}{6}f'''(c)(x-x_0)^3$
- **Wichtige Taylorreihen** (Entwicklungspunkt $x_0=0$):
    - $e^x = \sum_{n=0}^{\infty} \frac{x^n}{n!} = 1 + x + \frac{x^2}{2} + \dots \quad$ ($R=\infty$)
    - $\sin(x) = \sum_{n=0}^{\infty} \frac{(-1)^n}{(2n+1)!} x^{2n+1} = x - \frac{x^3}{6} + \frac{x^5}{120} - \dots \quad$ ($R=\infty$)
    - $\cos(x) = \sum_{n=0}^{\infty} \frac{(-1)^n}{(2n)!} x^{2n} = 1 - \frac{x^2}{2} + \frac{x^4}{24} - \dots \quad$ ($R=\infty$)
    - $\frac{1}{1-x} = \sum_{n=0}^{\infty} x^n = 1 + x + x^2 + \dots \quad$ ($|x|<1$)
    - $\ln(1+x) = \sum_{n=1}^{\infty} (-1)^{n-1} \frac{x^n}{n} = x - \frac{x^2}{2} + \frac{x^3}{3} - \dots \quad$ ($|x|<1$)
    - $(1+x)^p = \sum_{n=0}^{\infty} \binom{p}{n} x^n = 1 + px + \frac{p(p-1)}{2}x^2 + \dots \quad$ ($|x|<1$)

## Differentialrechnung & Extrema

- **Allgemeine Ableitungsregeln:**
    - **Produktregel:** $(uv)' = u'v + uv'$
    - **Quotientenregel:** $\left(\frac{u}{v}\right)' = \frac{u'v - uv'}{v^2}$
    - **Kettenregel:** $(g(f(x)))' = g'(f(x)) \cdot f'(x)$
    - **Umkehrfunktion:** $(f^{-1})'(y) = \frac{1}{f'(x)}$ (mit $y = f(x)$)
- **Spezielle Ableitungen** (Tabelle):
    - $(a^x)' = a^x \ln(a)$
    - $(\log_a(x))' = \frac{1}{x \ln(a)}$
    - $(\tan x)' = 1 + \tan^2 x = \frac{1}{\cos^2 x}$
    - $(\arcsin x)' = \frac{1}{\sqrt{1-x^2}}$
    - $(\arccos x)' = -\frac{1}{\sqrt{1-x^2}}$
    - $(\arctan x)' = \frac{1}{1+x^2}$
    - $(\sinh x)' = \cosh x$
    - $(\cosh x)' = \sinh x$
- **Trick für Exponent-Funktionen:**
    - $(x^x)' = x^x(\ln x + 1)$ (Herleitung via Umrechnung: $x^x = e^{x \ln x}$)
- **Hinreichendes Kriterium für lokale Extrema:**
    - $f'(x_0) = 0$ und $f''(x_0) > 0 \implies$ Lokales **Minimum**
    - $f'(x_0) = 0$ und $f''(x_0) < 0 \implies$ Lokales **Maximum**

## Integralrechnung

- **Integrationsregeln:**
    - **Partielle Integration:** $\int u(x)v'(x)dx = u(x)v(x) - \int u'(x)v(x)dx$
    - **Substitution:** $\int f(g(x))g'(x)dx = \int f(u)du$ (mit $u=g(x), du=g'(x)dx$)
    - **Logarithmisches Integrieren:** $\int \frac{f'(x)}{f(x)}dx = \ln|f(x)| + C$
- **Standard-Stammfunktionen** (Integrationskonstante $+ C$ nicht vergessen):
    - $\int x^n dx = \frac{x^{n+1}}{n+1} \quad (n \neq -1)$
    - $\int \frac{1}{x} dx = \ln|x|$
    - $\int e^{ax} dx = \frac{1}{a}e^{ax}$
    - $\int \ln(x) dx = x\ln(x) - x$ (Herleitung via partielle Integration mit $1 \cdot \ln(x)$)
    - $\int \sin(ax) dx = -\frac{1}{a}\cos(ax)$
    - $\int \cos(ax) dx = \frac{1}{a}\sin(ax)$
    - $\int \tan(x) dx = -\ln|\cos(x)|$
    - $\int \frac{1}{1+x^2} dx = \arctan(x)$
    - $\int \frac{1}{\sqrt{1-x^2}} dx = \arcsin(x)$
    - $\int \frac{1}{\sqrt{x^2 \pm 1}} dx = \ln|x + \sqrt{x^2 \pm 1}|$

## Differentialgleichungen (DGL) & Modellierung

- **DGL 1. Ordnung - Trennung der Variablen:**
    - $y' = f(x)g(y) \implies \int \frac{1}{g(y)} dy = \int f(x) dx$
- **Lineare DGL 2. Ordnung** ($ay'' + by' + cy = 0$):
    - **Ansatz:** $y = e^{\lambda x} \implies a\lambda^2 + b\lambda + c = 0$
    - **Fall 1 ($D>0$):** Zwei reelle Wurzeln $\lambda_1, \lambda_2 \implies y = C_1 e^{\lambda_1 x} + C_2 e^{\lambda_2 x}$
    - **Fall 2 ($D=0$):** Eine doppelte Wurzel $\lambda \implies y = C_1 e^{\lambda x} + C_2 x e^{\lambda x}$
    - **Fall 3 ($D<0$):** Komplexe Wurzeln $\lambda_{1,2} = \alpha \pm i\beta \implies y = e^{\alpha x}(C_1 \cos(\beta x) + C_2 \sin(\beta x))$