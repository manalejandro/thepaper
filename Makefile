# =============================================================================
# Makefile — From Earth to the Stars
# Builds PDF and HTML versions of the paper in all three languages.
#
# Requirements:
#   PDF:  TeX Live >= 2022  (pdflatex, xelatex, bibtex)
#         Packages: amsmath, amssymb, mathtools, bm, geometry, lmodern,
#                   microtype, xcolor, tikz, pgfplots, booktabs, tabularx,
#                   multirow, float, caption, siunitx, natbib, hyperref,
#                   setspace, fancyhdr, titlesec, enumitem, ctex (for ZH)
#   HTML: pandoc >= 3.0  (converts LaTeX → HTML5 with MathJax)
#
# Usage:
#   make          → build all PDFs and HTML pages
#   make pdf      → build PDFs only (EN + ES + ZH)
#   make html     → build HTML only (EN + ES)
#   make clean    → remove auxiliary files
#   make distclean → remove all generated files including PDFs and HTML
# =============================================================================

PDFLATEX  = pdflatex
XELATEX   = xelatex
BIBTEX    = bibtex
PANDOC    = pandoc

LATEXFLAGS  = -interaction=nonstopmode -halt-on-error
PANDOCFLAGS = --standalone \
              --mathjax \
              --toc \
              --metadata title="" \
              --css assets/paper.css \
              -f latex \
              -t html5

# Output directory for HTML assets
HTMLDIR = html

# Source files
EN_SRC  = paper_en.tex
ES_SRC  = paper_es.tex
ZH_SRC  = paper_zh.tex
BIB     = references.bib

# Targets
EN_PDF  = paper_en.pdf
ES_PDF  = paper_es.pdf
ZH_PDF  = paper_zh.pdf
EN_HTML = $(HTMLDIR)/paper_en.html
ES_HTML = $(HTMLDIR)/paper_es.html

# =============================================================================
.PHONY: all pdf html clean distclean assets

all: pdf html

pdf: $(EN_PDF) $(ES_PDF) $(ZH_PDF)

html: assets $(EN_HTML) $(ES_HTML)

# --- English PDF (pdflatex) --------------------------------------------------
$(EN_PDF): $(EN_SRC) $(BIB)
	$(PDFLATEX) $(LATEXFLAGS) paper_en
	$(BIBTEX)   paper_en
	$(PDFLATEX) $(LATEXFLAGS) paper_en
	$(PDFLATEX) $(LATEXFLAGS) paper_en

# --- Spanish PDF (pdflatex) --------------------------------------------------
$(ES_PDF): $(ES_SRC) $(BIB)
	$(PDFLATEX) $(LATEXFLAGS) paper_es
	$(BIBTEX)   paper_es
	$(PDFLATEX) $(LATEXFLAGS) paper_es
	$(PDFLATEX) $(LATEXFLAGS) paper_es

# --- Chinese PDF (xelatex — required for ctex / CJK fonts) ------------------
$(ZH_PDF): $(ZH_SRC) $(BIB)
	$(XELATEX)  $(LATEXFLAGS) paper_zh
	$(BIBTEX)   paper_zh
	$(XELATEX)  $(LATEXFLAGS) paper_zh
	$(XELATEX)  $(LATEXFLAGS) paper_zh

# --- HTML (pandoc) -----------------------------------------------------------
$(HTMLDIR):
	mkdir -p $(HTMLDIR)

assets: $(HTMLDIR)
	@mkdir -p $(HTMLDIR)/assets
	@echo "/* paper.css — Minimal stylesheet for HTML output */" \
	  > $(HTMLDIR)/assets/paper.css
	@echo "body { max-width: 860px; margin: 2em auto; font-family: Georgia, serif;" \
	  "font-size: 1.05em; line-height: 1.7; padding: 0 1.2em; color: #222; }" \
	  >> $(HTMLDIR)/assets/paper.css
	@echo "h1,h2,h3 { font-family: 'Helvetica Neue', Arial, sans-serif; }" \
	  >> $(HTMLDIR)/assets/paper.css
	@echo "table { border-collapse: collapse; margin: 1.2em auto; }" \
	  >> $(HTMLDIR)/assets/paper.css
	@echo "th,td { border: 1px solid #ccc; padding: 0.35em 0.7em; }" \
	  >> $(HTMLDIR)/assets/paper.css
	@echo "th { background: #f0f0f0; }" \
	  >> $(HTMLDIR)/assets/paper.css
	@echo "code,tt { background: #f8f8f8; padding: 0.1em 0.3em; border-radius: 3px; }" \
	  >> $(HTMLDIR)/assets/paper.css
	@echo "figure { text-align: center; margin: 1.5em 0; }" \
	  >> $(HTMLDIR)/assets/paper.css
	@echo "figcaption { font-style: italic; font-size: 0.9em; color: #555; }" \
	  >> $(HTMLDIR)/assets/paper.css
	@echo ".abstract { border-left: 3px solid #888; padding-left: 1em;" \
	  "margin: 1.5em 2em; font-style: italic; }" \
	  >> $(HTMLDIR)/assets/paper.css

$(EN_HTML): $(EN_SRC) $(BIB) | $(HTMLDIR)
	$(PANDOC) $(PANDOCFLAGS) \
	  --metadata lang=en \
	  -o $@ $<

$(ES_HTML): $(ES_SRC) $(BIB) | $(HTMLDIR)
	$(PANDOC) $(PANDOCFLAGS) \
	  --metadata lang=es \
	  -o $@ $<

# Note: Pandoc HTML output for Chinese requires font adjustments.
# Building paper_zh.pdf via xelatex is the recommended output for Chinese.

# --- Cleanup -----------------------------------------------------------------
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lot *.lof \
	      *.fdb_latexmk *.fls *.synctex.gz *.nav *.snm *.vrb

distclean: clean
	rm -f $(EN_PDF) $(ES_PDF) $(ZH_PDF)
	rm -rf $(HTMLDIR)
