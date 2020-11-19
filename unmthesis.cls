%%
%% UNM Dissertation template
%%
%% Quotes regarding formatting requirements are taken from 
%% https://grad.unm.edu/degree-completion/thesis-dissertations/guidelines.html
%% as the page exists February 2020
%%
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unmthesis}[2020/03/28 UNM SOE thesis class]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Commands for filling in the various blanks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The class uses the same \author and \title as the report document class

% Degree (default: Doctor of Philosophy)
\newcommand{\@degree}{Doctor of Philosophy}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}

% University
\newcommand{\@university}{The University of New Mexico\\Albuquerque, New Mexico}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}

% Department (default: computer science)
\newcommand{\@department}{Computer Science}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}

% Degrees held (default: null)
\newcommand{\@degreeheld}{}
\newcommand{\degreeheld}[1]{\renewcommand{\@degreeheld}{#1}}

% graduation month and year
\newcommand{\@gradmonth}{Graduation Month}
\newcommand{\@gradyear}{Graduation Year}
\newcommand{\graddate}[2]{\renewcommand{\@gradmonth}{#1}\renewcommand{\@gradyear}{#2}}

% committee
\newcommand{\@cnameone}{Chair}
\newcommand{\cnameone}[1]{\renewcommand{\@cnameone}{#1}}
\newcommand{\@caffiliationone}{Chair's affiliation}
\newcommand{\caffiliationone}[1]{\renewcommand{\@caffiliationone}{#1}}

\newcommand{\@cnametwo}{Committee 2 name}
\newcommand{\cnametwo}[1]{\renewcommand{\@cnametwo}{#1}}
\newcommand{\@caffiliationtwo}{Committee 2 affiliation}
\newcommand{\caffiliationtwo}[1]{\renewcommand{\@caffiliationtwo}{#1}}

\newcommand{\@cnamethree}{Committee 3 name}
\newcommand{\cnamethree}[1]{\renewcommand{\@cnamethree}{#1}}
\newcommand{\@caffiliationthree}{Committee 3 affiliation}
\newcommand{\caffiliationthree}[1]{\renewcommand{\@caffiliationthree}{#1}}

\newcommand{\@cnamefour}{Committee 4 name}
\newcommand{\cnamefour}[1]{\renewcommand{\@cnamefour}{#1}}
\newcommand{\@caffiliationfour}{Committee 4 affiliation}
\newcommand{\caffiliationfour}[1]{\renewcommand{\@caffiliationfour}{#1}}

\newcommand{\@cnamefive}{}
\newcommand{\cnamefive}[1]{\renewcommand{\@cnamefive}{#1}}
\newcommand{\@caffiliationfive}{}
\newcommand{\caffiliationfive}[1]{\renewcommand{\@caffiliationfive}{#1}}

\newcommand{\@cnamesix}{}
\newcommand{\cnamesix}[1]{\renewcommand{\@cnamesix}{#1}}
\newcommand{\@caffiliationsix}{}
\newcommand{\caffiliationsix}[1]{\renewcommand{\@caffiliationsix}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options
%%
%% singlespace : override the default doublespacing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\Singlespace}{0}
\DeclareOption{singlespace}{\renewcommand{\Singlespace}{1}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load base class
%%
%% the base class
%% "Font size for your text should be 12 point"
%% "All manuscript pages must be 8.5"x11" ("letter size")."
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[letterpaper,12pt]{report}

% Margins: "The left margin of each page must be 1 1/4 or 1 1/2 inches, and the top, right, and bottom margins 1 inch."
\RequirePackage[
left=1.25in,
right=1in,
top=1in,
bottom=1in]
{geometry}

% Table of contents customization
\RequirePackage{tocloft}

% For chapter titles etc. customization
\RequirePackage{titlesec}
\titleformat{\chapter}[display]{\center\LARGE\bfseries}{\chaptertitlename\ \thechapter}{10pt}{\LARGE}
\titleformat*{\section}{\raggedright\large\bfseries}
\titleformat*{\subsection}{\raggedright\large\bfseries}
\titleformat*{\subsubsection}{\raggedright\normalsize\bfseries}


% For intelligent double spacing
\RequirePackage{setspace}

% For formatting the appendices
% The toc option adds an appendices entry into the TOC
% The title option includes the value of \appendixname in front of 'A', 'B', etc, but only if they are specified as \chapter s in the appendices.
\RequirePackage[toc,title,titletoc]{appendix}
%\renewcommand{\appendixname}{Insert the prefix you want here} % This affects \chapter commands

% For forcing the title page to include a page number, as required 
% by UNM formatting guidelines
\RequirePackage{xpatch}

% default for dot spacing in all lists (ToC, LoF, LoA, and LoT)
\newcommand{\@tocdotspacing}{1} 

% General formatting for front matter
\newcommand{\frontmatter}{%
	\pagenumbering{roman}
}

% Formatting for the title page
\renewcommand{\maketitle}{%
  % the following lines are required to force the title page to show 
  % a page number ("ii")
  \xapptocmd{\endtitlepage}{\clearpage\stepcounter{page}}{}{}%
  \makeatletter
  \let\ps@empty\ps@plain%
  \makeatother
  % end of code for forcing title page number
	\newpage
	\thispagestyle{empty}
	% if more space is required above the title, add it here
	\begin{center}
		\large{%
			\MakeUppercase{\textbf{\@title}}%
  		\vfill%
  		\textbf{by}%
  		\vfill%
  		\MakeUppercase{\textbf{\@author}}\\[0.5cm]%
		}
  	\normalsize{%
			{\@degreeheld}\ \\%
  	}	
    \vfill%
    \large{%
  		DISSERTATION\\[0.5cm]%
  		Submitted in Partial Fulfillment of the\\Requirements for the Degree of\\
  		\textbf{\@degree}\\[0.5cm]%
  		\textbf{\@department}\\%
  		\@university\\[1cm]%
  		\textbf{\@gradmonth, \@gradyear}
		}
  	\end{center}
  	\clearpage
}

\newcommand{\makeapproval}{%
	%\thispagestyle{empty}%
  
	\par \noindent \large
  \textbf{\@author}%
	\vskip -.3cm% to move the line upwards to the name
	\par\noindent\makebox[4in]{\rule{4in}{.5pt}}%
  \vskip -.1cm%
  \par\noindent\makebox[4in][l]{\small \textit{Candidate}}\\%
  \normalsize

	\par \noindent \large \textbf{\@department}%
	\vskip -.3cm%
	\par\noindent\makebox[4in]{\rule{4in}{.5pt}}%
  \vskip -.1cm%
  \par\noindent\makebox[4in][l]{\small \textit{Department}}\\%
  \normalsize

	\par \noindent This dissertation is approved, and it is acceptable in quality\\%
	and form for publication:\\%

	\par \noindent \textit{Approved by the Dissertation Committee:}\\%

	\par \noindent \large \textbf{\@cnameone}\hfill\@caffiliationone%
	\vskip -.3cm%
	\par \noindent \makebox[4in][l]{\rule{\textwidth}{.5pt}}%
  \vskip -.1cm%
  \par\noindent\makebox[4in][l]{\small \textit{Chairperson}}\\%
  \normalsize

	\par \noindent \large \textbf{\@cnametwo}\hfill\@caffiliationtwo%
	\vskip -.3cm%
	\par \noindent \makebox[4in][l]{\rule{\textwidth}{.5pt}}%
  \vskip -.1cm%
  \par\noindent\makebox[4in][l]{\small \textit{}}\\%
  \normalsize

	\par \noindent \large \textbf{\@cnamethree}\hfill\@caffiliationthree%
	\vskip -.3cm%
	\par \noindent \makebox[4in][l]{\rule{\textwidth}{.5pt}}%
  \vskip -.1cm%
  \par\noindent\makebox[4in][l]{\small \textit{}}\\%
  \normalsize

	\par \noindent \large \textbf{\@cnamefour}\hfill\@caffiliationfour%
	\vskip -.3cm%
	\par \noindent \makebox[4in][l]{\rule{\textwidth}{.5pt}}%
  \vskip -.1cm%
  \par\noindent\makebox[4in][l]{\small \textit{}}\\%
  \normalsize

  % if you need more members, uncomment
	%\par \noindent \large \textbf{\@cnamefive}\hfill\@caffiliationfive%
	%\vskip -.3cm%
	%\par \noindent \makebox[4in][l]{\rule{\textwidth}{.5pt}}%
  %\vskip -.1cm%
  %\par\noindent\makebox[4in][l]{\small \textit{}}\\%
  %\normalsize

	%\par \noindent \large \textbf{\@cnamesix}\hfill\@caffiliationsix%
	%\vskip -.3cm%
	%\par \noindent \makebox[4in][l]{\rule{\textwidth}{.5pt}}%
  %\vskip -.1cm%
  %\par\noindent\makebox[4in][l]{\small \textit{}}\\%
  %\normalsize

}	

\renewenvironment{abstract}{%
	\clearpage%
	\begin{center}%
	\large \MakeUppercase{\textbf{\@title}}\\[0.5cm]%
	by\\[0.5cm]%
	{\textbf{\@author}}\\[0.5cm]%
  \normalsize
	\@degreeheld\ \\[0.5cm]%
  \large
	\@degree, \@department
  \normalsize
	\end{center}%
	}%
	{%
	}

% UNM graduate studies (in november 2020) said the abstract has to be <= 150 words, 
% So use the usual \begin{abstract}...\end{abstract} environment 
% for a short abstract, and then if you want a long abstract, use this
\newenvironment{longabstract}{%
	\clearpage%
	\begin{center}%
	%\large \MakeUppercase{\textbf{\@title}}\\[0.5cm]%
	%by\\[0.5cm]%
	%{\textbf{\@author}}\\[0.5cm]%
  %\normalsize
	%\@degreeheld\ \\[0.5cm]%
  %\large
	%\@degree, \@department\\[0.5cm]%
  \large \MakeUppercase{\textbf{Long Abstract}}\\[0.5cm]%
  \normalsize
	\end{center}%
	}%
	{%
	}

\newenvironment{dedication}{%
	\clearpage%
	\begin{center}%
	\large \textbf{DEDICATION}\\%
	\end{center}%
	}%
	{%
	}

\newenvironment{acknowledgements}{%
	\clearpage%
	\begin{center}%
	\large \textbf{ACKNOWLEDGEMENTS}\\%
	\end{center}%
	}%
	{%
	}

\newcommand{\makecontents}{%
	\clearpage%
  % depth 1 = section, 2 = subsection, etc.
	\setcounter{tocdepth}{2} 
  \setcounter{secnumdepth}{3} % one more than tocdepth to get numbering at all depths in toc
	\renewcommand{\cftchapdotsep}{\@tocdotspacing}%
	\renewcommand{\cftsecdotsep}{\@tocdotspacing}%
	\renewcommand{\cftsubsecdotsep}{\@tocdotspacing}%
	\renewcommand{\cftsubsubsecdotsep}{\@tocdotspacing}%
	\renewcommand{\cftfigdotsep}{\@tocdotspacing}% for dot spacing in list of figures
	\renewcommand{\cfttabdotsep}{\@tocdotspacing}% for dot spacing in list of figures
	\renewcommand{\cftchapleader}{\normalfont\cftdotfill{\cftsecdotsep}}% make chapters not have bold dots

	%\cftsetindents{section}{0em}{2em}%
	%\cftsetindents{subsection}{0em}{2em}%
	
	% Change TOC title format
	\renewcommand{\contentsname}{Table of Contents}% change title 
	\renewcommand{\cfttoctitlefont}{\hfill\Large\bfseries\MakeUppercase}%
	\renewcommand{\cftaftertoctitle}{\hfill\mbox{}}%

	% ditto for LOF
	\renewcommand{\cftloftitlefont}{\hfill\Large\bfseries\MakeUppercase}%
	\renewcommand{\cftafterloftitle}{\hfill\mbox{}}%
	
	% ditto for LOT
	\renewcommand{\cftlottitlefont}{\hfill\Large\bfseries\MakeUppercase}%
	\renewcommand{\cftafterlottitle}{\hfill\mbox{}}%

	\tableofcontents%
  %\cleardoublepage
  \clearpage
	\addcontentsline{toc}{chapter}{List of Figures}
	\clearpage
	\listoffigures%
	\clearpage
	\addcontentsline{toc}{chapter}{List of Tables}
	\listoftables%
	\clearpage%
}

%"Beginning with the first page of text in the Body of Research (begin again with page "1"), 
%pages are numbered with sequential Arabic numerals through the end of your manuscript."
%"Your manuscript should be double-spaced (one and a half spaces can be used if approved by 
%the chair of your committee) and single-sided."
\newcommand{\bodyofwork}{%
	\pagenumbering{arabic}
	\ifnum \Singlespace=1
		\singlespacing
	\else
		\doublespacing
	\fi
}

% "Each chapter/major division of the text must start on a new page. 
% Each of these lead pages should be counted and numbered."
% This can be handled by default using the normal \chapter command

% "The pages of the appendices are numbered in sequence with those of the 
% text. Although it is preferable, you do not have to meet margin requirements 
% for the material in your appendix, except for the left-hand margin.
%
% "After the last page of text, include a list of appendices on a separate 
% page. Individual appendices should start on a separate page and should be 
% clearly marked.
%
% "The list of appendices should also be included in the Table of Contents. To list appendices in your 
% Table of Contents, use "Appendices" as your major heading. On the next line, indent five spaces, 
% and begin listing each appendix with its title (e.g., "Appendix A. Survey Data") and page number."
%
% These requirements are the most finicky because of how appendices are 
% supposed to appear in the TOC. The strategy is to make each appendix 
% appear as a section for purpose of TOC formatting. We then have to 
% create a special section command for appendix sections (because 
% \section would make them appear in TOC, which is what we don't want).
%
% create a list of appendices name
\newcommand{\listappendixname}{\hfill\Large\bfseries LIST OF APPENDICES\hfill\mbox{}}
% create a new list with the appendix counter and .apdx extension
\newlistof{appendix}{apdx}{\listappendixname}
% set the depth of the new list
\setcounter{apdxdepth}{1}
% make it use alphabetic labels
\renewcommand{\theappendix}{\Alph{appendix}}
% make its dots conform to those used in the other lists
\renewcommand{\cftappendixdotsep}{\@tocdotspacing}% \@tocdotspacing defined above.
% because our method for securing the proper formatting treats chapters as sections in the ToC, 
% we need a substitute for \section
\newcounter{apdxsec}
\newcounter{apdxsubsec}

\newcommand{\appendixstart}{%}
	\clearpage
	\listofappendix%
	\begin{appendices}
}%

\newcommand{\addappendix}[1]{%
	% increment counter
	\refstepcounter{appendix}%
	\chapter*{Appendix \theappendix:\\#1} % creates a chapter but does not add it to ToC
  	% add the chapter to the ToC as a section (to make it format in the ToC as required by grad studies), 
  	% with a period after the appendix name A, B, C, ...
  	\addcontentsline{toc}{section}{Appendix\space \protect\numberline{\theappendix.}#1}%
  	% add the chapter to the LoA
  	\addcontentsline{apdx}{appendix}{Appendix \protect\numberline{\theappendix.}#1}%
  	% set counter to use with sections
  	\setcounter{apdxsec}{1}%
}

% Because we insert new appendices as sections into the ToC, we need 
% a new \section command for appendices. 
% If you need \subsection or \subsubsection, you need to write your own
\newcommand{\appsection}[1]{%
	\section*{\Alph{appendix}.\arabic{apdxsec} #1}%
  %\setcounter{apdxsubsec}{1}%
	\refstepcounter{apdxsec}%
}

%\newcommand{\appsubsection}[1]{%
%  \subsection*{\Alph{appendix}.\arabic{apdxsec}.\arabic{apdxsubsec} #1}%
%  \refstepcounter{apdxsubsec}%
%}

% Any cleanup required at the end of the appendices section goes here
\newcommand{\appendixend}{%
	\end{appendices}	
}


% Default is to use biber for bibliography generation.
% To use, you may have to \addbibresource{<bibliography file>} in the preamble of your tex file.
% To use with bibtex, adjust the comments, and invoke 
% the command with the name of your references file.
\newcommand{\references}[1][]{%
	\clearpage%
	\pagestyle{empty}%
	\addcontentsline{toc}{chapter}{References}%
%	\bibliographystyle{plain}% For Bibtex
%	\bibliography{#1}% For Bibtex
    
	% I couldn't figure out how to adjust the font for "Bibliography", so this is a hack.
	% First make it not print anything
	% Then print what we want
	% Then override clearpage to keep \printbibliography from adding a page break
  \renewcommand{\bibname}{}% get rid of the default biblography heading
	\chapter*{References}% 	
	\begingroup
	\renewcommand{\cleardoublepage}{}
	\renewcommand{\clearpage}{}
	\printbibliography% For Biber
	\endgroup
	\clearpage%
}
