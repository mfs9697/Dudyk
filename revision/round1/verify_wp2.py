"""WP2 verification for Reviewer 1 comment R1.6.

WP2A tests the sign exclusivity of Q1 and Q2 over a broad elastic-parameter
domain. WP2B evaluates the Nazarenko--Kipnis branch-tip coefficient in the
notation of the submitted manuscript and the dimensionless mechanism boundary.

Requires Python 3 and mpmath >= 1.3 only for the high-precision WP2B section.
The broad WP2A sweep itself uses only the standard library.
"""
from __future__ import annotations

import json
import math
import random
from pathlib import Path

try:
    import mpmath as mp
except ImportError as exc:
    raise SystemExit("verify_wp2.py requires mpmath >= 1.3") from exc

PI = math.pi


def material(ratio, nu1, nu2):
    e = (1.0 + nu2) / (1.0 + nu1) * ratio
    return e, 3.0 - 4.0 * nu1, 3.0 - 4.0 * nu2


def determinant_d(p, alpha, e, k1, k2):
    return (
        (1.0 + k1)
        * (math.cos(2.0 * p * (PI - alpha)) - math.cos(2.0 * alpha))
        * (math.sin(2.0 * p * alpha) + p * math.sin(2.0 * alpha))
        + e
        * (1.0 + k2)
        * (math.cos(2.0 * p * alpha) - math.cos(2.0 * alpha))
        * (math.sin(2.0 * p * (PI - alpha)) - p * math.sin(2.0 * alpha))
    )


def determinant_d0(p, alpha, e, k1, k2):
    s_a = math.sin(2.0 * p * alpha)
    s_b = math.sin(2.0 * p * (PI - alpha))
    s = math.sin(2.0 * alpha)
    left_plus = s_a + p * s
    right_k1_plus = k1 * s_b + p * s
    right_minus = s_b - p * s
    left_k2_minus = k2 * s_a - p * s
    b0 = left_plus * right_k1_plus
    b2 = right_minus * left_k2_minus
    b1 = (1.0 + k1) * (1.0 + k2) * math.sin(PI * p) ** 2 - b0 - b2
    return b0 + e * b1 + e * e * b2


def smallest_lambda(det, alpha, e, k1, k2, scan_points=160):
    left = -1.0 + 1.0e-8
    right = -1.0e-8
    step = (right - left) / (scan_points - 1)
    x0 = left
    f0 = det(-1.0 - x0, alpha, e, k1, k2)
    for j in range(1, scan_points):
        x1 = left + j * step
        f1 = det(-1.0 - x1, alpha, e, k1, k2)
        if math.isfinite(f0) and math.isfinite(f1) and f0 * f1 < 0.0:
            lo, hi, flo = x0, x1, f0
            for _ in range(60):
                mid = 0.5 * (lo + hi)
                fm = det(-1.0 - mid, alpha, e, k1, k2)
                if flo * fm <= 0.0:
                    hi = mid
                else:
                    lo, flo = mid, fm
            return 0.5 * (lo + hi)
        x0, f0 = x1, f1
    raise RuntimeError("no sign-changing root in (-1,0)")


def s_values(p, alpha, e, k1, k2):
    beta = PI - alpha
    s11 = (
        p * math.cos(p * PI - alpha) * math.sin(alpha)
        - math.sin(p * beta) * math.cos(p * alpha)
    )
    s12 = p * math.sin(2.0 * alpha) + math.sin(2.0 * p * alpha)
    s13 = (
        p * math.cos(p * beta) * math.sin(alpha)
        - math.sin(p * beta) * math.cos(alpha)
    )
    s1 = (
        2.0 * e * (1.0 + k2) * s11 * math.sin((p + 1.0) * alpha)
        + s12
        * (
            (1.0 + k1) * math.sin(p * beta - alpha)
            + 2.0 * (1.0 - e) * s13
        )
    )
    s21 = math.sin(2.0 * p * beta) - p * math.sin(2.0 * alpha)
    s22 = (
        p * math.cos(p * alpha) * math.sin(alpha)
        + math.sin(p * alpha) * math.cos(alpha)
    )
    s23 = (
        p * math.cos(p * PI + alpha) * math.sin(alpha)
        + math.cos(p * beta) * math.sin(p * alpha)
    )
    s2 = (
        s21
        * (
            e * (1.0 + k2) * math.sin((p + 1.0) * alpha)
            + 2.0 * (1.0 - e) * s22
        )
        - 2.0 * (1.0 + k1) * math.sin(p * beta - alpha) * s23
    )
    return s1, s2


def g_values(lambda0, alpha, e, k2):
    common = (
        (lambda0 + 1.0) * math.sin(2.0 * alpha)
        + math.sin(2.0 * (lambda0 + 1.0) * alpha)
    )
    g1 = (
        (1.0 - e) * math.sin(lambda0 * (PI - alpha)) * common
        + e
        * (1.0 + k2)
        * math.sin(lambda0 * PI)
        * math.sin((lambda0 + 2.0) * alpha)
    )
    g2 = (
        (1.0 - e) * math.cos(lambda0 * (PI - alpha)) * common
        + e
        * (1.0 + k2)
        * math.sin(lambda0 * PI)
        * math.cos((lambda0 + 2.0) * alpha)
    )
    return g1, g2


def case_sign_product(ratio, nu1, nu2, alpha_deg):
    alpha = math.radians(alpha_deg)
    e, k1, k2 = material(ratio, nu1, nu2)
    lam = smallest_lambda(determinant_d, alpha, e, k1, k2)
    s1, s2 = s_values(-1.0 - lam, alpha, e, k1, k2)
    return lam, s1, s2, s1 * s2


def deterministic_scan():
    ratios = [10.0 ** (-3.0 + 6.0 * i / 24.0) for i in range(25)]
    nus = [-0.95, -0.75, -0.50, -0.25, 0.0, 0.25, 0.45, 0.49]
    angles = [float(a) for a in range(3, 180, 3) if a != 90]
    count = both_sign_count = 0
    closest = None
    for ratio in ratios:
        for nu1 in nus:
            for nu2 in nus:
                for alpha_deg in angles:
                    lam, s1, s2, product = case_sign_product(
                        ratio, nu1, nu2, alpha_deg
                    )
                    count += 1
                    if product > 0.0:
                        both_sign_count += 1
                    row = {
                        "E1_over_E2": ratio,
                        "nu1": nu1,
                        "nu2": nu2,
                        "alpha_deg": alpha_deg,
                        "lambda": lam,
                        "S1": s1,
                        "S2": s2,
                        "S1S2": product,
                    }
                    if closest is None or abs(product) < abs(closest["S1S2"]):
                        closest = row
    return {
        "cases": count,
        "same_sign_S_cases": both_sign_count,
        "simultaneous_Q_admissibility_candidates": both_sign_count,
        "domain": {
            "E1_over_E2": [1.0e-3, 1.0e3],
            "ratio_samples": 25,
            "nu_samples": nus,
            "alpha_deg": "3,6,...,177 excluding 90",
        },
        "closest_to_zero": closest,
    }


def random_scan(n=20000, seed=20261124):
    rng = random.Random(seed)
    count = same = 0
    closest = None
    for _ in range(n):
        ratio = 10.0 ** rng.uniform(-3.0, 3.0)
        nu1 = rng.uniform(-0.99, 0.499)
        nu2 = rng.uniform(-0.99, 0.499)
        alpha_deg = rng.uniform(0.2, 179.8)
        if abs(alpha_deg - 90.0) < 0.05:
            alpha_deg += 0.1
        lam, s1, s2, product = case_sign_product(
            ratio, nu1, nu2, alpha_deg
        )
        count += 1
        if product > 0.0:
            same += 1
        row = {
            "E1_over_E2": ratio,
            "nu1": nu1,
            "nu2": nu2,
            "alpha_deg": alpha_deg,
            "lambda": lam,
            "S1": s1,
            "S2": s2,
            "S1S2": product,
        }
        if closest is None or abs(product) < abs(closest["S1S2"]):
            closest = row
    return {
        "seed": seed,
        "cases": count,
        "same_sign_S_cases": same,
        "simultaneous_Q_admissibility_candidates": same,
        "closest_to_zero": closest,
    }


def interchange_check(n=1000, seed=424242):
    rng = random.Random(seed)
    max_lambda_error = 0.0
    max_d_error = 0.0
    max_s_error = 0.0
    for _ in range(n):
        ratio = 10.0 ** rng.uniform(-3.0, 3.0)
        nu1 = rng.uniform(-0.95, 0.49)
        nu2 = rng.uniform(-0.95, 0.49)
        alpha = math.radians(rng.uniform(1.0, 179.0))
        e, k1, k2 = material(ratio, nu1, nu2)
        lam = smallest_lambda(determinant_d, alpha, e, k1, k2)

        es, k1s, k2s = material(1.0 / ratio, nu2, nu1)
        alpha_s = PI - alpha
        lam_s = smallest_lambda(determinant_d, alpha_s, es, k1s, k2s)
        max_lambda_error = max(max_lambda_error, abs(lam - lam_s))

        p = -1.0 - lam
        # Check D(alpha,m)=e D(pi-alpha,swapped) away from the root.
        pp = p + 0.123
        lhs = determinant_d(pp, alpha, e, k1, k2)
        rhs = e * determinant_d(pp, alpha_s, es, k1s, k2s)
        max_d_error = max(
            max_d_error, abs(lhs - rhs) / max(1.0, abs(lhs), abs(rhs))
        )

        s1, s2 = s_values(p, alpha, e, k1, k2)
        t1, t2 = s_values(p, alpha_s, es, k1s, k2s)
        # Exact interchange relations:
        # S1(alpha,m)=-e*S2(pi-alpha,swap), S2=-e*S1_swapped.
        max_s_error = max(
            max_s_error,
            abs(s1 + e * t2) / max(1.0, abs(s1), abs(e * t2)),
            abs(s2 + e * t1) / max(1.0, abs(s2), abs(e * t1)),
        )
    return {
        "cases": n,
        "seed": seed,
        "max_lambda_swap_error": max_lambda_error,
        "max_D_swap_relative_error": max_d_error,
        "max_S_swap_relative_error": max_s_error,
    }


# ---- High-precision WP2B baseline ----

def mp_material(ratio, nu1, nu2):
    e = mp.mpf(1 + nu2) / mp.mpf(1 + nu1) * mp.mpf(ratio)
    return e, mp.mpf(3 - 4 * nu1), mp.mpf(3 - 4 * nu2)


def mp_d(p, a, e, k1, k2):
    return (
        (1 + k1)
        * (mp.cos(2 * p * (mp.pi - a)) - mp.cos(2 * a))
        * (mp.sin(2 * p * a) + p * mp.sin(2 * a))
        + e
        * (1 + k2)
        * (mp.cos(2 * p * a) - mp.cos(2 * a))
        * (mp.sin(2 * p * (mp.pi - a)) - p * mp.sin(2 * a))
    )


def mp_d0(p, a, e, k1, k2):
    sa = mp.sin(2 * p * a)
    sb = mp.sin(2 * p * (mp.pi - a))
    s = mp.sin(2 * a)
    lp = sa + p * s
    rk = k1 * sb + p * s
    rm = sb - p * s
    lk = k2 * sa - p * s
    b0 = lp * rk
    b2 = rm * lk
    b1 = (1 + k1) * (1 + k2) * mp.sin(mp.pi * p) ** 2 - b0 - b2
    return b0 + e * b1 + e * e * b2


def mp_d1(p, a, e, k1, k2):
    return (
        2 * e * (1 + k2)
        * (mp.cos(2 * p * a) - mp.cos(2 * a))
        * (mp.sin(p * (mp.pi - a)) ** 2 - p * p * mp.sin(a) ** 2)
        + (1 + k1)
        * (mp.sin(2 * p * a) + p * mp.sin(2 * a))
        * (mp.sin(2 * p * (mp.pi - a)) - p * mp.sin(2 * a))
    )


def mp_base_kernel(t, a, e, k1, k2):
    if abs(t) < mp.mpf("1e-25"):
        t = mp.mpf("1e-25")
    p = 1j * t
    return mp.re(
        (e + k1) * (1 + e * k2) * mp.sin(mp.pi * p) * mp_d(p, a, e, k1, k2)
        / (
            (e + k1 + 1 + e * k2)
            * mp.cos(mp.pi * p)
            * mp_d0(p, a, e, k1, k2)
        )
    )


def mp_material1_kernel(t, a, e, k1, k2):
    if abs(t) < mp.mpf("1e-25"):
        t = mp.mpf("1e-25")
    p = 1j * t
    return mp.re(
        mp_d1(p, a, e, k1, k2) * mp.cos(mp.pi * p)
        / (mp_d(p, a, e, k1, k2) * mp.sin(mp.pi * p))
    )


def plus_factor(pneg, kernel):
    x = -mp.mpf(pneg)
    integral = mp.quad(
        lambda t: mp.log(kernel(t)) / (t * t + x * x),
        [0, 1, 4, 12, 30, 60],
    )
    return mp.e ** (x * integral / mp.pi)


def kplus(p):
    return mp.gamma(1 - p) / mp.gamma(mp.mpf("0.5") - p)


def mp_s1(p, a, e, k1, k2):
    beta = mp.pi - a
    s11 = p * mp.cos(p * mp.pi - a) * mp.sin(a) - mp.sin(p * beta) * mp.cos(p * a)
    s12 = p * mp.sin(2 * a) + mp.sin(2 * p * a)
    s13 = p * mp.cos(p * beta) * mp.sin(a) - mp.sin(p * beta) * mp.cos(a)
    return (
        2 * e * (1 + k2) * s11 * mp.sin((p + 1) * a)
        + s12 * ((1 + k1) * mp.sin(p * beta - a) + 2 * (1 - e) * s13)
    )


def baseline_mechanism():
    mp.mp.dps = 40
    ratio, nu1, nu2, alpha_deg = 0.5, 0.3, 0.3, 45.0
    a_f = math.radians(alpha_deg)
    e_f, k1_f, k2_f = material(ratio, nu1, nu2)
    lambda0 = smallest_lambda(determinant_d0, a_f, e_f, k1_f, k2_f)
    lam = smallest_lambda(determinant_d, a_f, e_f, k1_f, k2_f)
    g1, _ = g_values(lambda0, a_f, e_f, k2_f)

    a = mp.radians(alpha_deg)
    e, k1, k2 = mp_material(ratio, nu1, nu2)
    p0 = mp.mpf(-1 - lambda0)
    pl = mp.mpf(-1 - lam)
    base = lambda t: mp_base_kernel(t, a, e, k1, k2)
    mat1 = lambda t: mp_material1_kernel(t, a, e, k1, k2)
    base_g0 = plus_factor(p0, base)
    base_gl = plus_factor(pl, base)
    g1m1 = plus_factor(mp.mpf(-1), mat1)
    g1pl = plus_factor(pl, mat1)

    s1 = mp_s1(pl, a, e, k1, k2)
    dprime = mp.diff(lambda p: mp_d(p, a, e, k1, k2), pl)
    q1 = (
        2 * s1 * kplus(pl) * base_gl
        / (
            (mp.mpf(lam) - mp.mpf(lambda0))
            * dprime
            * kplus(p0)
            * base_g0
        )
    )

    # G1(0), independently evaluated from a small imaginary argument.
    g10 = mp_material1_kernel(mp.mpf("1e-10"), a, e, k1, k2)

    A = (
        mp.mpf(g1) * q1 * kplus(pl) * g1m1
        / ((1 + mp.mpf(lam)) * kplus(-1) * g1pl)
    )
    B = (
        -mp.mpf(lam) * kplus(-1)
        / (mp.sqrt(mp.pi * g10) * (1 + mp.mpf(lam)) * g1m1)
    )
    Dcoef = -4 * mp.mpf(lam) / (
        mp.pi * (mp.mpf(lam) + 2) * g1m1 * g1m1
    )

    # Nazarenko--Kipnis Eq. (7): KII=g1*k*C*l^(lambda0+1/2).
    k_tip = (
        2
        * mp.sqrt(2)
        * (1 + k2 * e)
        * mp.gamma(mp.mpf(lambda0) + mp.mpf("1.5"))
        / (
            (1 + k1 + (1 + k2) * e)
            * mp.gamma(mp.mpf(lambda0) + 2)
            * base_g0
        )
    )
    Kcoef = mp.mpf(g1) * k_tip

    # Boundary R_II^*(Delta)=C_delta Delta^(-lambda)
    # and R_II^*(J')=C_J J'^(-lambda).
    c_delta = abs(Kcoef) / abs(A) * B ** mp.mpf(lam)
    c_energy = abs(Kcoef) / abs(A) * Dcoef ** mp.mpf(lam)
    chi_normalized = Dcoef / B

    return {
        "case": {
            "E1_over_E2": ratio,
            "nu1": nu1,
            "nu2": nu2,
            "alpha_deg": alpha_deg,
            "active_material": 1,
        },
        "lambda0": float(lambda0),
        "lambda": float(lam),
        "g1": float(g1),
        "base_Gplus_minus1_minus_lambda0": float(base_g0),
        "base_Gplus_minus1_minus_lambda": float(base_gl),
        "q1": float(q1),
        "G1_plus_minus1": float(g1m1),
        "G1_plus_minus1_minus_lambda": float(g1pl),
        "G1_zero": float(g10),
        "A1": float(A),
        "B1": float(B),
        "D1_energy": float(Dcoef),
        "tip_k_factor": float(k_tip),
        "KII_coefficient_g1k": float(Kcoef),
        "normalized_energy_opening_ratio": float(chi_normalized),
        "mechanism_boundary": {
            "definition": "RII=KIIc/(sigma_i*sqrt(l))",
            "opening": {
                "formula": "RII_star=C_delta*Delta_i**(-lambda)",
                "Delta_i": "E_i*delta_ic/[4(1-nu_i^2)*sigma_i*l]",
                "C_delta": float(c_delta),
                "exponent_minus_lambda": float(-lam),
            },
            "energy": {
                "formula": "RII_star=C_energy*Jprime_ic**(-lambda)",
                "Jprime_ic": "E_i*J_ic/[4(1-nu_i^2)*sigma_i^2*l]",
                "C_energy": float(c_energy),
                "exponent_minus_lambda": float(-lam),
            },
        },
    }


def main():
    output = {
        "wp2a": {
            "analytical_reduction": "sign(Q1*Q2)=sign(S1*S2)",
            "deterministic": deterministic_scan(),
            "random": random_scan(),
            "material_interchange": interchange_check(),
            "verdict": (
                "No simultaneous-admissibility candidate was found. "
                "This is numerical evidence on the stated domain, not a global theorem."
            ),
        },
        "wp2b": {
            "source_mapping": (
                "Nazarenko-Kipnis Eq. (7): "
                "KII=g1*k*C*l^(lambda0+1/2); their kernel G is algebraically "
                "identical to the manuscript base kernel G."
            ),
            "baseline": baseline_mechanism(),
            "verdict": (
                "The two critical loads are quantitatively comparable through "
                "RII=KIIc/(sigma_i*sqrt(l)). Corner branching occurs first when "
                "|g1*k|*|sigma_prime_c| < RII; the opposite inequality selects "
                "interfacial branch-tip propagation."
            ),
        },
    }

    # Scientific stop conditions.
    assert output["wp2a"]["deterministic"]["same_sign_S_cases"] == 0
    assert output["wp2a"]["random"]["same_sign_S_cases"] == 0
    assert output["wp2a"]["material_interchange"]["max_lambda_swap_error"] < 1e-9
    b = output["wp2b"]["baseline"]
    assert abs(b["q1"] - 0.563193382302324) < 2e-9
    assert abs(b["G1_zero"] - 1.04944322692827) < 2e-8
    assert abs(b["G1_plus_minus1"] - 0.996302154170794) < 2e-9
    assert abs(b["A1"] - (-0.6183253228)) < 2e-8
    assert abs(b["B1"] - 0.9888266934) < 2e-8

    path = Path("results/wp2_verification.json")
    path.write_text(json.dumps(output, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(output, indent=2))


if __name__ == "__main__":
    main()
