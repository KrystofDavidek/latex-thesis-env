#!/bin/bash

MAIN="bakalarka"

echo -e "\n\n### Converting Markdown to LaTeX ###\n\n"

for FILE in src/*.md; do
  pandoc ${FILE} -o "${FILE%.md}.tex"
  vlna -r -l -v KkSsVvZzOoUuAaIi "${FILE%.md}.tex"
  sed -ie 's/\s\\autocite/~\\autocite/g' "${FILE%.md}.tex"
  sed -ie 's/\\section/\\chapter/g' "${FILE%.md}.tex"
  sed -ie 's/\\subsection/\\section/g' "${FILE%.md}.tex"
  sed -ie 's/\\subsubsection/\\subsection/g' "${FILE%.md}.tex"
done

echo -e "\n\n### Doing LaTeX magic ###\n\n"

latexmk -pdf ${MAIN}.tex
rm "${FILE%.md}.texe" "${FILE%.md}.aux"
evince ${MAIN}.pdf



