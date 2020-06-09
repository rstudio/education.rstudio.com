---
title: "My Organization's First R Package Workshop at rstudio::conf(2020)"
author: 
  - "[Malcolm Barrett](https://malco.io/)"
  - "[Richard Iannone](https://randr.rocks/)"
date: '2020-06-08'
categories: [learn, teach]
tags: [conf2020]
slug: conf20-org-first-pkg
description: |
  A tour of the rstudio::conf() workshop 'My Organization’s First R Package'
photo:
  url: https://unsplash.com/photos/mTkXSSScrzw
  author: Leone Venter
---

> tl;dr: all workshop materials are available here: <br>
> <i class="fab fa-github"></i> https://rstd.io/conf20-org-pkg <br>
> 🔗 https://rstd.io/conf20-org-pkg <br>
> <i class="fab fa-creative-commons fa-fw"></i> [License: CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/legalcode)


We were thrilled to deliver our workshop, “My Organization’s First R Package,” at `rstudio::conf(2020L)`. Packages are the [fundamental unit of shareable code in R](https://r-pkgs.org/), and the modern ecosystem for developing and sharing packages is efficient and user-friendly. While many R packages are distributed through CRAN, they are also useful for sharing code within your organization, [organizing](https://github.com/benmarwick/rrtools) [analysis](https://zenartofrpkgs.netlify.app) [projects](https://emilyriederer.netlify.app/post/rmarkdown-driven-development/), and [deploying data science products](https://thinkr-open.github.io/golem/).

Many great resources exist for learning R package development, including the [R Packages book](https://r-pkgs.org/) and workshops like [Building Tidy Tools](blog/2020/02/conf20-tidy-tools/). Our workshop was unique, however, in that it focused on developing R packages for use within your organization---whether you’re a data science team, an academic research lab, or a lone R user in a sea of [Excel users](/blog/2020/02/conf20-r-excel/). We taught participants how to use devtools, usethis, and other useful package development tools to develop and share R packages for internal use. We made R packages for two fictional organizations, AVALANCHE and Intendo, to learn best practices in R development and useful tricks for internal packages. 

## Day 1

On Day 1, we focused on R package development basics: setting up packages, writing R code, documenting and testing your code, teaching others to use your package, and adding data (and other files) to R packages. We learned how to work with packages with usethis, build and check them with devtools, document them with roxygen2, and test them with testthat. 

To put these tools into practice, we developed an R package for the data science team for [AVALANCHE](https://finalfantasy.fandom.com/wiki/Avalanche_(group)), an (alleged) eco-terrorist group looking to take down the evil [Shinra Inc.](https://finalfantasy.fandom.com/wiki/Shinra_Electric_Power_Company). You can see the package we developed, avalanchr, on [GitHub](https://github.com/malcolmbarrett/avalanchr).

We also explored how R package development tools meet the needs of internal R packages. For instance, we included a data dictionary for our database with `usethis::use_data()`, we included R Markdown report templates with `usethis::use_rmarkdown_template()`, and we deployed a Shiny app straight from our package.

## Day 2

On Day 2, four sections covered several themes: working with databases, writing functions that use DB data, planning package dev within the organization, and integrating standardized reporting. The goals for this day were to review and get practice with most of the concepts learned on Day 1, and, to build a complete package based that utilizes data housed in a database (which is typical of how most organizations store their data). 
To make package development more fun and provide an experience more akin to a real-world business scenario, we used a set of DB tables that belong to an imaginary game studio called *Intendo*. We quickly got up to speed with how to access a MySQL database and how to calculate key performance indicators that were important to *Intendo* during its brief reign in 2015 (the company had moderate success with its *Super Jetroid* game before fizzling out in early ‘16).
The students learned how to create functions for the intendo package that: (1) facilitated data access, (2) quickly got us KPIs most relevant to the organization, and (3) were fully documented. Throughout the day, as on the first day, the package authoring workflow made great use of the easy-to-use functions available in usethis. There were five checkpoints of the intendo package that were available if any of the learners needed to get caught up.
Throughout the day, the learners asked us questions, showed us their new package functions, and ran `R CMD check` dozens of times. They made fully-functioning packages that any organization would be lucky to have! Aside from covering everything in the instructional materials, we exchanged plenty of tips and tricks about how to solve all those little package development snafus, save time during development, and go the extra mile to make the package shine!

## Packages

In the spirit of this workshop, we used plenty of packages to deliver the course! 

The first was the course package, [firstrpkg](https://my-org-first-pkg-2020.netlify.app/pre/packages/), which let participants install the materials locally, as well as all the R packages we needed for the course.

Participants also developed two R packages: avalanchr and intendo. You can follow along with their development by installing the materials with firstrpkg or by checking out the slides for each section:

## Teaching Materials

| Day | Session | Taught By | Theme | Materials |
| :---| :------------------------------ | :---------| :------------| :-----------|
| 1 | Welcome, Whole Game | Malcolm | Package dev | [Welcome](https://mb-slides-mofrp.netlify.app/welcome/index.html), [Whole Game](https://mb-slides-mofrp.netlify.app/r_packages_whole_game2/index.html)
| 1 | Setup Packages | Malcolm | Package dev | [Setup Packages](https://mb-slides-mofrp.netlify.app/r_packages_setup/index.html)
| 1 | Write Code | Malcolm | Package dev | [Write Code](https://mb-slides-mofrp.netlify.app/r_packages_write_code/index.html)
| 1 | Document | Malcolm | Package dev | [Document](https://mb-slides-mofrp.netlify.app/r_packages_document/index.html)
| 1 | Test Code | Malcolm | Package dev | [Test Code](https://mb-slides-mofrp.netlify.app/r_packages_test/index.html)
| 1 | Teach Others | Malcolm | Package dev | [Teach Others](https://mb-slides-mofrp.netlify.app/r_packages_teach/index.html)
| 1 | Adding Data and Files | Malcolm | Package dev | [Adding Data and Files](https://mb-slides-mofrp.netlify.app/r_packages_add_files/index.html)
| 2 | Working with Data in a Database | Rich | Databases | [Databases](https://github.com/rstudio-conf-2020/my-org-first-pkg/blob/master/materials/day_2/p_01_intendo/slides.pdf)
| 2 | Package Functions | Rich | Package dev | [Package Functions](https://github.com/rstudio-conf-2020/my-org-first-pkg/blob/master/materials/day_2/p_02_intendo/slides.pdf)
| 2 | Package Management | Rich | Organization | [Package Management](https://github.com/rstudio-conf-2020/my-org-first-pkg/blob/master/materials/day_2/p_03_intendo/slides.pdf)
| 2 | Standardized Reporting | Rich | Package dev | [Standardized Reporting](https://github.com/rstudio-conf-2020/my-org-first-pkg/blob/master/materials/day_2/p_03_intendo/slides.pdf)


## Closing

We had a great time interacting with the learners during the two days of the workshop! Many thanks go out to our wonderful TAs, [Amy Tzu-Yu Chen](https://my-org-first-pkg-2020.netlify.app/authors/amy/), [Samantha Toet](https://my-org-first-pkg-2020.netlify.app/authors/samantha/), and [Greg Lin](https://my-org-first-pkg-2020.netlify.app/authors/greg/). They answered dozens of questions and handled all sorts of technical issues.

Learners told us during and after the workshop that they got a lot out of it, and working with this group of enthusiastic useRs was an excellent experience for us, too. We wanted to empower everyone in attendance to be able to create useful R packages. With these new R skills, both they and the organizations they represent will invariably be more successful.

<div class="hline-top">
<i class="fas fa-binoculars"></i>&nbsp;&nbsp;&nbsp;<a href='/blog/2020/02/conf2020-workshops/'><em>Check out materials from the 18 other rstudio::conf(2020) workshops...</em></a>
</div>
