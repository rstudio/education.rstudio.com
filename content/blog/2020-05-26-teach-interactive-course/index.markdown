---
title: Teach R with Interactive Courses
author:
  - '[Julia Silge](https://juliasilge.com/)'
date: '2020-05-26'
categories:
  - learn
  - teach
slug: teach-interactive-course
description: |
  How and why we built free online interactive courses for learning R.
photo:
  url: https://unsplash.com/photos/P_qvsF7Yodw
  author: Alain Pham
---

I [recently published](https://juliasilge.com/blog/tidymodels-ml-course/) yet another version of an [interactive supervised machine learning course](https://supervised-ml-course.netlify.app/) where learners can practice their modeling skills in the browser with four case studies. 

[![supervised ML](ml-course.png)](https://supervised-ml-course.netlify.app/)

It's a good thing that I like these data sets and this course 😉 because I have released at least three different versions of it at this point (depending on how exactly you want to do the accounting). The latest iteration of this course focuses on how to use [tidymodels](https://www.tidymodels.org/) for predictive modeling. Undertaking another significant revision of this course has given me the opportunity to reflect on the process of building and maintaining interactive courses.

## We're all in this together

I'm not the only one who has built interactive courses over the past year or so. In the aftermath of [loss of trust](https://juliasilge.com/blog/datacamp-misconduct/) in [DataCamp as a learning platform](https://www.buzzfeednews.com/article/daveyalba/datacamp-sexual-harassment-metoo-tech-startup), folks across both Python and R communities have looked into other options, especially open source options that are transparent, [free-as-in-speech, and/or free-as-in-beer](https://en.wikipedia.org/wiki/Gratis_versus_libre). [Ines Montani](https://ines.io/) created a course platform for both [Python](https://github.com/ines/course-starter-python) and [R](https://github.com/ines/course-starter-r), with a front-end powered by Gatsby and Reveal.js and back-end code execution powered by [Binder](https://mybinder.org/). Ines used this course framework for her own excellent [course on spaCy](https://course.spacy.io/en/), and multiple folks in the R community have built on their own courses as well. For example, Ted Laderas and the team behind the [R Bootcamp](https://r-bootcamp.netlify.app/) shared [their perspectives on building such a course](https://education.rstudio.com/blog/2020/03/r-bootcamp/) here at the RStudio Education blog earlier this spring.

The first person I knew who successfully got their interactive R course launched was [Noam Ross](https://www.noamross.net/); his course on generalized additive models is fantastic. 💯

[![GAMS](gams-course.png)](https://noamross.github.io/gams-in-r-course/)

All three of us (Noam, myself, and Ted Laderas) collaborated with [Florencia D'Andrea](https://florencia.netlify.app/) in building our courses. Florencia is one of the most knowledgeable people out there when it comes to getting a course like this up and running! I've chatted informally with both Florencia and Noam about their experiences in building and maintaining interactive courses before, so I decided to ask them to gather their thoughts less casually so we could share them all together.

## It's time to build

Everyone I know who has worked on a course like this says that it is a challenge to get up and running. Part of this is probably because it involves JavaScript frameworks that we as data scientists are _not_ 🙅 experts in. "It kind of constrains my ability to maintain or extend it," says Noam. 

Even aside from the JavaScript, this particular course framework involves a complex file structure for exercises, solutions, slides, and so forth that can be onerous to manage. I think I agree with Florencia, who says, "Perhaps the longest part is getting familiar with the file structures and exercises." Florencia wrote a [blog post outlining these details](https://florencia.netlify.app/2020/03/cooking-your-first-tutorial.en-us/), which is also [available in Spanish](https://florencia.netlify.app/es-es/2020/03/receta-para-tu-primer-tutorial.es-es/)!

On the other hand, we have all been amazed at learning more about [Binder](https://mybinder.org/), what it is, and what it can do. "The degree to which the Binder back-end just works is amazing. It's astonishingly low maintenance, which is one reason I don't consider moving to something I might understand better," says Noam. The first time Florencia explained to me how you can access what you have in the repo in an RStudio IDE in a browser, I was floored! "I think it is a great tool to turn a Git repo into an executable environment in a simple way," she says. To try it out, visit the [Binder site for my course](https://mybinder.org/v2/gh/juliasilge/supervised-ML-case-studies-course/binder), wait for the container to start, then click "New" near the top right, and choose "RStudio". You will be in an RStudio Server IDE where you have access to all of the code and data from the course.

[![binder](binder.png)](https://mybinder.org/v2/gh/juliasilge/supervised-ML-case-studies-course/binder)

## No free lunch

Building and maintaining courses like these are not without costs, of time ⏳ and money 💰. Both Noam and I sometimes struggle with managing questions or requests from learners. "It would be great to have a forum or something tied to the course where students can ask each other questions," Noam thinks, and I try to make sure folks know about [RStudio Community](https://community.rstudio.com/) (perhaps [specifically the modeling and machine learning category](https://community.rstudio.com/c/ml/15)) and other friendly spaces to get help.

There are different ways to host such courses. Noam hosts his via GitHub Pages and I use Netlify. My interactive course gets enough traffic that I exceed the bandwidth of the free starter plan on Netlify. For a little while, I paid Netlify for hosting costs, but then I applied for Netlify's [open source plan](https://www.netlify.com/legal/open-source-policy/) for my course, which has worked out great.

## Sweet success

An interactive course like this is a somewhat complicated undertaking, but seeing it finished is **so** satisfying. Florencia says, "To have a look at the course finished and running is definitely the best time of the work!" We also talked about how much we learned ourselves, about new tools and frameworks. 

Seeing a course be used by actual real learners is the true test of success. "It is awesome getting messages from students who use the course," Noam shares. "I always ask graduate students to send me their papers and dissertations." At a conference this past year, a fellow R user showed me that he had saved the supervised machine learning course as an icon on the Dock on his Mac, and said he had used it to study for getting a job! 🎉 This type of real impact is why we have invested the time and energy into making our courses free and accessible to people around the world. 

If you are a professor or content developer, perhaps suddenly needing to create online content, we can't tell you if this exact course framework is the right option for you. However, we are happy to be able to share these experiences with our community here, so you can take from it what works for you, whether that's exploring how to use Binder, how to consider the needs of diverse folks with questions, or whether one of these specific resources we created could fit your needs.

