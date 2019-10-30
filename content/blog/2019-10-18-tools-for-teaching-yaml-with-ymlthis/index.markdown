---
title: Tools for Teaching YAML with ymlthis
author:
  - '[Malcolm Barrett](https://malco.io)'
date: '2019-10-18'
categories:
  - teach
slug: tools-for-teaching-yaml-with-ymlthis
description: "I spent my summer internship at RStudio trying to reckon with the YAML
  problem: R Markdown is pretty easy to learn, but students often trip over YAML.
  Here are some tools to help with teaching this tricky subject. \n"
photo:
  url: https://unsplash.com/photos/ZahNAl_Ic3o
  author: Austin Neill
tags: [internship]
---



R Markdown is one of the most powerful aspects of the R ecosystem, and it’s also surprisingly intuitive. Markdown itself has a simple syntax, and R Markdown handles so many of the tricky details of document creation that the basics will get you a long way. But there’s one area of R Markdown that consistently trips students up: YAML.

YAML (“Yet Another Markup Language” or “YAML Ain’t Markup Language,” depending on who you ask) is the metadata that tells R Markdown, pandoc, and other software exactly how to process or display the document. But YAML looks and smells differently than R. What’s with this white space? Does this need quotation marks? Where’s the documentation? Why doesn’t this work? Often, the simplest solution is to copy and paste the YAML from older documents. (That’s what I did for a long time. At least I knew it would probably work!)

I spent my [summer internship at RStudio](https://blog.rstudio.com/2019/03/25/summer-interns-2019/) trying to reckon with this problem. Work my mentor [Rich Iannone](https://github.com/rich-iannone) led to the [ymlthis](https://ymlthis.r-lib.org) package ([now on CRAN!](https://malco.io/2019/10/10/introducing-ymlthis/)). ymlthis addresses these issues by documenting YAML options for R Markdown and friends, providing R functions to write YAML for you (in the correct syntax!), and providing new ways of working with R Markdown and YAML files.

ymlthis also includes several tools useful for teaching YAML. Three particularly relevant elements are 1) writing YAML chunks for you in a reproducible, safe way, 2) drawing the nested structure underlying YAML, and 3) the YAML Fieldguide, a comprehensive guide to YAML options in the context of R Markdown. The first two are useful for creating teaching materials, while the third is a great place to point students to during exercises or for future reference.

# Writing YAML with ymlthis

One of the main features of ymlthis is that it can write YAML for you. 


```r
library(ymlthis)
yml() %>% 
  yml_output(pdf_document(), html_document()) %>% 
  yml_latex_opts(fontsize = "12pt")
```

```
---
author: Malcolm Barrett
date: '`r format(Sys.Date())`'
output:
  pdf_document: default
  html_document: default
fontsize: 12pt
---
```

By default, this simply prints to your console. (You can also write it to files or place it on your clipboard; see the [vignette introducing ymlthis](http://ymlthis.r-lib.org/articles/introduction-to-ymlthis.html)). ymlthis includes a function, `asis_yaml_output()`, that will take the result of `yml_*()` functions (which all return objects of class `yml`) and turns them into knitr YAML chunks. YAML chunks display the output as proper YAML (not R output, as above) with correct syntax highlighting. Since ymlthis produces safe, correct YAML, you won't have to double-guess your teaching materials. For example, [Alison Hill](/author/alison/) uses it [in her recent workshop, R Markdown for Medicine](https://github.com/rstudio-education/rmd4medicine/blob/master/static/slides/01-rmd-anatomy.Rmd#L412-L422).


```r
last_yml() %>% # use the most recent `yml` object
  asis_yaml_output()
```

```yaml
---
author: Malcolm Barrett
date: '`r format(Sys.Date())`'
output:
  pdf_document: default
  html_document: default
fontsize: 12pt
---
```

In an R Markdown document (including slides!), a useful trick is to set a `knit_print` method for the `yml` object. Writing `knit_print.yml` to call `asis_yaml_output()` and including it in your document will automatically convert all `yml` objects to YAML chunks.


```r
knit_print.yml <- function(x, ...) {
  ymlthis::asis_yaml_output(x, ...)
}
```

# Drawing the hierarchy in a YAML header

YAML uses whitespace to specify the relationship between fields. This syntax can be quite confusing for R users since R does not use whitespace in this way. To make these relationships more explicit, `draw_yml_tree()` takes a `yml` object and draws the underlying connections between the levels of the metadata. 

Let’s consider an example using output functions. The `output` field takes R functions from the rmarkdown package that specify how to produce the document. The default, for instance is `rmarkdown::html_document()`. While we don’t usually write it this way, the YAML fields nested underneath the output types are just arguments that get passed to the function you’re using (thus you can see the options by reading the help page for the function, e.g. `?rmarkdown::html_document()`).


```r
yml() %>% 
  yml_output(html_document(toc = TRUE, toc_float = TRUE))
```

```
---
author: Malcolm Barrett
date: '`r format(Sys.Date())`'
output:
  html_document:
    toc: true
    toc_float: true
---
```

`draw_yml_tree()` draws this relationship more clearly.


```r
draw_yml_tree() # draws the most recent YAML by default
```

```
├── author: Malcolm Barrett
├── date: '`r format(Sys.Date())`'
└── output:
    └── html_document:
        ├── toc: true
        └── toc_float: true
```

`toc` and `toc_true` are *nested* under `html_document`, which is, in turn, nested under `output`. Here's the structure for more than one output type:


```r
yml() %>% 
  yml_output(
    html_document(toc = TRUE, toc_float = TRUE),
    pdf_document()
  ) %>% 
  draw_yml_tree() 
```

```
├── author: Malcolm Barrett
├── date: '`r format(Sys.Date())`'
└── output:
    ├── html_document:
    │   ├── toc: true
    │   └── toc_float: true
    └── pdf_document: default
```

`html_document` and `pdf_document` are both nested under `output`, while the arguments for `html_document` are still connect to that function. This also explains why missing whitespace will often produce the wrong results: if we misspecify the whitespace, we misspecify the structure of the metadata. Let's say we write some YAML that looks like this, where both `toc` and `toc_float` have the wrong indentation:

```yaml
---
output:
    html_document:
    toc: true
toc_float: true
---
```

This document won’t render correctly, because the YAML has this underlying structure:


```
├── output:
│   ├── html_document: null
│   └── toc: true
└── toc_float: true
```

R Markdown doesn't know that `toc` and `toc_float` are related to `html_document()`. It thinks the value of `html_document` is `NULL`! This particular example even renders (because, although `toc` is not an output function, R Markdown only evaluates `html_document`). Whitespace errors like these often fail silently. 

# The YAML Fieldguide

<div class="figure">
<img src="ymlthis_fieldguide.jpeg" alt="The YAML Fieldguide and the types of YAML documented therein. Image by Mara Averick" width="75%" />
<p class="caption">Figure 1: The YAML Fieldguide and the types of YAML documented therein. Image by Mara Averick</p>
</div>

The final resource I want to talk about is one of the most straightforward but most useful: documentation. YAML that we use for R Markdown is documented in many ways across many pieces of software. It’s often hard to dig up what the options are. A benefit of using R functions to write YAML is that each field is documented in the function’s help page. But ymlthis goes one step further: [the YAML Fieldguide](http://ymlthis.r-lib.org/articles/yaml-fieldguide.html), one of the three vignettes included in ymlthis, aggregates every YAML option documented in the package, organized by source Because the options are in a single place, they are easily searchable. They also link back to the help pages for more information.

The Fieldguide thus provides a comprehensive source for finding options to set in YAML and understanding what valid values are.

# Learn More

The ymlthis package is still early in its lifecycle, but it can already do a lot, including writing R Markdown and YAML files, creating ad-hoc templates, and creating new R Markdown files using an add-in that helps you write your YAML. [See the package website](https://ymlthis.r-lib.org/) for more. Of particular use may be its three vignettes:

* [An Introduction to ymlthis](https://ymlthis.r-lib.org/articles/introduction-to-ymlthis.html)
* [YAML: an Overview](https://ymlthis.r-lib.org/articles/yaml-overview.html)
* [The YAML Fieldguide](https://ymlthis.r-lib.org/articles/yaml-fieldguide.html)


