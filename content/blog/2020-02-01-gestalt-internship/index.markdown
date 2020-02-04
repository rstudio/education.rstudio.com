---
title: Gestalt Internship
author:
  - "[Daniel Chen](https://chendaniely.github.io/)"
date: '2020-02-04'
slug: gestalt-internship
categories: []
tags:
  - internship
photo:
  url: https://unsplash.com/photos/dG35-kUxv34
  author: Dinh Pham
description: |
  Was working at RStudio as amazing as you think it would be? Yes.
  And what you get out of it is more than technical training.
---

Of all the
[projects](https://blog.rstudio.com/2019/01/18/summer-internships-2019/)
listed for the 2019 internships,
the one that stood out to me the most was the **Grader Enhancements**.
Mainly because I knew how deceptively **difficult** the problem is.

It's now named
[`gradethis`](https://github.com/rstudio-education/gradethis)
because `grader` made it to CRAN on my first week of the internship.
The package tries to grade code in a
[`learnr`](https://rstudio.github.io/learnr/)
document,
but the real magic of the package isn’t just reporting a correct or incorrect answer,
it’s the ability to provide meaningful feedback to the learner.
For example,
if the solution to a question was
`sqrt(log(1))`
and the student provided
`sqrt(log(2))`,
it would report the answer as “incorrect” but also return 
"I expected 1 where you wrote 2. Try it again; next time’s the charm!”.

If it wasn't for
[Hadley's `lobstr` talk a year earlier](https://www.youtube.com/watch?v=g1h-YDWVRLc),
I wouldn't have even known about ASTs
([abstract syntax trees](https://adv-r.hadley.nz/expressions.html#ast-funs))
to approach the problem.
I probably thought it would've involved writing the gnarliest regular expression pattern ever (I clearly don't come from a computer science background).

Ever since I've been involved with the R (and python) community,
I've always been surprised how much (free) material is out there for you to learn.
Everyone in the community just fosters a welcoming learning environment,
and the internship was yet another way to level-up my R skills.
From a technical perspective,
the most jarring part of the internship was transitioning from
"a user of the R language" to a "developer".
I've taught workshops and written R packages,
but nothing came close to the type of code I had to write for my internship.

Some of the major topics were:

1. **Using `vapply` instead of `sapply`**:
You might be okay in an analysis *script* with using `sapply`, but `vapply` **guarantees** the type of vector that is returned.
2. **Testing**: This goes for package unit tests but also writing internal testing code to make sure the object you are working with is actually what you think it is.
This was done with the
[`testthat`](https://testthat.r-lib.org/)
package for running unit test suites,
and the
[`checkmate` package](https://github.com/mllg/checkmate)
to write powerful assert statements to check objects.
3. **Non-standard evaluation**: A good part of the internship was just reading
and writing toy example code to get a sense of what NSE is in R.
There's a reading list of links on one of my
[earlier posts](https://daniel.rbind.io/2019/06/18/rstudio-internship-week-2/)

To give a sense of how deep of a hole I needed to get myself out of
just to understand what was going on,
it took me about a month to 
[fix](https://github.com/rstudio-education/gradethis/pull/10)
the package and 
[implement](https://github.com/rstudio-education/gradethis/pull/21)
the first
[issue](https://github.com/rstudio-education/gradethis/issues/11).

`gradethis` was refactored out of `learnr`,
so the entry-point into the grading functions were
highly coupled to what `learnr` passed into the grading function.
If it weren't for all the unit tests that were already there,
refactoring the package and changing the API would've been impossible.
What made unit tests essential to the work was that `print` statements and `browser`
calls wouldn't work as expected (if at all) because `learnr` is a very complex
piece of software that needs knowledge of how `knitr` **and** `shiny` works.
If I needed `browser` statements,
I'd actually have replicate the error in a unit test and put a `browser` statement into the actual test call.
This wasn't something that
[Jenny Bryan](https://speakerdeck.com/jennybc/object-of-type-closure-is-not-subsettable)
talks about.

I eventually got a hang of things,
and give a small internal lightning talk of it working.
Along the way I
[polished up the API](https://rstudio-education.github.io/gradethis/reference/index.html),
and even
[found a bug in the `==` operator](https://daniel.rbind.io/2019/08/06/inconsistencies-with-in-r/),
which I
[reported to r-devel](https://r.789695.n4.nabble.com/Unexpected-behaviour-when-comparing-long-quoted-expressions-td4758181.html).
You can also use the package as a standalone grader!
One of my proudest accomplishments was
[putting together a function](https://github.com/r-lib/rlang/issues/875) that
standardizes function calls with all the default arguments.
This way something like
`vapply(X = LETTERS[1:3], FUN = stringr::str_to_upper, character(1), USE.NAMES = TRUE)`
and `vapply(X = LETTERS[1:3], FUN = stringr::str_to_upper, character(1))`
are marked as "correct".

What made the internship such a
[wonderful experience](https://daniel.rbind.io/2020/01/29/my-time-as-an-rstudio-intern/)
was how many people
I saw and spoke with, even though everyone is remote.
The interns rotated every week to host a virtual coffee hour,
so we would meet one another.
The common theme of our discussions were usually along the lines of
"I have no idea how I got here",
"everyone is amazing",
"we don't want to go".
Needless to say, we all loved working there.

I had the chance to meet a [few interns](https://daniel.rbind.io/2020/01/29/my-time-as-an-rstudio-intern/)
in person while at conferences over the summer,
but it was great meet the rest of the interns and RStudio employees
at rstudio::conf:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">The <a href="https://twitter.com/rstudio?ref_src=twsrc%5Etfw">@rstudio</a> interns gather for a picture at <a href="https://twitter.com/hashtag/rstudioconf?src=hash&amp;ref_src=twsrc%5Etfw">#rstudioconf</a> <a href="https://twitter.com/hashtag/rstats?src=hash&amp;ref_src=twsrc%5Etfw">#rstats</a>.<br><br>AKA this is why parallel programming is hard. <a href="https://t.co/QslxOjAPTV">pic.twitter.com/QslxOjAPTV</a></p>&mdash; Dⓐniel Chen @ rstudio::conf 🐍🏴
☠️ (@chendaniely) <a href="https://twitter.com/chendaniely/status/1223034528479895552?ref_src=twsrc%5Etfw">January 31, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

But why "Gestalt Internship"?
It wasn't **just** an internship where I got to work on an R packages.
I had an entire R and
[Carpentries](https://carpentries.org/)
community behind me to get me there.
I didn't just learn how to be a better R programmer,
I worked on an education tool that would benefit future learners in R.
I've left the internship with a better understanding of topics that I can
pay forward to the rest of the community.
After being on the Education team,
I've found my way around my own dissertation topic and studying data science education in medicine, now.
It's more than just the "street cred" of being an intern at RStudio,
I feel even more responsibility to take all that I've learned to help the community grow.

So if you ask, "what was it like interning at RStudio?",
it's anything and everything you could possibly hope for.
