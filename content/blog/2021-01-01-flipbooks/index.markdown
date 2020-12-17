---
title: 'Building code-movies with {flipbookr}'
author:
  - Gina Reynolds
  - Rachel Goodman
  - Luca Picci
  - Conner Surrency
  - Brit Woodrum
date: '2021-01-01'
categories:
  - learn
description: |
  here
slug: flipbooks
photo:
  author: Alex Litvin
  url: https://unsplash.com/photos/MAYsdoYpGuk
---
<script src="{{< relref "blog/2021-01-01-flipbooks/index.markdown" >}}index_files/fitvids-2.1.1/fitvids.min.js"></script>
<script src="{{< relref "blog/2021-01-01-flipbooks/index.markdown" >}}index_files/fitvids-2.1.1/fitvids.min.js"></script>
<script src="{{< relref "blog/2021-01-01-flipbooks/index.markdown" >}}index_files/fitvids-2.1.1/fitvids.min.js"></script>
<script src="{{< relref "blog/2021-01-01-flipbooks/index.markdown" >}}index_files/fitvids-2.1.1/fitvids.min.js"></script>
<script src="{{< relref "blog/2021-01-01-flipbooks/index.markdown" >}}index_files/fitvids-2.1.1/fitvids.min.js"></script>




Have you heard of "code-movies" or "code-flipbooks"? Maybe not?  This blog post will tell you what they are, point you to tools to build them, and showcase student work and their insights about building flipbooks. 

I'll use the terms 'code-movies' and 'flipbooks' interchangeably. 

## What are flipbooks?

Flipbooks help you communicate how to get from 'A' to 'B' using data manipulation, analysis, or visualization code pipelines.   When using R markdown or Jupytr notebooks, we often see the input and output for a pipeline of steps.   Having the inputs and outputs nearby is really helpful in communicating the big picture of what is being accomplished with a chunk of code.  







But newcomers and even seasoned practitioners might have trouble figuring out what the individual steps in a pipeline accomplish.   This is where flipbooks come in! They seek to illuminate what’s going on in each incremental step of the pipeline or plot. Flipbooks do this by showing the *within* pipeline output states as the code is built up.  


Here's an example (click forward arrow to advance):  




<div class="shareagain" style="min-width:300px;margin:1em auto;">
<iframe src="embedded_flipbooks/an_mtcars_flipbook_embed.html" width="1600" height="900" style="border:2px solid currentColor;" loading="lazy" allowfullscreen></iframe>
<script>fitvids('.shareagain', {players: 'iframe'});</script>
</div>

## Code-movies in presentations

The 'flipbook' or code-movie technique is one that you are probably seeing more and more in coding presentations.  Presenters know that showing a code pipeline as it is built helps audiences digest workflows.  So they choreograph a set of slides to break down the build; if the alignment between slides is good --- and if we don't have disruptive slide transitions (wipes, spins, fades) --- we get to enjoy a little movie: the coordinated evolution of code and output.  Here are some inspiring examples...



- https://www.youtube.com/watch?v=DhDOTxojQ3k&feature=emb_logo
- https://pkg.garrickadenbuie.com/gentle-ggplot2/#42
- https://www.youtube.com/watch?v=sB8CYGlPN0o



## Building flipbooks fast and reliably with {flipbookr}

While code-movies deliver helpful insight to consumers, putting together this code-movie experience can be time consuming. There's a lot of copy-paste that has to happen to create the right partial code sequence -- and you can mix yourself up trying to coordinate it (I've been there!).

The [{flipbookr}](https://github.com/EvaMaeRey/flipbookr) package's goal is to help create these easy-to-follow-along-with, step-by-step experiences --- without the copy and paste pain!  So all you need to do is write your pipeline once -- then you can let {flipbookr} take over and create the coordinated evolution of code and output movie to communicate the process.

Basically {flipbookr}, using the slide show rmarkdown tool Xaringan, does four things: 

1. It parses an Rmd code pipeline from the chunk you indicate (you name the chunk)
2. It identifies good break points in that code chunk pipeline; the default is finding balanced parentheses at the ends of lines.
3. It spawns a bunch of code chunks with these partial builds of code, separated by slide breaks.

Upon compiling (knit), the html slide show displays these partial builds, giving us a movie-like experience ([xaringan](https://github.com/yihui/xaringan)!). 

There is so much decision-making packed into our code pipelines.  The {flipbookr} project is about making it easy to bringing those decisions to light so they can be appreciated, examined, discussed -- savored!


## Taking {flipbookr} for a spin

One way to get started with flipbookr is using the [Easy Flipbook Recipes](https://evamaerey.github.io/flipbooks/flipbook_recipes#1) guide; there's also a [video companion guide](https://www.youtube.com/watch?v=07xEB4q8bXo&feature=youtu.be) to the recipes book. 


Alternatively, you can use the "A minimal flipbook" template that comes with the package.  Using R Studio, install flipbookr (and {xaringan} if you don't have it already installed) as follows: `remotes::install_github("EvaMaeRey/flipbookr")`.  Then get the template with `File -> New File -> Rmarkdown -> A Minimal Flipbook`.  The template shows you some basic examples.

In the future, we hope to deliver a new mode of creating embedded mini flipbooks from *within Rmarkdown files* themselves. You will be able to create instant mini flipbooks with the function `flipbookr::embed_flipbook()`. You (or your students!) will be able to create flipbooks with less fuss than ever before!  Stay tuned or, if you are feeling brave and helpful, check out the [functions](https://github.com/EvaMaeRey/flipbookr/blob/master/R/h_write_instant_flipbook.R) or [examples template](https://github.com/EvaMaeRey/flipbookr/blob/master/inst/rmarkdown/templates/flipbook-embed/skeleton/skeleton.Rmd).  



## What to expect: insights and products using {flipbookr} 

Before you start building your own flipbooks, it might also be useful to hear about the experience of designing code-movies from some other folks.  

Four of my graduate research assistants, with the support of an RConsortium Grant, have built several excellent flipbooks here, showcasing gganimation, ggplot maps, tmap and magick.  Conner and Brit were in my quantitative analysis courses, and Luca and Rachel were in my data visualization course at the [Unversity of Denver's Korbel School of International Studies](https://korbel.du.edu/).

They offer some comments on the experience of writing them.  

<!-- So writing code for to create flipbooks is a little different than writing code only to accomplish a task.  It is more like choreographing an experience.  As much as possible, the creators should try to write the code so that their is feedback as code is revealed.    -->



## Conner - {tmap}



<div class="shareagain" style="min-width:300px;margin:1em auto;">
<iframe src="assets/AUS_InteractMap/AUS_tmap.html" width="1600" height="900" style="border:2px solid currentColor;" loading="lazy" allowfullscreen></iframe>
<script>fitvids('.shareagain', {players: 'iframe'});</script>
</div>



## Brit - {magick}



<div class="shareagain" style="min-width:300px;margin:1em auto;">
<iframe src="assets/magick/magick.html" width="1600" height="900" style="border:2px solid currentColor;" loading="lazy" allowfullscreen></iframe>
<script>fitvids('.shareagain', {players: 'iframe'});</script>
</div>

## Luca - {gganimate}


<div class="shareagain" style="min-width:300px;margin:1em auto;">
<iframe src="assets/unemployment/unemployment.html" width="1600" height="900" style="border:2px solid currentColor;" loading="lazy" allowfullscreen></iframe>
<script>fitvids('.shareagain', {players: 'iframe'});</script>
</div>

## Rachel - {maps w/ ggplot}

<div class="shareagain" style="min-width:300px;margin:1em auto;">
<iframe src="assets/Idaho Mapping/Idaho_mapping.html" width="1600" height="900" style="border:2px solid currentColor;" loading="lazy" allowfullscreen></iframe>
<script>fitvids('.shareagain', {players: 'iframe'});</script>
</div>


> *The process of producing a flipbook pushed me to think differently about both data wrangling and data visualization. It required me to be more deliberate in how I wrote and ordered my code... - Rachel*

<!-- It required me to be more deliberate in how I wrote and ordered my code, and it revealed redundancies and other inefficiencies in my script. The process also deepened my understanding of the commands that I employed by allowing me to see the output of each individual line of code. -->



---

## {flipbookr} heroes

The {flipbookr} project has been incredibly fortunate to build on incredible tools and has benefited from lot of motivation. Only with useful packages to demo, does flipbookr communicate useful information!

This project benefits a lot from generous help from folks, in particular to Emi Tanaka and Garrick Aden-Buie who were instrumental to getting the flipbookr project off the ground.  

Inspirations for flipbooks are ggplot2 and magrittr pipelines.  The sequential, incremental coding processes allowed by ggplot2 and magrittr pipelines makes code parsing easy and code alignment basically automatic.  The knitr, xaringan, and remark.js tools have been amazing platforms for this project.  

Yihui Xie's Xaringan and Garrick Aden-Buie's contributions to xaringan have put us in a position enjoy code movies. 

- [xaringan]() is *another* great Rmarkdown tool for creating output and code -- this time on output to .html slides
- [xaringan]()'s use of remark.js gives us [no-frills slide transitions](https://yihui.org/en/2017/08/why-xaringan-remark-js/) as its default = no disruptions between frames of our movies!
- [Side-by-side display of code and output](https://www.garrickadenbuie.com/blog/decouple-code-and-output-in-xaringan-slides/) has made alignment for output better.  
- [Highlighting new code](https://www.garrickadenbuie.com/blog/highlight-lines-without-breaking-the-code-in-xaringan/) allows the user to focus on output, with code highlight keeping track of what's new on the code side

Educational materials and detailed examples for Xaringan make it an attractive tool:

- remark.js styling flexibility and xaringan [examples and education](https://arm.rbind.io/slides/xaringan.html#1)





