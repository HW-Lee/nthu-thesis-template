% This is a thesis template of NTHU in LaTex, which is modified by Hao-Wei Lee
% author: Tz-Huan Huang [http://www.csie.ntu.edu.tw/~tzhuan]

% ----------------------------------------------------------------------------
% "THE CHOCOLATE-WARE LICENSE":
% Tz-Huan Huang wrote this file. As long as you retain this notice you
% can do whatever you want with this stuff. If we meet some day, and you think
% this stuff is worth it, you can buy me a chocolate in return Tz-Huan Huang
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
% \ProvidesClass{ntuthesis}[2013/04/23 Thesis template for National Taiwan University]
% Line 12 is not deleted intentionally.
\ProvidesClass{nthuthesis}[2016/07/25 Thesis template for National Tsing Hua University] % modified by HW Lee

% Derived from book class
\DeclareRobustCommand{\@typeen}{Master}
\DeclareRobustCommand{\@typezh}{碩士}
\DeclareRobustCommand{\@classen}{Thesis}
\DeclareRobustCommand{\@classzh}{論文}
\DeclareOption{phd}{\gdef\@typeen{Doctoral}\gdef\@typezh{博士}\gdef\@classen{Dissertation}}
\DeclareOption{proposal}{\gdef\@typeen{Proposal for Doctoral}\gdef\@typezh{博士論文計畫提案書}\gdef\@classen{Dissertation}\gdef\@classzh{}}
\DeclareRobustCommand{\@setspacing}{\doublespacing}
\DeclareOption{singlespacing}{\gdef\@setspacing{\singlespacing}}
\DeclareOption{onehalfspacing}{\gdef\@setspacing{\onehalfspacing}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{book}

% Required packages
\RequirePackage[top=1in,left=1.5in,bottom=1in,right=1in]{geometry}
\RequirePackage{xeCJK}
\RequirePackage{setspace}

% Declarations
\DeclareRobustCommand{\university}[2]{\gdef\@universityen{#1}\gdef\@universityzh{#2}}
\DeclareRobustCommand{\college}[2]{\gdef\@collegeen{#1}\gdef\@collegezh{#2}}
\DeclareRobustCommand{\institute}[2]{\gdef\@instituteen{#1}\gdef\@institutezh{#2}}
\DeclareRobustCommand{\division}[1]{\gdef\@divisionzh{#1}}
\DeclareRobustCommand{\title}[2]{\gdef\@titleen{#1}\gdef\@titlezh{#2}}
\DeclareRobustCommand{\author}[2]{\gdef\@authoren{#1}\gdef\@authorzh{#2}}
\DeclareRobustCommand{\studentid}[1]{\gdef\@studentid{#1}}
\DeclareRobustCommand{\advisor}[2]{\gdef\@advisoren{#1}\gdef\@advisorzh{#2}}
\DeclareRobustCommand{\defenseyear}[2]{\gdef\@yearen{#1}\gdef\@yearzh{#2}}
\DeclareRobustCommand{\defensemonth}[2]{\gdef\@monthen{#1}\gdef\@monthzh{#2}}
\DeclareRobustCommand{\defenseday}[1]{\gdef\@day{#1}}
\DeclareRobustCommand{\abstractname}[2]{\gdef\@abstractnameen{#1}\gdef\@abstractnamezh{#2}}
\DeclareRobustCommand{\acknowledgements}[2]{\gdef\@acknowledgementsen{#1}\gdef\@acknowledgementszh{#2}}

\abstractname{Abstract}{摘要}
\acknowledgements{Acknowledgements}{誌謝}

% The command \makecover has been re-designed to be a valid format for the Dept. EE
\DeclareRobustCommand{\makecover}{
  \begin{titlepage}
    \begin{center}
      \fontsize{30}{30}\selectfont
      \makebox[9cm][s]{\textbf{\@universityzh}}\\
      \underline{\makebox[5cm][s]{\textbf{\@typezh\@classzh}}}
    \end{center}
    \vspace{\fill}
    \begin{center}
      \fontsize{25}{25}\selectfont
      \textbf{\@titlezh}\par
      \textbf{\@titleen}\par
    \end{center}
    \vspace{\fill}
    \begin{flushleft}
      \fontsize{20}{30}\selectfont
      \textbf{系所別：\underline{{\@institutezh\@typezh}班}
      \hspace{\fill}組別：\underline{\@divisionzh 組}}\\
      \textbf{學號姓名：\underline{\@studentid \@authorzh} (\@authoren)}\\
      \textbf{指導教授：\underline{\@advisorzh\hspace{.3cm}博士} (Prof. \@advisoren)}
    \end{flushleft}
    \vspace{1.5cm}
    \begin{center}
      \fontsize{20}{15}\selectfont
      \makebox[10cm][s]{\textbf{中華民國 \@yearzh 年 \@monthzh 月}}
    \end{center}
  \end{titlepage}
}

% The command \makecopyright is created and designed by HW Lee
\DeclareRobustCommand{\makecopyright}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \begin{singlespace}
    \thispagestyle{empty}
    \vspace*{\fill}
    \begin{center}
      \fontsize{14}{20}\selectfont
      \textcopyright Copyright by \@authorzh (\@authoren), \@yearen\\
      All Right Reserved
    \end{center}
  \end{singlespace}
}

%  stolen from CJKfntef
%
%  myCJKfilltwosides environment:
%    Align CJK characters to fill two sides.
%
%  Usage:
%    \begin{myCJKfilltwosides}{width}
%      first line \\
%      second line \\
%      ... \\
%      last line
%    \end{myCJKfilltwosides}
%
\newif\ifmyCJK@fillbegin@
\global\myCJK@fillbegin@false
\newif\ifmyCJK@filltwosides@
\global\myCJK@filltwosides@false

\newenvironment{myCJKfilltwosides}[1]{
  \leavevmode
  \vbox\bgroup
    \global\myCJK@filltwosides@true
    \global\let\myCJK@filltwosidesSymbol \CJKsymbol

    \def\myCJK@ftscr{
      \egroup
      \global\myCJK@fillbegin@false
      \hbox to #1\bgroup
        \ignorespaces}

    \let\\ \myCJK@ftscr

    \def\CJKsymbol##1{
      \ifmyCJK@fillbegin@
        \hfill
        \myCJK@filltwosidesSymbol{##1}
      \else
        \myCJK@filltwosidesSymbol{##1}
        \global\myCJK@fillbegin@true
      \fi}

    \hbox to #1\bgroup
      \ignorespaces
 }{
  \egroup
  \egroup

  \global\let\CJKsymbol \myCJK@filltwosidesSymbol
  \global\myCJK@fillbegin@false
  \global\myCJK@filltwosides@false}


\DeclareRobustCommand{\CJKmove}[1]{\raisebox{.35em}{#1}}
\DeclareRobustCommand{\makespine}{
  \noindent\rotatebox{-90}{
    \CJKfamily{sidepagefont}
    \begin{tabular}{m{3.5cm}m{0.1cm}m{2cm}m{0.1cm}m{10cm}m{1cm}m{2.5cm}m{0.1cm}m{1.5cm}}
      \fontsize{8}{6}\selectfont
      \begin{myCJKfilltwosides}{3cm}\CJKmove{\@universityzh}\end{myCJKfilltwosides}\newline
      \begin{myCJKfilltwosides}{3cm}\CJKmove{\@institutezh}\end{myCJKfilltwosides} & &
      \CJKmove{\@typezh\@classzh} & &
      {\fontsize{14}{14}\selectfont\CJKmove{\@titlezh}} & &
      {\fontsize{14}{14}\selectfont\CJKmove{\@authorzh{} 撰}} & &
      \raisebox{-0.25em}{\rotatebox{90}{\@yearzh{}} \rotatebox{90}{\hspace{0.25em}\@monthzh{}}}
    \end{tabular}}
}

\newenvironment{quotationpage}[1]
  {\if@openright\cleardoublepage\else\clearpage\fi
   \chapter*{\centerline{#1}}
   \addcontentsline{toc}{chapter}{#1}
   \quotation}
  {\endquotation}

\newenvironment{abstracten}{\begin{quotationpage}{\@abstractnameen}}{\end{quotationpage}}
\newenvironment{abstractzh}{\begin{quotationpage}{\@abstractnamezh}}{\end{quotationpage}}
\newenvironment{acknowledgementsen}{\begin{quotationpage}{\@acknowledgementsen}}{\end{quotationpage}}
\newenvironment{acknowledgementszh}{\begin{quotationpage}{\@acknowledgementszh}}{\end{quotationpage}}

\setcounter{tocdepth}{2}
\pagestyle{plain}
\@setspacing
