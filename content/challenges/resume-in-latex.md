---
title: Writing a Résumé in LaTeX
description: Writing a résumé in LaTeX is initially painful, but rewarding
date: 2021-02-11T18:00:00
tag: latex, résumé, short
---

Way back in my college days, I was trying to write the first version of my
résumé. As a pedantic IT guy, I wanted to get **everything** perfect so that I
could stand out despite having very little practical experience.

Trying to write my résumé in OpenOffice proved to be quite
difficult. Attempting to select text sometimes resulted in selecting the
background which made it impossible to select text; trying to highlight text
would sometimes result it that text disappearing; moving one little object could
sometimes destroy formatting and alignment of everything else; maintaining
consistent text formatting was challenging; so many other issues...

After many hours of headaches, it became obvious that the best course of action
was to pick up LaTeX and figure out that screwy animal. I found many
"resume.cls" files out there to begin copying from, but they were all limited or
exceptionally frustrating to work with and required getting to know LaTeX in a
bit of depth. Many of them had some strange expectations which made sense only
to the original author.

With all that learning in my future, it made sense to start from scratch while
combining best practices that have been learned throughout my career.

The Style
---------

The result of this effort is [mteck.sty](/misc/mteck.sty), which can be
stored alongside a ``.tex`` file and imported using ``\usepackage{mteck}``.

Résumé
------

With this class file, getting started on your own résumé should (hopefully) be
quite trivial.

Here is a minimal example using this [mteck.sty](/misc/mteck.sty) LaTeX style:
```tex
%===================%
% John Doe's Resume %
%===================%
\documentclass[letterpaper,10pt]{article}
\usepackage{mteck}

\begin{document}

  %---------%
  % Heading %
  %---------%

  \documentTitle{John Doe}{
    % Web Version
    %\raisebox{-0.05\height} \faPhone\ [redacted - web copy] ~
    %\raisebox{-0.15\height} \faEnvelope\ [redacted - web copy] ~
    %%
    \href{tel:1234567890}{
      \raisebox{-0.05\height} \faPhone\ 123-456-7890} ~
    \href{mailto:user@domain.tld}{
      \raisebox{-0.15\height} \faEnvelope\ USER@domain.tld} ~
    \href{https://linkedin.com/in/USER/}{
      \raisebox{-0.15\height} \faLinkedin\ linkedin.com/in/USER} ~
    \href{https://github.com/USER}{
      \raisebox{-0.15\height} \faGithub\ github.com/USER}
  }

  %---------%
  % Summary %
  %---------%

  \tinysection{Summary}
  Very terse summary of below.

  %--------%
  % Skills %
  %--------%

  \section{Technical Competencies}

  \begin{multicols}{2}
    \begin{itemize}[itemsep=-2px, parsep=1pt, leftmargin=75pt]
      \item[\textbf{Automation}] SaltStack, Ansible, Chef, Puppet
      \item[\textbf{Cloud}] Salt-Cloud, Linode, GCP, AWS
      \item[\textbf{Languages}] Python, Bash, PHP, Perl, VB/C\#.Net
      \item[\textbf{OS}] Debian, Ubuntu, CentOS, BSD, AIX
      \item[\textbf{Policies}] CIS, SOC2, PCI-DSS, GDPR, ITIL
      \item[\textbf{Testing}] Pytest, Docker, CircleCI, Jenkins, Inspec
    \end{itemize}
  \end{multicols}

  %------------%
  % Experience %
  %------------%

  \section{Recent Experience}

  \headingBf{Consulting Corp}{Jul 2015 -- Jun 2025}
  \headingIt{Senior DevOps Engineer (FTE Consultant)}{}
  \begin{resume_list}
    \itemTitle{Client: Notable Placement}
    \item Analyzed network traffic patterns to identify bottlenecks and optimize performance
    \item Implemented firewall rules to enhance network security and prevent unauthorized access
    \item Conducted regular vulnerability assessments and applied patches to secure systems
    \item Collaborated with cross-functional teams to streamline IT processes and improve efficiency
    \vspace{3pt}
    \itemTitle{Client: Challenges Unlimited}
    \item Configured monitoring tools to track system performance and troubleshoot issues proactively
    \item Automated routine tasks using scripts to reduce manual effort and increase productivity
    \item Documented system configurations and procedures for knowledge sharing within the team
    \item Participated in disaster recovery planning and drills to ensure business continuity in case of emergencies
    \vspace{3pt}
    \itemTitle{Client: Broken Galleries}
    \item Implemented cloud migration strategies to move applications to a hybrid environment
    \item Optimized database performance through indexing and query tuning techniques
    \item Conducted capacity planning and scalability assessments to support future growth
    \item Provided on-call support for critical issues and worked on root cause analysis for incident resolution
  \end{resume_list}

  \headingBf{HealthCo Industries}{Feb 2011 -- Mar 2016}
  \headingIt{Senior Systems Administrator (SRE)}{}
  \begin{resume_list}
    \item Managed virtualized server environment spanning multiple data centers
    \item Oversaw migration of critical business applications to cloud-based platforms
    \item Configured and monitored network security measures, including firewalls and intrusion detection systems
    \item Implemented multi-factor authentication for remote access to company systems
    \item Streamlined patch management process, reducing vulnerabilities and downtime
    \item Conducted regular vulnerability assessments and penetration testing
    \item Automated server provisioning and configuration management tasks
    \item Maintained documentation for IT policies and procedures
    \item Coordinated responses to cybersecurity incidents with internal teams and external vendors
  \end{resume_list}

  %-----------%
  % Education %
  %-----------%

  \section{Education}

  \headingBf{State University}{} % Note: Adding year(s) exposes an implied age
  \headingIt{Bachelor of Science in Computer Information Systems}{}
  \headingIt{Minors: Networking ; Network Security}{}

  \vspace{5pt}
  \headingBf{Certifications}{}
  \begin{resume_list}
    \item Salt \hspace{2pt}- SaltStack Certified Engineer
    \item GCP - Professional Cloud Architect
  \end{resume_list}

  %----------------------------%
  % Extracurricular Activities %
  %----------------------------%

  \section{Volunteer / Open Source}

  \headingBf{Hospital / Health Science IRB}{Mar 2015 -- Present}
  \begin{resume_list}
    \item Served as non-scientific/unaffiliated patient-representative
    \item Reviewed patient consent forms for completeness, accuracy, and clarity
    \item Became familiar with industry standards and regulations (OHRP, HIPAA)
  \end{resume_list}

  \headingBf{Debian Linux}{Jan 2001 -- Present}
  \begin{resume_list}
    \item Maintained packages in Debian repositories
    \item Reviewed and sponsored packages on behalf of prospective Developers
    \item Resolved bugs reported in bug tracking system
  \end{resume_list}

\end{document}
```

Generate PDF
------------

On a Debian-based OS, all dependencies can be installed using:
```sh
apt-get install texlive-latex-base texlive-latex-recommended texlive-latex-extra texlive-fonts-extra
```

I personally use the following Makefile:
```make
#!/usr/bin/make -f
##
# Basic wrapper for pdflatex
# Usage: make; make Resume.pdf; make CV_compressed.pdf
##

# Build "all" PDF documents
all: Resume.pdf CV.pdf

# Compress a PDF file after build is complete
%_compressed.pdf: %.pdf
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
		-dPDFSETTINGS=/screen \
		-dNOPAUSE -dQUIET -dBATCH \
		-sOutputFile=$*_compressed.pdf $*.pdf

# Build a PDF document
%.pdf: mteck.sty %.tex
	$(RM) $*.pdf
	pdflatex -halt-on-error -file-line-error $*.tex
	# Requires second run for proper linking
	pdflatex -halt-on-error -file-line-error $*.tex
	sync; $(RM) $*.log $*.out $*.aux

# Remove non-source files
clean:
	$(RM) *.pdf
	$(RM) *.log *.out *.aux

.PHONY: all clean
```

This supports building ``resume.pdf`` from ``resume.tex`` by running
``make resume.pdf``.

Closing Thought
---------------

My own resume is also provided as a template on
[Overleaf, as "MTeck's Resume](https://www.overleaf.com/latex/templates/mtecks-resume/fzgztpkgngjc).
This platform provides a great alternative to local building.
