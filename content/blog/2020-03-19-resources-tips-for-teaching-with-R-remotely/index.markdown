---
title: "Resources and tips for teaching (with) R remotely"
description: |
  Many of us are moving our teaching online on short notice, thankfully there are lots of openly available online resources out there.
date: '2020-03-19'
slug: resources-for-teaching-data-science-and-statistics-remotely
categories:
  - teach
tags:
  - resources
  - rstudio-cloud
author: [mine]
photo:
  url: https://unsplash.com/photos/yW-Qgw_IJXg
  author: Maya Maceka
---

Having to move your teaching from in person to online on short notice is a difficult task. Thankfully there are plenty of openly and freely available resources that might help ease this transition, and allow you to focus on the bits of your teaching that only you can do. Below is a list of resources as well as tips to help you shift your teaching of R online.

## Code in the cloud

If your students don't have R and RStudio set up locally on their own devices, the easiest way to get them accessing these tools in the cloud is using [RStudio Cloud](https://rstudio.cloud/). Not only can you get your students up and running in an RStudio instance in no time, but you can also peek into their projects when they need help, which is extremely helpful when you're trying to help them debug something but you can't look over their shoulder. Shifting to a new technology on short notice is difficult, but here are some pointers to get you started:

- Read the [RStudio Cloud Guide](https://rstudio.cloud/learn/guide) for getting started with setting up your course on RStudio Cloud.
- Watch the [RStudio Cloud in the Classroom](https://resources.rstudio.com/webinars/rstudio-cloud-in-the-classroom) webinar step-by-step instructions, tips, and best practices.
- Sign up for our upcoming webinar with on RStudio Cloud on March 24th, 4-5 pm EDT [here](https://pages.rstudio.net/TeachingRonlinewithRStudioCloud_WebinarRegistration.html). In addition to going through how to set up a course on RStudio Cloud, we'll focus on teaching with RStudio Cloud remotely.

## Outsource content delivery

One option for content delivery is synchronous virtual sessions and we've given you some tips for this [here](/blog/2020/03/teaching-online-on-short-notice/). Another option is pre-recorded videos. Videos can be a great supplement to any class, but they can be especially useful for making time in synchronous virtual sessions for discussion as well as providing alternatives for students who are unable to make it to synchronous virtual sessions. The drawback is that they can be incredibly time consuming to produce, even if you promise yourself you won't spend too much time on perfecting them. You might be able to leverage existing video content, especially if you're using these to supplement other synchronous teaching sessions you're already planning to run:

- A searchable list of [RStudio webinars and conference talks](https://resources.rstudio.com/)
- Many courses on Coursera have an [audit option](https://learner.coursera.help/hc/en-us/articles/209818613-Enrollment-options). The [Data Science Specialization](https://www.coursera.org/specializations/jhu-data-science) and [Statistics with R](https://www.coursera.org/specializations/statistics) specialisations have lots of statistics and R content in video form that your students can watch for free with the audit option. 
- Each of the OpenIntro books come with videos accompanying each chapter, e.g. click on the videos link [here](https://www.openintro.org/book/os/).
- The [Cloud Based Data Science](https://leanpub.com/universities/set/jhu/cloud-based-data-science) course on Leanpub also features videos (and exercises students can complete for free).
  
## Flip code into interactive tutorials

Interactive exercises are great not only for self-paced learning, but also for the preparation phase in a flipped class, for formative assessment, or for self-contained demos during synchronous teaching (since they make it easy for students to jump in mid-analysis and code along with you). Interactive tutorials can also be a great replacement for pre-recorded videos that walk students through an analysis step-by-step, and while not trivial to create, they are likely less time consuming than creating a well edited video. The following resources feature many interactive tutorials for R that you can use / assign to your students.

- The [learnr](https://rstudio.github.io/learnr/) package makes it easy to turn any R Markdown document into an interactive tutorial. [RStudio Primers](https://rstudio.cloud/learn/primers) cover topics like R basics, visualising, wrangling, and tidying data and iteration and functions.
- [R Bootcamp](https://r-bootcamp.netlify.com/) is a "gentle and gradual introduction to manipulating and visualizing data in R using the tidyverse suite of packages". Read more about it [here](https://education.rstudio.com/blog/2020/03/r-bootcamp/).

## Plan for the "turn it in" phase

If your originally planned workflow required students to print out work they completed in R and turn in hard copies, you are probably having to shift from this. Yes, they can always email you things, but that's a bit of a mess... Below are a few options, from simpler to implement to more complex.

- Upload to learning management system (LMS): If students are working locally, students will have local copies of their files that they can upload to your LMS. If they're using RStudio Cloud or other server access, they can select the files they need to submit from the Files pane in RStudio, then go to More -> Export, which will download all selected files as a zipped folder. They can either unzip and upload, or upload as is (especially since some LMSs have restrictions on file types they allow, but usually most zip files).
<img src="file-export.jpeg" width="50%" />
- Publish to RPubs: RPubs is a free publishing service for R Markdown documents. Before you go down this route, note that all documents published to RPubs are publicly visible, so this option might not work for all types of assignments and you need to consider compliance with [FERPA](https://www2.ed.gov/policy/gen/guid/fpco/ferpa/index.html), [GDPR](https://gdpr-info.eu/), etc. for your students. But one option for protecting student identity is don't have students write their names on their documents they publish on RPubs, collect URLs to published assignments via your LMS, download as a spreadsheet, and now you have something much simpler than email submissions to sort through.
<img src="rpubs-publish.jpeg" width="946" />
- Dropbox File Request: If you don't have access to an LMS where students can upload work or your LMS is fussy about file types, sizes, etc. you can use the file request feature on Dropbox for students to upload their files. Read more about it [here](https://help.dropbox.com/files-folders/share/create-file-request). The benefit of this approach over uploading to something like a Google Drive is that students can't see each others' submissions.
- Using GitHub as your LMS: I wouldn't recommend introducing GitHub only for the sake of collecting student assignments, but if version control is already part of your course or if you're teaching students who are already familiar with Git and GitHub (and you are familiar with them as well!), the [ghclass](https://rundel.github.io/ghclass) package and GitHub Classroom both make it easy to set up using GitHub as your learning management system. [These slides](https://rstudio-conf-2020.github.io/design-ds-classroom/materials/05-github/slides/05-github.html#1) from the [Designing the Data Science Classroom workshop](https://rstudio-conf-2020.github.io/design-ds-classroom/) at rstudio::conf(2020) give an overview of how to get started.

## Additional resources

You're probably not changing your reading list mid-semester, but your students might appreciate pointers for free, online books they can use to supplement their learning. The following books are freely available online.

- [R for Data Science](https://r4ds.had.co.nz/)
- [Hands on Programming with R](https://rstudio-education.github.io/hopr/)
- [OpenIntro textbooks](https://www.openintro.org): OpenIntro Statistics, Introductory Statistics with Randomization and Simulation, Advanced High School Statistics, Introductory Statistics for the Life and
Biomedical Sciences
- [Statistical Inference via Data Science](https://moderndive.com/)
- [Modern Data Science with R](https://mdsr-book.github.io/) (some chapters are freely available online)

We also have a trove of openly licenced materials for teaching [here](https://education.rstudio.com/teach/materials/). Some highlights include [Data Science in a Box](https://datasciencebox.org/), [Stat 545](https://stat545.com/), and materials from RStudio workshops.

This is by no means a complete list. If you have, or know of, resources and tips for teaching R, data science, and statistics remotely, on short notice, or if you are looking for specific resources to help with your transition to online teaching, the [RStudio Community](https://community.rstudio.com/c/teaching/13) as well as [#rstats Twitter](https://twitter.com/search?q=%23rstats) are great places to share / ask.
