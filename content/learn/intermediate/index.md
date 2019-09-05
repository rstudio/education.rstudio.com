---
title: Intermediates
subtitle: Expand your skills
description: >
    _**Expand your R Skills.**_ Here are some common areas that people who already have some experience in R find particularly rewarding to learn.
weight: 2
---


\
\

<img src="/images/sail.jpg" alt="intermediates">

\
\

Once you've gotten started learning R, you can expand your skills by exploring many of the specialized capabilities of R. Here are 5 of the most common areas that people who already have some experience in R find particularly rewarding to learn.

- __Grab some cheat sheets.__ No one can possibly remember all the functions and arguments for every R package, which is why cheat sheets were invented. RStudio publishes a [free collection of cheat sheets](https://www.rstudio.com/resources/cheatsheets/) for the most popular R features and packages to help jog your memory. If you decide you'd like to collect them all, you may clone [the cheat sheet github repository](https://www.rstudio.com/resources/cheatsheets/). 

- __Improve your visualizations.__ You may already know how to create a basic plot using `ggplot2`, but can you build one that makes your audience go "Wow?" You can start by expanding your knowledge of the Grammar of Graphics and ggplot2 by reading Hadley Wickham's book, *ggplot2: Elegant Graphics for Data Analysis*. Paper and Kindle versions are [available on Amazon](https://www.amazon.com/ggplot2-Elegant-Graphics-Data-Analysis-ebook/dp/B01GVCRF6M) for the second edition of the book. The third edition is in-progress; you can see the in-progress book for [free online](https://ggplot2-book.org/) and the source files on [GitHub](https://github.com/hadley/ggplot2-book). If you'd like Hadley to personally explain his philosophy of using ggplot2 in his data science work, check out Hadley's talk from OpenVisConf 2017, [ *The Role of Visualiation in Exploratory Data Analysis*](https://youtu.be/ZdPNBF6GWBw).

- __Develop interactive applications with htmlwidgets and Shiny.__ One concrete way to communicate your analyses better is to make your visualizations interactive. You can learn how to add browser-based interactivity to your graphics with just a few lines of code at [www.htmlwidgets.org](https://www.htmlwidgets.org). If your interactive needs demand help from R code that needs to run on a server, learn how to write `Shiny` applications at [shiny.rstudio.com](https://shiny.rstudio.com). Both approaches can be integrated with R Markdown to create polished interactive dashboards [using the `flexdashboards` package](https://rmarkdown.rstudio.com/flexdashboard/).

-	__Simplify your model explorations with *tidymodels*.__ Much of data science involves modeling, but each modeling package seems to invent its own interface and arguments. Enter [`tidymodels`](https://github.com/tidymodels), a meta-package for modeling and analysis that shares the underlying design philosophy, grammar, and data structures of the tidyverse. If you previously have used `caret` for a uniform modeling interface, the [tidymodels package `parsnip`](https://tidymodels.github.io/parsnip/) is its more up-to-date child. While this project is still under development, it promises to dramatically simplify model exploration.

- __Explore other specialized packages.__ R attracts data scientists because of its more than 13,000 packages that address nearly every use case. If you're interested in genomics, you'll want to spend some time learning the [*bioconductor* collection of packages](https://bioconductor.org/). If you're working with Big Data on Spark clusters, check out [`sparklyr`](https://sparklyr.rstudio.com). If you want to dive into finance, you'll probably want to start with [`quantmod`](http://www.quantmod.com). To find out what packages you should explore, we recommend some of the topic-based package catalogs such as [Awesome R](https://awesome-r.com/) or the [CRAN task views](https://cran.r-project.org/web/views/).
