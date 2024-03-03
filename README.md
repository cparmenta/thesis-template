# Latex template for BSc/MSc/PhD thesis

This is the template I used for my MSc and PhD thesis. Download the file `cpa-thesis.cls` to your Latex project root and load it using the `\documentclass` command:

```latex
\documentclass[options]{cpa-thesis}
```

See and compile the example files for detailed usage.

## Class options

- `review`: Adds extra space to the margin and increases the line spacing. Handy for handwritten comments of your supervisors.

- `spanish`: Sets the document language to spanish plus some defaults ("Índice" en lugar de "Índice general", "Tabla" en lugar de "Cuadro", etc.). If not specified, babel is loaded with english language.

- `etsit-tfe`: Replaces the title page by the obligatory one at ETSIT UMA and adds abstract pages. Use the proper commands to fill the information.

- `minted`: Loads the minted package. Requires python, pygments and the -shell-escape flag in the latex compiler. See [minted documentation](https://texdoc.org/serve/minted.pdf/0) and [Overleaf help page](https://overleaf.com/learn/latex/Code_Highlighting_with_minted) for more information. A light yellow background color is defined (`dhscodebg`: rgb(1, 0.9922, 0.95) ).

## Logo

Replace the `assets/university.pdf` file to change the logo at the title page.

## Commands

### General

- `\title{}`, `\author{}`, `\date{}`: use standard Latex commands to specify the title, the author's name and the date.

- `\University{}`, `\Faculty{}`, `\Program{}`, `ThesisType{}`: set the university and faculty name, the degree name and the kind of thesis (BSc. Thesis, PhD Thesis, etc.).

- `\Supervisor{}`, `\CoSupervisor{}` (optional): set the name of your supervisor and (optionally) your co-supervisor.

- `\setthesistitlefont{A}{B}`: set the font size of the thesis title in the title page (see the `\fontsize{A}{B}` command documentation).

### Specifics for the `etsit-tfe` option

- `\TitleES{}`, `TitleEN{}`: set the spanish and english title of the document. If the `spanish` option is set, it will choose the appropiate title in the title page. Do not use the `\title{}` command when using the `etsit-tfe` option.

- `\Department{}`: set the department where the thesis has been developed.

- `\KeywordsES{}`, `\KeywordsEN{}`: specify the keywords of the work in spanish and english, respectively. E.g.,
```latex
\KeywordsES{First keyword, second keyword, third keyword}
```

- `\AbstractES{}`, `\AbstractEN{}`: set the english and spanish abstracts.

## List of loaded packages (options)

- geometry
- babel
- inputenc (utf8)
- fontenc (T1)
- lmodern
- type1cm
- anyfontsize
- charter
- mathdesign (charter)
- amsmath
- upgreek
- siunitx
- csquotes
- microtype

- fancyhdr
- emptypage
- titlesec (explicit)
- xcolor
- tcolorbox
- biblatex (
    - backend=biber,
    - style=ieee,
    - citestyle=numeric-comp,
    - sorting=none,
    - maxcitenames=99,
    - maxbibnames=99
    )
- hyperref (pdftex,bookmarksnumbered,hidelinks)
- url

- graphicx
- caption (
    - format=plain,
    - labelformat=default,
    - labelsep=quad,
    - font=footnotesize,
    - labelfont=bf,
    - textfont={},
    - margin=1cm,
    - indention=0pt,
    - parindent=0pt,
    - hangindent=0pt,
    - singlelinecheck=true
    )
- subcaption
- multicol
- multirow
- glossaries (toc, acronym, nopostdot)
- tocbibind
- booktabs
- pdfpages

## Miscelaneous

### Colors
The following colors are defined:
- `uma-blue`: #002e5d (Pantone 648 C)
- `uma-lblue`: #00aec7 (Pantone 3125 C)
- `uma-gray`: #63666a (Pantone Cool Gray 10)
- `uma-lgray`: #969491 (Pantone Cool Gray 8)
- `uma-pink`: #cc0066 

Example usage:
```latex
\textcolor{uma-pink}{emphasized text}
```

### Bibliography

- Fullcite and highlight
When using the `\fullcite` command, it is possible to highlight the nth author(s). [[Source](https://tex.stackexchange.com/questions/445029/higlight-a-desired-n-th-author-in-fullcites-in-cleanthesis)]

```latex
\highlightnames{<author number>}  % Can be used more than once
\highlightnames*{<author number>} % Reset the hightlight list before appending the number
\resetnamehightlights             % Self-explanatory
```

- Header style
The fancypage style "bibliography" is defined. When printing the bibliography use:
```latex
\clearpage \pagestyle{bibliography}
\printbibliography
```
