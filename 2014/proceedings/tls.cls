\ProvidesClass{tls}[2015/09/02 TLS Proceedings]

\LoadClass[letterpaper,11pt]{article}

\RequirePackage[vmargin=1.25in,hmargin=1.5in]{geometry}
\RequirePackage{times}
\RequirePackage[utf8]{inputenc}

\RequirePackage{natbib}
\bibpunct[: ]{(}{)}{,}{a}{}{,}
\bibliographystyle{unified}

\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage[font={small}]{caption}

% coloring
\RequirePackage{color}
\RequirePackage{colortbl}
\RequirePackage{xcolor}

% urls
\RequirePackage{url}
\RequirePackage{hyperref}

\pagestyle{empty} % No page numbers
% No, really (\maketitle overrides the empty style)
\let\ps@plain\ps@empty
\ps@empty

% floats
\setlength{\intextsep}{16pt plus 2pt minus 6pt}
\setlength{\textfloatsep}{8pt plus 2pt minus 2pt}

% maketitle, mostly from article.cls (2007/10/19 v1.4h)
\makeatletter
\def\institution#1{\gdef\@institution{#1}}
\def\email#1{\gdef\@email{#1}}
\def\@maketitle{%
  \newpage
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\Large \bfseries\@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author\\[1pt]
        \@institution\\
        {\small\@email}\\
      \end{tabular}\par}%
    \vskip 1em%
  \end{center}%
  \par
  \vskip 1.5em}
\makeatother


% list environments from tweaklist.sty
\makeatletter
\def\enumhook{}
\def\enumhooki{}
\def\enumhookii{}
\def\enumhookiii{}
\def\enumhookiv{}
\def\itemhook{}
\def\itemhooki{}
\def\itemhookii{}
\def\itemhookiii{}
\def\itemhookiv{}
\def\descripthook{}
\def\enumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}%
          \enumhook \csname enumhook\romannumeral\the\@enumdepth\endcsname}%
  \fi}
\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{##1}}%
        \itemhook \csname itemhook\romannumeral\the\@itemdepth\endcsname}%
  \fi}

\renewenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
    \let\makelabel\descriptionlabel\descripthook}}
  {\endlist}

\makeatother

% itemize environment lengths
\renewcommand{\itemhook}{
  \setlength{\topsep}{6pt}%
  \setlength{\parskip}{0pt}%
  \setlength{\partopsep}{0pt}%
  \setlength{\parsep}{0pt}%
  \setlength{\itemsep}{0pt}%
}

% enumerate environment lengths
\renewcommand{\enumhook}{
  \setlength{\topsep}{6pt}%
  \setlength{\parskip}{0pt}%
  \setlength{\partopsep}{0pt}%
  \setlength{\parsep}{0pt}%
  \setlength{\itemsep}{0pt}%
}

% shims for lsa bib commands
\let\namecite\citet
\let\cite\citep
\let\citeboth\citealt
