Writing a Résumé in LaTeX
#########################
:desc: Writing a résumé in LaTeX is initially painful, but rewarding
:date: 2021-02-11 18:00
:tags: latex, résumé, short

Way back in my college days, I was trying to write the first version of my
résumé. As a pedantic IT guy, I wanted to get **everything** perfect so that I
could stand out despite having very little practical experience.

Trying to write my résumé in OpenOffice--yes, I'm that old--proved to be quite
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

So... if learning LaTeX is required, it made sense that my end goal would
become, "spend a million hours on my own resume.cls that will serve me well for
many years to come. Which, of course, is what this post is here to share.

Here it is... my `resume.cls`_.

Résumé
------

With this class file, getting started on your own résumé should (hopefully) be
quite trivial. It's as simple as:

.. code-block:: latex

    %%%%%%%%%%%%%%%%%%%%%%%%%
    %  First Last - Résumé  %
    %%%%%%%%%%%%%%%%%%%%%%%%%

    \documentclass[margin,line]{resume}
    \usepackage{hyperref}

    \begin{document}

      %%%%%%%%%%%
      % Heading %
      %%%%%%%%%%%

      \name{First Last}
      \address{
        [details redacted -- web copy]
        %123 E 1st St ---
        %City, St 12345 ---
        %(123) 123-1234 ---
        %user@domain.tld
      }

      \begin{resume}

        %%%%%%%%%%%%%%%%%%%%
        % Career Objective %
        %%%%%%%%%%%%%%%%%%%%

        \section{Summary}

          \heading{Information Technology, }{DevOps Engineer}{}
          \begin{resume_list}
            \item[] Driven IT nerd with a passion for challenging problems; experienced with:
            \item[] - Release management, Cloud Technologies, Automation, Release  Engineering
          \end{resume_list}

        %%%%%%%%%%%%%%
        % Experience %
        %%%%%%%%%%%%%%

        \section{Career \\ Highlights}

          \heading{Company Name, }{San Jose, CA}{July 2010 -- Present}
          [Senior Systems Engineer]
          \begin{resume_list}
            \item foo
            \item bar
          \end{resume_list}

        %%%%%%%%%%%%%
        % Education %
        %%%%%%%%%%%%%

        \section{Education}

          \heading{Dakota State University, }{Madison, SD}{September 2006 -- December 2010}
          \begin{resume_list}
            \item[] B.S. in Business and Computer Information Systems
            \item[] Specialization: Systems Development
            \item[] Minors: Networking; Network Security
          \end{resume_list}

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Professional Development %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%

        \section{Professional \\ Development}

          Certifications\hfill Record ID
          \begin{resume_list}
            \item \textbf{SSCE} (SaltStack Certified Engineer) [2015]\hfill
              \href{https://ssc.saltstack.com/}{710C6EC7}
            \item \textbf{GCP - Professional Cloud Architect} (Google Cloud Platform) [2019 -- 2021]\hfill
              \href{https://www.credential.net/k315bwjm}{xuB2dH}
          \end{resume_list}
      \end{resume}

    \end{document}

Building a PDF from this is as simple as (on Debian-based systems) installing
texlive-latex-base and running ``pdflatex ./resume.tex``.

References
----------

This same `resume.cls`_ can be used for a references list.

.. code-block:: latex

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %  First Last - References  %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    \documentclass[margin,line]{resume}

    \begin{document}

      %%%%%%%%%%%
      % Heading %
      %%%%%%%%%%%

      \name{First Last}
      \address{
        123 E 1st St ---
        City, St 12345 ---
        (123) 123-1234 ---
        user@domain.tld
      }

      \begin{references}

        %%%%%%%%%%%%%%
        % References %
        %%%%%%%%%%%%%%

        \begin{reference}
          \person{Buddy One}
          \jobtitle{Network and Data Communications Consultant}
          \business{Engineering Firm}
          \street{122 8th St}
          \citystate{City, ST 12345}
          \phone{(123) 123-1255}
          \email{buddy@domain.tld}
        \end{reference}

      \end{references}

    \end{document}

Please remember that you should *not* offer a references list unless requested,
and only after you interviewed your potential employer at least once. There is
no reason to share it until you're sure you want to work for the company.

Closing Thought
---------------

Good luck fellow job seekers; I hope this can help you find your next employer!

.. _resume.cls: /files/uploads/resume.cls
