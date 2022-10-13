%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% File:     thesis.cls           (LaTeX Document class option "thesis")
%          
% Author:  Jakub Zaprzałka      (j.zaprzalka@student.pb.edu.pl)
%          Białystok University of Technology, Białystok, POLAND
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}

\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{mbook}
}
\ExecuteOptions{magisterska,a4paper,12pt,oneside}
\ProcessOptions

\LoadClass[oneside,12pt]{mbook}

\RequirePackage[OT4,plmath]{polski}
\RequirePackage{graphicx}
\RequirePackage[tableposition=top]{caption}
\RequirePackage{listings}
\RequirePackage{multirow}
\RequirePackage[linesnumbered,ruled]{algorithm2e}
\RequirePackage{tikz}
\RequirePackage{indentfirst}
\RequirePackage{t1enc}
\RequirePackage{times}
\RequirePackage{pdfpages}
\RequirePackage{url}
\RequirePackage{xcolor}

\urlstyle{same}

\pagestyle{headings}
\parindent=1cm
\linespread{1.5}


% ==============================
% Ustawienia listingów
% ==============================

\definecolor{comment}{rgb}{0,0.4,0}

\lstdefinestyle{listing_style}{
    commentstyle=\color{comment},
    keywordstyle=\color{blue}\bfseries,
    numberstyle=\tiny\color{gray},
    stringstyle=\color{red!50!brown},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                   
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=4,
}

\lstset{style=listing_style}


% ==============================
% Odstępy
% ==============================

\hoffset -1 in
\textwidth 15.5 cm
\voffset -1 in
\textheight 23.5 cm
\oddsidemargin = 3.5cm
\evensidemargin = 3.5cm
\topmargin = 1.5 cm

% ==============================
% Strona tytułowa 
% ==============================

\def\katedra#1      {\gdef\@katedra{#1}}
\def\thesistype#1   {\gdef\@thesistype{#1}}
\def\subject#1{
    \gdef\@subject{#1}
    \title{#1}
}
\def\thesisauthor#1 {\gdef\@thesisauthor{#1} \author{#1}}
\def\thesisyear#1   {\year=#1}
\def\supervisor#1   {\gdef\@supervisor{#1}}
\def\karta#1        {\gdef\@karta{#1}} % plik pdf z kartą dyplomową
\def\summary#1      {\gdef\@summary{#1}} % plik tex z oswiadczeniem o samodzielności
\def\statement#1    {\gdef\@statement{#1}} % plik pdf z oswiadczeniem o samodzielności

\newcounter         {@zak}

\newcommand{\mcolumns}[4]{
    \multicolumn{#1}{#2}{\parbox{#3\textwidth}{#4}}
}

\newcommand{\mpbox}[1]{
    \parbox{.3\textwidth}{\centering #1}
}

\newlength{\originalVOffset}
\newlength{\originalHOffset}
\setlength{\originalVOffset}{\voffset}   
\setlength{\originalHOffset}{\hoffset}

% \def\clearheadinfo{\gdef\@autor{Brak Autora}%
%                   \gdef\@temat{Brak Tytułu}%
%                   \gdef\@institute{Brak Katedry}%
% }

% ---------------------------------------------------

\renewenvironment{titlepage}{
    \cleardoublepage
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse\newpage
    \fi
    \thispagestyle{empty}
}
{\if@restonecol\twocolumn \else \newpage \fi}

% \clearheadinfo
\renewcommand\maketitle{
    \begin{titlepage}
    \linespread{1.0}
    \begin{center}
        {\Huge\textsc{Politechnika Białostocka}\par}
        \vspace{\stretch{.3}}
        {\LARGE\textsc{Wydział Informatyki}\par}
        \vspace{\stretch{1}}
        {\LARGE\textsc{Praca Dyplomowa \@thesistype}\par}
        \vspace{\stretch{2}}
        {\Huge\textsc{Temat: \@subject}\par}
        \begin{flushright}
            \vspace{\stretch{2}}
            {\Large\textsc{Wykonawca: \@thesisauthor} \par}
            \vskip 2em
            {\Large\textsc{podpis: }}....................................
        \end{flushright}
        \begin{flushleft}
            \vspace{\stretch{1}}
            {\Large\textsc{Promotor: \@supervisor} \par}
            \vskip 2em
            {\Large\textsc{podpis: }}....................................
        \end{flushleft}
        \vspace{\stretch{2}}
        {\LARGE\textsc{Białystok \number\year \ rok}\par}
   \end{center}
   \end{titlepage}
   \if@twoside
        {\pagestyle{empty}
        \cleardoublepage}
    \else
    \fi

    % =============================================================================
    % SEC:   Metryczka
    % =============================================================================
   
    \setlength{\voffset}{0cm}
    \setlength{\hoffset}{0cm}
    \includepdf[pages=-]{\@karta}
    \setlength{\voffset}{\originalVOffset}
    \setlength{\hoffset}{\originalHOffset}

    % =============================================================================
    % SEC:   Summary
    % =============================================================================
   
    \thispagestyle{empty}
    \setcounter{page}{0}
    \pagestyle{plain}

    \include{\@summary}

    % =============================================================================
    % SEC:   Oświadczenie
    % =============================================================================
   
    \setlength{\voffset}{0cm}
    \setlength{\hoffset}{0cm}
    \includepdf[pages=-]{\@statement}
    \setlength{\voffset}{\originalVOffset}
    \setlength{\hoffset}{\originalHOffset}

}

%% spolszczenia
\renewcommand{\listalgorithmcfname}     {Spis algorytmów}
\renewcommand{\algorithmcfname}         {Algorytm}
\renewcommand{\algocf@typo}             {}
\renewcommand{\@algocf@procname}        {Procedura}
\renewcommand{\@algocf@funcname}        {Funkcja}
\renewcommand{\lstlistlistingname}      {Spis listingów}
\renewcommand{\lstlistingname}          {Listing}

\endinput
