# 📡 Signals and Systems Assignment
### KIX1002 Engineering Mathematics II | Tower Crane Transient Analysis

![MATLAB](https://img.shields.io/badge/MATLAB-R2023a-orange?style=for-the-badge&logo=mathworks)
![Python](https://img.shields.io/badge/Python-3.10+-blue?style=for-the-badge&logo=python)
![Status](https://img.shields.io/badge/Status-Completed-green?style=for-the-badge)
![License](https://img.shields.io/badge/License-Academic-red?style=for-the-badge)

---

## 📋 Table of Contents
- [Overview](#-overview)
- [Problem Statement](#-problem-statement)
- [Repository Structure](#-repository-structure)
- [Theory & Solutions](#-theory--solutions)
- [Results & Graphs](#-results--graphs)
- [How to Run](#-how-to-run)
- [Tools Used](#-tools-used)
- [References](#-references)

---

## 🏗️ Overview

This repository contains the full solution to **Assignment 2** of KIX1002 Engineering Mathematics II.

The assignment models the **transient displacement of a tower crane operator cabin** subjected to oscillatory wind loading, solved using **Laplace Transform** methods.

> **Matric Number End Digit:** n = 7 → Wind Force = **21,000 cos(2t) N**

---

## 📌 Problem Statement

| Parameter | Value |
|---|---|
| Cabin mass (m) | 1,000 kg |
| Height | 100 m above ground |
| Wind force | 3,000n cos(2t) N = **21,000 cos(2t) N** |
| Wind duration | 0 to 2π seconds |
| Damping (c) | 11,000 dx/dt N |
| Stiffness cases (k) | 5,000 / 10,000 / 100,000 N/m |
| Initial conditions | x(0) = 0, x'(0) = 0 (calm morning) |

**Governing ODE:**

```
m·x''(t) + c·x'(t) + k·x(t) = F(t)
```

where F(t) = 21,000·cos(2t)·[u(t) − u(t−2π)]

---

## 📁 Repository Structure

```
Signal-and-Systems-Assignment/
│
├── 📄 README.md                  ← You are here
│
├── 📝 handwritten/
│   ├── Part_a_ODE_k10000.pdf     ← ODE derivation (k = 10,000)
│   ├── Part_b_Laplace_k10000.pdf ← Laplace solution (k = 10,000)
│   └── Part_c_k5000_k100000.pdf  ← Repeat for k = 5,000 & 100,000
│
├── 📊 plots/
│   ├── displacement_all_k.png    ← Main displacement graph (Part d)
│   ├── k5000_response.png        ← Individual plot k = 5,000
│   ├── k10000_response.png       ← Individual plot k = 10,000
│   └── k100000_response.png      ← Individual plot k = 100,000
│
├── 🐍 python/
│   └── crane_displacement.py     ← Python plotting script (Part d)
│
├── 📊 excel/
│   └── crane_displacement.xlsx   ← Excel data and chart (Part d)
│
└── 📄 Assignment2_Full.pdf       ← Final combined submission PDF
```

---

## 📐 Theory & Solutions

### System Parameters (n = 7)

| Parameter | Formula | k = 5,000 | k = 10,000 | k = 100,000 |
|---|---|---|---|---|
| α (damping coeff) | c / 2m | 5.5 | 5.5 | 5.5 |
| ω₀ (natural freq) | √(k/m) | 2.236 rad/s | 3.162 rad/s | 10.000 rad/s |
| ζ (damping ratio) | α / ω₀ | **2.460** | **1.739** | **0.550** |
| Condition | — | Overdamped | Overdamped | Underdamped |

### Laplace Transform Steps Applied

```
Step 1 → Write ODE from Newton's 2nd Law (KVL equivalent)
Step 2 → Take Laplace Transform of both sides
Step 3 → Substitute zero initial conditions x(0)=0, x'(0)=0
Step 4 → Solve for X(s) algebraically
Step 5 → Partial fraction expansion
Step 6 → Inverse Laplace → x(t)
Step 7 → Apply again for t > 2π (wind OFF region)
```

### Transfer Function

```
         21000·s / 1000
X(s) = ─────────────────────────────────────
        s · [(s² + 11s + k/1000)(s² + 4)]
```

---

## 📊 Results & Graphs

### Damping Behaviour Summary

```
k = 5,000  N/m  │ ζ = 2.46 │ ████████████░░░░░ OVERDAMPED   → slow, no oscillation
k = 10,000 N/m  │ ζ = 1.74 │ ████████░░░░░░░░░ OVERDAMPED   → moderate, no oscillation  
k = 100,000 N/m │ ζ = 0.55 │ ████░░░░░░░░░░░░░ UNDERDAMPED  → oscillates, recovers fast
```

### Key Observations

1. **Higher k = stiffer mast = smaller displacement** during wind loading
2. **k = 5,000 and k = 10,000** are overdamped → cabin returns to zero smoothly after wind stops at t = 2π ≈ 6.28 s
3. **k = 100,000** is underdamped → cabin oscillates after wind stops but with rapidly decaying amplitude
4. **All cases are stable** → all poles have negative real parts (left half of s-plane)
5. **Best engineering design:** k = 100,000 N/m — smallest peak displacement despite oscillation

---

## ▶️ How to Run

### Option 1 — Python Script

**Requirements:**
```bash
pip install numpy matplotlib scipy
```

**Run:**
```bash
cd python
python crane_displacement.py
```

The script will:
- ✅ Solve the ODE numerically using `scipy.integrate.odeint`
- ✅ Plot all three k cases on separate subplots
- ✅ Mark wind-active region (0 to 2π s)
- ✅ Print damping summary to terminal
- ✅ Save graph as `displacement_all_k.png`

### Option 2 — Excel

1. Open `excel/crane_displacement.xlsx`
2. Time data is in **Column A** (0 to 20s, step 0.1s)
3. Displacement formulas are in **Columns B, C, D**
4. Chart is in the **Chart sheet** tab

---

## 🛠️ Tools Used

| Tool | Purpose | Version |
|---|---|---|
| Python | Numerical ODE solving & plotting | 3.10+ |
| NumPy | Array operations | 1.24+ |
| SciPy | ODE integration (`odeint`) | 1.10+ |
| Matplotlib | Graph generation | 3.7+ |
| Microsoft Excel | Data table & chart (Part d) | Office 365 |
| Git & GitHub | Version control | — |

---

## 📚 References

1. Hayt, W., Kemmerly, J. & Durbin, S. (2019). *Engineering Circuit Analysis*, 9th ed. McGraw-Hill.
2. Kreyszig, E. (2011). *Advanced Engineering Mathematics*, 10th ed. Wiley.
3. KIX1002 Lecture Notes — Laplace Transform & ODE Applications, University of Malaya.

---

## 👤 Author

| Field | Details |
|---|---|
| Course | KIX1002 Engineering Mathematics II |
| Assignment | Assignment 2 — Tower Crane Transient Analysis |
| Matric digit (n) | 7 |
| Due Date | 05/06/2026 |

---

> ⚠️ **Academic Integrity Notice:** This repository is for personal academic reference only. Copying any part of this work and submitting it as your own violates university academic integrity policy.