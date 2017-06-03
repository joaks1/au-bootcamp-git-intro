#!/bin/sh

currentdir="$(pwd)"

cd ..

pandoc -N \
    --template util/pandoc-util/pandoc-template.latex \
    util/exercise-title.md \
    README.md \
    -o util/exercise.pdf

cd "$currentdir"
