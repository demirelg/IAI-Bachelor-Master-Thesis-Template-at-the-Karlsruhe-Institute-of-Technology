%% LaTeX2e class for student theses
%% iaithesis.cls
%%
%% Based on SDQ KIT Template by Dr.-Ing. Erik Burger (Version 1.4, 2023-06-19)
%%
%% Karlsruhe Institute of Technology
%% Institute for Automation and Applied Informatics (IAI)
%% IT Methods and Components for Energy Systems (IT4ES) Research Group
%%
%% Gökhan Demirel
%% goekhan.demirel@kit.edu
%%
%% Adaptation Version 1.0, 01.12.2023

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iaithesis}[2023-12-01 v1.0 Student thesis class]
% Language options. German is also needed in English thesis for the abstract
\DeclareOption{ngerman}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{english}{\PassOptionsToPackage{main=\CurrentOption,ngerman}{babel}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax
% Used to detect language families
\RequirePackage{translations}

%% ---------------------------------------------------------------
%% | Based on KOMAscript by Markus Kohm http://www.komascript.de |
%% ---------------------------------------------------------------
\LoadClass{scrbook}

%% --------------
%% | Typography |
%% --------------

% T1 font encoding
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

% serif type: Linux Libertine
\RequirePackage{libertine}
% Linux Libertine in math mode
\RequirePackage[libertine]{newtxmath}

% grotesque type: Adobe Source Sans Pro
\RequirePackage[scaled=.92]{sourcesanspro}

% monospace type: Bera Mono
\RequirePackage[scaled=.78]{beramono}

% semi-bold type (for subsections and paragraphs)
\newcommand*{\sbdefault}{sb}
\DeclareRobustCommand{\sbseries}{%
  \not@math@alphabet\sbseries\relax
  \fontseries\sbdefault\selectfont}

\DeclareTextFontCommand{\textsb}{\sbseries}

\addtokomafont{subsection}{\sbseries}
\addtokomafont{subsubsection}{\sbseries}
\addtokomafont{paragraph}{\sbseries}

% microtype for nicer typography
\RequirePackage[protrusion=true,expansion=true]{microtype}

% commands for code and model keywords in text
\newcommand{\code}[1]{\texttt{\hyphenchar\font45\relax #1}}
\newcommand{\model}[1]{\textsf{#1}}

% nicer spacing for enumerations
\RequirePackage{enumitem}

%% -----------
%% | Spacing |
%% -----------

% more flexible spacing for paragraphs
\RedeclareSectionCommands[
    beforeskip= .7em plus .6em minus .3em
]{paragraph}

%% ---------------
%% | Page Layout |
%% ---------------
\KOMAoptions{
   fontsize=12pt,
   paper=a4,
   parskip=half,
   titlepage=true,
   headinclude=true,
   footinclude=false,
}

% Margins
\if@twoside%
  \typearea[20mm]{15} % twoside
\else% 
  \typearea[10mm]{15} % oneside
\fi%
\RequirePackage[headsepline,draft=false]{scrlayer-scrpage}
\pagestyle{scrheadings}

\clubpenalty=10000 %prevent orphans
\widowpenalty=10000 %prevent widows


%% --------------
%% | Title page |
%% --------------

% Logos
\newcommand{\thegrouplogo}{iailogo}
\newcommand{\grouplogo}[1]{\renewcommand{\thegrouplogo}{#1}}
\newcommand{\printgrouplogo}{\includegraphics[height=1.8cm]{logos/\thegrouplogo}}
\newcommand{\nogrouplogo}{\renewcommand{\printgrouplogo}{}}

\titlehead{%
% KIT logo german/english
\ifcurrentbaselanguage{English}
{\includegraphics[height=1.8cm]{logos/kitlogo_en_cmyk}}
{\includegraphics[height=1.8cm]{logos/kitlogo_de_cmyk}}
\hfill
% IAI logo
%\printgrouplogo
\nogrouplogo
\ThisCenterWallPaper{1}{logos/title-background.pdf}
}

%
\setkomafont{title}{\huge\sffamily\bfseries}
\setkomafont{subtitle}{\normalfont\large}


%% variables for title page
\newcommand{\theinstitute}{\ifcurrentbaselanguage{English}
	{Institute for Automation and Applied Informatics (IAI)}
	{Institut für Automation und angewandte Informatik (IAI)}}
\newcommand{\thethesistype}{}
\newcommand{\thereviewerone}{}
\newcommand{\thereviewertwo}{}
\newcommand{\theadvisorone}{}
\newcommand{\theadvisortwo}{}
\newcommand{\theeditstart}{}
\newcommand{\theeditend}{}
\newcommand{\thefacultyname}{}
\newcommand{\thematriculationnumber}{}

%% formatting commands for titlepage
\newcommand{\thesistype}[1]{\subtitle{\vskip2em #1 \ifcurrentbaselanguage{English}{of}{von}}%
\renewcommand{\thethesistype}{#1}}
\newcommand{\myinstitute}[1]{\renewcommand{\theinstitute}{#1}}
\newcommand{\reviewerone}[1]{\renewcommand{\thereviewerone}{#1}}
\newcommand{\reviewertwo}[1]{\renewcommand{\thereviewertwo}{#1}}
\newcommand{\advisorone}[1]{\renewcommand{\theadvisorone}{#1}}
\newcommand{\advisortwo}[1]{\renewcommand{\theadvisortwo}{#1}}
\newcommand{\facultyname}[1]{\renewcommand{\thefacultyname}{#1}}

\newcommand{\editingtime}[2]{%
\renewcommand{\theeditstart}{#1}%
\renewcommand{\theeditend}{#2}%
%% do not show the date
\date{}
}

\newcommand{\matriculationnumber}[1]{%
\renewcommand{\thematriculationnumber}{#1}%

}


% 3.Define the \settitle command:
\newcommand{\settitle}[1]{%
	\publishers{%
		\large
		\ifcurrentbaselanguage{English}{
			\ifthenelse{\equal{#1}{Informatics}}{At the KIT Department of Informatics}{At the KIT Department of Mechanical Engineering}
		}{
			\ifthenelse{\equal{#1}{Engineering}}{An der KIT-Fakultät für Maschinenbau}{An der KIT-Fakultät für Informatik}
		}\\
		\theinstitute\\[2em]
		\begin{tabular}{l l}
			\ifcurrentbaselanguage{English}{First examiner}{1. Prüfer/Prüferin}: & \thereviewerone\\
			\ifcurrentbaselanguage{English}{Second examiner}{2. Prüfer/Prüferin}: & \thereviewertwo\\[.5em]
			\ifcurrentbaselanguage{English}{First advisor}{1. Betreuer/Betreuerin}: &  \theadvisorone\\
			% if there is no second advisor, do not output this line
			\ifthenelse{\equal{\theadvisortwo}{}}{}{%
				\ifcurrentbaselanguage{English}{Second advisor}{2. Betreuer/Betreuerin}: & \theadvisortwo\\
			}
		\end{tabular}
\vskip3em
\vskip2em
\begin{tabular}{c c}
\ifcurrentbaselanguage{English}{Matriculation Number}{Matrikelnummer}:  \thematriculationnumber  \\
\theeditstart{} -- \theeditend  % \ifcurrentbaselanguage{English}{Duration}{Bearbeitungszeit}:
\end{tabular}

% Hier fügen wir den vertikalen Füllraum ein
\vskip6em
\begin{picture}(0,0)
	\put(-220,-130){% Verschiebt 100pt nach oben vom unteren Rand
		\begin{minipage}{\textwidth}
			\scriptsize \ifcurrentbaselanguage{English}{KIT -- The Research University in the Helmholtz Association}{KIT -- Die Forschungsuniversität in der Helmholtz-Gemeinschaft} \hskip20em \large \textbf{www.kit.edu}
		\end{minipage}
	}
\end{picture}
}
\uppertitleback{
  \ifcurrentbaselanguage{English}{
    \ifthenelse{\equal{#1}{Informatics}}{
      Karlsruhe Institute of Technology (KIT)\\ Department of Informatics\\ P.O. Box 6980\\ 76128 Karlsruhe
    }{
      Karlsruhe Institute of Technology (KIT)\\ Department of Mechanical Engineering\\ Dean´s Office Kaiserstraße 12\\ 76131 Karlsruhe
    }
  }{
    \ifthenelse{\equal{#1}{Engineering}}{
       Karlsruher Institut für Technologie (KIT)\\ Fakultät für Maschinenbau\\ Dekanat Kaiserstraße 12\\ 76131 Karlsruhe
    }{
      Karlsruher Institut für Technologie (KIT)\\ Fakultät für Informatik\\ Postfach 6980\\ 76128 Karlsruhe
    }
  }
}

}


%% -----------------------------
%% | Abstract/Acknowledgements |
%% -----------------------------

\newcommand{\abstract}[1][\abstractname]{\chapter*{#1}}
\newcommand{\Abstract}[1][\abstractname]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}

\def\ackname{Acknowledgments}
\def\abstractname{Abstract}
\def\switcht@deutsch{\svlanginfo
	\def\ackname{Danksagung}
	\def\abstractname{Kurzfassung}
}
\def\switcht@english{\svlanginfo
	\def\ackname{Acknowledgements}
	\def\abstractname{Abstract}
}

%% In English theses, an additional German Abstract is needed.
\newcommand{\includeabstract}{
\ifcurrentbaselanguage{English}{
% include English and German abstracts
\input{main/abstract_en.tex}
\begin{otherlanguage}{ngerman}
\input{main/abstract_de.tex}
\end{otherlanguage}
}{
% include only German abstract
\include{main/abstract_de}
}
}

%% ------------
%% | Packages |
%% ------------

% draft mode
\RequirePackage{ifdraft}
\RequirePackage{ifthen}

% enumerate subsubsections
\setcounter{secnumdepth}{3}

% wallpaper for title page (KIT-Frame)
\RequirePackage{wallpaper}

% subimport of files
\RequirePackage{import}

% languages
\RequirePackage{babel}
\RequirePackage{csquotes}

% hyphenation for compound words
\RequirePackage[shortcuts]{extdash}

% nice tables
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}

% show graphics in draft mode
\RequirePackage{graphicx}
\setkeys{Gin}{draft=false}

% appendix
\RequirePackage[toc,title,header]{appendix}
\noappendicestocpagenum

% PDF specific packages
\RequirePackage[hyphens]{url}
\RequirePackage[breaklinks,colorlinks=false]{hyperref}
\newcommand\setpdf{
    \hypersetup{%
    pdftitle={\thethesistype},%
    pdfsubject={\@title},%
    pdfauthor={\@author},%
    pdfborder={0 0 0},%
    }%
    \let\theauthor\@author
}
