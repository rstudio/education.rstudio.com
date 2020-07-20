---
title: "Finding Errors in Data Analyses"
author: 
  - "[Ian Flores](https://education.rstudio.com/trainers/people/flores_siaca+ian/)"
date: '2020-06-23'
tags:
  - internship
slug: finding-errors-in-data-analyses
description: |
  A preview of a research project studying how and how well data scientists find errors.
photo:
  author: Ian Flores
---

While some people guide their teaching practices with anecdotal evidence,
we prefer to study these practices through a scientific lens.
The goal of my summer internship with the RStudio Education team is
to find out how and how well data scientists and data science students identify errors in data analyses.
In particular,
we want to explore how the ability to catch errors varies by level of experience
as well as familiarity to the data and type of analysis. 

To do this we have developed R Markdown documents
that contain analyses related to domains such as sports, elections, and property sales.
These analyses will be presented to participants who will think aloud as they go through the document and identify errors.
Before implementing the study we wanted to test our design,
so I recruited two fellow interns and two experienced data professionals as alpha testers.
We found that the interns finished the notebooks quicker than the experienced professionals,
but still caught all of the errors.
Data professionals were much more meticulous with the wording of statistical premises
(e.g., association versus effect)
and they were more meticulous about their data exploration than the interns.
However,
the interns were able to wrap their heads more quickly around code they hadn't encountered before
than the experienced professionals. 

This experience also helped us refine the length and structure of the document
as some of the errors were too obvious.
We will start collecting data from real subjects in July,
and hope to publish our analysis in the fall.
If you are interested in taking part,
please contact us at ian.floressiaca@rstudio.com 

To support this study
I'm collaborating on the development of the R package [templar](https://github.com/kbodwin/templar)
created by [Prof. Kelly Bodwin](https://www.kelly-bodwin.com/) from California Polytechnic University,
which provides tools to create variant R Markdown documents.
Let's say you want to create an exam for students and have three different variants,
but the narrative of the exercises will stay the same and just the code chunks will differ.
You can use `templar` to select consistent variant code chunks
just by adding an extra argument to the chunk's setup.
This package is still in its early stages but it will be useful for both education and research.

What I've enjoyed most about my internship so far is the chance to meet and chat with people like Kelly,
Mine Çetinkaya-Rundel,
and Alison Hill.
RStudio as a company is great:
they provided me with a MacBook Pro (which has made me rethink my personal setup with Ubuntu and a Tuxedo laptop),
and they have provided space and dialogue about the current events regarding racism in the States.
They also follow a truly asynchronous remote culture.
My day usually starts by coding a little bit before 6am;
I then go exercise with my dog,
followed by snorkeling in the northeast of Puerto Rico (sorry not sorry),
and start my morning around 08:30am by checking Slack and email.
I work until around 14:00,
then continue after 18:30.
It has been a great learning and networking experience so far,
and I'm looking forward to the rest of my summer.
