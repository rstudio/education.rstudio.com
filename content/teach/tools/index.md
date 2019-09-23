---
title: "Tools for teaching"
subtitle: "How to set up effective learning environments for teaching R and data science."
description: >
    _**How to set up effective learning environments for teaching R and data science.**_ Design an infrastructure and choose packages that can set you and your learners on the happy path.
weight: 3
---

# Computing infrastructure

A common friction point for getting students (and faculty) started with computing is installation and setup. Having the right computing infrastructure in place can make life easier for you as an educator, and can help put your learners on the happy path early. We have found that paying careful attention to your technical stack *before* you start teaching can minimize frustration and improve buy in for both students and instructors.

- **[Sign up for RStudio Academic pricing](https://www.rstudio.com/pricing/academic-pricing/).** RStudio offers special academic pricing discounts for our commercial products to qualified academic institutions. To find out if you qualify, please read more [here](https://www.rstudio.com/pricing/academic-pricing/). To get academic pricing, [contact the RStudio Sales team](https://www.rstudio.com/about/contact-sales/).

- **Use [RStudio Cloud in the Classroom](https://resources.rstudio.com/webinars/rstudio-cloud-in-the-classroom).** [RStudio Cloud](https://rstudio.cloud/) is a managed cloud instance of the RStudio IDE. This means you and your learners can use the RStudio IDE directly from your browser - there is no software to install and nothing to configure on your computer. Using RStudio Cloud early in a workshop or course allows you to circumvent the installation step and skip right to the good stuff. This webinar walks you through the steps of setting up your course on RStudio Cloud, highlighting the various functionalities for teachers and students.

- **Craft your course infrastructure.** The article [_Infrastructure and tools for teaching computing throughout the statistical curriculum_](https://peerj.com/preprints/3181/) discusses computational infrastructure and toolkit choices for modern educators using RStudio Server and RStudio Server Pro. The authors provide links to technical notes on setting up these systems for teaching, intended for both academics and IT professionals. (Note: A peer reviewed, but pay-walled version of the article can be found [here](https://www.tandfonline.com/doi/full/10.1080/00031305.2017.1397549).)

# Packages

After you get your tech stack set up, you'll want to think about packages that can help you create and deliver your content better. Several of RStudio's open source R packages can be very helpful when creating, organizing, and delivering your educational content.

- __Create interactive tutorials with the [learnr package](https://rstudio.github.io/learnr/).__ The [learnr package](https://rstudio.github.io/learnr/) is designed to turn any [R Markdown document](https://rmarkdown.rstudio.com) into an interactive tutorial. The final product can be published all of the same ways that Shiny applications can, including running locally on an end-user’s machine or running on a Shiny Server or hosting service like [shinyapps.io](https://www.shinyapps.io/). All of the [RStudio.cloud Primers](https://rstudio.cloud/learn/primers) are written with learnr &mdash; you can see the source code in this [GitHub repository](https://github.com/rstudio-education/primers).

- __Grade learnr tutorials with the [gradethis package](https://rstudio-education.github.io/gradethis/)__. Once you've created a tutorial, you may want to be able to evaluate learners' solutions, and provide targeted feedback based on their input. This package is being actively developed and refined.

- __Level up your YAML__. If you plan to teach R Markdown *with* R Markdown, you'll want to use the [ymlthis package](https://ymlthis.r-lib.org/). The package allows you to use R functions to create valid YAML headers (with all the right indentations and formatting!). Be sure to use the function [`asis_yaml_output()`](https://ymlthis.r-lib.org/reference/asis_yaml_output.html) so that when you knit your document, the YAML syntax is printed with built-in code highlighting.
