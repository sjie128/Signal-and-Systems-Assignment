import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.patches import FancyArrowPatch

fig, ax = plt.subplots(figsize=(10, 7))
ax.set_facecolor('#f9f9f9')
fig.patch.set_facecolor('#ffffff')

ax.axhspan(-5, 5, xmin=0, xmax=0.5, color='#5DCAA5', alpha=0.25, label='Stable (LHP)')
ax.axhspan(-5, 5, xmin=0.5, xmax=1.0, color='#E24B4A', alpha=0.20, label='Unstable (RHP)')

ax.axhline(0, color='#2C2C2A', linewidth=1.5)
ax.axvline(0, color='#2C2C2A', linewidth=1.5)

ax.axvline(0, color='#BA7517', linewidth=2, linestyle='--', alpha=0.8, zorder=3)

stable_real   = [(-1.5, 0)] # stable
stable_complex = [(-1.0, 2.5), (-1.0, -2.5)]

marginal = [(0, 2.0), (0, -2.0), (0, 0)]

unstable_real    = [(1.5, 0)] # unstable
unstable_complex = [(1.0, 2.5), (1.0, -2.5)]

def plot_poles(poles, color, size=180):
    for (x, y) in poles:
        ax.plot(x, y, 'x', color=color, markersize=14,
                markeredgewidth=3, zorder=5)

plot_poles(stable_real,    '#085041')
plot_poles(stable_complex, '#085041')
plot_poles(marginal,       '#854F0B')
plot_poles(unstable_real,  '#791F1F')
plot_poles(unstable_complex,'#791F1F')

labels = [
    (-1.5,  0,   's = −a',   '#085041', (-0.3,  0.4)),
    (-1.0,  2.5, '−σ+jω',   '#085041', (-0.3,  0.4)),
    (-1.0, -2.5, '−σ−jω',   '#085041', (-0.3, -0.6)),
    ( 1.5,  0,   's = +a',   '#791F1F', ( 0.15, 0.4)),
    ( 1.0,  2.5, '+σ+jω',   '#791F1F', ( 0.15, 0.4)),
    ( 1.0, -2.5, '+σ−jω',   '#791F1F', ( 0.15,-0.6)),
]
for (x, y, lbl, col, (dx, dy)) in labels:
    ax.text(x + dx, y + dy, lbl, fontsize=10, color=col, fontweight='bold')

annotations = [
    # (pole_x, pole_y, text_x, text_y, text, bg, border)
    (-1.0,  2.5, 3.8,  3.2, 'Damped\noscillation',  '#9FE1CB', '#0F6E56'),
    (-1.5,  0.0, 3.8,  1.2, 'Decays\nno oscillation','#9FE1CB', '#0F6E56'),
    ( 0.0,  2.0, 3.8,  4.5, 'Sustains\npure oscillation','#FAC775','#854F0B'),
    ( 1.0,  2.5, 3.8, -1.0, 'Growing\noscillation', '#F7C1C1', '#A32D2D'),
    ( 1.5,  0.0, 3.8, -2.8, 'Grows\nexponentially', '#F7C1C1', '#A32D2D'),
]
for (px, py, tx, ty, txt, bg, border) in annotations:
    bbox_props = dict(boxstyle='round,pad=0.4', facecolor=bg,
                      edgecolor=border, linewidth=1.2)
    ax.annotate(txt, xy=(px, py), xytext=(tx, ty),
                fontsize=9, color='#1a1a1a',
                arrowprops=dict(arrowstyle='-', color=border,
                                linestyle='dashed', lw=0.8),
                bbox=bbox_props, ha='left', va='center')

ax.text(0.08, -4.0, 'Marginally stable', fontsize=9,
        color='#412402', ha='left',
        bbox=dict(boxstyle='round,pad=0.4', facecolor='#FAC775',
                  edgecolor='#854F0B', linewidth=1.2))

ax.text(-3.8, 4.2, 'Stable region',     fontsize=13,
        fontweight='bold', color='#085041')
ax.text(-3.8, 3.6, 'Left half plane (σ < 0)', fontsize=9,
        color='#0F6E56')
ax.text( 0.2, 4.2, 'Unstable region',   fontsize=13,
        fontweight='bold', color='#791F1F')
ax.text( 0.2, 3.6, 'Right half plane (σ > 0)', fontsize=9,
        color='#A32D2D')

ax.set_xlim(-4.5, 5.5)
ax.set_ylim(-5.0, 5.0)
ax.set_xlabel('σ  (real axis)', fontsize=12, color='#2C2C2A')
ax.set_ylabel('jω  (imaginary axis)', fontsize=12, color='#2C2C2A')
ax.set_title('S-plane Pole Stability Map', fontsize=14,
             fontweight='bold', color='#2C2C2A', pad=14)
ax.tick_params(colors='#5F5E5A')
ax.spines['bottom'].set_color('#B4B2A9')
ax.spines['left'].set_color('#B4B2A9')
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.grid(True, linestyle='--', linewidth=0.4, color='#D3D1C7', alpha=0.7)

legend_handles = [
    mpatches.Patch(facecolor='#9FE1CB', edgecolor='#0F6E56', label='Stable poles (LHP)'),
    mpatches.Patch(facecolor='#FAC775', edgecolor='#854F0B', label='Marginally stable (jω axis)'),
    mpatches.Patch(facecolor='#F7C1C1', edgecolor='#A32D2D', label='Unstable poles (RHP)'),
]
ax.legend(handles=legend_handles, loc='lower left',
          fontsize=9, framealpha=0.9, edgecolor='#D3D1C7')

plt.tight_layout()
plt.savefig('Figure_1', dpi=150, bbox_inches='tight')
plt.show()