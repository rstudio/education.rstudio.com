---
title: Presentation-Ready Summary Tables
author:
  - '[Daniel Sjoberg](http://www.danieldsjoberg.com/)'
  - '[Margie Hannum](https://margarethannum.github.io/about.html)'
  - Karissa Whiting
date: '2020-06-01'
categories:
  - learn
tags:
  - rmarkdown
description: |
  The {gtsummary} package summarizes data sets, regression models, and more, using sensible defaults with highly customizable capabilities, and is compatible with multiple R Markdown output types.
slug: gtsummary
photo:
  url: https://unsplash.com/photos/hk2gSD_S5j0
  author: Daniel von Appen
---



We are thrilled to introduce you to the [{gtsummary} package](http://www.danieldsjoberg.com/gtsummary/)!<a href='https://github.com/ddsjoberg/gtsummary'><img src='logo.png' align="right" height="200" /></a>

  The motivation behind the package stems from our work as statisticians, where every day we summarize datasets and regression models in R, share these results with collaborators, and eventually include them in manuscript submissions. Many people in our department had our own scripts to create the tables we needed, and even then would often need to modify the formatting in a document editor later, which did not lead to reproducible results!

  At the time we created the package, we had several ideas in mind for our ideal table summary package. We also wanted our tables to be able to take advantage of all the features (like spanning column headers, table footnotes, stubhead label, row group labels...) in the newly released RStudio package [{gt}](https://gt.rstudio.com/). So, {gtsummary} was born! Here's what you can do with {gtsummary}:

- [**Summarize data frames or tibbles**](http://www.danieldsjoberg.com/gtsummary/articles/tbl_summary.html) to present descriptive statistics, compare group demographics (e.g creating a Table 1 for medical journals), and more!
- [**Summarize regression models**](http://www.danieldsjoberg.com/gtsummary/articles/tbl_regression.html): using `broom::tidy()` in the background, gtsummary plays nicely with many model types (lm, glm, coxph, glmer etc...). There's also the ability to use custom functions to summarize regression models that do not currently have broom tidiers.
- [**Customize gtsummary tables**](http://www.danieldsjoberg.com/gtsummary/reference/index.html#section-general-formatting-styling-functions) using a growing list of formatting/styling functions: everything from which statistics and tests to use to how many decimal places to round to, bolding labels, indenting categories and more!
- [**Report statistics inline**](http://www.danieldsjoberg.com/gtsummary/articles/tbl_summary.html#inline_text) from summary tables and regression summary tables in **R markdown**. Make your reports completely reproducible! 
- Sensible defaults and easy syntax to create publication-ready summary tables in only a few lines of code
- Compatibility with multiple R Markdown output types (HTML, PDF, Word, RTF)


Install {gtsummary} from **CRAN** with the following code: 


```r
install.packages("gtsummary")  

# also recommended you install gt package
install.packages("gt")
```

## Example 1: Table of descriptive statistics

Throughout the post we will use an example dataset of 200 subjects treated with either Drug A or Drug B, with a mix of categorical, dichotomous, and continuous demographic and response data. The dataset has label attributes for column names. 


```r
sm_trial <- trial %>% select(trt, age, response, grade)

head(sm_trial)
#> # A tibble: 6 x 4
#>   trt      age response grade
#>   <chr>  <dbl>    <int> <fct>
#> 1 Drug A    23        0 II   
#> 2 Drug B     9        1 I    
#> 3 Drug A    31        0 II   
#> 4 Drug A    NA        1 III  
#> 5 Drug A    51        1 III  
#> 6 Drug B    39        0 I
```


In **one line of code** we can summarize the overall demographics of the dataset!


```r
tbl_summary_1 <- tbl_summary(sm_trial)
```

<p align="center"><img src="tbl_summary_1.png" width=50%></p>


Notice some nice default behaviors:  
  ♥ Detects variable types of input data and calculates descriptive statistics  
  ♥ Variables coded as 0/1, TRUE/FALSE, and Yes/No are presented dichotomously  
  ♥ Recognizes `NA` values as "missing" and lists them as unknown  
  ♥ Label attributes automatically printed  
  ♥ Variable levels indented and footnotes added with _({gt})_  


### Start customizing by adding arguments and functions

Next you can start to customize the table by using arguments to the `tbl_summary()` function, as well as pipe the table through additional {gtsummary} functions to add more information, like p-value to compare across groups, add an overall demographic column, and bold labels.  


```r
tbl_summary_2 <- sm_trial %>%
  tbl_summary(by = trt) %>%
  add_p() %>%
  add_overall() %>% 
  bold_labels()
```

<p align="center"><img src="tbl_summary_2.png" width=90%></p>

### Customize further using formula syntax and tidy selectors


```r
tbl_summary_3 <- sm_trial %>%
  tbl_summary(
    by = trt,
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",
      all_categorical() ~ "{n} / {N} ({p}%)"), 
    label = age ~ "Patient Age") %>%
  add_p(test = all_continuous() ~ "t.test")
```

<p align="center"><img src="tbl_summary_3.png" width=90%></p>

### Additional customization options

- Use **{tidyselect}** functions to select variables for customization
- Use **custom functions** for calculating p-values and reporting any statistic for continuous variables (including user-written functions)
- **Formatting** functions to bold and italicize labels and levels
- **Missing data** options
- **Sort variables** by significance (`sort_p()`); sort categorical variables by frequency  
- Calculate **cell percents and row percents** (default is column-wide)  
- Only report p-values for select variables (`add_p(include = ...)`); report q-values (like false discovery rate)  
- **Rounding options** and ability to **set global options** for rounding p-values

## Example 2: Summarize regression models

First create a simple logistic regression model to use in examples. 


```r
m1 <- glm(response ~ trt + grade + age, 
          data = trial,
          family = binomial) 
```


`tbl_regression()` accepts regression model object as input. Uses {broom} in the background, outputs table with nice defaults:

  ♥ Reference groups added to the table  
  ♥ Sensible default number rounding and formatting  
  ♥ Label attributes printed  
  ♥ Certain model types detected  
  ♥ Estimate header and footnote included 
  

```r
tbl_reg_1 <- tbl_regression(m1, exponentiate = TRUE)
```


<p align="center"><img src="tbl_regression_1.png" width=50%></p>

### Merge or stack two tables

In this example we can use `tbl_merge()` to merge two gtsummary objects side-by-side. There is also a `tbl_stack()` function to place tables on top of each other. 


```r
library(survival)

tbl_reg_3 <- 
  coxph(Surv(ttdeath, death) ~ trt + grade + age, 
        data = trial) %>%
  tbl_regression(exponentiate = TRUE)

tbl_reg_4 <-
  tbl_merge( #<<
    tbls = list(tbl_reg_1, tbl_reg_3), 
    tab_spanner = c("**Tumor Response**", "**Time to Death**") 
  ) 
```


<p align="center"><img src="tbl_regression_4.png" width=90%></p>

## {gtsummary} reporting results with inline_text()

Tables are important, but we often need to report results in-line in a report. Any statistic reported in a {gtsummary} table can be extracted and reported in-line in a R Markdown document with the `inline_text()` function.


```r
inline_text(tbl_reg_1, variable = trt, level = "Drug B")
1.13 (95% CI 0.60, 2.13; p=0.7)
```

- The pattern of what is reported can be modified with the `pattern = ` argument.  

- Default is `pattern = "{estimate} ({conf.level*100}% CI {conf.low}, {conf.high}; {p.value})"`.

## gtsummary + R Markdown

The **{gtsummary}** package was written to be a companion to the **{gt}** package from RStudio.
But not all output types are supported by the **{gt}** package (yet!).
Therefore, we have made it possible to print **{gtsummary}** tables with various engines.

Review the **[gtsummary + R Markdown](http://www.danieldsjoberg.com/gtsummary/articles/rmarkdown.html)** vignette for details.

<a href="http://www.danieldsjoberg.com/gtsummary/articles/rmarkdown.html">
<img src="gt_output_formats.PNG" width="55%" style="display: block; margin: auto;" />
</a>

## Wrap-up

The {gtsummary} package website contains [well-documented functions](http://www.danieldsjoberg.com/gtsummary/reference/index.html), detailed [tutorials](http://www.danieldsjoberg.com/gtsummary/articles/), and [examples](http://www.danieldsjoberg.com/gtsummary/articles/gallery.html)! 

If you have any questions, please post to [stackoverflow with the tag gtsummary](https://stackoverflow.com/questions/tagged/gtsummary?tab=Newest). We try to answer questions ASAP! You can also report bugs or make feature requests by submitting an issue on [GitHub](https://github.com/ddsjoberg/gtsummary/issues). 

Happy coding! 

<iframe src="https://giphy.com/embed/13AcmSNW5O7WV2" width="480" height="426" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/post-how-tenorgif-13AcmSNW5O7WV2">via GIPHY</a></p>
