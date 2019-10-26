%& -no-cctspace
%
% $Id: cjcmltx.cls,v 1.14 2007/06/19 03:19:14 zlb Exp $
%
% Changelog:
%
% - 2007/06/19:
%   . fix issues with \Jrevised
% - 2007/06/18:
%   . set default class option to 'final'
%   . use abbreviated month names
% - 2007/06/05:
%   . add jssx and szjs options
%   . fix misplaced '*' with no \thanks command in \title
% - 2007/05/03: created the file
%

\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{cjcmltx}[2007/06/19, Mathematica Numerica Sinica]

% Class options
% Options 'draft' (草稿) and 'final' (终稿)，缺省为 'final'
\newif\if@draft \@draftfalse
\DeclareOption{draft}{\@drafttrue}
\DeclareOption{final}{\@draftfalse}
% Options 'jssx' (计算数学) and 'szjs' (数值计算与计算机应用)，缺省为 'jssx'
\newif\if@jssx \@jssxtrue
\DeclareOption{jssx}{\@jssxtrue}
\DeclareOption{szjs}{\@jssxfalse}

%%%\DeclareOption*{\PassOptionsToClass{CJK}{cctart}}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{cctart}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions
%\LoadClass[a4paper,twoside]{cctart}
\LoadClass[a4paper,twoside]{ctexart}
\pagestyle{myheadings}

\RequirePackage{CJKCCT}

\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{latexsym}
\RequirePackage{amsbsy}
\RequirePackage{epsfig}
\RequirePackage{epsf}

%--------------------------- Page Format --------------------------
\headsep=8mm
\headheight=6mm
\topmargin=0pt
\oddsidemargin=0pt
\evensidemargin=0pt
\textheight=215truemm
\textwidth=145truemm
\footskip=2truemm
\renewcommand{\baselinestretch}{1.25}
%%%%\renewcommand{\arraystretch}{1.3}
\abovedisplayskip=8pt plus 1pt minus 5pt 
\belowdisplayskip=8pt plus 1pt minus 5pt
\zihao{5}\ziju{0.05}\parindent=2\ccwd

%========================= Floats, tables, figures =================
\renewcommand{\floatpagefraction}{1}
\floatsep=20pt plus 5pt minus 2pt
\textfloatsep=20pt plus 5pt minus 2pt
\intextsep=20pt plus 5pt minus 2pt
\doublerulesep=0pt

\abovecaptionskip=3pt
\belowcaptionskip=5pt

%
% Insert \small and remove colon after table/figure number
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \small\zihao{-5}%
  \sbox\@tempboxa{#1 #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1 #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%\@addtoreset{table}{section}
%\renewcommand\thetable{\thesection.\arabic{table}}
\def\fnum@table{\bf\everymath{\mathbf}\tablename\nobreakspace\thetable}

%\@addtoreset{figure}{section}
%\renewcommand\thefigure{\thesection.\arabic{figure}}
\def\fnum@figure{\figurename\nobreakspace\thefigure}

%======================== Section ===============================
\def\@seccntformat#1{\csname the#1\endcsname. }
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                     %%%{-3.5ex \@plus -1ex \@minus -.2ex}%
                                     {3.5ex \@plus 1ex \@minus .2ex}%
                                     {2.3ex \@plus.2ex}%
                                     {\normalfont\large\bfseries\centering}}
\renewcommand\subsection{\@startsection {subsection}{2}{\z@}%
                                        %%%{-3.25ex\@plus -1ex \@minus -.2ex}%
                                        {3.25ex\@plus 1ex \@minus .2ex}%
                                        {1.5ex \@plus .2ex}%
                                        {\normalfont\normalsize\bfseries}}

%======================== Bibliography ===============================
\bibliographystyle{cjcmltx}

\renewcommand\refname{参~~考~~文~~献}
\renewcommand\@openbib@code{\parsep \z@ \itemsep \z@ \parskip \z@
  \small \let~\nobreakspace}

% \cite, \citeN
\RequirePackage{cite}
\let\cite@bak=\cite
%
% \cite produces $^{[1]}$
\def\cite{\@ifnextchar [ {\cite@hack} {\cite@hack[]}}
\def\cite@hack[#1]#2{\def\@tempa{#1}%
  \ifx\@tempa\@empty
    \unskip$^{\text{\scriptsize\cite@bak{#2}}}$%
  \else
    \unskip$^{\text{\scriptsize\cite@bak[#1]{#2}}}$%
  \fi}
%
% \citeN produces [1]
\let\citeN\cite@bak

%======================== Equation ===================================
\@addtoreset{equation}{section}
\renewcommand\theequation{\thesection.\arabic{equation}}

%======================== Theorem, Lemma, etc., and proof ============
\def\@begintheorem#1#2{\smallskip\par{\bf #1~#2.} \ignorespaces}
\def\@opargbegintheorem#1#2#3{\smallskip\par{\bf #1~#2#3.} \ignorespaces}
\newenvironment{proof} {\par{\bf 证明.} \ignorespaces} {\par\medskip}

\newtheorem{theorem}{定理}

%
% Hacky: use the same counter 'theorem' for all theorem environments
%%\let\newtheorem@bak\newtheorem
%%\renewcommand\newtheorem[2]{\@ifnextchar[{\newtheorem@hack{#1}{#2}}
%%  {\newtheorem@hack{#1}{#2}[]}}
%%\def\newtheorem@hack#1#2[#3]{\def\@tempa{#3}%
%%  \ifx\@tempa\@empty\newtheorem@bak{#1}{#2}\else\newtheorem@bak{#1}{#2}[#3]\fi
%%  \expandafter \let \csname c@#1\endcsname \c@theorem}

\newtheorem{lemma}{引理}
\newtheorem{proposition}{命题}
\newtheorem{corollary}{推论}
\newtheorem{remark}{注}
\newtheorem{definition}{定义}
\newtheorem{condition}{条件}
\newtheorem{example}{例}
\newtheorem{conclusion}{结论}
\newtheorem{algorithm}{算法}
\newtheorem{assumption}{假设}

%===========================================================================

\AtBeginDocument{\label{firstpage}}
\AtEndDocument{\label{lastpage}}

%
%======================== Title/Abstract =============================
%
\newif\ifenglishtitle \englishtitlefalse
\renewcommand\abstractname{\ifenglishtitle Abstract\else 摘~~~~要\fi}

\renewenvironment{abstract}
  {\par\medskip\small
   \leftskip\leftmargin \rightskip\leftskip
   \centerline{\bfseries \abstractname}}
  {\par}

\newenvironment{keywords}
  {\small\par\leavevmode\leftskip\leftmargin\rightskip\leftskip
   \ifenglishtitle
     \renewcommand\baselinestretch{1.0}%
     \setbox\z@\hbox{\textbf{Keywords: }}%
   \else
     \setbox\z@\hbox{\textbf{关键词: }}%
   \fi
   \@tempdima=\wd\z@ \advance\@tempdima\parindent
   \hangindent \@tempdima\hangafter 1 \box\z@ \ignorespaces}
  {\par}

\newenvironment{classification}
  {\small\par\leavevmode\leftskip\leftmargin \rightskip\leftskip
   \ifenglishtitle
     \textbf{2000 Mathematics Subject Classification: }%
   \else
     \textbf{MR (2000) 主题分类: }%
   \fi
   \ignorespaces}
  {\par\global\englishtitletrue}

%----------- \aref and \affiliation
\newcounter{affno}
\setcounter{affno}{0}

\def\aref#1{\let\@aref@comma\relax{$^{\@aref#1,,}$}}
\def\@aref#1,{\def\@tempa{#1}\ifx\@tempa\@empty \let\@next\relax\else
  \@aref@comma\text{\small\ref{#1\arefsuffix}}\let\@next\@aref\fi
  \let\@aref@comma,\@next}

\newif\if@affiliation \@affiliationfalse
\newtoks\@afflist
\@afflist={}
\newcommand\affiliation[2][]{\@afflist=\expandafter{\the\@afflist \par
  \small\rm (\def\@tempa{#1}\ifx\@tempa\@empty\else
    \refstepcounter{affno}\label{#1\arefsuffix}\arabic{affno}. \fi
  #2)\par}\global\@affiliationtrue}

%----------- \maketitle
% FIXME: why need to insert a space (but not within \maketitle)?
\@addtoreset{footnote}{page}
\renewcommand\thefootnote{\arabic{footnote}) }%
\renewcommand\maketitle{\par
  \begingroup
    \if@draft
      \renewcommand\thefootnote{\arabic{footnote})}%
    \else
      \c@footnote\m@ne
      \renewcommand\thefootnote{\ifnum\c@footnote=0\relax*\else
         \@arabic\c@footnote)\fi}%
    \fi
    \def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark} }##1}%
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle 
    \if@draft
      \thispagestyle{firstpage}%
    \else
      \thispagestyle{firstpage}%
    \fi
    \@thanks
  \endgroup

  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@title\@empty
}

\def\@maketitle{%
  \null \ifenglishtitle\else \vskip 1em \fi
  {\centering
    {% Insert 'Received ...'
     \let\thanks@bak\thanks
     \def\thanks{\protect\thanks@bak}%
     \def\thanks@tmp{%
        \ifx\thanks@bak\thanks@old\else
	  % prevent line break between title and \thanks
	  {\skip0=\lastskip\unskip\nobreak\hskip\skip0}%
	  \setbox0=\hbox{\expandafter\ignorespaces\Jrevised}%
          \ifdim\wd0=\z@
            \thanks@old{\Jreceived 收到.}%
          \else
            \thanks@old{\Jreceived 收到; \Jrevised 修回.}%
          \fi
          \global\@datestrue\let\thanks@bak\thanks@old
        \fi
        \thanks@bak}
     \newif\if@dates \@datesfalse
     \if@draft\else
        \let\thanks@old\thanks@bak
        \def\thanks@bak{\thanks@tmp}%
     \fi
     \let \footnote \thanks
     \ifenglishtitle
       {\def\thanks##1{}\large\@title\par}%
     \else
      {\bfseries\huge\ziti{E}\zihao{2}\def\baselinestretch{1.1}\@title
       \if@draft\else
        \if@dates\else
	 % \title 中不含 \thanks, 强制加入 '... 收到' 脚注
	 \unskip
	 \setbox0=\hbox{\expandafter\ignorespaces\Jrevised}%
         \ifdim\wd0=\z@
          \thanks@old{\Jreceived 收到.}%
         \else
          \thanks@old{\Jreceived 收到; \Jrevised 修回.}%
         \fi
        \fi
       \fi
       \par
      }%
     \fi
     \par}%
    \vskip 1em%
    \let \footnote \thanks
    {\ifenglishtitle
      \small\def\affiliation##1{\\({\textit{##1}}\/)\par\medskip}%
      \def\arefsuffix{@en}%
     \else
      \hz@scale{0.85}{1.00}\fangsong\zihao{4}%
      \def\affiliation##1{\\({\hz@scale{1}{1}\small\textrm{##1}})\par\medskip}%
      \def\arefsuffix{@chn}%
     \fi
     \let \thanks \affiliation
     \def\and{\ifvmode\else ~~\fi}\@author
     \if@affiliation
      %\smallskip
      \the\@afflist \global\@affiliationfalse 
      \global\@afflist={}\setcounter{affno}{0}%
     \fi
    }%
  \par}}

%
% 下述命令将后续汉字横向缩放#1倍，纵向缩放#2倍。
\def\hz@scale#1#2{\def\@CCTaccent##1##2{\scalebox{#1}[#2]}}

%
%============================ Headings ===============================
%
\if@jssx
  \renewcommand\markright[1]{\markboth{计~~算~~数~~学}{#1}}
\else
  \renewcommand\markright[1]{\markboth{数值计算与计算机应用}{#1}}
\fi

\newcommand\h@adrule{\rlap{\vrule width\hsize height\z@ depth 0.4pt}}
\renewcommand\markboth[2]{%
  \def\@evenhead{\leavevmode\lower 5pt \h@adrule
    \rlap{\thepage}\hfill {\small\zihao{-5}\rm #1\hfill\llap{\Jyear~年}}}
  \def\@oddhead{\leavevmode\lower 5pt \h@adrule
    {\small\zihao{-5}\rm\rlap{\Jno~期}\hfill #2}\hfill \llap{\thepage}}
}

\newcommand\m@nthname[1]{\@tempcnta=#1 \advance \@tempcnta \m@ne
  \ifcase\@tempcnta Jan.\or Feb.\or Mar.\or Apr.\or May\or Jun.\or
    Jul.\or Aug.\or Sep.\or Oct.\or Nov.\or Dec.\else
    \@ctrerr\fi}

\newcommand\ps@firstpage{
  \def\@oddhead{\leavevmode\lower 20pt\h@adrule \lower 22pt\h@adrule
    \rlap{\hbox to\hsize{%
	\rlap{\zihao{-5}\Jyear~年~\Jmonth~月}\hfill
	\if@jssx
	  {\zihao{-4}计~~算~~数~~学}\hfill
	\else
	  {\zihao{-4}数值计算与计算机应用}\hfill
	\fi
	\llap{\zihao{-5}第~\Jvol~卷第~\Jno~期}%
    }}%
    \lower 14pt\hbox to\hsize{%
	\rlap{\m@nthname{\Jmonth}, \Jyear}\hfill
	\if@jssx
	  MATHEMATICA NUMERICA SINICA\hfill
	\else
	  Journal On Numerical Methods and Computer Applications\hfill
	\fi
	\llap{Vol.\Jvol, No.\Jno}%
    }%
  }
  \let\@evenhead\@oddhead}

\markright{}

%
%========================== Variables ===========================
%
\ifx\Jvol\@undefined\def\Jvol{??}\fi
\ifx\Jno\@undefined\def\Jno{?}\fi
\ifx\Jyear\@undefined\def\Jyear{200?}\fi
\ifx\Jmonth\@undefined\def\Jmonth{??}\fi
\ifx\Jreceived\@undefined\def\Jreceived{200? 年~??~月~??~日}\fi
\ifx\Jrevised\@undefined\def\Jrevised{}\fi

\endinput
