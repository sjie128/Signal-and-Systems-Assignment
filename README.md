# ⚡ KIE2006 Signals and Systems Assignment
### RLC Protection Circuit Analysis for EV Charging Station

![MATLAB](https://img.shields.io/badge/MATLAB-R2023a-orange?style=for-the-badge&logo=mathworks)
![Status](https://img.shields.io/badge/Status-Completed-green?style=for-the-badge)
![Course](https://img.shields.io/badge/Course-KIE2006-blue?style=for-the-badge)
![Deadline](https://img.shields.io/badge/Due-8%20June%202026-red?style=for-the-badge)

---

## 📋 Table of Contents
- [Overview](#-overview)
- [Problem Statement](#-problem-statement)
- [Repository Structure](#-repository-structure)
- [Task Summary](#-task-summary)
- [Mathematical Solution](#-mathematical-solution)
- [MATLAB Simulation](#-matlab-simulation)
- [Applications & SDGs](#-applications--sdgs)
- [How to Run](#-how-to-run)
- [References](#-references)

---

## 🔍 Overview

This repository contains the full individual assignment report for **KIE2006 Signals and Systems (Session 2025/2026 Semester 2)**.

The assignment focuses on designing and analysing an **RLC protection circuit** for an **Electric Vehicle (EV) charging station** that experiences sudden voltage spikes during high-power charging operations. The Laplace Transform method is used throughout to analyse the transient behaviour of the circuit.

---

## 📌 Problem Statement

An EV charging station suffers transient voltage surges when high-power charging begins. These surges can:
- Damage sensitive electronic controllers
- Reduce the lifespan of charging equipment

A **series RLC protection circuit** is proposed with the following parameters:

| Parameter | Symbol | Value |
|---|---|---|
| Resistance | R | 20 Ω |
| Inductance | L | 0.5 H |
| Capacitance | C | 200 μF |
| Input voltage | vₛ(t) | 100u(t) V |
| Initial current | i(0⁻) | 0 A |
| Initial capacitor voltage | v_C(0⁻) | 0 V |

---

## 📁 Repository Structure

```
Signal-and-Systems-Assignment/
│
├── 📄 README.md                        ← You are here
│
├── 📝 report/
│   └── KIE2006_Assignment_Report.pdf   ← Final submission (max 15 pages)
│
├── 💻 matlab/
│   └── rlc_transient.m                 ← MATLAB code for Task (c)
│
├── 📊 plots/
│   ├── rlc_transient_response.png      ← Transient current i(t) graph
│   └── rlc_pzmap.png                   ← Pole-Zero map
│
└── 📖 references/
    └── references.md                   ← All cited references
```

---

## ✅ Task Summary

| Task | Description | Status |
|---|---|---|
| (a) | Laplace Transform theory & s-domain explanation | ✅ Done |
| (b) | Full mathematical solution for i(t) via Laplace | ✅ Done |
| (c) | MATLAB simulation & transient response graph | ✅ Done |
| (d) | Two real-world engineering applications | ✅ Done |
| (e) | Two UNESCO SDG contributions | ✅ Done |

---

## 📐 Mathematical Solution (Task b)

### Circuit ODE (from KVL)

```
L·d²i/dt² + R·di/dt + (1/C)·i = dv_s/dt
0.5·d²i/dt² + 20·di/dt + 5000·i = 0
→  d²i/dt² + 40·di/dt + 10000·i = 0
```

### S-Domain Transfer Function

```
I(s) = 200 / (s² + 40s + 10000)
```

### Poles

```
s₁,₂ = -20 ± j97.98
```

Both poles have **negative real parts** → circuit is **STABLE**

### Damping Analysis

| Parameter | Formula | Value |
|---|---|---|
| Damping coefficient α | R / 2L | 20 |
| Natural frequency ω₀ | 1/√(LC) | 100 rad/s |
| Damped frequency ωd | √(ω₀² − α²) | 97.98 rad/s |
| Damping ratio ζ | α / ω₀ | **0.2** |
| Condition | ζ < 1 | **UNDERDAMPED** |

### Time-Domain Solution

```
i(t) = 2.041 · e^(-20t) · sin(97.98t)  A,   t ≥ 0
```

---

## 💻 MATLAB Simulation (Task c)

### How to Run

1. Open MATLAB
2. Press `Ctrl + N` to open a new script
3. Copy and paste the code from `matlab/rlc_transient.m`
4. Press `F5` to run

### What the Script Produces

```
Figure 1 — Two subplots:
  ├── Top:    i(t) with decay envelope + peak marker
  └── Bottom: Verification plot (magenta)

Figure 2 — Pole-Zero Map:
  └── Complex poles at -20 ± j97.98 (left half plane → stable)
```

### Command Window Output

```
=== RLC Circuit Parameters ===
Damping coefficient  α  = 20.0000
Natural frequency   ω₀  = 100.0000 rad/s
Damped frequency    ωd  = 97.9796 rad/s
Damping ratio        ζ  = 0.2000
Damping Condition: UNDERDAMPED (ζ < 1)

=== Poles of H(s) ===
s1 = -20.0000 + 97.9796j
s2 = -20.0000 - 97.9796j
```

---

## 🌍 Applications & SDGs (Tasks d & e)

### Task (d) — Two Engineering Applications

| # | Field | Application | RLC Equivalent |
|---|---|---|---|
| 1 | Mechanical Engineering | Car suspension (mass-spring-damper) | m↔L, b↔R, k↔1/C |
| 2 | Biomedical Engineering | Cardiovascular Windkessel model | blood inertia↔L, vessel resistance↔R, arterial compliance↔C |

Both systems share the same governing equation:
```
m·x''(t) + b·x'(t) + k·x(t) = F(t)
```
→ Solved using the identical Laplace Transform steps.

### Task (e) — Two UNESCO SDGs

| SDG | Goal | RLC Contribution |
|---|---|---|
| **SDG 7** | Affordable and Clean Energy | Transient analysis ensures stable, efficient delivery of renewable energy through power inverters |
| **SDG 9** | Industry, Innovation & Infrastructure | RLC protection circuits safeguard smart grid and EV charging infrastructure from damaging surges |

---

## ▶️ How to Run the MATLAB Code

```matlab
% Step 1 — Open MATLAB
% Step 2 — New Script (Ctrl+N)
% Step 3 — Paste code from matlab/rlc_transient.m
% Step 4 — Press F5

% To save plots for the report:
saveas(figure(1), 'plots/rlc_transient_response.png');
saveas(figure(2), 'plots/rlc_pzmap.png');
```

---

## 📚 References

1. Hayt, W., Kemmerly, J. & Durbin, S. (2019). *Engineering Circuit Analysis*, 9th ed. McGraw-Hill.
2. Oppenheim, A. & Willsky, A. (1997). *Signals and Systems*, 2nd ed. Prentice Hall.
3. Nise, N. (2019). *Control Systems Engineering*, 8th ed. Wiley.
4. MathWorks (2024). MATLAB Control System Toolbox Documentation. https://www.mathworks.com/help/control
5. United Nations (2015). *Transforming Our World: The 2030 Agenda for Sustainable Development*. https://sdgs.un.org/goals
6. IRENA (2022). *Renewable Power Generation Costs in 2022*. https://www.irena.org/Publications

---

## 👤 Assignment Details

| Field | Details |
|---|---|
| Course | KIE2006 Signals and Systems |
| Session | 2025/2026 Semester 2 |


---

> ⚠️ **Academic Integrity:** This is an individual assignment. All work must be completed independently. Copying is strictly prohibited per university policy.