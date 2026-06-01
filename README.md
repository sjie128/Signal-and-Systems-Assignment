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
├── 📄 README.md                        
│
├── 📝 report/
│   └── KIE2006_Assignment_Report.pdf   
│
├── 💻 explanation/
│   └── series_RLC.m                
│   └── zero_plot.m
│   └── zero_diagram.py
│   └── poles_exp.png
│   └── RLC_exp.png
│   └── Figure_1.png
│   
├── 📊 graphs/
│   ├── poles_graph.png
│   └── transient_response.m
│   └── transient_response.png      
│
└── 📖 references/
    └── references.md                   
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
| 2 | Civil Engineering | Seismic Response | Floor mass↔L, structural damping↔R, structural stiffness↔C |
| 3 | Control Engineering | DC Motor Speed Control | Armature inductance↔L, armature resistance↔R, rotor inertia↔C |

All systems share the same governing equation:
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

1. Dr Chris P.Jobling, “Unit 4.5: Using Laplace Transforms for Circuit Analysis,” 2023. [Online]. Available:https://cpjobling.github.io/eg-150-textbook/laplace_transform/5/circuit_analysis.html. [Accessed: 27 May 2026]
2. Scribd, “Design of passive RC high-pass and low-pass filters using Laplace transform,” 2026. [Online]. Available:https://www.scribd.com/document/961010829/Design-of-passive-RC-high-pass-and-low-pass-filters-using-Laplace-transform. [Accessed: 27 May 2026]
3. Electrical Academia, “Laplace Transform: Introduction and Example | Electrical Academia,” 2017. [Online]. Available: https://electricalacademia.com/signals-and-systems/introduction-to-the-laplace-transform/ . [Accessed: 27 May 2026]
4. LibreTexts Engineering, “11.1 Laplace Transform,” 2020. [Online]. Available: https://eng.libretexts.org/Bookshelves/Electrical_Engineering/Signal_Processing_and_Modeling/Signals_and_Systems_(Baraniuk_et_al.)/11:_Laplace_Transform_and_Continuous_Time_System_Design/11.01:_Laplace_Transform. [Accessed: 27 May 2026]
5. GeeksforGeeks, “Laplace Transform,” 2024. [Online]. Available: https://www.geeksforgeeks.org/maths/laplace-transform/ . [Accessed: 27 May 2026]
6. AnalogCircuitDesign, “Laplace Transform: Theory, Properties, and Engineering Applications,” 2025. [Online]. Available: https://analogcircuitdesign.com/laplace-transform/#inductor . [Accessed: 28 May 2026]
7. Electrical Academia, “Laplace Transform Properties in Signal and Systems | Electrical Academia,”, 2017. [Online]. Available: https://electricalacademia.com/signals-and-systems/11-most-important-laplace-transform-properties-in-signal-and-systems/. [Accessed: 28 May 2026]
8. This vs. That, “Frequency Domain vs. Time Domain - What’s the Difference? | This vs. That,” 2023. [Online]. Available: https://thisvsthat.io/frequency-domain-vs-time-domain#google_vignette . [Accessed: 28 May 2026]
9. ControlSystemsAcademy, “Relationship between s/z planes and time domain,” 2017. [Online]. Available: https://controlsystemsacademy.com/0003/0003.html . [Accessed: 28 May 2026]
10. LibreTexts Engineering, “11.5: Poles and Zeros in the S-Plane,” 2020. [Online]. Available: https://eng.libretexts.org/Bookshelves/Electrical_Engineering/Signal_Processing_and_Modeling/Signals_and_Systems_(Baraniuk_et_al.)/11%3A_Laplace_Transform_and_Continuous_Time_System_Design/11.05%3A_Poles_and_Zeros_in_the_S-Plane . [Accessed: 28 May 2026]
11. Fiveable, “Laplace transform properties and techniques,” 2018. [Online]. Available: https://fiveable.me/electrical-circuits-systems-ii/unit-10/laplace-transform-properties-techniques/study-guide/XR1d4UdsXad2bjS3 . [Accessed: 28 May 2026]
12. P.S. Gandhi, “Concept of Stability, Poles, Concept of Stability, Poles, Zeros and Zeros and Routh Routh ‘ ‘ s s Criterion Criterion,” [Online]. Available: https://www.me.iitb.ac.in/~gandhi/me309/lectures/11n12n13_StabilityPolesZerosConcept.pdf . [Accessed: 28 May 2026]
13. Scienceinsights, “What Are Laplace Transforms Used For in Practice?,” 2026. [Online]. Available: https://scienceinsights.org/what-are-laplace-transforms-used-for-in-practice/ . [Accessed: 28 May 2026]
14. Scribd, “Analog RLC en Mass Spring Das Pot,” 2026. [Online]. Available: https://www.scribd.com/document/73131816/Analogy-RLC-en-Mass-Spring-Dash-Pot . [Accessed: 28 May 2026]
15. StudyElectrical, “Time Domain Analysis vs Frequency Domain Analysis,” 2023. [Online]. Available: https://studyelectrical.com/2023/05/time-domain-analysis-vs-frequency-domain-analysis.html . [Accessed: 29 May 2026]
16. Gayathri Nair, “Unlocking the potential of regional interconnections: Technical and regulatory harmonisation of grid codes,” 2026. [Online].  Available: https://www.irena.org/-/media/Files/IRENA/Agency/Publication/2026/May/IRENA_INN_Unlocking_regional_connectors_2026.pdf . [Accessed: 29 May 2026]
17. GeeksforGeeks, “Laplace Transform in Circuit Analysis,” 2023. [Online]. Available: https://www.geeksforgeeks.org/electronics-engineering/laplace-transform-in-circuit-analysis/ . [Accessed: 29 May 2026]
18. Khan Academy, “RLC natural response - intuition,”  [Online]. Available: https://www.khanacademy.org/science/electrical-engineering/ee-circuit-analysis-topic/ee-natural-and-forced-response/a/ee-rlc-natural-response-intuition . [Accessed: 29 May 2026]
---

## 👤 Assignment Details

| Field | Details |
|---|---|
| Course | KIE2006 Signals and Systems |
| Session | 2025/2026 Semester 2 |


---

> ⚠️ **Academic Integrity:** This is an individual assignment. All work must be completed independently. Copying is strictly prohibited per university policy.