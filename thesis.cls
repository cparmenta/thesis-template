\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[My PhD thesis class]

\LoadClass[11pt]{book}

%% ------ Packages --------

% Fonts and text
\RequirePackage[utf8]{inputenc}
\RequirePackage{charter}
\RequirePackage[charter]{mathdesign}
\let\circledS\undefined

% Style and format
\usepackage[a4paper, total={6in, 9in}]{geometry}


% Figures
\RequirePackage{graphicx}




%% Default definitions
\def\@University{Universidad de Málaga}
\def\@Faculty{Escuela Técnica Superior de Ingeniería de Telecomunicación}
\def\@Program{Programa de doctorado en Ingeniería de Telecomunicación}

\def\@ThesisType{Thesis by compendium of publications}

\def\@Advisors{%
    {Advisor 1} \\
    {Advisor 2}
}

%% ------- Commands -------

\renewcommand{\baselinestretch}{1.1}

% Redefine title page variables
\def\University#1{\gdef\@University{#1}}
\def\Faculty#1{\gdef\@Faculty{#1}}
\def\Program#1{\gdef\@Program{#1}}
\def\ThesisType#1{\gdef\@ThesisType{#1}}

\def\Advisors#1{\gdef\@Advisors{#1}}



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
    \includegraphics[width=4cm]{assets/uma.pdf}
    \vspace{2cm}

    \upshape \MakeUppercase{\@ThesisType}
    

    \scshape \LARGE \bfseries \@title \mdseries

    \vspace{3cm}
    \upshape
    \footnotesize \textbf{AUTHOR}\\
    \normalsize \@author \\

    \vspace{1cm}


    \footnotesize \textbf{ADVISORS}\\
    \normalsize \@Advisors \\

    \vfill
    \@date

    \end{titlepage}
}

%% ------ Papers ----------


%% -- Chapter formatting --
