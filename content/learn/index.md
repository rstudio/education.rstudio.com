---
title: Learn
---


![](../images/forest.jpg)

\

# Finding Your Way To R



After more than 25 years of development, the R ecosystem can seem overwhelming to newcomers. Whether you are just beginning R or have many years of data science experience, R offers a plethora of choice. Yet, when RStudio asks students about their biggest challenges in learning R, respondents overwhelmingly answer that survey question with another question: where should they begin?

- *Say something about emphasis on data science, not computer science, and being able to do things right away with data.*

Most journeys begin with a map. Here's ours: we have created three tracks to help learners navigate the R ecosystem. These tracks are not meant to be exhaustive, but instead are designed to help you become productive in the minimum amount of time, based on your experience level. The three tracks are:

1. [**Beginners:**](#beginner) Get started with the Tidyverse and R Markdown
1. [**Intermediates:**](#intermediate) Expand Your R Skills, and 
1. [**Experts:**](#expert) Go Deep.


## Beginners: Get Started With The Tidyverse And R Markdown {#beginner}

\
\

![](../images/beginner.jpg)

\
\

No one starting point will serve all beginners, but here are 5 ways to begin learning R.

- __Spend an hour with [*A Gentle Introduction to Tidy Statistics In R*](https://resources.rstudio.com/webinars/a-gentle-introduction-to-tidy-statistics-in-r).__ If you are coming to R from a traditional point-and-click statistics package such as SPSS or SAS, RStudio's Thomas Mock has created a free video webinar titled [A Gentle Introduction to Tidy Statistics In R](https://resources.rstudio.com/webinars/a-gentle-introduction-to-tidy-statistics-in-r). This one-hour introduction covers how to get started quickly with the basics of research statistics in R, providing an emphasis on reading data into R, exploratory data analysis with the `tidyverse`, statistical testing with ANOVAs, and finally producing a publication-ready plot in `ggplot2`. Plus, you'll find a host of other RStudio webinars and videos to explore via the topic menus on the left side of that page.

- __Read [*R for Data Science*](https://r4ds.had.co.nz).__ While videos are great for some, others of us learn best by curling up with a good book. If that describes you, pick up a copy of *R For Data Science* by Garrett Grolemund and Hadley Wickham from your friendly local bookseller. *R For Data Science* is available in [paper](https://www.amazon.com/Data-Science-Transform-Visualize-Model-dp-1491910399/dp/1491910399/ref=mt_paperback?_encoding=UTF8&me=&qid=1562083100) and [electronic](https://www.amazon.com/Data-Science-Transform-Visualize-Model-ebook-dp-B01NAJAEN5/dp/B01NAJAEN5/ref=mt_kindle?_encoding=UTF8&me=&qid=1562083100) forms and has been translated into multiple languages, so choose the version that's easiest for you. ** *R For Data Science* is also available for free as a `bookdown` online book at [https://r4ds.had.co.nz](https://r4ds.had.co.nz).** If you don't yet know enough about R to commit to *R for Data Science*, you may find Garret Grolemund's *Hands On Programming with R* a quicker way to get started. It's also available in paper, electronic, and free versions.

- __Start coding using [RStudio.cloud Primers](https://rstudio.cloud/learn/primers).__ One of the most effective ways to get started learning R is to start using it. [RStudio.cloud Primers](https://rstudio.cloud/learn/primers) offer a cloud-based learning environment that will teach you the basics of R all from the comfort of your browser. RStudio.cloud doesn't require you to install any software on your computer, making it easy to dip your toe into data science with R with a minimum of fuss. And best of all, rstudio.cloud accounts are free for personal use.

- __Publish your work with R Markdown.__ R is a terrific tool for telling stories with graphics and data, but sometimes you need words too. R Markdown weaves together narrative text and code to produce elegantly formatted reports, papers, books, slides and more. Garrett Grolemund will give you a personal R Markdown tour with his [*Get Started With R Markdown*](https://resources.rstudio.com/the-essentials-of-data-science/getting-started-with-r-markdown-60-02) video, or you can choose your own path through the wonders of R Markdown at [rmarkdown.rstudio.com](https://rmarkdown.rstudio.com).

- __Learn about some power tools for development.__ RStudio offers 6 videos called the [RStudio Essentials Series](https://resources.rstudio.com) that help you learn how to program and manage R projects using RStudio's tools including the RStudio Integrated Development Environment (IDE). These videos will also help you learn good development practices that make collaboration within a team safe and easy.

## Intermediates: Expand Your R Skills {#intermediate}

\
\

![](../images/sail.jpg)

\
\

Once you've gotten started learning R, you can expand your skills by exploring many of the specialized capabilities of R. Here are 5 of the most common areas that people who already have some experience in R find particularly rewarding to learn.

- __Grab some cheat sheets.__ No one can possibly remember all the functions and arguments for every R package, which is why cheat sheets were invented. RStudio publishes a [free collection of cheat sheets](https://www.rstudio.com/resources/cheatsheets/) for the most popular R features and packages to help jog your memory. If you decide you'd like to collect them all, you may clone [the cheat sheet github repository](https://www.rstudio.com/resources/cheatsheets/). 

- __Improve your visualizations.__ You may already know how to create a basic plot using `ggplot2`, but can you build one that makes your audience go "Wow?" You can start by expanding your knowledge of the Grammar of Graphics and ggplot2 by reading Hadley Wickham's book, *ggplot2: Elegant Graphics for Data Analysis*. Paper and Kindle versions are [available on Amazon](https://www.amazon.com/ggplot2-Elegant-Graphics-Data-Analysis-ebook/dp/B01GVCRF6M), while the github book source and instructions how to generate a PDF can be downloaded from [https://github.com/hadley/ggplot2-book](https://github.com/hadley/ggplot2-book). If you'd like Hadley to personally explain his philosophy of using ggplot2 in his data science work, check out Hadley's talk from OpenVisConf 2017, [ *The Role of Visualiation in Exploratory Data Analysis*](https://youtu.be/ZdPNBF6GWBw).

- __Develop interactive applications with htmlwidgets and Shiny.__ One concrete way to communicate your analyses better is to make your visualizations interactive. You can learn how to add browser-based interactivity to your graphics with just a few lines of code at [www.htmlwidgets.org](https://www.htmlwidgets.org). If your interactive needs demand help from R code that needs to run on a server, learn how to write `Shiny` applications at [shiny.rstudio.com](shiny.rstudio.com). Both approaches can be integrated with R Markdown to create polished interactive dashboards [using the `flexdashboards` package](https://rmarkdown.rstudio.com/flexdashboard/).

-	__Simplify your model explorations with *tidymodels*.__ Much of data science involves modeling, but each modeling package seems to invent its own interface and arguments. Enter [`tidymodels`](https://github.com/tidymodels), a meta-package for modeling and analysis that shares the underlying design philosophy, grammar, and data structures of the tidyverse. If you previously have used `caret` for a uniform modeling interface, the [tidymodels package `parsnip`](https://tidymodels.github.io/parsnip/) is its more up-to-date child. While this project is still under development, it promises to dramatically simplify model exploration.

- __Explore other specialized packages.__ R attracts data scientists because of its more than 13,000 packages that address nearly every use case. If you're interested in genomics, you'll want to spend some time learning the [*bioconductor* collection of packages](https://bioconductor.org/). If you're working with Big Data on Spark clusters, check out [`sparklyr`](https://sparklyr.rstudio.com). If you want to dive into finance, you'll probably want to start with [`quantmod`](http://www.quantmod.com). To find out what packages you should explore, we recommend some of the topic-based package catalogs such as [Awesome R](https://awesome-r.com/) or the [CRAN task views](https://cran.r-project.org/web/views/).


## Experts: Go Deep {#expert}

\
\

![](../images/scuba.jpg)

\
\


Even once you are an expert at R code development, learning some topics in depth will both help you develop better code and share it more effectively with others.

- __Dive into the foundations of R.__ Most R users are not programmers, and therefore much of their R code is not as readable, fast, or efficient as it could be. Hadley Wickham's book, *Advanced R* (available in [electronic form](http://adv-r.had.co.nz) and [an O'Reilly paperback from Amazon](http://amzn.com/1466586966?tag=devtools-20) forms), unlocks many of the secrets behind how R works the way it does, and gives you new strategies for solving diverse problems.

- __Learn how to extend R.__ While its content sometime overlaps with Hadley's *Advanced R*, the R Core Team offers *Writing R Extensions* ([electronic version](https://cran.r-project.org/doc/manuals/r-release/R-exts.html)) on CRAN. This book is particularly useful if you wish to add your own C and C++ routines to R, but also has unique information on debugging, the R API, and runtime profiling that is difficult to find anywhere else.

- __Build your own packages.__ R packages allow you to share your functions with other R programmers in a modular and easy-to-integrate way. The above-mentioned *Writing R Extensions* documents how to write packages, but you may find Hadley Wickham's *R Packages* book ([electronic edition here](http://r-pkgs.had.co.nz/package.html) and [an O'Reilly paperback from Amazon here](https://www.amazon.com/dp/1491910593/ref=cm_sw_su_dp?tag=r-pkgs-20) a bit easier to read and more step-by-step. If you want your R code to reach the widest possible population of developers, you'll want to know how to build packages.

- __Use Python in your analyses.__ Anyone who insists you must choose between R and Python for doing data science is creating a false choice. R offers an easy way to incorporate Python code in the [`reticulate` package](https://rstudio.github.io/reticulate). Sean Lopp's webinar, [*R, RStudio 1.2 & Python—a love story*](https://resources.rstudio.com/webinars/r-rstudio-1-2-amp-python-a-love-story-sean-lopp), demonstrates how easily developers can integrate Python code into their R workflows and walks through the development of a reticulated Shiny app.

- __Try your hand at Tensorflow for deep learning.__ RStudio hosts a web site dedicated to R and Tensorflow at [tensorflow.rstudio.com][https://tensorflow.rstudio.com), where you can learn how to use deep learning in your analyses. 
J.J. Allaire and Francois Chollet have published a *Deep Learning with R" [book available at Amazon](https://www.amazon.com/Deep-Learning-R-Francois-Chollet/dp/161729554X). You can hear J.J. describe the philosophy behind the system in his [rstudio::conf 2019 video](https://www.rstudio.com/resources/videos/machine-learning-with-tensorflow-and-r/). For an quick overview of  resources for how to get started with deep learning in R, read [Sigrid Keydana's article](https://blog.rstudio.com/2018/09/12/getting-started-with-deep-learning-in-r/) and subscribe to the [Tensorflow for R blog](https://blogs.rstudio.com/tensorflow/)



