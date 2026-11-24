"""Independent WP1 checks. Run with Python 3 and mpmath >= 1.3."""
import mpmath as m

m.mp.dps = 40
width = [3*m.pi/4, m.pi/4]
compliance = [2, 1]  # common scale cancels


def determinants(p, i=0):
    x = [m.sin(p*w)**2 - (p*m.sin(w))**2 for w in width]
    y = [m.sin(2*p*w) + p*m.sin(2*w) for w in width]
    z = [m.cos(2*p*w) - m.cos(2*w) for w in width]
    j = 1-i
    d = sum(compliance[k]*z[k]*y[1-k] for k in range(2))
    n = 2*compliance[j]*z[j]*x[i] + compliance[i]*y[i]*y[j]
    return d, n


def wedge(p, w):
    """Map endpoint tractions to inward bisector gradient by Airy solve."""
    def row(x, order):
        return [k**order*fn(k*x + order*m.pi/2)
                for k in (1-p, 1+p) for fn in (m.cos, m.sin)]
    scale = p*(p-1)
    matrix = m.matrix([row(0, 1), row(w, 1),
                       [scale*v for v in row(0, 0)],
                       [scale*v for v in row(w, 0)]])
    return [sum(a*b for a, b in zip(row(0, 3), m.lu_solve(matrix, rhs)))
            / (2*(1+p)) for rhs in ([0, 0, 1, 0], [0, 0, 0, 1])]


def check_close(x, y, tol):
    assert abs(x-y) < tol, (x, y)


for p in (m.mpc('-.14', '.37'), m.mpc(0, '.8')):
    for i in range(2):
        j = 1-i
        li, mi = wedge(p, width[i])
        lj, mj = wedge(p, width[j])
        b = compliance[i]*li*lj + compliance[j]*(lj**2-mj**2)
        impedance = b/(li*b-compliance[i]*mi**2*lj)
        d, n = determinants(p, i)
        check_close(impedance, -n/d, 1e-32)

g0 = m.diff(lambda p: determinants(p)[1], 0, 2)/(
    2*m.pi*m.diff(lambda p: determinants(p)[0], 0))
a = m.findroot(lambda p: determinants(p)[0], (.33, .45))
lam = a-1


def kernel(t):
    if abs(t) < m.mpf('1e-16'):
        return g0
    d, n = determinants(1j*t)
    return (n*m.cot(m.pi*1j*t)/d).real


def factor(x):
    return m.exp(x/m.pi*m.quad(lambda t: m.log(kernel(t))/(x*x+t*t),
                               [0, 1, 4, 12, 30, 60]))


def k(x):
    return m.gamma(1+x)/m.gamma(m.mpf('.5')+x)


g1, ga = factor(1), factor(a)
# Prescribed outer amplitude from repository regression fixture, l=sigma=1.
load = m.mpf('-.5')*m.mpf('-.583869497507357')*m.mpf('.563193382302324')
A = k(1)/g1
d = (load*k(a)/(a*ga*A))**(-1/lam)
B = load*d**lam*k(a)/(a*ga)
check_close(A, B, 1e-35)
m0 = k(0)/m.sqrt(g0)*(A-B/a)
m1 = k(1)/g1*(A/2-B/(1+a))
opening = -d*m0
energy = -2*d*m1
chi = 4*a*m.sqrt(m.pi*g0)/(m.pi*(1+a)*g1*k(1))
check_close(energy/opening, chi, 1e-35)
for value, reference in zip((g0, g1, ga, d, opening, energy),
                            (1.04944322692827, .996302154170794,
                             .998663862614929, .147434361717898,
                             .145787032377, .083620387222)):
    check_close(value, reference, 2e-7)
for name, value in locals().copy().items():
    if name in ('lam', 'g0', 'g1', 'ga', 'd', 'm0', 'm1', 'opening',
                'energy', 'chi'):
        print(name, m.nstr(value, 13))
