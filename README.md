# LateX learning notes

## Install

- Create install directory:

```
mkdir -p ~/Latex
```

- TexLive installed following this [tutorial](https://zestedesavoir.com/tutoriels/826/introduction-a-latex/1319_creer-vos-premiers-documents/5786_installation-et-premiers-pas/) (update installation path with folder created in last step)
- Add LateX install folder to `$PATH`
- Init usermode for `tlmgr` to allow install packages.

```
 tlmgr init-usertree
```

#### Warning

- Installing `texlive-full` then removing/purging it may cause some issue.
- I land with two `tlmgr` installed even after apt purge on `texlive-full`
- `sudo apt-get remove texlive-base` solved the issue

## Trying to use limecv

- `pdflatex` complaining about missing `limecv.sty`
  => Solved : `\usepackage{limecv}` seems to the right way to use the package.
  </br>
- Trying to compile the example from the `limecv` github.
  </br>
- `pdflatex` complaining about missing `xstring.sty`
  => Solved : `tlmgr install xstring`
  </br>
- `pdflatex` complaining with :
  `! LaTeX Error: File 'fontawesome5.sty' not found`
  => Solved : running install scripts from github repo of limecv
- Install `optional` package to be able to write CV in english and french in same document.

#### Build

```
sudo apt install latexmk
latexmk -pdf cv       # build cv.tex pdf using pdflatex
latexmk -pdfxe cv     # build cv.tex pdf using xetex
latexmk -pvc -pdf cv  # build cv.tex pdf live loop (detect any changes) thanks to `-pvc`
```
