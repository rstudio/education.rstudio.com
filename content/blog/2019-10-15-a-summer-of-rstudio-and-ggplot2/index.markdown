---
title: A Summer of RStudio and ggplot2
author:
  - '[Dewey Dunnington](https://fishandwhistle.net/)'
date: '2019-10-15'
slug: a-summer-of-rstudio-and-ggplot2
photo:
  url: https://unsplash.com/photos/AFp6M-Cj0Kk
  author: kazuend
description: |
  This past summer, I had the incredible opportunity to spend the summer as an RStudio intern working with Hadley Wickham on a few new features for the ggplot2 package.
tags: [internship]
---




> This post was written by [Dewey Dunnington](https://fishandwhistle.net/) about his work during his 2019 RStudio internship. Dewey's original post was published on his [blog](https://fishandwhistle.net/post/2019/a-summer-of-rstudio-and-ggplot2/) and is published here with some minor edits with Dewey's consent, as part of our series highlighting the work of RStudio's summer interns.


This past summer, [I](https://fishandwhistle.net/) had the incredible opportunity to spend the summer as an [RStudio](https://rstudio.com/) intern working with [Hadley Wickham](http://hadley.nz) on the [ggplot2](https://ggplot2.tidyverse.org/) package. It was a welcome change of pace from writing [articles](https://fishandwhistle.net/project/geoscience/) about mud in lakes, and I'm sad the internship is over. 

<div class="figure" style="text-align: center">
<img src="https://user-images.githubusercontent.com/10995762/66663010-4313f200-ec20-11e9-9cda-5d96b9c5301f.jpg" alt="RStudio summer interns and software engineers meet up at the Boston office" width="50%" />
<p class="caption">Figure 1: RStudio summer interns and software engineers meet up at the Boston office</p>
</div>


I had the opportunity to work alongside [a lot of great interns](https://blog.rstudio.com/2019/03/25/summer-interns-2019/) at a [fantastic company](https://rstudio.com/), prepare [tons of issues for tidy-dev-day at UseR!](https://github.com/tidyverse/ggplot2/issues?page=1&q=is%3Aissue+label%3A%22tidy-dev-day+%3Anerd_face%3A%22&utf8=%E2%9C%93), become an [RStudio-certified tidyverse trainer](https://fishandwhistle.net/project/training/), spiff up [my website](https://fishandwhistle.net/) considerably with [blogdown](https://bookdown.org/yihui/blogdown/), and of course develop a few humble new features for ggplot2! Here are a few of them:



```r
library(ggplot2)
```

# New vignette on using ggplot2 in packages

I joined as an intern just prior to the [release of ggplot2 3.2.0](https://www.tidyverse.org/articles/2019/06/ggplot2-3-2-0/). Before all ggplot2 releases, we run the CMD check on every reverse dependency (there are 2,622 of them as of the last revdep check) with the CRAN version and with the release candidate to make sure we don't introduce new failures. In sifting through the [failures](https://github.com/tidyverse/ggplot2/pull/3303#issue-275916520), it became clear that there was no documentation about how to use ggplot2 in a package in a way that wouldn't be likely to break in the future. Thus, the [Using ggplot2 in packages vignette](https://ggplot2.tidyverse.org/dev/articles/ggplot2-in-packages.html) was born! It covers how to refer to ggplot2 functions, how to create a mapping without triggering a CMD check error, and best practices for common ggplot2 uses in packages (like creating a theme or visualizing an object).

# coord_trans() improvements

The difference between a ggplot with `scale_(x|y)_log10()` and a ggplot with `coord_trans((x|y) = "log10")` is a common reason that issues get opened in ggplot2. In short, `scale_(x|y)_log10()` applies `log10()` to the `x` and/or `y` aesthetics *before* anything happens, including computing any statistics. Using `coord_trans((x|y) = "log10")` applies `log10()` *after* everything happens. This means that a `geom_boxplot()` with `scale_(x|y)_log10()` is going to have different outliers (say) than a `geom_boxplot()` with `coord_trans((x|y) = "log10")`.


```r
p <- ggplot(diamonds, aes(cut, price)) + geom_boxplot()

patchwork::wrap_plots(
  p + scale_y_log10(),
  p + coord_trans(y = "log10"),
  nrow = 1
)
```

<img src="figs/unnamed-chunk-4-1.png" width="672" />

It's common for an issue to be opened for cases where this is non-intuitive (`stat_summary()` comes to mind - it's not intuitive that summary statistics are not calculated on the original data), and the response is often that `coord_trans()` should be used instead of a transformed scale. However, there were [problems with the expansion of discrete scales in coord_trans()](https://github.com/tidyverse/ggplot2/issues/3338) that prevented `coord_trans()` from being a viable solution. In the [PR fixing this](https://github.com/tidyverse/ggplot2/pull/3380), I also fixed a [problem with second axes in coord_trans()](https://github.com/tidyverse/ggplot2/issues/2990), and made sure that the `"reverse"` trans worked (it didn't before, but it doesn't appear that anybody noticed). Hopefully `coord_trans()` is now ready to serve as a drop-in replacement  when `scale_(x|y)_log10()` gives non-intuitive results!

# NA limits in coord_cartesian()

Another common source of confusion in ggplot2 is the difference between `scale_(x|y)_continuous(limits = ...)` and `coord_cartesian((x|y)lim = ...)`. When setting scale limits (this includes `xlim()` and `ylim()`), data is "censored" by default, meaning values outside this range magically turn into `NA` and disappear; when setting the coordinate system limits, the data are still exist, but data outside the (expanded) limits are not shown.


```r
patchwork::wrap_plots(
  p + scale_y_continuous(limits = c(0, 10000)),
  p + coord_cartesian(ylim = c(0, 10000))
)
```

```
## Warning: Removed 5222 rows containing non-finite values (stat_boxplot).
```

<img src="figs/unnamed-chunk-5-1.png" width="672" />

In this example, using scale limits (_on the left_) leads to displaying spurious information about where the min and max of the data are. When this issue comes up, the response is usually that the user should use `coord_cartesian(ylim = ...)` (_as shown on the right_) instead of `scale_y_continuous(limits = ...)`. Scale limits have this awesome feature where you can pass `NA` as one or more of the limits to refer to the minimum or maximum of the data, but this previously wasn't possible for coordinate system limits. Now it is! It's particularly useful with facets where `scales = "free"`:


```r
ggplot(diamonds, aes(color, price)) +
  geom_boxplot() +
  facet_wrap(vars(cut), scales = "free_y") +
  coord_cartesian(ylim = c(0, NA))
```

<img src="figs/unnamed-chunk-6-1.png" width="672" />

# Axis guide improvements

When I started my internship, there was a long-standing open [issue about overlapping axis text](https://github.com/tidyverse/ggplot2/issues/3281). Previously, it was impossible to do any customization of axes other than change the `breaks` and/or `labels` in the `scale_*()` functions, which could be customized a bit using `theme()`, and anything else was a crazy workaround. Now that [this pull request ](https://github.com/tidyverse/ggplot2/pull/3398) has been merged, axes will use the same guide system that powers `guide_legend()` and `guide_colourbar()`, such that you will be able to customize how axes are drawn (and in the future create custom ones!). This feature comes with a couple improvements for dealing with overlapping text in the new `guide_axis()` function:


```r
# you'll need the current development version of the package
# remotes::install_github("tidyverse/ggplot2")
ggplot(mpg, aes(hwy, cty)) +
  geom_point() +
  # create closely-spaced breaks that will overlap
  scale_x_continuous(breaks = seq(10, 50, 2)) +
  facet_wrap(vars(drv)) +
  guides(x = guide_axis(check.overlap = TRUE))
```

<img src="figs/unnamed-chunk-7-1.png" width="672" />
