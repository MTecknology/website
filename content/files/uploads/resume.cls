\typeout{Document Style `resume' <26 Sep 89, Dec 07>.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Class Information                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   @author  Michael Lustfield (MTecknology)
%   @date    February 2011
%   @url     https://michael.lustfield.net/misc/resume-in-latex
%   @brief   LaTeX2e Resume/References Style Config
%   @info    This is a very heavy modification of work done by Kamil K Wojcicki,
%            Chris Paciorek, and Michael DeCorte. The aim was to produce
%            resume.cls that lets the user produce a very clean and easy to read
%            resume.tex file which builds a very pretty resume at the end.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Document Properties                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   You can have multiple style options the legal options ones are:
%
%   centered
%		the name and address are centered at the top of the
%		page (default)
%
%   line
%		the name is the left with a horizontal line then 
%		the address to the right
%
%   overlapped
%		the section titles overlap the body text (default)
%
%   margin
%		the section titles are to the left of the body text
%		
%   11pt
%		use 11 point fonts instead of 10 point fonts
%
%   12pt
%		use 12 point fonts instead of 10 point fonts
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Commands - Resume                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   \Resume
%		prints the word resume but typeset nicely
%
%   \newsectionwidth{dimen}
%		defines the amount of space the labels extend
%		into the left margin.
%		DO NOT TRY to change any of the dimensions
%		yourself.  You will probably confuse the style file.
%
%   \name{text}
%		defines your name
%
%   \address{text}
%		defines your address
%		this can be called twice if you have two addresses
%		use \\ to indicate where either line breaks or
%		comas should go
%
%   \opening
%		this prints your name and address at that spot
%		this is not normally needed, as \begin{resume}
%		does this but is provided just in case you need
%		to do something odd
%
%   \begin{resume} ... \end{resume}
%		all of the resume should go inside of this
%		environment
%
%   \section{text}
%		This prints 'text' in the left hand margin.
%		Its exact placement depends on what the style 
%		options has been set to. (overlapped or margin)
%		You should use \\ to start a new line.	If the
%		style option is margin, the \\ is converted
%		to a space.
%		To use this in any of the list environments, put
%		the \section after the \item[] but before the 
%		text.
%		Eg.
%		\begin{itemize}
%		\item\section{text}
%		text
%		\end{itemize}
%
%   \heading{title}{location}{date}[position]
%		'section heading'
%		packed little gem to make printing a section
%		heading pretty and easy
%		the [position] parameter is optional
%
%   \b{title}
%		'section label'
%		prints formatted text for a label
%
%   \begin{resume_list} ... \end{resume_list}
%		modifies an itemized list to better fit pages
%		so more data can fit on one page of the resume.
%
%   \begin{tear} ... \end{tear}
%		creates a two column area to split data
%
%   \begin{ncolumn}{n} ... \end{ncolumn}
%		creates a tabular environment with n equally
%		spaced columns.  Separate columns by & and
%		end them with \\
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Commands - References                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   \begin{references} ... \end{references}
%		begin a references page
%
%   \begin{reference} ... \end{reference}
%		used to change the way references are ouput.
%               Within a reference, the following commands
%               can be used:
%		\person{text}
%		\jobtitle{text}
%		\business{text}
%		\street{text}
%       \citystate{text}
%		\phone{text}
%		\email{text}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Glue                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   sectionskip
%		the amount of horizontal before a section
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Dimensions                                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   sectionwidth
%		the amount that the section titles go in the
%		left margin
%
%   resumewidth
%		the width of the total resume from the left
%		margin to the right. Do not use textwidth
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Definitions                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   sectionfont
%		the font used to print section titles
%		use \renewcommand to change it
%
%   namefont
%		the font used to print your name
%		use \renewcommand to change it
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{resume}[2000/05/19 v1.4b Resume class]

\PassOptionsToClass{11pt,12pt}{article}
\LoadClassWithOptions{article}

\newif\if@line
\newif\if@margin

\DeclareOption{line}{\@linetrue}
\DeclareOption{centered}{\@linefalse}

\DeclareOption{margin}{\@margintrue}
\DeclareOption{overlapped}{\@marginfalse}

\ExecuteOptions{overlapped,centered}
\ProcessOptions\relax

\nofiles

\newtoks\tabular@text
\newtoks\tabular@head
\newtoks\tabular@tail
\newtoks\@ta
\newtoks\undefined@token\undefined@token={}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   package requirements

\usepackage{color}
\usepackage{ifthen}
\usepackage{multicol}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   colors that can be used later

\definecolor{grey}{RGB}{117,117,117}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   prints a centered name with the address centered or the two address on
%   opposite sides of the page

\def\@printcentername{\begingroup
  % print the name centered
  \leavevmode\hbox to \textwidth{\hfil\@tablebox{\namefont\@name}\hfil}\par
  \@ifundefined{@addressone}{}{%
    \@ifundefined{@addresstwo}{
      % only one address
      \leavevmode\hbox to \textwidth{\hfil\@tablebox{\@addressone}\hfil}\par
    }{
      % two addresses
      \leavevmode\hbox to \textwidth{\@tablebox{\@addressone}\hfil
				     \@tablebox{\@addresstwo}}\par
    }%
  }%
\endgroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   this is used to print the name and address at the top of the page with a
%   hline in between

\def\namefont{\Huge\bf}
\def\@linename{\begingroup
  \leavevmode\hbox to \textwidth{
    \hfil
    \@tablebox{
      \namefont
      \@name
    }
    \hfil
  }
  \par
  \vskip 8pt
  \fullline
  \@ifundefined{@addressone}{}{
    \vskip 4pt
    \leavevmode\hbox to \textwidth{
      \hfil
      \hbox{\@addressone}
      \hfil
    }
    \par
    \vskip 3pt
    \fullline
  }
\endgroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   two types of headings:
%   1) one with the name centered and the address centered or
%      in the left and right side if there are two address
%   2) one where the name is in the upper left corner 
%      the a line accross the paper
%      then the address all on one line in the right corner
%      the second address will be directly below the first if defined

\let\print@name\relax
\def\ds@centered{\ifx\print@name\relax\let\print@name\@printcentername\fi}
\def\ds@line{\ifx\print@name\relax\let\print@name\@linename\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Use this to set the sectionwidth. It adjust the width of the text as well as
%   the offset. You probably should not touch any of the size paramaters.

\def\sectionfont{\bf}
\newdimen\sectionwidth
\newskip\sectionskip
\newdimen\resumewidth

\resumewidth=6.5in
\sectionskip=3.5ex plus 1ex minus -.2ex

\def\newsectionwidth#1{%
		     \sectionwidth=#1
		     \textwidth=\resumewidth
		     \advance\textwidth-\sectionwidth
		     \hsize=\textwidth
		     \hoffset=\sectionwidth
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   used for sectiontitles that are entirely in the left margin.

\def\boxed@sectiontitle#1{%
  \ifx\\\@tabcr
    \@stopfield
   \else
     \@@par
  \fi
  \begingroup
  \everypar={}%
  \def\par{\@@par}%
  \let\\=\@normalcr
  \addpenalty{\@secpenalty}
  \addvspace{\sectionskip}
  \hbox to 0pt{%
    \hss
    \vtop to 0pt{%
      \leftskip=0pt
      \hsize=\sectionwidth
      \textwidth=\sectionwidth
      \raggedright
      \sectionfont
      \textcolor{grey}{
        \mysidestyle
        #1\vss
      }
    }%
  }%
  \addpenalty{-\@secpenalty}
  \vskip-\baselineskip
  \endgroup
  \ifx\\\@tabcr
    \@startline
    \ignorespaces
  \else
    \vskip-\parskip
  \fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   used for sectiontitles that are entirely above the section text

\def\unboxed@sectiontitle#1{%
  \ifx\\\@tabcr
    \@stopfield
   \else
     \@@par
  \fi
  \begingroup
  \everypar={}%
  \def\par{\@@par}%
  \def\\{ }
  \addpenalty{\@secpenalty}
  \addvspace{\sectionskip}
  \hbox to 0pt{\hss\hbox to \sectionwidth{\sectionfont#1\hss}}
  \addpenalty{-\@secpenalty}
  \endgroup
  \ifx\\\@tabcr
    \@startline
  \else
    \vskip-\parskip
  \fi
  \ignorespaces
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   two types of section headings:
%   1) the section heading is all on one line and directly
%      below it, is the body of the text
%   2) the section heading is entirely in the left margin
%      (possibly taking multiple lines) with the body of
%      the text next to it

\let\@@section\relax
\def\ds@overlapped{%
  \ifx\@@section\relax\newsectionwidth{0.5in}
  \let\@@section\unboxed@sectiontitle\fi
}
\def\ds@margin{%
  \ifx\@@section\relax\newsectionwidth{0.9in}
  \let\@@section\boxed@sectiontitle\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   centered name
%   overlapped section titles

\if@line\ds@line\else\ds@centered\fi
\if@margin\ds@margin\else\ds@overlapped\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   typeset resume all nice and pretty

\def\Resume{{R\'{e}sum\'{e}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   makes a line of width \textwidth starting at -\hoffset

\def\fullline{
  \nointerlineskip
  \moveleft\hoffset\vbox{\hrule width\textwidth} 
  \nointerlineskip
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   create a multiline box.

\def\@tablebox#1{\begin{tabular}[t]{@{}l@{\extracolsep{\fill}}}#1\end{tabular}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   use this to define your name

\def\name#1{\def\@name{#1}}
\def\@name{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   use this to define your address, this may be called more than once.

\let\@addressone\relax
\let\@addresstwo\relax

\def\address#1{
  \@ifundefined{@addressone}{\def\@addressone{#1}}{\def\@addresstwo{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   if you want to print your name and address in a slightly different format
%   than sugessted, then this can be used to place it exactly where you want

\def\opening{\def\@opening{}
  \begingroup
  \leftskip=-\hoffset
  \advance\textwidth\hoffset
  \hsize=\textwidth
  \let\par=\@@par
  \parindent=0pt
  \parskip=0pt
  \print@name
  \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   all of the resume goes in the resume environment

\newenvironment{resume}{%
  \begingroup
    \small
    \@ifundefined{@opening}{\opening}{}
}{%
  \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   an environment similar to the resume for a references list

\newenvironment{references}{%
  \begingroup
    \footnotesize
    \@ifundefined{@opening}{\opening}{}
    \vskip 0.5in
}{%
  \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   use an itemized list but modify it some

\newenvironment{resume_list}{
  \begin{itemize}
    \vskip -12pt
    \itemsep -2pt
    \vskip -12pt
}{
  \end{itemize}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   split data into two columns

\newenvironment{tear}{
  \vskip -12pt
  \begin{multicols}{2}
}{
  \end{multicols}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   use this to define a section heading with an optional
%   fourth paramater

\def\heading#1#2#3{
  \@ifnextchar[{
    \sectionheader{#1}{#2}{#3}%
  }{
    \sectionheader{#1}{#2}{#3}[]%
  }
}

\def\sectionheader#1#2#3[#4]{
  {\bf #1}% {title}
  #2% {location}
  \hfill
  {\bf #3}% {date}
  \ifthenelse{%
    \equal{#4}{}}{}{
    \\
    \emph{#4}% [position]
  }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   use this to define a section label

\renewcommand{\b}[1]{
  \textbf{ #1}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   define a set of commands that are used for the reference environment
%
%   commands defined:
%   \person{text}
%   \jobtitle{text}
%   \business{text}
%   \street{text}
%   \citystate{text}
%   \phone{text}
%   \email{text}

\newcommand{\@person}{}
\newcommand{\@jobtitle}{}
\newcommand{\@business}{}
\newcommand{\@street}{}
\newcommand{\@citystate}{}
\newcommand{\@phone}{}
\newcommand{\@email}{}

\newcommand{\person}[1]{\renewcommand{\@person}{#1}}
\newcommand{\jobtitle}[1]{\renewcommand{\@jobtitle}{#1}}
\newcommand{\business}[1]{\renewcommand{\@business}{#1}}
\newcommand{\street}[1]{\renewcommand{\@street}{#1}}
\newcommand{\citystate}[1]{\renewcommand{\@citystate}{#1}}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   build text for a reference

\newcommand{\makereference}{%
  \begingroup
    \parindent 1.9in
    \parskip 0pt
    \ifthenelse{\equal{\@person}{}}{}{\normalsize\textbf{\@person} \par}%
    \ifthenelse{\equal{\@business}{}}{}{\small\textit{\@business}\par}%
    \ifthenelse{\equal{\@jobtitle}{}}{}{\small\textit{\@jobtitle}\par}%
    \ifthenelse{\equal{\@street}{}}{}{\small{\@street}\par}%
    \ifthenelse{\equal{\@citystate}{}}{}{\small{\@citystate}\par}%
    \ifthenelse{\equal{\@phone}{}}{}{\small{Phone: \@phone}\par}%
    \ifthenelse{\equal{\@email}{}}{}{\small{Email: \@email}\par}%
    \null\par
  \endgroup
  \vfill
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   this is used to define how the reference should appear

\newenvironment{reference}{
}{%
  \makereference
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   used to see if two token lists are equal

\let\then=\empty
\def\iftoks#1#2\then#3\else#4\skotfi{
  \edef\1{\the#1}
  \edef\2{\the#2}
  \ifx\1\2\then#3\else #4\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   centered name
%   overlapped section titles

\@secpenalty = -500
\topmargin 0pt
\headheight 0pt
\headsep 0pt
\textheight 9in
\parindent 0pt
\topmargin 0in
\oddsidemargin 0pt
\evensidemargin 0pt
\marginparwidth 0pt
\parindent 0pt
\parskip \baselineskip
\setcounter{secnumdepth}{0}
\def\@listI{\leftmargin\leftmargini
\topsep 0pt 
\parskip 0pt
\partopsep 10pt plus 2pt
\parsep 2pt plus 2pt
\itemsep \parsep}

\pagestyle{empty}

\let\section\@@section

\oddsidemargin -11mm
\evensidemargin -11mm
\textwidth=6.5in
\itemsep=0cm
\parsep=0cm
\topmargin -20mm
\textheight 265mm

\newcommand{\mysidestyle}{\small\sc}
\newcommand{\myheadingstyle}{\sl}
\newcommand{\mysubheadingstyle}{\sl}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
