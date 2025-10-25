# LaTeX CV

You can find here my resume made with love using [LaTeX](https://www.latex-project.org/) and the nice resume template [limecv](https://github.com/opieters/limecv).
Its also my first time writing a LaTeX document.
Last up to date resume are available in [releases](https://github.com/banthony42/cv/releases).

## Install dependencies

```
sudo apt-get update
sudo apt-get install texlive-full
```

## Generate Resume

```
make pdf
```

## Dev notes

`tlmgr` is the package manager to TeX Live:

```
# Init usermode for `tlmgr` to allow install packages.
tlmgr init-usertree
```

#### texlive-full

- Removing or purging `texlive-full` apt package may cause some issue:
  I land with two `tlmgr` installed even after apt purge on `texlive-full`
  `sudo apt-get remove texlive-base` solved the issue.

#### limecv usage

**Disclaimer** these issues was encountered after bad TeX Live installation, while following this [tutorial](https://zestedesavoir.com/tutoriels/826/introduction-a-latex/1319_creer-vos-premiers-documents/5786_installation-et-premiers-pas/).
A clean install with `texlive-full` package may prevent all these issues.

- `pdflatex` complaining about missing `limecv.sty`
  - [x] Fixed : `\usepackage{limecv}` seems to the right way to use the package.
- `pdflatex` complaining about missing `xstring.sty`
  - [x] Fixed : `tlmgr install xstring`
- `pdflatex` complaining with : `! LaTeX Error: File 'fontawesome5.sty' not found`
  - [x] Fixed : running install scripts from github repo of limecv
- Install `optional` package to be able to write CV in english and french in same document.

```
tlmgr install optional
```

#### Build flavor

```
sudo apt install latexmk
latexmk -pdf cv       # build cv.tex pdf using pdflatex
latexmk -pdfxe cv     # build cv.tex pdf using xetex
latexmk -pvc -pdf cv  # build cv.tex pdf live loop (detect any changes) thanks to `-pvc`
```

## Credits

- [opieters/limecv](https://github.com/opieters/limecv)
- [ctan/limecv](https://ctan.org/pkg/limecv)
- [doc/limecv](https://ctan.mines-albi.fr/macros/latex/contrib/limecv/limecv.pdf)
- [includegraphics](https://www.learnlatex.org/en/lesson-07)
- [zestedesavoir/introduction-a-latex](https://zestedesavoir.com/tutoriels/826/introduction-a-latex/1319_creer-vos-premiers-documents/5786_installation-et-premiers-pas/)
