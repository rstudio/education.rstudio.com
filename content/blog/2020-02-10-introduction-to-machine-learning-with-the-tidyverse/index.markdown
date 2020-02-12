---
title: 'Introduction to Machine Learning with the Tidyverse'
date: '2020-02-10'
slug: intro-to-ml-tidy
categories: []
tags: []
author:
  - alison
photo:
  url: https://unsplash.com/photos/2YPSfYQA6Z0
  author: Brunel Johnson
description: >
  Here is your roadmap to our two-day rstudio::conf(2020) workshop on machine learning with the tidyverse and tidymodels.
---



> tl;dr: all workshop materials are available here: <br>
> <i class="fab fa-github"></i> https://rstd.io/conf20-intro-ml <br>
> 🔗 https://conf20-intro-ml.netlify.com/

At [rstudio::conf(2020)](https://rstd.io/conf) in January, I was lucky to lead a new two-day workshop called "Introduction to Machine Learning with the Tidyverse." This workshop was designed for learners who are comfortable using R and the [tidyverse](https://www.tidyverse.org/), and curious to learn how to use these tools to do machine learning using the modern suite of R packages called [tidymodels](https://github.com/tidymodels). If you just read that last sentence and don't yet know the word "tidymodels" yet, it is a collection of modeling packages that, like the tidyverse, have a consistent API and are designed to work together specifically to support the activities of a human doing predictive modeling (also known as [machine learning](https://sebastianraschka.com/Articles/2014_intro_supervised_learning.html#machine-learning-and-pattern-classification)).

If you have heard or used the [caret](https://cran.r-project.org/web/packages/caret/caret.pdf) package, tidymodels is its successor. The development of tidymodels is supported by [RStudio](https://rstudio.com/), and the team is led by [Max Kuhn](https://twitter.com/topepos), the author of [caret](https://cran.r-project.org/web/packages/caret/caret.pdf), [Cubist](https://cran.r-project.org/web/packages/Cubist/index.html), [C50](https://cran.r-project.org/web/packages/C50/C50.pdf) and other R packages for predictive modeling. Max has offered an [Applied Machine Learning workshop](https://github.com/tidymodels/aml-training) for several years now, but we have not yet attempted to teach tidymodels to a beginner audience. Until now! 🎉

<div class="figure" style="text-align: center">
<a href="https://github.com/allisonhorst/stats-illustrations" target="_blank"><img src="parsnip.png" alt="Art by Allison Horst" width="49%" /></a>
<p class="caption">Figure 1: Art by Allison Horst</p>
</div>

My colleague [Garrett Grolemund](https://twitter.com/statgarrett?lang=en) and I designed the workshop to provide a gentle introduction to supervised machine learning: concepts, methods, and code. Attendees learned how to train and assess predictive models with several common machine learning algorithms, as well as how to do feature engineering to improve the predictive accuracy of their models. We focused on learning the basic theory and best practices that support machine learning. Along the way, we introduced several core tidymodels packages including [parsnip][parsnip], [recipes][recipes], [rsample][rsample], and [tune][tune], which provide a grammar for modeling that makes it easy to the right thing, and harder to accidentally do the wrong thing. 

<div class="figure" style="text-align: center">
<a href="https://github.com/allisonhorst/stats-illustrations" target="_blank"><img src="recipes.png" alt="Art by Allison Horst" width="49%" /></a>
<p class="caption">Figure 2: Art by Allison Horst</p>
</div>



## Prerequisite Knowledge

Before workshops for this year's conf were announced, we framed two questions to help potential learners gauge whether this workshop was the right one for them:

---

+ Can you use mutate and purrr to transform a data frame that contains list columns?

+ Can you use the ggplot2 package to make a large variety of graphs?

If you answered "no" to either question, you can brush up on these topics by working through the online tutorials at https://rstudio.cloud/learn/primers.

---

These questions were driven by the fact that when we started developing the workshop, using tidymodels required fairly advanced [purrr](https://purrr.tidyverse.org/) skills; see an end-to-end code example from Max's Applied Machine Learning workshop at rstudio::conf(2019) [here](https://github.com/topepo/rstudio-conf-2019/blob/2aaf4c24cd90cfa91cf2cdde256d68341f21133b/Materials/Part_2_Basic_Principles.R#L137-L212). 

However, between the time we first conceived of the workshop and when we taught it, a lot of the tidymodels API had changed (for the better). In hindsight, I would reframe with these questions *(rationale in italics)*:

+ Have you used R for statistics, that is, doing hypothesis tests or another kind of inferential modeling? *Comfort with at least `lm` and hopefully more packages/functions for modeling is helpful.*

+ Can you use the [pipe operator](https://r4ds.had.co.nz/transform.html#combining-multiple-operations-with-the-pipe) to combine a sequence of functions to transform objects in R (like a data frame)? *Tidymodels code uses pipes, but tends to be more for combining functions within a single package rather than across packages.*

+ Can you work with tibbles (or data frames) that contain [list columns](https://r4ds.had.co.nz/many-models.html#list-columns-1)? *Tidymodels code generally returns tibbles, often with list columns that you need to get comfortable with.*

+ Can you use [`dplyr::select()` helper functions](https://tidyselect.r-lib.org/reference/select_helpers.html)? *This helps when composing [recipes][recipes] for feature engineering.*


## Packages

We set up [RStudio Server Pro](https://rstudio.com/products/rstudio-server-pro/) workspaces for all workshop attendees, which provided more horsepower for running some of the more computationally intensive models, and which came pre-loaded with all the workshop exercises as R Markdown files and the packages needed to do them pre-installed. For those who wished to follow along on their local machine, we provided the packages needed as [prework](https://conf20-intro-ml.netlify.com/prework/).

The code made heavy use of packages from the [tidyverse](https://tidyverse.tidyverse.org/) and [tidymodels](https://tidymodels.github.io/tidymodels/):


```r
install.packages(c("tidyverse", "tidymodels"))
```

Like the [tidyverse](https://tidyverse.tidyverse.org/), [tidymodels](https://tidymodels.github.io/tidymodels/) is a meta-package that bundles most of the building blocks we needed:


```r
library(tidymodels)
```

```
## ── Attaching packages ────────────────────────────────────────────────────────────────────────── tidymodels 0.0.3 ──
```

```
## ✓ broom     0.5.3          ✓ purrr     0.3.3     
## ✓ dials     0.0.4          ✓ recipes   0.1.9     
## ✓ dplyr     0.8.3          ✓ rsample   0.0.5     
## ✓ ggplot2   3.2.1          ✓ tibble    2.1.3     
## ✓ infer     0.5.1          ✓ yardstick 0.0.4     
## ✓ parsnip   0.0.4.9000
```

```
## ── Conflicts ───────────────────────────────────────────────────────────────────────────── tidymodels_conflicts() ──
## x purrr::discard()    masks scales::discard()
## x dplyr::filter()     masks stats::filter()
## x dplyr::lag()        masks stats::lag()
## x ggplot2::margin()   masks dials::margin()
## x recipes::step()     masks stats::step()
## x recipes::yj_trans() masks scales::yj_trans()
```

Two tidymodels packages were not yet on CRAN at the time of the workshop. We installed the development versions of [workflows][workflows] and [tune][tune] from GitHub.


```r
# install once per machine
install.packages("remotes")
remotes::install_github(c("tidymodels/workflows",
                          "tidymodels/tune"))

# load once per work session
library(workflows)
library(tune)
```

We also used some non-tidymodels packages as well:


```r
install.packages(c("kknn", "rpart", "rpart.plot", "rattle", 
                   "AmesHousing", "ranger", "partykit", "vip"))

# and

remotes::install_github("tidymodels/modeldata")
```

## Teaching Infrastructure

+ **RStudio Server Pro:** Our [RStudio Server Pro](https://rstudio.com/products/rstudio-server-pro/) workspaces used Amazon compute optimized [`c5.large` instances](https://aws.amazon.com/ec2/instance-types/) with 2 vCPUs and 4 GiB memory for each learner.

+ **Slides:** I used the [xaringan package](https://github.com/yihui/xaringan) to build all my slides in R Markdown. For a tutorial, you can see my rstudio::conf(2019) workshop slides [here](https://arm.rbind.io/slides/xaringan.html#1). I also highly recommend the [countdown package](https://pkg.garrickadenbuie.com/countdown/#1), which I used to create the exercise timers ⌛.

+ **Workshop website:** I used the [blogdown R package](https://bookdown.org/yihui/blogdown/) to build the [website](https://conf20-intro-ml.netlify.com), with the [Hugo academic theme](https://themes.gohugo.io/academic/) with a custom CSS designed by [Desirée De Leon](http://desiree.rbind.io/). If you want to re-use my workshop website (you'll need [GitHub](https://github.com/) and [Netlify](https://www.netlify.com/) accounts), click on *Deploy to Netlify* button at the top of my [`README`](https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/README.md) 🚀

In the rest of this post, I'll walk you through the materials available through the [workshop website](https://conf20-intro-ml.netlify.com/):

<iframe src="https://conf20-intro-ml.netlify.com/" width="100%" height="400px"></iframe>

## Materials

The workshop consisted of 8 sessions. In each session, we presented slides interspersed with timed group activities and independent coding exercises.

<!--
| session | slides                                 | Exercises + Solutions                   | 
|---------|----------------------------------------|-----------------------------------------|
| 00      | [Welcome & Introductions][00-slides]   |                                         |
| 01      | [Predicting][01-slides]                | [Exercises][01-ex], [Solutions][01-sol] |
| 02      | [Classifying][02-slides]               | [Exercises][02-ex], [Solutions][02-sol] |
| 03      | [Sampling & Resampling][03-slides]     |                                         |
| 04      | [Ensembling][04-slides]                | [Exercises][04-ex], [Solutions][04-sol] |
| 05      | [Workflows][05-slides]                 | [Exercises][05-ex], [Solutions][05-sol] |
| 06      | [Recipes][06-slides]                   | [Exercises][06-ex], [Solutions][06-sol] |
| 07      | [Cross-validation][07-slides]          | [Exercises][07-ex], [Solutions][07-sol] |
| 08      | [Tuning][08-slides]                    | [Exercises][08-ex], [Solutions][08-sol] |
-->

<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#upfttjnwpw .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  /* table.margin.left */
  margin-right: auto;
  /* table.margin.right */
  color: #333333;
  font-size: 16px;
  /* table.font.size */
  background-color: #FFFFFF;
  /* table.background.color */
  width: auto;
  /* table.width */
  border-top-style: solid;
  /* table.border.top.style */
  border-top-width: 2px;
  /* table.border.top.width */
  border-top-color: #A8A8A8;
  /* table.border.top.color */
  border-bottom-style: solid;
  /* table.border.bottom.style */
  border-bottom-width: 2px;
  /* table.border.bottom.width */
  border-bottom-color: #A8A8A8;
  /* table.border.bottom.color */
}

#upfttjnwpw .gt_heading {
  background-color: #FFFFFF;
  /* heading.background.color */
  border-bottom-color: #FFFFFF;
  /* table.background.color */
  border-left-style: hidden;
  /* heading.border.lr.style */
  border-left-width: 1px;
  /* heading.border.lr.width */
  border-left-color: #D3D3D3;
  /* heading.border.lr.color */
  border-right-style: hidden;
  /* heading.border.lr.style */
  border-right-width: 1px;
  /* heading.border.lr.width */
  border-right-color: #D3D3D3;
  /* heading.border.lr.color */
}

#upfttjnwpw .gt_title {
  color: #333333;
  font-size: 125%;
  /* heading.title.font.size */
  font-weight: initial;
  /* heading.title.font.weight */
  padding-top: 4px;
  /* heading.top.padding - not yet used */
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  /* table.background.color */
  border-bottom-width: 0;
}

#upfttjnwpw .gt_subtitle {
  color: #333333;
  font-size: 85%;
  /* heading.subtitle.font.size */
  font-weight: initial;
  /* heading.subtitle.font.weight */
  padding-top: 0;
  padding-bottom: 4px;
  /* heading.bottom.padding - not yet used */
  border-top-color: #FFFFFF;
  /* table.background.color */
  border-top-width: 0;
}

#upfttjnwpw .gt_bottom_border {
  border-bottom-style: solid;
  /* heading.border.bottom.style */
  border-bottom-width: 2px;
  /* heading.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* heading.border.bottom.color */
}

#upfttjnwpw .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  padding-top: 4px;
  padding-bottom: 4px;
}

#upfttjnwpw .gt_col_headings {
  border-top-style: solid;
  /* column_labels.border.top.style */
  border-top-width: 2px;
  /* column_labels.border.top.width */
  border-top-color: #D3D3D3;
  /* column_labels.border.top.color */
  border-bottom-style: solid;
  /* column_labels.border.bottom.style */
  border-bottom-width: 2px;
  /* column_labels.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* column_labels.border.bottom.color */
  border-left-style: none;
  /* column_labels.border.lr.style */
  border-left-width: 1px;
  /* column_labels.border.lr.width */
  border-left-color: #D3D3D3;
  /* column_labels.border.lr.color */
  border-right-style: none;
  /* column_labels.border.lr.style */
  border-right-width: 1px;
  /* column_labels.border.lr.width */
  border-right-color: #D3D3D3;
  /* column_labels.border.lr.color */
}

#upfttjnwpw .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  /* column_labels.background.color */
  font-size: 100%;
  /* column_labels.font.size */
  font-weight: initial;
  /* column_labels.font.weight */
  text-transform: inherit;
  /* column_labels.text_transform */
  vertical-align: middle;
  padding: 5px;
  margin: 10px;
  overflow-x: hidden;
}

#upfttjnwpw .gt_sep_right {
  border-right: 5px solid #FFFFFF;
}

#upfttjnwpw .gt_group_heading {
  padding: 8px;
  /* row_group.padding */
  color: #333333;
  background-color: #FFFFFF;
  /* row_group.background.color */
  font-size: 100%;
  /* row_group.font.size */
  font-weight: initial;
  /* row_group.font.weight */
  text-transform: inherit;
  /* row_group.text_transform */
  border-top-style: solid;
  /* row_group.border.top.style */
  border-top-width: 2px;
  /* row_group.border.top.width */
  border-top-color: #D3D3D3;
  /* row_group.border.top.color */
  border-bottom-style: solid;
  /* row_group.border.bottom.style */
  border-bottom-width: 2px;
  /* row_group.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* row_group.border.bottom.color */
  border-left-style: none;
  /* row_group.border.left.style */
  border-left-width: 1px;
  /* row_group.border.left.width */
  border-left-color: #D3D3D3;
  /* row_group.border.left.color */
  border-right-style: none;
  /* row_group.border.right.style */
  border-right-width: 1px;
  /* row_group.border.right.width */
  border-right-color: #D3D3D3;
  /* row_group.border.right.color */
  vertical-align: middle;
}

#upfttjnwpw .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  /* row_group.background.color */
  font-size: 100%;
  /* row_group.font.size */
  font-weight: initial;
  /* row_group.font.weight */
  border-top-style: solid;
  /* row_group.border.top.style */
  border-top-width: 2px;
  /* row_group.border.top.width */
  border-top-color: #D3D3D3;
  /* row_group.border.top.color */
  border-bottom-style: solid;
  /* row_group.border.bottom.style */
  border-bottom-width: 2px;
  /* row_group.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* row_group.border.bottom.color */
  vertical-align: middle;
}

#upfttjnwpw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
  /* row.striping.background_color */
}

#upfttjnwpw .gt_from_md > :first-child {
  margin-top: 0;
}

#upfttjnwpw .gt_from_md > :last-child {
  margin-bottom: 0;
}

#upfttjnwpw .gt_row {
  padding-top: 8px;
  /* data_row.padding */
  padding-bottom: 8px;
  /* data_row.padding */
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  /* table_body.hlines.style */
  border-top-width: 1px;
  /* table_body.hlines.width */
  border-top-color: #D3D3D3;
  /* table_body.hlines.color */
  border-left-style: none;
  /* table_body.vlines.style */
  border-left-width: 1px;
  /* table_body.vlines.width */
  border-left-color: #D3D3D3;
  /* table_body.vlines.color */
  border-right-style: none;
  /* table_body.vlines.style */
  border-right-width: 1px;
  /* table_body.vlines.width */
  border-right-color: #D3D3D3;
  /* table_body.vlines.color */
  vertical-align: middle;
  overflow-x: hidden;
}

#upfttjnwpw .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  /* stub.background.color */
  font-weight: initial;
  /* stub.font.weight */
  text-transform: inherit;
  /* stub.text_transform */
  border-right-style: solid;
  /* stub.border.style */
  border-right-width: 2px;
  /* stub.border.width */
  border-right-color: #D3D3D3;
  /* stub.border.color */
  padding-left: 12px;
}

#upfttjnwpw .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  /* summary_row.background.color */
  text-transform: inherit;
  /* summary_row.text_transform */
  padding-top: 8px;
  /* summary_row.padding */
  padding-bottom: 8px;
  /* summary_row.padding */
  padding-left: 5px;
  padding-right: 5px;
}

#upfttjnwpw .gt_first_summary_row {
  padding-top: 8px;
  /* summary_row.padding */
  padding-bottom: 8px;
  /* summary_row.padding */
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  /* summary_row.border.style */
  border-top-width: 2px;
  /* summary_row.border.width */
  border-top-color: #D3D3D3;
  /* summary_row.border.color */
}

#upfttjnwpw .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  /* grand_summary_row.background.color */
  text-transform: inherit;
  /* grand_summary_row.text_transform */
  padding-top: 8px;
  /* grand_summary_row.padding */
  padding-bottom: 8px;
  /* grand_summary_row.padding */
  padding-left: 5px;
  padding-right: 5px;
}

#upfttjnwpw .gt_first_grand_summary_row {
  padding-top: 8px;
  /* grand_summary_row.padding */
  padding-bottom: 8px;
  /* grand_summary_row.padding */
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  /* grand_summary_row.border.style */
  border-top-width: 6px;
  /* grand_summary_row.border.width */
  border-top-color: #D3D3D3;
  /* grand_summary_row.border.color */
}

#upfttjnwpw .gt_table_body {
  border-top-style: solid;
  /* table_body.border.top.style */
  border-top-width: 2px;
  /* table_body.border.top.width */
  border-top-color: #D3D3D3;
  /* table_body.border.top.color */
  border-bottom-style: solid;
  /* table_body.border.bottom.style */
  border-bottom-width: 2px;
  /* table_body.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* table_body.border.bottom.color */
}

#upfttjnwpw .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  /* footnotes.background.color */
  border-bottom-style: none;
  /* footnotes.border.bottom.style */
  border-bottom-width: 2px;
  /* footnotes.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* footnotes.border.bottom.color */
  border-left-style: none;
  /* footnotes.border.lr.color */
  border-left-width: 2px;
  /* footnotes.border.lr.color */
  border-left-color: #D3D3D3;
  /* footnotes.border.lr.color */
  border-right-style: none;
  /* footnotes.border.lr.color */
  border-right-width: 2px;
  /* footnotes.border.lr.color */
  border-right-color: #D3D3D3;
  /* footnotes.border.lr.color */
}

#upfttjnwpw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  /* footnotes.font.size */
  padding: 4px;
  /* footnotes.padding */
}

#upfttjnwpw .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  /* source_notes.background.color */
  border-bottom-style: none;
  /* source_notes.border.bottom.style */
  border-bottom-width: 2px;
  /* source_notes.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* source_notes.border.bottom.color */
  border-left-style: none;
  /* source_notes.border.lr.style */
  border-left-width: 2px;
  /* source_notes.border.lr.style */
  border-left-color: #D3D3D3;
  /* source_notes.border.lr.style */
  border-right-style: none;
  /* source_notes.border.lr.style */
  border-right-width: 2px;
  /* source_notes.border.lr.style */
  border-right-color: #D3D3D3;
  /* source_notes.border.lr.style */
}

#upfttjnwpw .gt_sourcenote {
  font-size: 90%;
  /* source_notes.font.size */
  padding: 4px;
  /* source_notes.padding */
}

#upfttjnwpw .gt_left {
  text-align: left;
}

#upfttjnwpw .gt_center {
  text-align: center;
}

#upfttjnwpw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#upfttjnwpw .gt_font_normal {
  font-weight: normal;
}

#upfttjnwpw .gt_font_bold {
  font-weight: bold;
}

#upfttjnwpw .gt_font_italic {
  font-style: italic;
}

#upfttjnwpw .gt_super {
  font-size: 65%;
}

#upfttjnwpw .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="upfttjnwpw" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">session</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Slides</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">Materials</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>00</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/00-welcome/'  target='_blank'>Welcome &amp; Introductions</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'></div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>01</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/01-predicting/'  target='_blank'>Predicting</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/01-Prediction.Rmd'  target='_blank'>Exercises</a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/01-Prediction.Rmd'  target='_blank'>Solutions</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>02</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/02-classifying/'  target='_blank'>Classifying</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/02-Classification.Rmd'  target='_blank'>Exercises</a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/02-Classification.Rmd'  target='_blank'>Solutions</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>03</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/03/'  target='_blank'>Sampling &amp; Resampling</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'></div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>04</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/04-ensembling/'  target='_blank'>Ensembling</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/04-Ensembling.Rmd'  target='_blank'>Exercises</a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/04-Ensembling.Rmd'  target='_blank'>Solutions</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>05</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/05-workflows/'  target='_blank'>Workflows</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/05-Workflows.Rmd'  target='_blank'>Exercises</a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/05-Workflows.Rmd'  target='_blank'>Solutions</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>06</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/06-recipes/'  target='_blank'>Recipes</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/06-Recipes.Rmd'  target='_blank'>Exercises</a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/06-Recipes.Rmd'  target='_blank'>Solutions</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>07</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/07-cv/'  target='_blank'>Cross-validation</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/07-CV.Rmd'  target='_blank'>Exercises</a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/07-CV.Rmd'  target='_blank'>Solutions</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>08</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/08-tune/'  target='_blank'>Tuning</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/08-Tune.Rmd'  target='_blank'>Exercises</a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/08-Tune.Rmd'  target='_blank'>Solutions</a></p>
</div></td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->




## Instructor Notes

We did a trial run of this workshop in December 2019 in Boston with about 20 participants, which proved one of [Greg Wilson's cardinal rules](https://teachtogether.tech/#the-rules):

> "Remember that no lesson survives first contact with learners…"

Actually, the workshop went pretty smoothly for a first run, and we received positive feedback from our attendees. But, like any good educators, Garrett and I decided that a content renovation would make the workshop **even better**. This decision was driven by a few observations:

1. We realized that the process of using a fitted model object for generating predictions was pretty new to many attendees. We needed to spend more time on this, so we beefed up our [early section on predicting][01-slides] considerably. This meant that [parsnip](https://tidymodels.github.io/parsnip/) was the first tidymodels package we introduced, which felt right! Parsnip probably should be the first tidymodels package to learn/teach to new users (previously, we had started with [rsample](https://tidymodels.github.io/rsample/)).

1. Many attendees were less familiar with resampling methods in general, and in particular with [bootstrap resampling](https://moderndive.com/8-confidence-intervals.html). Since bootstrapping is such a key concept, we pushed [cross-validation][07-slides] later and added an earlier section on [sampling and resampling][03-slides].

1. To lay out the red carpet for [ensembling][04-slides] (we worked up to bagging and random forest models), we spent some time working with and interpreting single decision trees, including a ["Guess the Animal" team activity](https://www.atarimagazines.com/v4n12/Animal.html) that helped to loosen everyone up on day 1.

1. A new, but very much welcome, kid on the tidymodels block appeared just before our workshop in December: [workflows](https://tidymodels.github.io/workflows/). For conf, we re-factored our approach to introduce workflows by bundling together formulas and parsnip model specifications *first* (via [`add_formula()`](https://tidymodels.github.io/workflows/reference/add_formula.html) and [`add_model()`](https://tidymodels.github.io/workflows/reference/add_model.html)), *then* introducing [recipes][06-slides] as a way to move beyond formulas and do feature engineering (substituting `add_formula()` with [`add_recipe()`](https://tidymodels.github.io/workflows/reference/add_recipe.html) instead).

1. To accomodate the new and improved content reorganization we envisioned, we hit a few code hiccups. Garrett and I made an executive decision to write some helper functions so that the code **just worked** and we kept the content on track. These were the earliest fitting functions we used on day 1, before transitioning to [`tune::fit_resamples()`](https://tidymodels.github.io/tune/reference/fit_resamples.html) and [`tune::tune_grid()`](https://tidymodels.github.io/tune/reference/tune_grid.html) on day 2 after introducing [cross-validation][07-slides]. 

    As an educator, this is typically something I try to avoid if possible, as my goal is to guide learners to be able to use the package APIs as designed independently. But debugging this specific error introduced too much [*"inessential weirdness"*](https://teachtogether.tech/#s:process-exercises) because:
    + we would have needed to describe things that were not really necessary to understand, and
    + these things were likely to alienate people (you can follow a discussion and reprex of one [error here](https://github.com/tidymodels/tune/issues/151)). 

    **Bottom-line:** If you are trying to follow these slides on your own,  open the accompanying exercise files for each slide deck and run the first chunk locally (look out for our helper functions named `fit_data()` and `fit_split()`). If you want to take the training wheels off and use the base tidymodels functions, you may run into similar errors, but roughly:
    
    + `fit_data()` = [`parsnip::fit()`](https://tidymodels.github.io/parsnip/reference/fit.html)
    + `fit_split()` = [`tune::last_fit()`](https://tidymodels.github.io/tune/reference/last_fit.html)

1. Finally, we re-worked most of our exercises (within R Markdown documents) to provide code templates that were either "fill-in-the-blanks" or "renovations needed" (i.e., replace or add arguments to already written code). On the first run, it became abundantly clear that, because tidymodels code can be verbose, we wore learners out with too much typing. In fact, we wore ourselves out typing. To reduce the cognitive load, we tried our best to adopt a *no-code-chunk-left-blank* strategy so that learners did not feel like [this](https://www.youtube.com/watch?v=DUGN-12HHwQ) at the end:

<div class="figure" style="text-align: center">
<img src="long.png" alt="Video from YouTube." width="50%" />
<p class="caption">Figure 3: Video from <a href="https://www.youtube.com/watch?v=DUGN-12HHwQ">YouTube</a>.</p>
</div>


## What would I change?

In hindsight after teaching this material twice, I would try to make room for a final case study with a new dataset so that learners get a chance to create a full predictive modeling pipeline, from the initial split to the last fit. To make room for a case study, I would try to get workflows and recipes to join forces a bit earlier. One of the clearest benefits of using workflows is that you don't need to spend too much time monkeying around with the [prep](https://tidymodels.github.io/recipes/reference/prep.html), [bake](https://tidymodels.github.io/recipes/reference/bake.html), and [juice](https://tidymodels.github.io/recipes/reference/juice.html) functions from the [recipes][recipes] package, so we could shorten the bridge between presenting these two packages considerably. I also think that cross-validation and tuning could be more closely aligned timing-wise, since tuning with tidymodels is only possible with resampled data. 

## Thanks

I sincerely enjoyed developing this workshop with [Garrett](https://twitter.com/StatGarrett), getting a chance to work closely with [Max Kuhn](https://twitter.com/topepos) and [Davis Vaughan](https://twitter.com/dvaughan32) of the tidymodels team (now including the inimitable [Julia Silge](https://juliasilge.com/)!), and having the opportunity to introduce a new cohort of R and tidyverse users to [tidymodels](https://github.com/tidymodels). I hope the materials we developed are useful to learners and other educators too&mdash;if they are, [please let me know](https://twitter.com/apreshill), I'd love to hear about it.

And most of all&mdash;thanks to our Boston and San Francisco workshop participants! You all were a pleasure to model with.

Happy predictive modeling!

<img src="https://media.giphy.com/media/3ohhwKFBNijG4GJEYw/giphy.gif" style="display: block; margin: auto;" />

### Special thanks

This workshop was made possible by an ⭐ all-star ⭐ TA team- you can find out more about them on our [workshop website](https://conf20-intro-ml.netlify.com/people/).

<a href="https://conf20-intro-ml.netlify.com/people/" target="_blank"><img src="tas.png" width="100%" style="display: block; margin: auto;" /></a>

[00-slides]: https://conf20-intro-ml.netlify.com/materials/00-welcome/

[01-slides]: https://conf20-intro-ml.netlify.com/materials/01-predicting/
[01-ex]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/01-Prediction.Rmd
[01-sol]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/01-Prediction.Rmd

[02-slides]: https://conf20-intro-ml.netlify.com/materials/02-classifying/
[02-ex]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/02-Classification.Rmd
[02-sol]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/02-Classification.Rmd

[03-slides]: https://conf20-intro-ml.netlify.com/materials/03/

[04-slides]: https://conf20-intro-ml.netlify.com/materials/04-ensembling/
[04-ex]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/04-Ensembling.Rmd
[04-sol]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/04-Ensembling.Rmd

[05-slides]: https://conf20-intro-ml.netlify.com/materials/05-workflows/
[05-ex]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/05-Workflows.Rmd
[05-sol]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/05-Workflows.Rmd

[06-slides]: https://conf20-intro-ml.netlify.com/materials/06-recipes/
[06-ex]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/06-Recipes.Rmd
[06-sol]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/06-Recipes.Rmd

[07-slides]: https://conf20-intro-ml.netlify.com/materials/07-cv/
[07-ex]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/07-CV.Rmd
[07-sol]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/07-CV.Rmd

[08-slides]: https://conf20-intro-ml.netlify.com/materials/08-tune/
[08-ex]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/08-Tune.Rmd
[08-sol]: https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/08-Tune.Rmd

[parsnip]: https://tidymodels.github.io/parsnip/
[rsample]: https://tidymodels.github.io/rsample/
[recipes]: https://tidymodels.github.io/recipes/
[yardstick]: https://tidymodels.github.io/yardstick/
[workflows]: https://tidymodels.github.io/workflows/
[tune]: https://tidymodels.github.io/tune/
