\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cpa-thesis}[PhD thesis class by Carlos Pérez Armenta]

\LoadClass[12pt]{book}

%% ------ Packages --------

% Fonts and text
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{type1cm}
\RequirePackage{anyfontsize}
\RequirePackage{charter}
\RequirePackage[charter]{mathdesign}
\let\circledS\undefined
\RequirePackage{amsmath} 	% Paquetes estándar
\DeclareMathAlphabet{\mathbfcal}{OMS}{cmsy}{b}{n}
\RequirePackage{siunitx} 	% Paquete para magnitudes y unidades físicas

% Style and format
\RequirePackage[a4paper, inner=3.18cm, outer=2.54cm, top=2.54cm, bottom=2.54cm]{geometry}  % APA Margins
\RequirePackage{fancyhdr}
\RequirePackage{emptypage}
\RequirePackage[explicit]{titlesec}
\RequirePackage{xcolor}
\RequirePackage[backend=biber, style=ieee, sorting=none, maxcitenames=99]{biblatex}
\RequirePackage[pdftex,bookmarksnumbered,hidelinks]{hyperref} % Hyper-references
\RequirePackage{url}
\setcounter{biburllcpenalty}{7000}
\setcounter{biburlucpenalty}{8000}


% Figures, tables, captions...
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage[format=plain,
                labelformat=default,
                labelsep=quad,
                font=footnotesize,
                labelfont=bf,
                textfont={},
                margin=1cm,
                indention=0pt,
                parindent=0pt,
                hangindent=0pt,
                singlelinecheck=true]{caption} % Custom captions
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage[toc, acronyms]{glossary}

%% Include papers, other documents in pdf
\RequirePackage{pdfpages}



%% Default definitions
\def\@University{Universidad de Málaga}
\def\@Faculty{Escuela Técnica Superior de Ingeniería de Telecomunicación}
\def\@Program{Programa de doctorado en Ingeniería de Telecomunicación}

\def\@ThesisType{Ph.D. Thesis}

\def\@Advisors{%
    {Advisor 1} \\
    {Advisor 2}
}

%% Colors!
\definecolor{uma-blue}{HTML}{002e5d}    % Pantone 648 C
\definecolor{uma-lblue}{HTML}{00aec7}   % Pantone 3125 C
\definecolor{uma-gray}{HTML}{63666a}    % Pantone Cool Gray 10
\definecolor{uma-lgray}{HTML}{969491}   % Pantone Cool Gray 8
\definecolor{uma-pink}{HTML}{cc0066}    % -

%% ------- Commands -------

\renewcommand{\baselinestretch}{1.1}

% Protect toc margins from bad hyphenations exceeding margins
\addtocontents{toc}{\protect\sloppy}
\addtocontents{lof}{\protect\sloppy}
\addtocontents{lot}{\protect\sloppy}


% Redefine title page variables
\def\University#1{\gdef\@University{#1}}
\def\Faculty#1{\gdef\@Faculty{#1}}
\def\Program#1{\gdef\@Program{#1}}
\def\ThesisType#1{\gdef\@ThesisType{#1}}

\def\Advisors#1{\gdef\@Advisors{#1}}

\def\@ThesisTitleFontSize{28}
\def\@ThesisTitleFontSkip{25}

\newcommand{\setthesistitlefont}[2]{%
    \gdef\@ThesisTitleFontSize{#1}
    \gdef\@ThesisTitleFontSkip{#2}
}


%% ---- Header style ------

\def\chaptermark#1{%
      \markboth {%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            %\@chapapp\ \thechapter. \ %
          \fi
        \fi
        #1}{}}%

\fancypagestyle{plain}{%
\fancyhead[LE,RE,LO,RO]{}
\fancyfoot[CE, CO]{}
\fancyfoot[RO, LE]{\thepage}}

\pagestyle{fancy}
    \fancyfoot[RO, LE]{\thepage}
    \fancyfoot[CE, CO]{}
    \fancyhead[LE]{\textcolor{uma-gray}{\nouppercase{\rightmark}}}
    \fancyhead[RE]{}
    \fancyhead[LO]{}
    %\fancyhead[RE]{Parte \thepart \rightmark} %
    \fancyhead[RO]{\textcolor{uma-gray}{\leftmark}} %
    \renewcommand{\headrulewidth}{0pt}



%% ---- Chapter style -----

\newcommand{\chaptersize}{30}
\newcommand{\setchaptersize}[1]{\renewcommand{\chaptersize}{#1}}

\titleformat
{\chapter}                  % command
[display]                   % shape
{\normalfont\Huge\rmfamily} % format
{%                          % Label
    \flushright
    {%
        \fontsize{4cm}{1cm}\selectfont
        \bfseries
        \raisebox{0.7ex}{\fontsize{30}{30}\selectfont \textcolor{uma-blue}{\chaptertitlename}}%
        \textcolor{uma-lblue}{\thechapter}% loading comment - please do not delete :)
    }
}
{0.5ex}                     % sep
{%                          % Before code
    \vspace{1ex}
    \flushleft
    \scshape
    \bfseries
    {%
        \fontsize{\chaptersize}{1pt}\selectfont
        \textcolor{uma-blue}{#1}
    }
} 
[%                          % After code
    \vspace{-0.5ex}%
]
\titlespacing*{\chapter}{0pt}{0cm}{3.5cm}


%% ------ Title page ------

\renewcommand*{\maketitle}{%
    \begin{titlepage}
        %This to align on the left the text and on the right the image
    \centering

    \scshape 
    \Large \@University \\
    \large \@Faculty \\
    \small \@Program \\

    \vspace{2cm}
    \includegraphics[width=4cm]{assets/university.pdf}
    \vspace{2cm}

    \upshape \textcolor{uma-gray}{\MakeUppercase{\bfseries \@ThesisType}} \\
    \vspace{2mm}
    

    \scshape \bfseries \fontsize{\@ThesisTitleFontSize}{\@ThesisTitleFontSkip}\selectfont \textcolor{uma-blue}{ \@title} \mdseries

    \vspace{3cm}
    \upshape
    \footnotesize \textbf{AUTHOR}\\
    \large \@author \\

    \vspace{1cm}


    \footnotesize \textbf{ADVISORS}\\
    \large \@Advisors \\

    \vfill
    \normalsize
    \@date

    \end{titlepage}
}

