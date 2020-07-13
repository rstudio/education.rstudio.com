---
title: 'Teaching the Tidyverse in 2020 - Part 2: Data Visualisation'
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
---


```r
library(tidyverse)
```

```
## ── Attaching packages ──────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
## ✓ tibble  3.0.3     ✓ dplyr   1.0.0
## ✓ tidyr   1.1.0     ✓ stringr 1.4.0
## ✓ readr   1.3.1     ✓ forcats 0.5.0
```

```
## ── Conflicts ─────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(palmerpenguins)
theme_set(theme_minimal())
```

Some intro, linking to first post...

## Single box plot


```r
# used to have to
ggplot(penguins, aes(x = body_mass_g, factor = 1)) +
  geom_boxplot()
```

```
## Warning: Removed 2 rows containing non-finite values (stat_boxplot).
```

<img src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/unnamed-chunk-2-1.png" width="672" />


```r
# now
ggplot(penguins, aes(x = body_mass_g)) +
  geom_boxplot()
```

```
## Warning: Removed 2 rows containing non-finite values (stat_boxplot).
```

<img src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/unnamed-chunk-3-1.png" width="672" />

## No more `coord_flip()`
  

```r
# with coord_flip
ggplot(penguins, aes(x = species)) +
  geom_bar() +
  coord_flip()
```

<img src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/unnamed-chunk-4-1.png" width="672" />


```r
# without coord_flip
ggplot(penguins, aes(y = species)) +
  geom_bar()
```

<img src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/unnamed-chunk-5-1.png" width="672" />
  
## scales & forcats 

to improve visualisations -- don't think of it just as cosmetic


```r
library(scales)
```

```
## 
## Attaching package: 'scales'
```

```
## The following object is masked from 'package:purrr':
## 
##     discard
```

```
## The following object is masked from 'package:readr':
## 
##     col_factor
```


```r
penguins %>%
  count(species) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(aes(x = prop, y = species)) +
  geom_col()
```

<img src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/unnamed-chunk-7-1.png" width="672" />


```r
penguins %>%
  count(species) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(aes(x = prop, y = fct_reorder(species, prop))) +
  geom_col() +
  scale_x_continuous(labels = label_percent(accuracy = 1))
```

<img src="/blog/2020-07-15-teaching-the-tidyverse-in-2020-part-2-data-visualisation/index_files/figure-html/unnamed-chunk-8-1.png" width="672" />

## legend ordering

ordering the legend the same order of data in line plots

Some outro, what's coming...
