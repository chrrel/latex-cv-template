\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2020/07/31 CV class for LaTeX]

%----------------------------------------------------------------------------------------
%	CONFIGURATION
%----------------------------------------------------------------------------------------
\LoadClass[a4paper, 11pt]{article} % Default font size and paper size
\usepackage[left=0.8in, right=0.8in, top=0.5in, bottom=0.4in]{geometry}

\usepackage[english,ngerman]{babel}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{csquotes}
\usepackage[sfdefault]{AlegreyaSans}
\usepackage{fontawesome}
\usepackage{color}
\usepackage{parskip}
\usepackage{titlesec}
\usepackage{graphicx}
\usepackage{ifthen}
\usepackage{tabularx}
\usepackage[pdfusetitle, hidelinks]{hyperref}

\MakeOuterQuote{"}
\pagestyle{empty} % Remove page numbering

\titleformat{\section}{\Large\scshape\raggedright}{}{0em}{}[\titlerule]
\titlespacing{\section}{0pt}{3pt}{3pt}

% PDF Meta Data
\author{\firstname \ \lastname}
\title{\documentTitle \ \firstname \ \lastname} 


%----------------------------------------------------------------------------------------
%	COMMANDS
%----------------------------------------------------------------------------------------
\newcommand{\marginAfterItem}{13pt}
\newcommand{\marginAfterItemShort}{5pt}

% CV Section with title - Usage: \begin{cvSection}{title} ... \end{cvSection}
\newenvironment{cvSection}[1] {%
	\section{#1} 
	\tabularx{\textwidth}{p{3cm}X}
} {
	\endtabularx
}

% Workplace - Usage: \workplace{Date}{Job role}{Company}{Location}{Description}, Location can be omitted.
\newcommand{\workplace}[5] {
	\textsc{#1} & \titlerow{#2, #3\ifthenelse{\equal{#4}{}}{}{, #4}} \\
	& \small{#5} \\[\marginAfterItem]
}

% Awards etc. - Usage: \award{Date}{Name of Award}{issuer}
\newcommand{\award}[3] {
	\textsc{#1} & #2 \footnotesize{(#3)} \\[\marginAfterItem]
}

% Activity - Usage: \activity{Date}{Job role}{Company}{Location}{Description}, Location can be omitted.
\newcommand{\activity}[5] {
	\textsc{#1} & \titlerow{#2 -- \textsc{#3}\ifthenelse{\equal{#4}{}}{}{, #4}} \\
	& \small{#5} \\[\marginAfterItem]
}

% Row - \cvRow{title}{Description}
\newcommand{\cvRow}[2] {
	\textsc{#1} & #2 \\[\marginAfterItem]
}

% Publication - Usage: \publication{Authors}{Year}{Title}{Type}{Institution}
\newcommand{\publication}[5] {
	#1 (#2). \emph{#3}. #4, #5.
}

% Title row - Usage: \titlerow{My Title}
\newcommand{\titlerow}[1] {
	{\AlegreyaSansMedium #1}
}

% Education - Usage: \education{Date}{Job role}{Company}{Location}{Description}, Location can be omitted.
\newcommand{\education}[5] {
	\textsc{#1} & \titlerow{#2} \\
	& {#3} \small{(#4)} \\
	& \ifthenelse{\equal{#5}{}}{}{\small{#5}} \\[\marginAfterItem]
}

% Skills - Usage \cvSkill{Deutsch}{5}
\makeatletter
\newcount\my@repeat@count
\newcommand{\cvSkill}[2]{
	\parbox[c]{7cm}{
		\parbox[c]{3.1cm}{#1}
		\begingroup \footnotesize
		\my@repeat@count=\z@
		\@whilenum\my@repeat@count<#2\do{ \faCircle\advance\my@repeat@count\@ne}%
		\my@repeat@count=\numexpr5-\z@\relax
		\@whilenum\my@repeat@count>#2\do{ \faCircleThin\advance\my@repeat@count\m@ne}%
		\endgroup 
	}
}
\makeatother

% Title - Usage: \maketitle
\renewcommand{\maketitle}{%
	\renewcommand{\baselinestretch}{1.4}
	\begin{center}
		\huge \textsc{\firstname \ \lastname}
		
		\normalsize {
			\faCalendar \ \dateOfBirth \ // \faMapMarker \ \address \\ 
			\faEnvelopeO \ \email \ // \ \faPhone \ \phonenumber \ // \ \faGithub \ \github \ 
		}
	\end{center}
	\renewcommand{\baselinestretch}{1.2}
}

% Title - Usage: \signature{image.png}{City, \today}
\newcommand{\signature}[2]{
	\vspace{0.8cm}
	\includegraphics[scale=0.16]{#1} \newline
	#2
}
