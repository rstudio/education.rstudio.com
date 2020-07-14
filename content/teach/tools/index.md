---
title: "Tools for teaching"
subtitle: "How to set up effective learning environments for teaching R and data science."
abstract: Set up for teaching and learning.
description: >
    Design a computing infrastructure and choose packages that can set you and your learners on the happy path.
weight: 3
---

Whether you are teaching for the first time or you are a seasoned educator, you know that finding the right tools can make or break any learning experience. As professional data science educators, we offer some opinionated advice about how to choose your computing infrastructure, and which packages are worth your time for adding value to your teaching.

# Computing infrastructure

A common friction point for getting students (and faculty) started with computing is installation and setup. Having the right computing infrastructure in place can make life easier for you as an educator, and can help put your learners on the happy path early. We have found that paying careful attention to your technical stack *before* you start teaching can minimize frustration and improve buy in for both students and instructors.

- **[Sign up for RStudio Academic pricing](https://www.rstudio.com/pricing/academic-pricing/).** RStudio offers special academic pricing discounts for our professional products to qualified academic institutions. This includes [RStudio Server Pro](https://rstudio.com/products/rstudio-server-pro/), [Connect](https://rstudio.com/products/connect/), and [Package Manager](https://rstudio.com/products/package-manager/). To find out if you qualify, please read more [here](https://www.rstudio.com/pricing/academic-pricing/). To get academic pricing, [contact the RStudio Sales team](https://www.rstudio.com/about/contact-sales/).

- **Use [RStudio Cloud in the Classroom](https://resources.rstudio.com/webinars/rstudio-cloud-in-the-classroom).** [RStudio Cloud](https://rstudio.cloud/) is a managed cloud instance of the RStudio IDE. This means you and your learners can use the RStudio IDE directly from your browser - there is no software to install and nothing to configure on your computer. Using RStudio Cloud early in a workshop or course allows you to circumvent the installation step and skip right to the good stuff. This webinar walks you through the steps of setting up your course on RStudio Cloud, highlighting the various functionalities for teachers and students.

- **Craft your course infrastructure.** The article [_Infrastructure and tools for teaching computing throughout the statistical curriculum_](https://peerj.com/preprints/3181/) discusses computational infrastructure and toolkit choices for modern educators using RStudio Server and RStudio Server Pro. The authors provide links to technical notes on setting up these systems for teaching, intended for both academics and IT professionals. (Note: A peer reviewed, but pay-walled version of the article can be found [here](https://www.tandfonline.com/doi/full/10.1080/00031305.2017.1397549).)

- **Use version control.** Our team uses [GitHub](https://github.com/rstudio-education). A lot. We use it for version control, but also for its side benefits: GitHub makes it easier to collaborate with others and share content with learners. If you aren't using version control yet, take a few minutes to read the article [_"Excuse me, do you have a moment to talk about version control?"_](https://peerj.com/preprints/3159/) Now that you are convinced, bookmark [_Happy Git with R_](https://happygitwithr.com/) also by [Jenny Bryan](https://jennybryan.org/). This free online book contains battle-tested instructions for setting up Git, GitHub, and RStudio across all operating systems. Use it yourself, and send your learners there too.

# Packages

After you get your tech stack set up, you'll want to think about packages that can help you create and deliver your content better. Several of RStudio's open source R packages can be very helpful when creating, organizing, and delivering your educational content.

- __Create interactive tutorials with the [learnr package](https://rstudio.github.io/learnr/).__ The [learnr package](https://rstudio.github.io/learnr/) is designed to turn any [R Markdown document](https://rmarkdown.rstudio.com) into an interactive tutorial. The final product can be published all of the same ways that Shiny applications can, including running locally on an end-user’s machine or running on a Shiny Server or hosting service like [shinyapps.io](https://www.shinyapps.io/). All of the [RStudio.cloud Primers](https://rstudio.cloud/learn/primers) are written with learnr &mdash; you can see the source code in this [GitHub repository](https://github.com/rstudio-education/primers).

- __Grade learnr tutorials with the [gradethis package](https://rstudio-education.github.io/gradethis/).__ Once you’ve created a tutorial, you'll probably want to evaluate learners’ solutions, and provide targeted feedback based on their input. Gradethis is a package that grades code and provides meaningful feedback in [learnr](https://rstudio.github.io/learnr/)
interactive tutorials, or as a standalone code grader. It gives instructors the ability to capture code submitted by a student and checks it by comparing the final result, the actual code, 
or against a set of test conditions. When gradethis is used to compare a learner's code against solution code, it can report *how* the answer differs.

- __Give your teaching materials a place to live.__ Many educators who teach R (or teach with R) have embraced the [bookdown package](https://bookdown.org/yihui/bookdown/), which helps you take a collection of R Markdown documents and knit them together into a polished website that engages learners. You can see some example books by browsing [bookdown.org](https://bookdown.org/). But you don't *have* to write a whole book &mdash; some of the best bookdown examples are from course or workshop notes like Columbia University's [*Exploratory Data Analysis & Visualization* (edav.info)](https://edav.info/), [*R Markdown for Scientists*](https://rmd4sci.njtierney.com/) by [Nick Tierney](https://www.njtierney.com/), and [*What They Forgot to Teach You About R*](https://rstats.wtf/). And once you've been bitten by the *down bug, you may not ever recover &mdash; you may start making websites for all your workshops with [blogdown](https://bookdown.org/yihui/blogdown/) and making all your [slides with R Markdown](https://bookdown.org/yihui/rmarkdown/xaringan.html).

- __Get serious about using GitHub in your classroom.__ The [ghclass package](https://rundel.github.io/ghclass/index.html) provides a suite of functions to manage courses via GitHub repositories for as few as two and as many as 400 learners. This package will help you if your aim is to teach learners how to use version control with R as part of a modern data science workflow, and you want to reduce your own and their Git pains. [This vignette](https://rundel.github.io/ghclass/articles/ghclass.html) lays out the nitty-gritty of setting your class up in GitHub with ghclass.
