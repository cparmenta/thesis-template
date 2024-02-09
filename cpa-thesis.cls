\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cpa-thesis}[PhD thesis class by Carlos Pérez Armenta]

\LoadClass[12pt]{book}

\RequirePackage[a4paper,
                inner=3.18cm,
                outer=2.54cm,
                top=2.54cm,
                bottom=2.54cm,
                headheight=15pt
                ]{geometry}  % APA Margins
\renewcommand{\baselinestretch}{1.2}
\RequirePackage[skip=2mm, indent=5mm]{parskip}
%%%%%% OPTION PROCESSING %%%%%%%

\newif\ifetsittfe
\etsittfefalse

\newif\ifusingspanish
\usingspanishfalse

\newif\ifusingminted
\usingmintedfalse

\DeclareOption{review}{%
    \geometry{papersize={250mm,297mm},
              inner=3.18cm,
              outer=6.54cm,
              top=2.54cm,
              bottom=2.54cm,
              headheight=15pt}
    \renewcommand{\baselinestretch}{1.75} }

\DeclareOption{etsit-tfe}{\etsittfetrue}

\DeclareOption{spanish}{%
    \usingspanishtrue
    \@expandtwoargs\@removeelement{english}\@classoptionslist\@classoptionslist
}

\DeclareOption{minted}{\usingmintedtrue}

\ProcessOptions\relax

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
\RequirePackage{upgreek}
\RequirePackage{siunitx} 	% Paquete para magnitudes y unidades físicas
\RequirePackage{csquotes}
\RequirePackage{microtype}
\ifusingspanish
    \RequirePackage[spanish, es-tabla]{babel}
    \addto{\captionsspanish}{
	\renewcommand{\contentsname}{Índice} }
\fi

% Style and format

\RequirePackage{fancyhdr}
\RequirePackage{emptypage}
\RequirePackage[explicit]{titlesec}
\RequirePackage{xcolor}
\RequirePackage[backend=biber, style=numeric-comp, sorting=none, maxcitenames=99]{biblatex}
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
\RequirePackage[toc, acronym, nopostdot]{glossaries}
\RequirePackage{tocbibind}  % Add lof and lot to toc
\RequirePackage{booktabs}

%% Include papers, other documents in pdf
\RequirePackage{pdfpages}

\ifusingminted
    \RequirePackage{minted}
    \usemintedstyle{perldoc}
    \definecolor{dhscodebg}{rgb}{1,0.9922,0.95}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Default definitions
\def\@University{Universidad de Málaga}
\def\@Faculty{Escuela Técnica Superior de Ingeniería de Telecomunicación}
\def\@Program{Programa de doctorado en Ingeniería de Telecomunicación}

\def\@ThesisType{Ph.D. Thesis}

\def\@Supervisor{Advisor 1}

%% Colors!
\definecolor{uma-blue}{HTML}{002e5d}    % Pantone 648 C
\definecolor{uma-lblue}{HTML}{00aec7}   % Pantone 3125 C
\definecolor{uma-gray}{HTML}{63666a}    % Pantone Cool Gray 10
\definecolor{uma-lgray}{HTML}{969491}   % Pantone Cool Gray 8
\definecolor{uma-pink}{HTML}{cc0066}    % -

%% ------- Commands -------

% Protect toc margins from bad hyphenations exceeding margins
\addtocontents{toc}{\protect\sloppy}
\addtocontents{lof}{\protect\sloppy}
\addtocontents{lot}{\protect\sloppy}


% Redefine title page variables
\def\University#1{\gdef\@University{#1}}
\def\Faculty#1{\gdef\@Faculty{#1}}
\def\Program#1{\gdef\@Program{#1}}
\def\ThesisType#1{\gdef\@ThesisType{#1}}

\def\Supervisor#1{\gdef\@Supervisor{#1}}

\newif\ifcosupervisor
\cosupervisorfalse
\newcommand{\CoSupervisor}[1]{%
    \def\@CoSupervisor{#1}
    \cosupervisortrue
}

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



%% ---------- Abstract pages ------------

\ifetsittfe
    \def\@TitleES{<Título del TFE en español>}
    \def\@TitleEN{<TFE title in english>}
    
    \ifusingspanish
        \gdef\@title{\@TitleES}
    \else
        \gdef\@title{\@TitleEN}
    \fi

    \def\@AbstractES{%
    Utilizar los siguientes comandos para completar esta página: 
    \begin{description}
        \item[\texttt{\char`\\titleES\{\}}] El título del TFE.
        \item[\texttt{\char`\\author\{\}}] Nombre del autor/a.
        \item[\texttt{\char`\\Supervisor\{\}}] Nombre del tutor/a.
        \item[\texttt{\char`\\CoSupervisor\{\}}] Nombre del co-tutor/a.
        \item[\texttt{\char`\\Department\{\}}] Nombre del departamento en el que se realiza el TFE.
        \item[\texttt{\char`\\Program\{\}}] Titulación en la que está matriculado el autor.
        \item[\texttt{\char`\\KeywordsES\{\}}] Lista de palabras clave en español separadas por comas.
        \item[\texttt{\char`\\AbstractES\{\}}] Resumen en español. Se recomienda que no exceda esta página.
    \end{description}
    }
    \def\@AbstractEN{%
    Use the following commands to complete this page: 
    \begin{description}
        \item[\texttt{\char`\\titleEN\{\}}] Title of this work.
        \item[\texttt{\char`\\title\{\}}] Author's name.
        \item[\texttt{\char`\\Supervisor\{\}}] Supervisor's name.
        \item[\texttt{\char`\\CoSupervisor\{\}}] Co-supervisor's name.
        \item[\texttt{\char`\\Department\{\}}] Department in which this work has been realized.
        \item[\texttt{\char`\\Program\{\}}] The university program.
        \item[\texttt{\char`\\KeywordsEN\{\}}] List of keywords separated by commas.
        \item[\texttt{\char`\\AbstractEN\{\}}] Abstract in english. It should not exceed this page.
    \end{description}
    }
    \def\@Department{<Nombre del departamento>}
    \def\@KeywordsES{Palabra clave 1, Palabra clave 2, Palabra clave 3}
    \def\@KeywordsEN{Keyword 1, Keyword 2, Keyword 3}

    \newcommand{\TitleES}[1]{\gdef\@TitleES{#1}}
    \newcommand{\TitleEN}[1]{\gdef\@TitleEN{#1}}
    \newcommand{\AbstractES}[1]{\gdef\@AbstractES{#1}}
    \newcommand{\AbstractEN}[1]{\gdef\@AbstractEN{#1}}
    \newcommand{\Department}[1]{\gdef\@Department{#1}}
    \newcommand{\KeywordsES}[1]{\gdef\@KeywordsES{#1}}
    \newcommand{\KeywordsEN}[1]{\gdef\@KeywordsEN{#1}}

    \newcommand{\PrintAbstractES}{%
        \begin{center}
            \scshape
            E.T.S. de Ingeniería de Telecomunicación, Universidad de Málaga
        \end{center}
        
        \bigskip
        
        \begin{center}
            \Large \scshape
            \textbf{\@TitleES}
        \end{center}
        
        \bigskip \bigskip \bigskip
        
        \begin{minipage}{0.9\textwidth}
        
        \textbf{Autor/a:} \@author
        
        \medskip
        
        \textbf{Tutor/a:} \@Supervisor
        
        \medskip
        
        \ifcosupervisor
            \textbf{Co-supervisor:} \@CoSupervisor   
            \medskip
        \fi
        
        \textbf{Departamento:} \@Department
        
        \medskip
        
        \textbf{Titulación:} \@Program
        
        \medskip
        
        \textbf{Palabras clave:} \@KeywordsES
        
        \bigskip \bigskip
        
        \end{minipage}
        
        \begin{center}
            \textbf{Resumen}
        \end{center}
        
        \noindent
        \@AbstractES
        
    }

    \newcommand{\PrintAbstractEN}{%
        \begin{center}
            \scshape
            E.T.S. de Ingeniería de Telecomunicación, Universidad de Málaga
        \end{center}
        
        \bigskip
        
        \begin{center}
            \Large \scshape
            \textbf{\@TitleEN}
        \end{center}
        
        \bigskip \bigskip \bigskip
        
        \begin{minipage}{0.9\textwidth}
        
        \textbf{Author:} \@author
        
        \medskip
        
        \textbf{Supervisor:} \@Supervisor
     
        \medskip

        \ifcosupervisor
            \textbf{Co-supervisor:} \@CoSupervisor   
            \medskip
        \fi
        
        %\textbf{Cotutor:} <Nombre del cotutor>\ (elimina esta línea si no hay cotutor)
        %
        %\medskip
        
        \textbf{Department:} \@Department
        
        \medskip
        
        \textbf{Degree:} \@Program
        
        \medskip
        
        \textbf{Keywords:} \@KeywordsEN
        
        \bigskip \bigskip
        
        \end{minipage}
        
        \begin{center}
            \textbf{Abstract}
        \end{center}
        
        \noindent
        \@AbstractEN
        
    }
\fi

%% ------ Title page ------

\ifetsittfe
    \def\@City{Málaga}
    \newcommand{\City}[1]{\gdef\@City{#1}}

    \renewcommand*{\maketitle}{%
        \begin{titlepage}
        \begin{center}
            \Large \scshape
            \@University\\
            \bigskip
            \@Faculty
        \end{center}

        \bigskip

        \bigskip

        \bigskip \bigskip \bigskip \bigskip

        \begin{center}
            \Large \scshape
            \@ThesisType
        \end{center}

        \bigskip \bigskip \bigskip \bigskip

        \begin{center}
            \LARGE \scshape
            \@title %Actualizar esta variable en A2.Preambulo.comandos.tex
        \end{center}

        \vfill

        \begin{center}
            \Large \scshape
            \@Program
        \end{center}

        \vspace{3cm}
    %	\vfill


    %	{\large Málaga, \tfganno \hfill \tfgauthorname}
        \begin{flushright}
            \large \scshape
            \@author \\%Actualizar esta variable en A2.Preambulo.comandos.tex
            \@City, \@date %Actualizar esta variable en A2.Preambulo.comandos.tex
        \end{flushright}
        \end{titlepage}
        
        \cleardoublepage
        \PrintAbstractES
        \cleardoublepage
        \PrintAbstractEN
    }
\else
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


        \footnotesize 
            \ifcosupervisor
                \textbf{SUPERVISORS}\\
            \else
                \textbf{SUPERVISOR}\\
            \fi
        \large \@Supervisor \\
        \ifcosupervisor
            \@CoSupervisor
        \fi

        \vfill
        \normalsize
        \@date

        \end{titlepage}
    }
\fi
