#!/bin/sh

pandoc \
    --template pandoc-util/pandoc-template.latex \
    homework.md \
    -o homework.pdf
