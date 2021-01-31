---
title: "(Re)building the R Bootcamp and generating R tutorials"
description: |
  Our experience (re-)building the R bootcamp and generating interactive R tutorials.
date: '2020-03-06'
slug: r-bootcamp
categories:
  - teach
  - learn
tags: [online]
author:
  - "[Ted Laderas](https://laderast.github.io/)"
  - "[Jessica Minnier](http://jessicaminnier.com/)"
  - "[Florencia D'Andrea](https://florencia.netlify.com/)"
photo:
  url: https://unsplash.com/photos/2FPjlAyMQTA
  author: John Schnobrich
---

This article outlines the original R-Bootcamp, why we moved it to [the current platform](https://r-bootcamp.netlify.com/), and talks about our experiences setting it up on the new [mybinder.org](https://mybinder.org) based platform that was created by [Ines Montani](https://github.com/ines/course-starter-r).

## The original RBootcamp

The original R-Bootcamp lived on DataCamp as a free course that
anyone could take. We decided to move the course off of DataCamp's platform because [we no longer felt it was ethical to support them](https://www.buzzfeednews.com/article/daveyalba/datacamp-sexual-harassment-metoo-tech-startup). The [R-Bootcamp](https://r-bootcamp.netlify.com/) focuses on teaching students the basics of the tidyverse with an interactive learning approach. It is not meant to be comprehensive, but it is meant to empower students who think they might be interested in data visualization, data wrangling, and simple statistical modeling. Most importantly, the R-Bootcamp is meant to be a psychologically safe and positive environment.

## Ines Montani's Platform

Ines Montani has developed a [course platform](https://github.com/ines/course-starter-r) that runs R and python code on mybinder.org. It is robust, and because it is based on mybinder.org, it scales very well. 

How does it work? It takes advantage of [mybinder.org](https://mybinder.org)'s ability to run R in a Docker container. The website itself is hosted on a service such as [Netlify](https://netlify.ocom), which handles the lesson material, code submission, and displaying results. The code is submitted via JavaScript to the Docker container and results (such as data.frames and ggplot2 figures) are returned to the user on a webpage. 

### Pros

**Scalability.** Because it is hosted on mybinder.org, a free service, the course scales very well. We have had hundreds of users run the RBootcamp, and we have had very few hiccups. Without this ability, we could not offer our course for free for everyone globally. 

**Free for right now.** Solutions such as LearnR are great, but they require a [shinyapps.io](http://shinyapps.io) account to host the material, which have limited bandwidth for the free accounts, and more access costs money. Ines' platform is dependent on two services that are currently free: mybinder.org and [netlify](https://netlify.com).

**Separates out code from content**. DataCamp lessons are organized into chapters that contain instructions and then an interactive coding platform that gives code scaffolding, hints and solutions. This allows students to learn interactively by following instructions to complete code prompts within an R environment. Ines' platform allows for similar interactivity, but separates out the slide contents from the code. This is very helpful in testing and debugging the code.

**Works on phone browsers**. A lot of students want to learn on the run. Because Ines is a usability master, the platform runs on phones with no problem, although some of the returned data frames may display a little small.

### Cons 

**Takes some time to learn.** The file structure of the platform takes a little getting used to, with code, exercises, and slides residing in different folders and files. It is not difficult to understand, but you do have to take some time learning these structures.

**Assumes you understand Git (particularly branches).** Because the course is run off two branches in the repository, you need to understand what goes where. Course material, exercise code, and slide material live in the *master* branch. Data and the docker related files to build the container live in the *binder* branch. Until you wrap your head around this, it can be a little confusing.

**Currently no way to track user completion/award certificates.** This platform is not meant to be a full replacement for online learning platforms such as Coursera or EdX. Again, it is perfect for our application of providing free lessons on learning R and encouraging students. 

**Code checking is limited.** Ines provides a template based method of matching of code. It works, but it is a little limited. We are looking at using the `gradethis` package to add more feedback about mistakes that students make and add helpful hints in response to these mistakes.

## Getting Started

The best way to start authoring content with this platform is to `usethis::create_project` to [fork the R course repo](https://github.com/ines/course-starter-r) and create an R project you can start altering. Once you have that open, the [`decampr`](https://github.com/laderast/decampr) documentation will help get you started with making chapters, and adding and editing exercises. 

We also recommend looking at the existing course repos ([RBootcamp](https://github.com/laderast/RBootcamp), [GAMs in R](https://github.com/noamross/gams-in-r-course) by Noam Ross, [Machine Learning Case Studies](https://github.com/juliasilge/supervised-ML-case-studies-course) by Julia Silge and Ines' [spacy course](https://github.com/ines/spacy-course)) to understand exactly how exercises, lessons, and data are set up. [Florencia](florencia.netlify.com) has been working in the framework and also maintaining a [list of courses that use this platform](https://github.com/flor14/tutorials), so look for other examples there. [Please](mailto:tedladeras@gmail.com) reach out to us! We want to help you put your content online.

One note on the Docker container, that is built on [mybinder.org](https://mybinder.org): while the `install.R` method works, we recommend building on existing work through [using a Dockerfile](https://github.com/rocker-org/rocker). That way, you can build on existing Docker containers that contain R installations and packages, such as Rocker (which has the [tidyverse](https://hub.docker.com/r/rocker/tidyverse) and [geospatial](https://hub.docker.com/r/rocker/geospatial) containers you can build on), which has containers such as the base rocker image, geospatial, and others (by the way, Rocker rocks!). 

## Contributing 

The `decampr` package developed by Ted Laderas and Jessica Minnier includes some simple utilities to process R-based DataCamp lessons to Ines' platform. We encourage people with DataCamp repositories to try it out on their own lessons and give feedback on how to improve the package. More examples of using Ines' platform will help it improve and grow to encompass many use cases.

Ines' platform is very powerful and flexible. However, as mentioned in the *Cons*, it can take some time to learn and there are some quirks to the file and git organization. Therefore, it would benefit greatly from community contribution to additional examples for [documentation](https://github.com/ines/course-starter-r) and [instructional material](https://github.com/laderast/decampr). This is a great way to contribute to the educational community!


## Conclusion

This platform has provided us the means with making our course content free and accessible to a large group of people worldwide. It requires a bit of technical skill to set up, but we have tried to make the process less painful with our `decampr` package. We highly encourage you to try setting up your own course. Reach out to us and we're happy to help you.

