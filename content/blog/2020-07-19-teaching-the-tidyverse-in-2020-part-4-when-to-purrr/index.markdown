---
title: "Teaching the Tidyverse in 2020 - Part 4: When to Purrr?"
date: "2020-07-19"
slug: teaching-the-tidyverse-in-2020-part-4-when-to-purrr
categories:
  - teach
tags:
  - tidyverse
authors:
  - mine
photo:
  url: https://unsplash.com/photos/wEL2zPX3jDg
  author: Fabio Ballasina
---


```r
# turn everything off for now
knitr::opts_chunk$set(eval=FALSE)
```


```r
library(tidyverse)
library(palmerpenguins)
library(jsonlite)
```

Some intro linking to older posts

#### 1. Reading in many files: use `vroom()` instead

1. Reading in many files

2. Flattening JSON files

We have data on Lego sales and some information on the buyers in JSON format. We want to covert it into a tidy data frame.



purrr solution:


```r
sales %>%
  purrr::map_dfr(
    function(l) {
      purchases <- purrr::map_dfr(l$purchases, ~.)
      l$purchases <- NULL
      l$hobbies <- list(l$hobbies)
      cbind(as_tibble(l), purchases) %>% as_tibble()
    }
  )
```

tidyr solution 



```r
# step 1
sales %>%
  tibble(sales = .)
```


```r
# step 2
sales %>%
  tibble(sales = .) %>%
  unnest_wider(sales)
```


```r
# step 3
sales %>%
  tibble(sales = .) %>%
  unnest_wider(sales) %>%
  unnest_longer(purchases)
```


```r
# step 4
sales %>%
  tibble(sales = .) %>%
  unnest_wider(sales) %>%
  unnest_longer(purchases) %>%
  unnest_wider(purchases)
```



```r
# auto!
sales %>%
  tibble(sales = .) %>%
  unnest_auto(sales) %>%
  unnest_auto(purchases) %>%
  unnest_auto(purchases)
```

<div class="question">Not sure if this is something I should get into?</div>

Suppose you want to repeatedly apply a function that reports back two values (e.g. lower and upper bounds of confidence interval).

For simplicity, let's say this function just randomly generates two values from the normal distribution.


```r
foo <- function(i){
  tibble(
    x = rnorm(1),
    y = rnorm(1)
  )
}
```

purrr solution 


```r
map_dfr(1:5, foo)
```

dplyr solution


```r
tibble(id = 1:5) %>% 
  group_by(id) %>% 
  summarise(foo())
```

Moral of the story

- There are many ways of getting to the answer
- Some likely need more scaffolding than others
- It's worth considering how much of `purrr` fits into your introductory data science curriculum

---

Some outro saying we're done!

In no particular order...

- [Illustrations os statistical topics and R packages](Allison Horst's ) by Allison Horst
- [Animations of tidyverse verbs using R, the tidyverse, and gganimate](https://www.garrickadenbuie.com/project/tidyexplain/) by Garrick Aden-Buie

