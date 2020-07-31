\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{applicationletter}[2020/07/31 Application letter class for LaTeX]

%----------------------------------------------------------------------------------------
%	CONFIGURATION
%----------------------------------------------------------------------------------------
\LoadClass[
	foldmarks=false,
	pagenumber=false,
	backaddress=false,
	firstfoot=false,
	parskip=half,
	addrfield=true
]{scrlttr2}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[english,ngerman]{babel}

\usepackage{graphicx}
\usepackage{fontawesome}
\usepackage[sfdefault]{AlegreyaSans}
\usepackage[singlespacing]{setspace}
\usepackage[pdfusetitle, hidelinks]{hyperref}

\makeatletter
\@setplength{toaddrvpos}{4cm} % distance from top
\@setplength{refvpos}{8cm}
\@setplength{toaddrhpos}{1in}
\@setplength{sigbeforevskip}{0.1in}
\makeatother

% Do not indent signature
\renewcommand*{\raggedsignature}{\raggedright}

\textheight=25cm

% Increase line height
\setstretch{1.08}

%----------------------------------------------------------------------------------------
%	LETTER HEAD
%----------------------------------------------------------------------------------------
\setkomavar{firsthead}{
	\begin{center}
		\renewcommand{\baselinestretch}{1.1}
		\LARGE  \textsc{\usekomavar{fromname}}
		
		\small {
			\faMapMarker \ \usekomavar{fromaddress}  \\ 
			\faEnvelopeO \ \usekomavar{fromemail} \  // \ \faPhone \ \usekomavar{fromphone} 
		}
	\end{center}
}
