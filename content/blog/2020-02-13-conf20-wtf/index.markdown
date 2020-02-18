---
title: What They Forgot to Teach You About R at rstudio::conf 2020
author:
  - '[Kara Woo](https://karawoo.com)'
date: '2020-02-13'
categories: [learn, teach]
tags: [conf2020]
slug: conf20-wtf
photo:
  url: https://unsplash.com/photos/okvqMfl78YE
  author: Nielsen Ramon
description: 'Highlights from the What They Forgot to Teach You About R workshop.'
---

> tl;dr: all workshop materials are available here: <br>
> <i class="fab fa-github fa-fw"></i> <https://rstd.io/conf20-wtf> <br>
> 🔗 <https://rstd.io/wtf-2020-rsc> <br>
> <i class="fab fa-creative-commons fa-fw"></i> [License: CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/legalcode)


What did they forget to teach you about R? If you're like many people, your R
education focused mainly on how to do statistical analyses in R. However, there
are many other skills that are crucial to working productively in R and are
rarely taught. Filling in these gaps was the focus of the What They Forgot to
Teach You About R workshop that Jenny Bryan, Jim Hester, and I taught at
rstudio::conf 2020.

The first morning of the workshop was devoted to talking about
[project-oriented workflows](https://rstudio-conf-2020.github.io/what-they-forgot/day1_1),
and how best to organize one's R projects. We discussed how to create a project
structure that is self-documenting, organized, and easy to revisit and
collaborate on. Creating a logical folder structure, using informative and
well-formatted file names, practicing "safe paths", and splitting analyses up
into manageable pieces were some of the key components of robust R projects. In
the afternoon, Jim led the group through an exploration of R's
[debugging](https://rstudio-conf-2020.github.io/what-they-forgot/day1_3)
tools, including `traceback()`, `browser()`, `debug()`, `trace()`, and
`recover()`. Finally, we covered how to use
[git and GitHub](https://rstudio-conf-2020.github.io/what-they-forgot/day1_4)
to track the history of our projects and communicate our results.

Day two began with [personal R administration](https://rstudio-conf-2020.github.io/what-they-forgot/day2_1) 
([part 2](https://rstudio-conf-2020.github.io/what-they-forgot/day2_2)):
how to maintain your R installation and package libraries, how to set up a
development environment, how to install source packages and read source code,
and how to create reproducible project environments with renv. From there, Jenny
took us into more advanced
[git workflows](https://rstudio-conf-2020.github.io/what-they-forgot/day2_3).
Using a
[repo full of ASCII art](https://github.com/rstats-wtf/wtf-ascii-funtimes),
everyone practiced visiting the history of their projects and reverting and
cherry picking commits. We also covered some time honored strategies for
working with git, including
[the repeated amend](https://happygitwithr.com/repeated-amend.html)
and the [burn it all down](https://happygitwithr.com/burn.html) method.
We ended the day with a lesson on
[using purrr](https://rstudio-conf-2020.github.io/what-they-forgot/day2_4)
for repetitive tasks.

All of the materials from the workshop are available at
<https://rstudio-conf-2020.github.io/what-they-forgot/>, including:

* slides
* hands-on exercises
* links to further reading on the [What They Forgot to Teach You About R](https://rstats.wtf/) and [Happy Git and GitHub for the useR](https://happygitwithr.com/) sites
* the popular [Spotify playlist](https://open.spotify.com/playlist/0OuvqM69DKFK3QPbHIy2kc?si=xonCaP2RTmeOXO3YW7hxhQ) we played during the course

Throughout the workshop our fantastic team of TAs&mdash;Hannah Frick, Myfanwy
Johnston, Sean Kross, and Theo Roe&mdash;kept things running smoothly by moving
throughout the room and answering learners' questions. Thank you to them, to the
rest of the RStudio team, and to the workshop participants for making the two
days such a success!

<div class="hline-top">
<i class="fas fa-binoculars"></i>&nbsp;&nbsp;&nbsp;<a href='/blog/2020/02/conf2020-workshops/'><em>Check out materials from the 18 other rstudio::conf(2020) workshops...</em></a>
</div>
