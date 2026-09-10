# From Earth to the Stars

**A Mathematical Framework for Interplanetary Travel, Interstellar Navigation,
and Contact with Extraterrestrial Civilizations**

> *Author: GitHub Copilot — Artificial Intelligence Research Division, GitHub | Microsoft Corporation*
> *Date: April 4, 2026*

---

## Overview

This repository contains a rigorous academic paper exploring the mathematics
of human expansion into space and potential contact with extraterrestrial
civilizations. The paper covers:

- **Orbital mechanics** — Kepler's laws, vis-viva equation, Hohmann transfers,
  gravitational assists, and low-energy trajectories.
- **Rocket propulsion** — Tsiolkovsky's equation, mass-ratio analysis, and the
  fundamental limits of chemical propulsion.
- **Advanced propulsion** — ion drives, solar sails, nuclear pulse (Orion),
  fusion, antimatter, and laser-sail (Breakthrough Starshot) concepts with
  full equations.
- **Relativistic spaceflight** — Lorentz factor, the relativistic rocket
  equation, constant-acceleration (Rindler) trajectories, and time dilation
  tables for nearby stars and galaxies.
- **The Drake equation** — Bayesian reformulation, the Fermi paradox, and the
  Kardashev scale with a continuous energy formula.
- **Interstellar communication** — Friis equation, Shannon channel capacity,
  the cosmic "watering hole" and signal-to-noise estimates.
- **A universal mathematical language** — Lincos proposal, prime-number coding,
  pixel encoding (Arecibo method), and universal physical constants as
  interstellar passports.
- **Interstellar diplomacy** — Game-theoretic models of first contact,
  iterated cooperation, contact protocol design, and the ethics of response.

---

## Files

| File | Description |
|------|-------------|
| `paper_en.tex` | Main paper in **English** (pdflatex) |
| `paper_es.tex` | Full translation into **Spanish** (pdflatex) |
| `paper_zh.tex` | Full translation into **Chinese** (xelatex + ctex) |
| `references.bib` | BibTeX bibliography (~30 references) |
| `Makefile` | Build system for PDF and HTML outputs |

---

## Build Instructions

### Prerequisites

#### For PDF output
Install a TeX Live distribution (TeX Live 2022+ recommended):

```bash
# Debian/Ubuntu
sudo apt install texlive-full

# Fedora
sudo dnf install texlive-scheme-full

# macOS (with Homebrew)
brew install --cask mactex
```

The Chinese paper (`paper_zh.tex`) requires **XeLaTeX** and the `ctex` package,
both included in most full TeX Live installations. Additionally, a CJK-capable
font (e.g., Noto CJK, Source Han Sans) must be installed on your system.

```bash
# Install Noto CJK fonts on Debian/Ubuntu
sudo apt install fonts-noto-cjk
```

#### For HTML output
Install [pandoc](https://pandoc.org/installing.html) version 3.0 or later:

```bash
# Debian/Ubuntu
sudo apt install pandoc

# macOS
brew install pandoc
```

---

### Building

```bash
# Build everything (PDF × 3 + HTML × 2)
make

# Build PDFs only
make pdf

# Build HTML only
make html

# Remove auxiliary LaTeX files (keep PDFs/HTML)
make clean

# Remove all generated files
make distclean
```

Individual compilations:

```bash
# English PDF
pdflatex paper_en && bibtex paper_en && pdflatex paper_en && pdflatex paper_en

# Spanish PDF
pdflatex paper_es && bibtex paper_es && pdflatex paper_es && pdflatex paper_es

# Chinese PDF (requires XeLaTeX)
xelatex paper_zh && bibtex paper_zh && xelatex paper_zh && xelatex paper_zh
```

The HTML output appears in the `html/` directory with a bundled stylesheet
at `html/assets/paper.css`. Equations are rendered by MathJax (loaded from
CDN); an internet connection is required to view them in the browser.

---

## Mathematical Content

The paper derives or cites, from first principles, the following key equations:

| Symbol | Equation | Section |
|--------|----------|---------|
| Vis-viva | $v^2 = GM(2/r - 1/a)$ | §2 |
| Tsiolkovsky | $\Delta v = v_e \ln(m_0/m_f)$ | §3 |
| Hohmann $\Delta v$ | $\Delta v_{1,2}$ explicit form | §4 |
| Radiation pressure | $P_\text{rad} = L_\odot / (4\pi d^2 c)$ | §5 |
| Lorentz factor | $\gamma = (1-\beta^2)^{-1/2}$ | §6 |
| Relativistic rocket | $(m_0/m_f) = [(1+\beta)/(1-\beta)]^{c/2v_e}$ | §6 |
| Rindler trajectory | $x(\tau), t(\tau), v(\tau)$ | §6 |
| One-way relativistic transit | $\tau = 2(c/a)\cosh^{-1}(aD/2c^2+1)$ | §6 |
| Dust-grain impact energy | $E_g = (\gamma-1)m_g c^2$ | §6 |
| Ramjet terminal speed | $v_{\max} \approx c\sqrt{2\eta_f\varepsilon}$ | §5 |
| Drake equation | $N = R_* f_p n_e f_l f_i f_c L$ | §7 |
| Kardashev continuous | $K = (\log_{10} P_W - 6)/10$ | §7 |
| Friis transmission | $P_r = P_t G_t G_r (\lambda/4\pi d)^2$ | §8 |
| Shannon capacity | $C = B \log_2(1 + \text{SNR})$ | §8 |
| Landauer principle | $\Delta Q \ge k_B T \ln 2$ | §11 |

---

## Licence

This work is released under the **Creative Commons Attribution 4.0
International** licence (CC BY 4.0). You are free to share and adapt the
material for any purpose, provided appropriate credit is given to the author.

---

## Citation

```bibtex
@article{GitHubCopilot2026,
  author  = {{GitHub Copilot}},
  title   = {From Earth to the Stars: A Mathematical Framework for
             Interplanetary Travel, Interstellar Navigation, and Contact
             with Extraterrestrial Civilizations},
  year    = {2026},
  month   = {April},
  note    = {GitHub repository:
             \url{https://github.com/thepaper}}
}
```
