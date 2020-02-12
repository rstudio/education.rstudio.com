---
title: 'Introduction to Machine Learning with the Tidyverse'
date: '2020-02-10'
slug: intro-to-ml-tidy
categories: []
tags: []
author:
  - alison
  - garrett
photo:
  url: https://unsplash.com/photos/2YPSfYQA6Z0
  author: Brunel Johnson
description: >
  Here is your roadmap to our two-day rstudio::conf(2020) workshop on machine learning with the tidyverse and tidymodels.
---


> tl;dr: all workshop materials are available here: <br>
> <i class="fab fa-github"></i> https://rstd.io/conf20-intro-ml <br>
> 🔗 https://conf20-intro-ml.netlify.com/

At [rstudio::conf(2020)](https://rstd.io/conf) in January, I was lucky to lead a new two-day workshop called "Introduction to Machine Learning with the Tidyverse." This workshop was designed for learners who are comfortable using R and the [tidyverse](https://www.tidyverse.org/), and curious to learn how to use these tools to do machine learning using the modern suite of R packages called [tidymodels](https://github.com/tidymodels). If you just read that last sentence and don't yet know the word "tidymodels" yet, it is a collection of modeling packages that, like the tidyverse, have a consistent API and work together. 

If you have heard or used the [caret](https://cran.r-project.org/web/packages/caret/caret.pdf) package, tidymodels is its successor. Tidymodels is supported by RStudio, and is led by [Max Kuhn](https://twitter.com/topepos), the author of [caret](https://cran.r-project.org/web/packages/caret/caret.pdf), [Cubist](https://cran.r-project.org/web/packages/Cubist/index.html), [C50](https://cran.r-project.org/web/packages/C50/C50.pdf) and other R packages for predictive modeling. Max has offered an [Applied Machine Learning workshop](https://github.com/tidymodels/aml-training) for several years now, but we have not yet attempted to teach tidymodels to a beginner audience. Until now! 🎉

<div class="figure" style="text-align: center">
<a href="https://github.com/allisonhorst/stats-illustrations" target="_blank"><img src="parsnip.png" alt="Art by Allison Horst" width="49%" /></a>
<p class="caption">Figure 1: Art by Allison Horst</p>
</div>

We designed the workshop to provide a gentle introduction to machine learning and to the tidyverse packages that do machine learning. Attendees learned how to train and assess predictive models with several common machine learning algorithms, as well as how to do feature engineering to improve the predictive accuracy of their models. We focused on learning the basic theory and best practices that support machine learning. Along the way, we introduced several core tidymodels packages including [parsnip][parsnip], [recipes][recipes], [rsample][rsample], and [tune][tune], which provide a grammar for modeling and work seamlessly with R's tidyverse packages. 

<div class="figure" style="text-align: center">
<a href="https://github.com/allisonhorst/stats-illustrations" target="_blank"><img src="recipes.png" alt="Art by Allison Horst" width="49%" /></a>
<p class="caption">Figure 2: Art by Allison Horst</p>
</div>

## Is this course for me?

Before workshops for this year's conf were announced, we framed two questions to help potential learners gauge whether this workshop was the right one for them:

---

+ Can you use mutate and purrr to transform a data frame that contains list columns?

+ Can you use the ggplot2 package to make a large variety of graphs?

If you answered "no" to either question, you can brush up on these topics by working through the online tutorials at https://rstudio.cloud/learn/primers.

---

These questions were driven by the fact that when we started developing the workshop, tidymodels code heavily relied on the purrr package (see an end-to-end code example from Max's Applied Machine Learning workshop at rstudio::conf(2019) [here](https://github.com/topepo/rstudio-conf-2019/blob/2aaf4c24cd90cfa91cf2cdde256d68341f21133b/Materials/Part_2_Basic_Principles.R#L137-L212)). However, between the time we first conceived of the workshop and when we taught it, a lot of the tidymodels API had changed (for the better!). In hindsight, here is the minimum tidyverse comfort level you need to be able to dive into tidymodels:

+ Can you use the [pipe operator](https://r4ds.had.co.nz/transform.html#combining-multiple-operations-with-the-pipe) to combine a sequence of functions to transform objects in R (like a data frame)?

+ Can you work with tibbles (or data frames) that contain [list columns](https://r4ds.had.co.nz/many-models.html#list-columns-1)?

+ Can you use [`dplyr::select()` helper functions](https://tidyselect.r-lib.org/reference/select_helpers.html)? (this helps a lot when you get to the [recipes][recipes] package)

Do you have to be a tidyverse enthusiast to use tidymodels? No, having a comfort level with the pipe, tibbles, and list columns helps.

In the rest of this post, I'll walk you through the materials available through the [workshop website](https://conf20-intro-ml.netlify.com/):

<iframe src="https://conf20-intro-ml.netlify.com/" width="100%" height="400px"></iframe>


## Packages

For the code, we obviously made heavy use of packages from [tidymodels](https://tidymodels.github.io/tidymodels/), which is available (like the [tidyverse](https://tidyverse.tidyverse.org/)) as a meta-package that bundles most of the building blocks we needed:


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

We also used two packages which were not on CRAN at the time of the workshop, and so we used the development versions of [workflows][workflows] and [tune][tune] installed from GitHub.


```r
# install once per machine
install.packages("remotes")
remotes::install_github(c("tidymodels/workflows",
                          "tidymodels/tune"))

# load once per work session
library(workflows)
library(tune)
```

## [Prework](https://conf20-intro-ml.netlify.com/prework/)

We set up [RStudio Server Pro](https://rstudio.com/products/rstudio-server-pro/) workspaces for all workshop attendees which provided more horsepower for running some of the more computationally intensive models, and which came pre-loaded with all the workshop exercises as R Markdown files and the packages needed to do them pre-installed. For those who wished to follow along locally, here is the list of additional packages needed:


```r
install.packages(c("kknn", "rpart", "rpart.plot", "rattle", 
                   "AmesHousing", "ranger", "partykit", "vip"))

# and

remotes::install_github("tidymodels/modeldata")
```

## Roadmap

During the workshop, we presented slides interspersed with timed coding exercises called "Your Turns". 

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

#rtocnmlfhg .gt_table {
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

#rtocnmlfhg .gt_heading {
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

#rtocnmlfhg .gt_title {
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

#rtocnmlfhg .gt_subtitle {
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

#rtocnmlfhg .gt_bottom_border {
  border-bottom-style: solid;
  /* heading.border.bottom.style */
  border-bottom-width: 2px;
  /* heading.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* heading.border.bottom.color */
}

#rtocnmlfhg .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  padding-top: 4px;
  padding-bottom: 4px;
}

#rtocnmlfhg .gt_col_headings {
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

#rtocnmlfhg .gt_col_heading {
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

#rtocnmlfhg .gt_sep_right {
  border-right: 5px solid #FFFFFF;
}

#rtocnmlfhg .gt_group_heading {
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

#rtocnmlfhg .gt_empty_group_heading {
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

#rtocnmlfhg .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
  /* row.striping.background_color */
}

#rtocnmlfhg .gt_from_md > :first-child {
  margin-top: 0;
}

#rtocnmlfhg .gt_from_md > :last-child {
  margin-bottom: 0;
}

#rtocnmlfhg .gt_row {
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

#rtocnmlfhg .gt_stub {
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

#rtocnmlfhg .gt_summary_row {
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

#rtocnmlfhg .gt_first_summary_row {
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

#rtocnmlfhg .gt_grand_summary_row {
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

#rtocnmlfhg .gt_first_grand_summary_row {
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

#rtocnmlfhg .gt_table_body {
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

#rtocnmlfhg .gt_footnotes {
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

#rtocnmlfhg .gt_footnote {
  margin: 0px;
  font-size: 90%;
  /* footnotes.font.size */
  padding: 4px;
  /* footnotes.padding */
}

#rtocnmlfhg .gt_sourcenotes {
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

#rtocnmlfhg .gt_sourcenote {
  font-size: 90%;
  /* source_notes.font.size */
  padding: 4px;
  /* source_notes.padding */
}

#rtocnmlfhg .gt_left {
  text-align: left;
}

#rtocnmlfhg .gt_center {
  text-align: center;
}

#rtocnmlfhg .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#rtocnmlfhg .gt_font_normal {
  font-weight: normal;
}

#rtocnmlfhg .gt_font_bold {
  font-weight: bold;
}

#rtocnmlfhg .gt_font_italic {
  font-style: italic;
}

#rtocnmlfhg .gt_super {
  font-size: 65%;
}

#rtocnmlfhg .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="rtocnmlfhg" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
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
      <td class="gt_row gt_left"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/00-welcome/'  target='_blank'><tt>Welcome &amp; Introductions</tt></a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'></div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>01</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/01-predicting/'  target='_blank'><tt>Predicting</tt></a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/01-Prediction.Rmd'  target='_blank'><tt>Exercises</tt></a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/01-Prediction.Rmd'  target='_blank'><tt>Solutions</tt></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>02</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/02-classifying/'  target='_blank'><tt>Classifying</tt></a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/02-Classification.Rmd'  target='_blank'><tt>Exercises</tt></a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/02-Classification.Rmd'  target='_blank'><tt>Solutions</tt></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>03</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/03/'  target='_blank'><tt>Sampling &amp; Resampling</tt></a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'></div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>04</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/04-ensembling/'  target='_blank'><tt>Ensembling</tt></a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/04-Ensembling.Rmd'  target='_blank'><tt>Exercises</tt></a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/04-Ensembling.Rmd'  target='_blank'><tt>Solutions</tt></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>05</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/05-workflows/'  target='_blank'><tt>Workflows</tt></a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/05-Workflows.Rmd'  target='_blank'><tt>Exercises</tt></a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/05-Workflows.Rmd'  target='_blank'><tt>Solutions</tt></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>06</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/06-recipes/'  target='_blank'><tt>Recipes</tt></a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/06-Recipes.Rmd'  target='_blank'><tt>Exercises</tt></a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/06-Recipes.Rmd'  target='_blank'><tt>Solutions</tt></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>07</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/07-cv/'  target='_blank'><tt>Cross-validation</tt></a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/07-CV.Rmd'  target='_blank'><tt>Exercises</tt></a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/07-CV.Rmd'  target='_blank'><tt>Solutions</tt></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>08</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p><a href='https://conf20-intro-ml.netlify.com/materials/08-tune/'  target='_blank'><tt>Tuning</tt></a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/exercises/08-Tune.Rmd'  target='_blank'><tt>Exercises</tt></a>, <a href='https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/materials/solutions/08-Tune.Rmd'  target='_blank'><tt>Solutions</tt></a></p>
</div></td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->


```r
tmf <- read_csv(here::here("content/blog/2020-02-10-introduction-to-machine-learning-with-the-tidyverse/tm-functions.csv")) 
```

```
## Parsed with column specification:
## cols(
##   session = col_double(),
##   package = col_character(),
##   `function` = col_character()
## )
```

```r
tmf %>% 
  gt() %>% 
  fmt_markdown(columns = TRUE) 
```

<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#uomlabltwu .gt_table {
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

#uomlabltwu .gt_heading {
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

#uomlabltwu .gt_title {
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

#uomlabltwu .gt_subtitle {
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

#uomlabltwu .gt_bottom_border {
  border-bottom-style: solid;
  /* heading.border.bottom.style */
  border-bottom-width: 2px;
  /* heading.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* heading.border.bottom.color */
}

#uomlabltwu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  padding-top: 4px;
  padding-bottom: 4px;
}

#uomlabltwu .gt_col_headings {
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

#uomlabltwu .gt_col_heading {
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

#uomlabltwu .gt_sep_right {
  border-right: 5px solid #FFFFFF;
}

#uomlabltwu .gt_group_heading {
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

#uomlabltwu .gt_empty_group_heading {
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

#uomlabltwu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
  /* row.striping.background_color */
}

#uomlabltwu .gt_from_md > :first-child {
  margin-top: 0;
}

#uomlabltwu .gt_from_md > :last-child {
  margin-bottom: 0;
}

#uomlabltwu .gt_row {
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

#uomlabltwu .gt_stub {
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

#uomlabltwu .gt_summary_row {
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

#uomlabltwu .gt_first_summary_row {
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

#uomlabltwu .gt_grand_summary_row {
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

#uomlabltwu .gt_first_grand_summary_row {
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

#uomlabltwu .gt_table_body {
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

#uomlabltwu .gt_footnotes {
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

#uomlabltwu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  /* footnotes.font.size */
  padding: 4px;
  /* footnotes.padding */
}

#uomlabltwu .gt_sourcenotes {
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

#uomlabltwu .gt_sourcenote {
  font-size: 90%;
  /* source_notes.font.size */
  padding: 4px;
  /* source_notes.padding */
}

#uomlabltwu .gt_left {
  text-align: left;
}

#uomlabltwu .gt_center {
  text-align: center;
}

#uomlabltwu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#uomlabltwu .gt_font_normal {
  font-weight: normal;
}

#uomlabltwu .gt_font_bold {
  font-weight: bold;
}

#uomlabltwu .gt_font_italic {
  font-style: italic;
}

#uomlabltwu .gt_super {
  font-size: 65%;
}

#uomlabltwu .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="uomlabltwu" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">session</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">package</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">function</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>parsnip</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>linear_reg()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>parsnip</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>decision_tree()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>parsnip</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>nearest_neighbor()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>helper</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>fit_data() (reference: parsnip::fit())</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>parsnip</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>predict()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>yardstick</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>rmse()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>rsample</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>initial_split()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>rsample</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>training()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>rsample</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>testing()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>helper</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>fit_split() (reference: tune::last_fit())</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>collect_metrics()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>yardstick</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>metric_set()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>tidyr</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>unnest()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>2</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>parsnip</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>set_mode(&quot;classification&quot;)</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>2</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>collect_predictions()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>2</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>yardstick</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>conf_mat()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>2</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>yardstick</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>roc_auc()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>2</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>yardstick</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>roc_curve()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>4</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>parsnip</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>rand_forest()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>4</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>parsnip</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>set_args()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>4</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>vip</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>vip()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>5</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>workflows</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>workflow()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>5</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>workflows</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>add_formula()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>5</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>workflows</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>add_model()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>5</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>workflows</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>update_formula()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>5</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>workflows</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>update_model()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>5</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>workflows</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>pull_workflow_fit()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>6</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>recipes</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>step_*()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>6</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>recipes</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>*_role()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>6</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>workflows</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>add_recipe()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>6</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>recipes</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>all_*() (recipe selectors)</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>6</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>workflows</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>update_recipe()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>7</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>rsample</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>vfold_cv()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>7</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>fit_resamples()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>7</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>collect_metrics(summarize = FALSE)</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>7</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>control_resamples()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>8</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>tune() (for parsnip and recipe objects)</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>8</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>tune_grid()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>8</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>tidyr</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>expand_grid()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>8</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>control_grid()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>8</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>show_best()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>8</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>select_best()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>8</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>autoplot()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>8</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>workflows</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>finalize_recipe()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>8</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>workflows</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>finalize_workflow()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>8</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>workflows</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>finalize_model()</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>8</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>tune</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>last_fit() (previously known as fit_split())</p>
</div></td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->


## Instructor Notes

We did a trial run of this workshop in December 2019 in Boston with about 20 participants, which proved one of [Greg Wilson's cardinal rules](https://teachtogether.tech/#the-rules):

> "Remember that no lesson survives first contact with learners…"

Actually, the workshop went pretty smooth for a first run, and we received positive feedback from our attendees. But, like any good educators, Garrett and I decided that a content renovation would make the workshop **even better**. This decision was driven by a few observations:

1. We realized that the process of using a fitted model object for generating predictions was pretty new to many attendees. We needed to spend more time on this, so we beefed up our [early section on predicting][01-slides] considerably. This meant that [parsnip](https://tidymodels.github.io/parsnip/) was our first tidymodels package to introduce, which felt right! This should be your first tidymodels package to learn/teach if you are new here (previously, we had started with [rsample](https://tidymodels.github.io/rsample/)).

1. Many attendees were less familiar with resampling methods in general, and in particular with [bootstrap resampling](https://moderndive.com/8-confidence-intervals.html). Since bootstrapping is such a key concept, we pushed [cross-validation][07-slides] later and added an earlier section on [sampling and resampling][03-slides].

1. To lay out the red carpet for [ensembling][04-slides] (we worked up to bagging and random forest models), we spent some time working with and interpreting single decision trees, including a ["Guess the Animal" team activity](https://www.atarimagazines.com/v4n12/Animal.html) that helped to loosen everyone up on day 1.

1. A new, but very much welcome, kid on the tidymodels block appeared just before our workshop in December: [workflows](https://tidymodels.github.io/workflows/). For conf, we re-factored our approach to introduce workflows by bundling together formulas and parsnip model specifications *first* (via [`add_formula()`](https://tidymodels.github.io/workflows/reference/add_formula.html) and [`add_model()`](https://tidymodels.github.io/workflows/reference/add_model.html)), *then* introducing [recipes][06-slides] as a way to move beyond formulas and do feature engineering (substituting `add_formula()` with [`add_recipe()`](https://tidymodels.github.io/workflows/reference/add_recipe.html) instead).

1. To accomodate the new and improved content reorganization we envisioned, we hit a few code hiccups. Garrett and I made an executive decision to write some helper functions so that the code **just worked** and we kept the content on track. As an educator, this is typically something I try to avoid if possible, as my goal is to guide learners to be able to use the package APIs as designed independently. But debugging this specific error introduced too much [*"inessential weirdness"*](https://teachtogether.tech/#s:process-exercises); that is, we would have needed to describe things that were not really necessary to understand, but which were likely to alienate people (you can follow a discussion and reprex of one [error here](https://github.com/tidymodels/tune/issues/151)). 

    **Bottom-line:** If you are trying to follow these slides on your own,  open the accompanying exercise files for each slide deck and run the first chunk locally (look out for our helper functions named `fit_data()` and `fit_split()`). These were the earliest fitting functions we used on day 1, before transitioning to [`tune::fit_resamples()`](https://tidymodels.github.io/tune/reference/fit_resamples.html) and [`tune::tune_grid()`](https://tidymodels.github.io/tune/reference/tune_grid.html) on day 2 after introducing [cross-validation][07-slides]. If you want to take the training wheels off and use the base tidymodels functions, you may run into similar errors, but roughly:
    + `fit_data()` = [`parsnip::fit()`](https://tidymodels.github.io/parsnip/reference/fit.html)
    + `fit_split()` = [`tune::last_fit()`](https://tidymodels.github.io/tune/reference/last_fit.html)


## Teaching Infrastructure

+ **RStudio Server Pro:** Our [RStudio Server Pro](https://rstudio.com/products/rstudio-server-pro/) workspaces used Amazon compute optimized [`c5.large` instances](https://aws.amazon.com/ec2/instance-types/) with 2 vCPUs and 4 GiB memory for each learner.

+ **Slides:** I used the [xaringan package](https://github.com/yihui/xaringan) to build all my slides in R Markdown. For a tutorial, you can see my rstudio::conf(2019) workshop slides [here](https://arm.rbind.io/slides/xaringan.html#1). I also highly recommend the [countdown package](https://pkg.garrickadenbuie.com/countdown/#1), which I used to create the "Your Turn" timers ⏲.

+ **Workshop website:** I used the [blogdown R package](https://bookdown.org/yihui/blogdown/) to build the [website](https://conf20-intro-ml.netlify.com), with the [Hugo academic theme](https://themes.gohugo.io/academic/) with a custom CSS designed by [Desirée De Leon](http://desiree.rbind.io/). If you want to re-use my workshop website (you'll need [GitHub](https://github.com/) and [Netlify](https://www.netlify.com/) accounts), click on *Deploy to Netlify* button at the top of my [`README`](https://github.com/rstudio-conf-2020/intro-to-ml-tidy/blob/master/README.md) 🚀


## Thanks

I sincerely enjoyed developing this workshop with [Garrett](https://twitter.com/StatGarrett), getting a chance to work closely with [Max Kuhn](https://twitter.com/topepos) and [Davis Vaughan](https://twitter.com/dvaughan32) of the tidymodels team (now including the inimitable [Julia Silge](https://juliasilge.com/)!), and having the opportunity to introduce a new cohort of R and tidyverse users to [tidymodels](https://github.com/tidymodels). I hope the materials we developed are useful to learners and other educators too- if they are, [please let me know](https://twitter.com/apreshill), I'd love to hear about it.

Happy predictive modeling!



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
