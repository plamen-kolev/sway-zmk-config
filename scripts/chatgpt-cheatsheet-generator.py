import yaml
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages

# Load YAML config
with open("keymap.yaml", "r") as f:
    config = yaml.safe_load(f)

layers = config["layers"]
combos = config.get("combos", [])

# Function to extract tap/hold labels
def parse_key(key):
    if isinstance(key, str):
        return key, None
    elif isinstance(key, dict):
        return key.get("t", ""), key.get("h", None)
    return "", None

# Draw a single layer as a grid
def draw_layer(ax, layer_name, keys):
    rows = len(keys)
    cols = max(len(r) for r in keys)
    ax.set_title(layer_name, fontsize=14, fontweight="bold")
    ax.axis("off")

    for r, row in enumerate(keys):
        for c, key in enumerate(row):
            tap, hold = parse_key(key)
            x, y = c, -r
            rect = plt.Rectangle((x, y), 1, 1, fill=False)
            ax.add_patch(rect)

            if tap:
                ax.text(x + 0.5, y + 0.7, str(tap), ha="center", va="center", fontsize=8)
            if hold:
                ax.text(x + 0.5, y + 0.3, str(hold), ha="center", va="center", fontsize=6, color="gray")

    ax.set_xlim(0, cols)
    ax.set_ylim(-rows, 0)

# Draw all layers into one big PNG
fig, axes = plt.subplots(len(layers), 1, figsize=(12, len(layers) * 2.5))
if len(layers) == 1:
    axes = [axes]

for ax, (lname, lkeys) in zip(axes, layers.items()):
    draw_layer(ax, lname, lkeys)

# Add combos at the bottom
combo_text = "Combos:\n" + "\n".join(
    [f"{c['p']} → {c['k']} ({','.join(c.get('l', []))})" for c in combos]
)
fig.text(0.01, 0.01, combo_text, ha="left", va="bottom", fontsize=8)

plt.tight_layout(rect=[0, 0.05, 1, 1])
plt.savefig("keymap_layers_combined.png", dpi=200)
plt.close()

# Create PDF with each layer separately
with PdfPages("keymap_layers.pdf") as pdf:
    for lname, lkeys in layers.items():
        fig, ax = plt.subplots(figsize=(8.5, 5))
        draw_layer(ax, lname, lkeys)
        plt.tight_layout()
        pdf.savefig(fig)
        plt.close()

    # Combos page
    fig, ax = plt.subplots(figsize=(8.5, 11))
    ax.axis("off")
    ax.set_title("Combos", fontsize=14, fontweight="bold")
    ax.text(0, 1, combo_text, fontsize=10, va="top", family="monospace")
    pdf.savefig(fig)
    plt.close()

print("Generated keymap_layers_combined.png and keymap_layers.pdf")

