---
title: What it Was Like Interning for RStudio
author:
  - Yim Register
date: '2019-10-25'
publishDate: '2019-10-25'
slug: what-it-was-like-interning-for-rstudio
description: |
   I spent the summer creating lessons to teach data science to software engineers. Here's what I learned along the way.
photo:
  url: https://unsplash.com/photos/KLJX9HmdVbw
  author: Danika Perkinson
tags: [internship]
---

I spent the summer creating a series of lessons to teach statistics and data science to software engineers
using software engineering data sources and academic research on software engineering practices.
It's nowhere near finished,
but I learned a lot that I hope other people will find helpful.
If you don't care about the details,
you can check out a first draft of the project at [ds4se.tech][ds4se].

## The Interview

Over the past few years I have developed a love for R.
I even pleaded with my Quantitative Methods class to give it a chance,
reminding them that *any* new language can be annoying.
(It turns out R is, but now I have a more nuanced understanding of why.)
So when I applied to RStudio it was in hope that I could combine my love of R with my PhD research in general machine learning literacy.

I get extremely nervous for interviews,
which may have something to do with
[The Needs of Autistic Adults in Video Calling][video-needs].
It might also have to do with my all-over-the-place background and skills:
I don't yet feel like a specialist in any one thing.
But the interview went well,
covering everything from my research to [my activist work][rochester].
My interviewer (and soon-to-be internship supervisor) emailed me a few days after our interview to try to *call me*
(for goodness sake).
I avoid phone calls like a good autistic millennial,
but at least I knew what I would be working on several months in advance,
which gave me time to rapidly learn everything I could about software engineering.

## The Project

"Data Science for Software Engineers" is a set of hour-long RMarkdown lessons (and packaged data)
that students can use to learn statistics on software engineering problems.
The problems include "how many repositories are on GitHub and how fast is it growing?"
and "how bad will your code suffer if you're sleep deprived?",
and the idea is to motivate computer science students and early-career software engineers
to learn about data science and research findings
using topics they care about.

When the project was first pitched to me
I had no idea why anyone cared about Git repos or Agile development or test suites or whatever.
What I *did* get was teaching statistics in a meaningful and gentle way,
and when I told software engineers about the project their eyes lit up.

## Preparation

I signed up for a Software Engineering Research seminar the second I accepted the internship
and vowed to read as much as I could before starting work so that no one would regret hiring me.
The first day in that seminar was incredibly frustrating.
I hadn't realized how little I knew about software engineering:
I simply did not know the terminology or the practices *at all*.
I'd written a few unit tests before, but that was about it.
I had no idea what a "test suite" was (it's just a bunch of unit tests).
We were reading a paper that mentioned the use of "fuzzers"
and I felt totally out of my element.
(Fuzzing is just throwing random data at a program to try to break it
and make sure you didn't miss any weird edge cases).
My RStudio mentor sent me lots of resources
and my PhD advisor [Amy Ko][amy-ko] has a strong background in software engineering and computing education research.

## Skills

The first day sucked,
in hindsight because I didn't properly advocate for myself.
My mentor tasked me with the first lesson we wanted to make:
How many repositories are there on Github?
Well,
I had basically used one API before and then given up because I didn't understand permissions,
what I had access to,
or how to submit queries.
I'm now in a course that I call "Bigger Data"
(because I already took "Big Data" and this one was next)
where I'm learning all the SQL, cloud computing, and API magic for data science.
But the first SQL I ever wrote was on my first day of my RStudio internship
and I didn't want to admit how little I knew.
I got there eventually,
but I should have told my mentor that I needed time to ramp up.

That first week was a sign of things to come:
the summer was a skills bootcamp for me
as well as an opportunity to *create* educational materials
instead of theorizing how we should teach computing.
Some of the things I picked up include:

-   Introduction to SQL
-   Waaaaaay better at using Git collaboratively and productively
-   Also better at video conferencing
    (if you don't think this is a skill, you haven't worked in a distributed company or had a long-distance relationship)
-   Teaching skills and exercises and how to make hard choices when designing at scale
-   Some API/cloud work
-   `ggplot2`, `dplyr`, and other data science skills
-   Software engineering knowledge, both conceptual and practical
-   Explaining statistics and envisioning how lessons could look like at large scale
-   Company internals/business things I didn't know about
-   How to rid my work of excess exclamation points

## Next Steps

I'm back at PhD school now
working on interventions for developing machine learning literacy using personal data.
The project has a long way to go,
but I hope to return to it soon
to evaluate some of its effectiveness and finish enough of it so that we can begin to circulate it.
I'll be at [rstudio::conf 2020][conf] both as a volunteer
(equipped with some gender, accessibility, and sensory guidelines for all)
and with a quick lightning talk about the project—I hope to see you there.

*A longer form of this post originally appeared [here][original].*

[amy-ko]: https://faculty.washington.edu/ajko/
[conf]: https://rstudio.com/conference/
[ds4se]: https://ds4se.tech/
[original]: https://medium.com/bits-and-behavior/what-it-was-like-interning-for-rstudio-ca0193e64bf5
[rochester]: [https://www.nytimes.com/2017/09/15/nyregion/rochester-university-sexual-harassment.html
[video-needs]: https://www.microsoft.com/en-us/research/uploads/prod/2019/08/Video_Calling_Challenges_for_Autism_camera-ready.pdf
