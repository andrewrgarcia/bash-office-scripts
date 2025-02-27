#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: pdtex file.tex"
    exit 1
fi

TEXFILE="$1"
BASENAME="${TEXFILE%.tex}"
EXTS=("aux" "log" "toc" "out" "nav" "snm" "bbl" "blg" "fls" "fdb_latexmk")


# pdflatex -interaction=nonstopmode -halt-on-error "$TEXFILE"

# dont halt on error
pdflatex "$TEXFILE"


# Remove auxiliary files
for ext in "${EXTS[@]}"; do
    rm -f "$BASENAME.$ext"
done

echo "Compiled $TEXFILE to $BASENAME.pdf and cleaned auxiliary files."
