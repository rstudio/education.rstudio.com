---
title: 'Teaching the Tidyverse in 2020 - Part 2: Data visualisation'
date: '2020-07-15'
slug: teaching-the-tidyverse-in-2020-part-2-data-visualisation
categories:
  - teach
tags:
  - tidyverse
author:
  - mine
photo:
  url: https://unsplash.com/photos/oMpAz-DN-9I
  author: Greg Rakozy
editor_options:
  markdown:
    canonical: true
---



This is the second blog post in the "Teaching the Tidyverse in 2020" series. The first post was on [getting started](https://education.rstudio.com/blog/2020/07/teaching-the-tidyverse-in-2020-part-1-getting-started/), and today our focus is data visualisation. In this post, I'll highlight some new(ish) features of [ggplot2](https://ggplot2.tidyverse.org/) as well as not-so-new features that I see rarely in introductory teaching materials that I think belong there.

Let's start by loading the tidyverse and [palmerpenguins](https://allisonhorst.github.io/palmerpenguins/) packages.


```r
library(tidyverse)
library(palmerpenguins)
```



We'll be using the `penguins` data from the palmerpenguins package. You can read about the variables in the data frame [here](https://allisonhorst.github.io/palmerpenguins/reference/penguins.html) and a quick peek is provided below.


```r
glimpse(penguins)
```

```
## Rows: 344
## Columns: 7
## $ species           <fct> Adelie, Adelie, Adelie, Adelie, Adelie, Adelie, Ade…
## $ island            <fct> Torgersen, Torgersen, Torgersen, Torgersen, Torgers…
## $ bill_length_mm    <dbl> 39.1, 39.5, 40.3, NA, 36.7, 39.3, 38.9, 39.2, 34.1,…
## $ bill_depth_mm     <dbl> 18.7, 17.4, 18.0, NA, 19.3, 20.6, 17.8, 19.6, 18.1,…
## $ flipper_length_mm <int> 181, 186, 195, NA, 193, 190, 181, 195, 193, 190, 18…
## $ body_mass_g       <int> 3750, 3800, 3250, NA, 3450, 3650, 3625, 4675, 3475,…
## $ sex               <fct> male, female, female, NA, female, male, female, mal…
```

## Making a single box

At some point in ggplot2 history, making a box plot of a single variable required adding `factor = 1` to the aesthetic mapping, which I never found to be easy to explain.


```r
ggplot(penguins, aes(y = body_mass_g, factor = 1)) +
  geom_boxplot()
```

{{<figure src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/boxplot-old-1.png" alt="Boxplot of body mass of penguins, using factor = 1 in the code.">}}

You can now (or more like for the [last couple years](https://github.com/tidyverse/ggplot2/issues/2110)!) omit `factor = 1`!


```r
ggplot(penguins, aes(y = body_mass_g)) +
  geom_boxplot()
```

{{<figure src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/boxplot-new-1.png" alt="Boxplot of body mass of penguins, without using factor = 1 in the code. Same figure as the previous one, despite simpler code.">}}

## No more `coord_flip()`

Horizontal bar plots can be really useful, especially for categorical data whose levels have long names that overlap if placed on the x-axis. Previously, making horizontal bar plots required mapping the variable to be plotted to the `x` aesthetic and then applying a `coord_flip()` layer to flip the axes, e.g.


```r
ggplot(penguins, aes(x = species)) +
  geom_bar() +
  coord_flip()
```

{{<figure src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/penguins-species-bar-coord-flip-1.png" alt="Barplot of species of penguins, using coord_flip in the code.">}}

`geom_bar()` now works in both directions, so the categorical variable can be directly mapped to the `y` aesthetic to achieve the horizontal box plot.


```r
ggplot(penguins, aes(y = species)) +
  geom_bar()
```

{{<figure src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/penguins-species-bar-1.png" alt="Barplot of species of penguins, without using coord_flip in the code. Same figure as the previous one, despite simpler code.">}}

You can read more about what this change enables in other geoms [here](https://www.tidyverse.org/blog/2020/03/ggplot2-3-3-0/#bi-directional-geoms-and-stats).

## Leverage scales and forcats

One of the biggest strengths of ggplot2 is that it has fantastic defaults and your plots look pretty good without trying hard. This is very attractive especially for teaching introductory audiences when you just want to focus on the basics. However, when teaching data visualisation (even in the simplest sense) it is important to discuss data visualisation good practices, e.g. present data in ascending/descending order, label axes in a way that matches your narrative, etc. Packages like [scales](http://scales.r-lib.org/) and [forcats](https://forcats.tidyverse.org/) are incredibly helpful for implementing these small but impactful improvements to visualisations.

Suppose we want to plot the percentage distribution of different species of penguins. We can first calculate these percentages in a dplyr pipeline.


```r
penguins %>%
  count(species) %>%
  mutate(prop = n / sum(n))
```

```
## # A tibble: 3 x 3
##   species       n  prop
##   <fct>     <int> <dbl>
## 1 Adelie      152 0.442
## 2 Chinstrap    68 0.198
## 3 Gentoo      124 0.360
```

We can then feed the result to the `ggplot()` function to be represented using `geom_col()`.


```r
penguins %>%
  count(species) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(aes(x = prop, y = species)) +
  geom_col()
```

{{<figure src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/penguins-species-props-bar-1.png" alt="Relative frequency bar plot of species of penguins.">}}

First, let's reorder the bars in descending order, with the penguin species with the highest proportion on top. We use `fct_reorder()` function from the forcats package for this. We can read `fct_reorder(species, prop)` as "reorder the levels of `species` based on the values of `prop`".


```r
penguins %>%
  count(species) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(aes(x = prop, y = fct_reorder(species, prop))) +
  geom_col()
```

{{<figure src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/penguins-species-props-bar-reorder-1.png" alt="Relative frequency bar plot of species of penguins, with bars ordered in descending order.">}}

The forcats package contains a [variety of functions](https://forcats.tidyverse.org/reference/index.html) starting with the prefix `fct_` that operate on factor levels. Perhaps unsurprisingly, they're named pretty intuitively (at least for English speakers). (Side note: After `fct_reorder()`, my favourite function for improving visualisations of messy survey data with factors with *many* levels is [`fct_lump()`](https://forcats.tidyverse.org/reference/fct_lump.html).)

Next, let's think about how we would interpret this visualisation. I would probably say something like "Adelie penguins make up over 40% of the sample, followed by Gentoo penguins at roughly over 35%, and Chinstrap penguins make up the remaining 20%". But the x-axis is showing proportions instead of percentages.

The scales package offers a [variety of functions](https://scales.r-lib.org/reference/index.html), starting with the prefix `label_*` that help with this sort of task.


```r
library(scales)
```

The function we want here is `label_percent()`. We can also specify the number of decimal places to show with the `accuracy` argument.


```r
penguins %>%
  count(species) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(aes(x = prop, y = fct_reorder(species, prop))) +
  geom_col() +
  scale_x_continuous(labels = label_percent(accuracy = 1))
```

{{<figure src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/penguins-species-props-bar-reorder-percent-1.png" alt="Relative frequency bar plot of species of penguins, with bars ordered in descending order, and axis tick labels are in percentages.">}}

And finally, let's fix up the axis labels.


```r
penguins %>%
  count(species) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(aes(x = prop, y = fct_reorder(species, prop))) +
  geom_col() +
  scale_x_continuous(labels = label_percent(accuracy = 1)) +
  labs(
    x = "Percentage",
    y = "Species",
    title = "Species distribution of penguins",
    subtitle = "Adelie, Gentoo, and Chinstrap Penguins at Palmer Station LTER",
    caption = "Source: allisonhorst.github.io/palmerpenguins"
  )
```

{{<figure src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/penguins-species-props-bar-reorder-percent-labels-1.png" alt="Relative frequency bar plot of species of penguins, with bars ordered in descending order, axis tick labels are in percentages, and with proper axis labels.">}}

Another very attractive feature of ggplot2 is that you get legends for free. But sometimes the factor levels displayed in the legends may not be optimally ordered. In these cases `fct_reorder2()` might be helpful. See [this gist](https://gist.github.com/jennybc/847c6b43c4e35cec2e5bb30a3f38af73) from Jenny Bryan for an example using this function to reorder levels displayed on a legend of a line plot.

ggplot2 is a vast package, and I don't think it's feasible to teach the complete functionality of the package within an intro stats or data science curriculum. That being said, I think it is important to not just teach how to make plots, but how to make good plots that follow data visualisation best practices. Leveraging packages like forcats and scales allows you to do that without adding too much cognitive burden on the learners.

## The rest of the gg-verse

There are many packages that extend ggplot2 (e.g. [gganimate](https://gganimate.com/), [ggridges](https://wilkelab.org/ggridges/), [ggrepel](https://ggrepel.slowkow.com/), [GGally](https://ggobi.github.io/ggally/)) and just like it's not possible to cover all of ggplot2 in an intro course, it's definitely not possible to cover the entire gg-verse. However, it is useful to introduce your students to some of these packages so they are aware of the existence of the larger ecosystem.

A particularly good place to start is when you find a pain point with ggplot2 and the solution is using one of these other packages (e.g. ggrepel for labelling data points on a plot without overlapping text).

Another good approach for introducing these packages are assignments where students independently explore packages you haven't explicitly taught them. I like doing this using the following two assignments:

-   **You gotta pick a package or two:** Provide a list of fun and/or easy to onboard packages and ask students to read the package documentation and use the package to do something.

-   **Mirror, mirror on the wall, who's the ugliest of them all?** I got the idea for this assignment Give a simple plot and ask students to make the plot as ugly as possible. I like doing this with a disclaimer that says "*I realize that ugly is subjective, so we're mostly looking to see if you can figure out how to change the look of a plot using help files of functions you haven't learned before. As you do, try to make your plot as visually unappealing as possible.*"I got the idea for this assignment from Drew Steen, who shared [on Twitter](https://twitter.com/biogeobiochem/status/1172547837046820864) sample student plots that are, well, awful, in the best way possible. Alison Horst also has a lovely blog post where she shares her experience with a similar assignment [here](https://www.allisonhorst.com/post/do-your-worst/).

You can find a more detailed write up of these assignments [here](https://introds.org/hw/hw-10/hw-10-wrap-up.html).

That's it for today, next up on the "Teaching the Tidyverse in 2020" series is data wrangling and tidying.
