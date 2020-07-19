---
title: "Teaching the Tidyverse in 2020 - Part 4: When to purrr?"
date: "2020-07-19"
slug: teaching-the-tidyverse-in-2020-part-4-when-to-purrr
categories:
  - teach
tags:
  - tidyverse
author:
  - mine
photo:
  url: https://unsplash.com/photos/wEL2zPX3jDg
  author: Fabio Ballasina
---

Welcome to the fourth (and final!) post in the "Teaching the Tidyverse in 2020" series. So far we have covered [getting started](https://education.rstudio.com/blog/2020/07/teaching-the-tidyverse-in-2020-part-1-getting-started/ "Teaching the Tidyverse in 2020: Getting started"), [data visualisation](https://education.rstudio.com/blog/2020/07/teaching-the-tidyverse-in-2020-part-2-data-visualisation/ "Teaching the Tidyverse in 2020: Data visualisation"), and [data wrangling and tidying](https://education.rstudio.com/blog/2020/07/teaching-the-tidyverse-in-2020-part-3-data-wrangling-and-tidying/). Today the focus will be on when to introduce the [purrr](https://purrr.tidyverse.org/ "Link to purrr package website") package, or more widely, the notion of iteration and functional programming.

In a nutshell, *purrr enhances R's functional programming toolkit by providing a complete and consistent set of tools for working with functions and vectors*. Its attractive features include informative naming of functions (even if you don't know anything about purrr or functional programming you can probably guess that `map_chr()` is about characters vs. `map_int()` is about integers) and type consistency. purrr is useful for solving iterative problems in R, and the [family of `map()` functions](https://purrr.tidyverse.org/reference/map.html "Family of map() functions") is what finally broke my habit of writing for loops to solve iterative problems in R.

At rstudio::conf(2020), Hadley Wickham gave a talk titled [*State of the Tidyverse*](https://rstudio.com/resources/rstudioconf-2020/state-of-the-tidyverse/ "State of the Tidyverse video") and among the list of things he is particularly excited about for 2020, he listed "less purrr for data science". In this post we take a look at a few common data science tasks that are iterative in nature, part of the introductory data science curriculum (or should be!), and that can be carried out using tools others than purrr in the tidyverse.


```r
library(tidyverse)
```

## Reading in many files at once

The [vroom](https://vroom.r-lib.org/ "Link to vroom package website") package is designed for reading data into R *fast*, but it also offers a very handy functionality for reading in many data files at once without the need for a for loop or a `map()` function.

Let's return back to the [palmerpenguins](https://allisonhorst.github.io/palmerpenguins/ "Link to palmerpenguins package website") package for this example. Let's artificially create multiple files we want to read in at once by splitting the `penguins` dataset into three csv files, one for each species, named as `[NAME OF SPECIES].csv`, and save them in the `data/` folder.


```r
library(palmerpenguins)

penguins %>%
  group_by(species) %>%
  group_walk(~ write_csv(.x, paste0("data/", .y$species, ".csv")))
```

Let's inspect the `data` directory and confirm the files look as we expect them to. We'll make use of the [fs](https://fs.r-lib.org/ "Link to fs package website") package for this, specifically the `dir_ls()` function to get information on the contents of a directory.


```r
library(fs)

dir_ls(path = "data", glob = "*csv")
```

```
## data/Adelie.csv    data/Chinstrap.csv data/Gentoo.csv
```

We can read each of these files with `read_csv()` and bind the rows to create a single data frame.


```r
adelie    <- read_csv("data/Adelie.csv")
chinstrap <- read_csv("data/Chinstrap.csv")
gentoo    <- read_csv("data/Gentoo.csv")
all_three <- bind_rows(adelie, chinstrap, gentoo, .id = "species")
```

You can imagine this could get tedious quickly if there were a large number of files to be read in. To do this programmatically, we first need a list of the files we want to read in.


```r
files <- dir_ls(path = "data", glob = "*csv")
files
```

```
## data/Adelie.csv    data/Chinstrap.csv data/Gentoo.csv
```

The purrr solution to this problem is as follows. It seems pretty straight forward, but it requires understanding what mapping a function over each item of a given vector means.


```r
map_dfr(files, read_csv, .id = "species")
```

```
## # A tibble: 344 x 7
##    species island bill_length_mm bill_depth_mm flipper_length_… body_mass_g
##    <chr>   <chr>           <dbl>         <dbl>            <dbl>       <dbl>
##  1 data/A… Torge…           39.1          18.7              181        3750
##  2 data/A… Torge…           39.5          17.4              186        3800
##  3 data/A… Torge…           40.3          18                195        3250
##  4 data/A… Torge…           NA            NA                 NA          NA
##  5 data/A… Torge…           36.7          19.3              193        3450
##  6 data/A… Torge…           39.3          20.6              190        3650
##  7 data/A… Torge…           38.9          17.8              181        3625
##  8 data/A… Torge…           39.2          19.6              195        4675
##  9 data/A… Torge…           34.1          18.1              193        3475
## 10 data/A… Torge…           42            20.2              190        4250
## # … with 334 more rows, and 1 more variable: sex <chr>
```

Alternatively, this can be achieved with the `vroom()` function from the package with the same name.


```r
library(vroom)

vroom(files, id = "species")
```

```
## # A tibble: 344 x 7
##    species island bill_length_mm bill_depth_mm flipper_length_… body_mass_g
##    <chr>   <chr>           <dbl>         <dbl>            <dbl>       <dbl>
##  1 data/A… Torge…           39.1          18.7              181        3750
##  2 data/A… Torge…           39.5          17.4              186        3800
##  3 data/A… Torge…           40.3          18                195        3250
##  4 data/A… Torge…           NA            NA                 NA          NA
##  5 data/A… Torge…           36.7          19.3              193        3450
##  6 data/A… Torge…           39.3          20.6              190        3650
##  7 data/A… Torge…           38.9          17.8              181        3625
##  8 data/A… Torge…           39.2          19.6              195        4675
##  9 data/A… Torge…           34.1          18.1              193        3475
## 10 data/A… Torge…           42            20.2              190        4250
## # … with 334 more rows, and 1 more variable: sex <chr>
```

This feels a lot more like the `read_csv()` function your students would undoubtedly be familiar with before they set out to read many csv files at once. The species variable needs to be cleaned up a bit, which we can achieve with character manipulation.


```r
vroom(files, id = "species") %>%
  mutate(
    species = str_remove(species, "data/"),
    species = str_remove(species, "\\.csv")
    )
```

```
## # A tibble: 344 x 7
##    species island bill_length_mm bill_depth_mm flipper_length_… body_mass_g
##    <chr>   <chr>           <dbl>         <dbl>            <dbl>       <dbl>
##  1 Adelie  Torge…           39.1          18.7              181        3750
##  2 Adelie  Torge…           39.5          17.4              186        3800
##  3 Adelie  Torge…           40.3          18                195        3250
##  4 Adelie  Torge…           NA            NA                 NA          NA
##  5 Adelie  Torge…           36.7          19.3              193        3450
##  6 Adelie  Torge…           39.3          20.6              190        3650
##  7 Adelie  Torge…           38.9          17.8              181        3625
##  8 Adelie  Torge…           39.2          19.6              195        4675
##  9 Adelie  Torge…           34.1          18.1              193        3475
## 10 Adelie  Torge…           42            20.2              190        4250
## # … with 334 more rows, and 1 more variable: sex <chr>
```

## Working with list columns

In the [previous post](https://education.rstudio.com/blog/2020/07/teaching-the-tidyverse-in-2020-part-3-data-wrangling-and-tidying/ "Teaching the Tidyverse in 2020: Data wrangling and tidying") on data wrangling and tidying we worked with a wide data frame of repeated observations stored across columns. We'll return back to this data frame, except this time let's store the repeated observations in a single list column called `body_mass`.


```r
penguins_madeup_list <- tribble(
  ~name,        ~sex,     ~body_mass, 
  "Mumble",     "male",   c(4801, 5699, 5743),         
  "Gloria",     "female", c(4785, 3092, 4220),         
  "Memphis",    "male",   c(3349, 4186, 4454),         
  "Norma Jean", "female", c(4235, 3220, 4019)        
)

penguins_madeup_list
```

```
## # A tibble: 4 x 3
##   name       sex    body_mass
##   <chr>      <chr>  <list>   
## 1 Mumble     male   <dbl [3]>
## 2 Gloria     female <dbl [3]>
## 3 Memphis    male   <dbl [3]>
## 4 Norma Jean female <dbl [3]>
```

Our goal is to find the average body mass for penguin based on these measurements. We can do this using purrr as follows.


```r
penguins_madeup_list %>% 
  mutate(body_mass_avg = purrr::map_dbl(body_mass, mean))
```

```
## # A tibble: 4 x 4
##   name       sex    body_mass body_mass_avg
##   <chr>      <chr>  <list>            <dbl>
## 1 Mumble     male   <dbl [3]>         5414.
## 2 Gloria     female <dbl [3]>         4032.
## 3 Memphis    male   <dbl [3]>         3996.
## 4 Norma Jean female <dbl [3]>         3825.
```

But with a combination of `rowwise()` and `summarise()` it's also possible to accomplish this task without purrr.


```r
penguins_madeup_list %>%
  rowwise() %>%
  mutate(body_mass_avg = mean(body_mass))
```

```
## # A tibble: 4 x 4
## # Rowwise: 
##   name       sex    body_mass body_mass_avg
##   <chr>      <chr>  <list>            <dbl>
## 1 Mumble     male   <dbl [3]>         5414.
## 2 Gloria     female <dbl [3]>         4032.
## 3 Memphis    male   <dbl [3]>         3996.
## 4 Norma Jean female <dbl [3]>         3825.
```

With this structure it's also possible to create a list column that has many elements, e.g. more than one summary statistic.


```r
penguins_madeup_list <- penguins_madeup_list %>%
  rowwise() %>%
  mutate(body_mass_summary = list(summary(body_mass)))

penguins_madeup_list
```

```
## # A tibble: 4 x 4
## # Rowwise: 
##   name       sex    body_mass body_mass_summary
##   <chr>      <chr>  <list>    <list>           
## 1 Mumble     male   <dbl [3]> <table [6]>      
## 2 Gloria     female <dbl [3]> <table [6]>      
## 3 Memphis    male   <dbl [3]> <table [6]>      
## 4 Norma Jean female <dbl [3]> <table [6]>
```

To confirm that the `body_mass_summary` column indeed has the summary statistics we asked for, we can unnest that column.


```r
penguins_madeup_list %>%
  unnest_wider(body_mass_summary)
```

```
## # A tibble: 4 x 9
##   name       sex    body_mass  Min. `1st Qu.` Median  Mean `3rd Qu.`  Max.
##   <chr>      <chr>  <list>    <dbl>     <dbl>  <dbl> <dbl>     <dbl> <dbl>
## 1 Mumble     male   <dbl [3]>  4801     5250    5699 5414.     5721   5743
## 2 Gloria     female <dbl [3]>  3092     3656    4220 4032.     4502.  4785
## 3 Memphis    male   <dbl [3]>  3349     3768.   4186 3996.     4320   4454
## 4 Norma Jean female <dbl [3]>  3220     3620.   4019 3825.     4127   4235
```

What is this unnest magic, you ask? Let's look at that in a bit more detail next.

## Data rectangling

JSON is a commonly used hierarchical data type and it is especially commonly used on the web. Reading in data from JSON files and turning them into rectangular (tabular) data is an important skill for most data scientists to have, and with today's tooling in the tidyverse, it's feasible to teach this skill in data science courses at any level.

Let's take a look at our made up penguin data, this time stored in JSON format with a few additional variables. We'll read in the data using the [jsonlite](https://jeroen.cran.dev/jsonlite/ "Link to jsonlite package website") package.


```r
library(jsonlite)

penguins_madeup_json <- read_json("data/penguins_madeup.json")
```

Let's take a look at the first entry to get a sense of the structure of each the data.


```r
toJSON(penguins_madeup_json[1], pretty = TRUE)
```

```
## [
##   {
##     "gender": ["male"],
##     "first_name": ["Mumble"],
##     "measurements": [
##       {
##         "date": ["2007-11-11"],
##         "body_mass": [4801],
##         "flipper_length": [181]
##       },
##       {
##         "date": ["2007-11-16"],
##         "body_mass": [5699],
##         "flipper_length": [182]
##       },
##       {
##         "date": ["2007-11-19"],
##         "body_mass": [5743],
##         "flipper_length": [181]
##       }
##     ]
##   }
## ]
```

purrr is a great solution for working with lists, and hence for flattening JSON files. There are a couple ways we can solve this problem with purrr. I'll start with the less verbose approach.


```r
penguins_madeup_json %>%
  map_dfr(
    
    function(penguin) {
      penguin$measurements <- bind_rows(penguin$measurements)
      bind_cols(penguin)
    }
    
  )
```

```
## # A tibble: 12 x 5
##    gender first_name date       body_mass flipper_length
##    <chr>  <chr>      <chr>          <int>          <int>
##  1 male   Mumble     2007-11-11      4801            181
##  2 male   Mumble     2007-11-16      5699            182
##  3 male   Mumble     2007-11-19      5743            181
##  4 female Gloria     2007-11-11      4785            186
##  5 female Gloria     2007-11-14      3092            182
##  6 female Gloria     2007-11-19      4220            183
##  7 male   Memphis    2007-11-11      3349            190
##  8 male   Memphis    2007-11-15      4186            188
##  9 male   Memphis    2007-11-17      4454            191
## 10 female Norma Jean 2007-11-11      4235            193
## 11 female Norma Jean 2007-11-12      3220            191
## 12 female Norma Jean 2007-11-18      4019            194
```

While this works, it is certainly not trivial code to parse through. A slightly simpler approach with purrr involves being more expressive with how we extract each column of data.


```r
penguins_madeup_json %>%
  map_dfr(
    function(penguin) {
      
      tibble(
        gender         = penguin$gender,
        first_name     = penguin$first_name,
        date           = map_chr(penguin$measurements, "date"),
        body_mass      = map_chr(penguin$measurements, "body_mass"),
        flipper_length = map_chr(penguin$measurements, "flipper_length")
      )
      
    }
  )
```

```
## # A tibble: 12 x 5
##    gender first_name date       body_mass flipper_length
##    <chr>  <chr>      <chr>      <chr>     <chr>         
##  1 male   Mumble     2007-11-11 4801      181           
##  2 male   Mumble     2007-11-16 5699      182           
##  3 male   Mumble     2007-11-19 5743      181           
##  4 female Gloria     2007-11-11 4785      186           
##  5 female Gloria     2007-11-14 3092      182           
##  6 female Gloria     2007-11-19 4220      183           
##  7 male   Memphis    2007-11-11 3349      190           
##  8 male   Memphis    2007-11-15 4186      188           
##  9 male   Memphis    2007-11-17 4454      191           
## 10 female Norma Jean 2007-11-11 4235      193           
## 11 female Norma Jean 2007-11-12 3220      191           
## 12 female Norma Jean 2007-11-18 4019      194
```

I think this is easier to read for an introductory audience, but it still requires understanding how anonymous functions work, which is not trivial.

Enter tidyr, and the family of `unnest_*()` functions. Let's go step by step.

-   Step 1: Place list object resulting from reading in the JSON file into a tibble.


```r
penguins_madeup_json %>%
  tibble(penguins_madeup = .)
```

```
## # A tibble: 4 x 1
##   penguins_madeup 
##   <list>          
## 1 <named list [3]>
## 2 <named list [3]>
## 3 <named list [3]>
## 4 <named list [3]>
```

-   Step 2: Unnest the list object by turning each element of a list-column into a column with `unnest_wider()`.


```r
penguins_madeup_json %>%
  tibble(penguins_madeup = .) %>%
  unnest_wider(penguins_madeup)
```

```
## # A tibble: 4 x 3
##   gender first_name measurements
##   <chr>  <chr>      <list>      
## 1 male   Mumble     <list [3]>  
## 2 female Gloria     <list [3]>  
## 3 male   Memphis    <list [3]>  
## 4 female Norma Jean <list [3]>
```

-   Step 3: Unnest the measurements column by turning each element into a row with `unnest_longer()`.


```r
penguins_madeup_json %>%
  tibble(penguins_madeup = .) %>%
  unnest_wider(penguins_madeup) %>%
  unnest_longer(measurements)
```

```
## # A tibble: 12 x 3
##    gender first_name measurements    
##    <chr>  <chr>      <list>          
##  1 male   Mumble     <named list [3]>
##  2 male   Mumble     <named list [3]>
##  3 male   Mumble     <named list [3]>
##  4 female Gloria     <named list [3]>
##  5 female Gloria     <named list [3]>
##  6 female Gloria     <named list [3]>
##  7 male   Memphis    <named list [3]>
##  8 male   Memphis    <named list [3]>
##  9 male   Memphis    <named list [3]>
## 10 female Norma Jean <named list [3]>
## 11 female Norma Jean <named list [3]>
## 12 female Norma Jean <named list [3]>
```

-   Step 4: Unnest the measurements column again, this time turning each element in the list into a column with `unnest_wider()`.


```r
penguins_madeup_json %>%
  tibble(penguins_madeup = .) %>%
  unnest_wider(penguins_madeup) %>%
  unnest_longer(measurements)%>%
  unnest_wider(measurements)
```

```
## # A tibble: 12 x 5
##    gender first_name date       body_mass flipper_length
##    <chr>  <chr>      <chr>          <int>          <int>
##  1 male   Mumble     2007-11-11      4801            181
##  2 male   Mumble     2007-11-16      5699            182
##  3 male   Mumble     2007-11-19      5743            181
##  4 female Gloria     2007-11-11      4785            186
##  5 female Gloria     2007-11-14      3092            182
##  6 female Gloria     2007-11-19      4220            183
##  7 male   Memphis    2007-11-11      3349            190
##  8 male   Memphis    2007-11-15      4186            188
##  9 male   Memphis    2007-11-17      4454            191
## 10 female Norma Jean 2007-11-11      4235            193
## 11 female Norma Jean 2007-11-12      3220            191
## 12 female Norma Jean 2007-11-18      4019            194
```

The purrr solution may be more flexible, but if all you want to do is to unnest list columns to create rectangular data, I think this approach can be a lot more accessible for an introductory audience. And if you don't want to think about whether you need to go wider or longer, you can also use `unnest_auto()` first and let tidyr choose for you!


```r
penguins_madeup_json %>%
  tibble(penguins_madeup = .) %>%
  unnest_auto(penguins_madeup) %>%
  unnest_auto(measurements) %>%
  unnest_auto(measurements)
```

```
## Using `unnest_wider(penguins_madeup)`; elements have 3 names in common
```

```
## Using `unnest_longer(measurements)`; no element has names
```

```
## Using `unnest_wider(measurements)`; elements have 3 names in common
```

```
## # A tibble: 12 x 5
##    gender first_name date       body_mass flipper_length
##    <chr>  <chr>      <chr>          <int>          <int>
##  1 male   Mumble     2007-11-11      4801            181
##  2 male   Mumble     2007-11-16      5699            182
##  3 male   Mumble     2007-11-19      5743            181
##  4 female Gloria     2007-11-11      4785            186
##  5 female Gloria     2007-11-14      3092            182
##  6 female Gloria     2007-11-19      4220            183
##  7 male   Memphis    2007-11-11      3349            190
##  8 male   Memphis    2007-11-15      4186            188
##  9 male   Memphis    2007-11-17      4454            191
## 10 female Norma Jean 2007-11-11      4235            193
## 11 female Norma Jean 2007-11-12      3220            191
## 12 female Norma Jean 2007-11-18      4019            194
```

If you want to learn more about the family of `unnest_*()` functions, I recommend the [rectangling vignnette](https://tidyr.tidyverse.org/articles/rectangle.html "Rectangling vignette on the tidyr package website") in the tidyr package, and if you want to learn more about using purrr for such a task, I recommend [Charlotte Wickham's purrr tutorial](https://github.com/cwickham/purrr-tutorial "Charlotte Wickham’s purrr tutorial") if you prefer to browse through slides and [Jenny Bryan's purrr tutorial](https://jennybc.github.io/purrr-tutorial/ls13_list-columns.html "Jenny Bryan’s purrr tutorial") if you prefer written examples.

## So... when to purrr?

So far I've discussed when not to purrr, and provided alternative solutions to using packages like dplyr, tidyr, and vroom. This approach allows you to solve more data wrangling and import tasks before teaching functions, iteration, and mapping, i.e. get through more of your data science curriculum before diving into topics that are more traditionally programming than data science. So, when would be a good time in the introductory science curriculum to introduce these topics? I would recommend doing so after covering data visualisation, wrangling, and import, but before going into modeling and inference. And I would recommend doing with a motivating example of webscraping, where the webscraping task involves bringing together data from multiple pages that are all formatted the same way (e.g. IMDB pages on movies, voting records for each state). The recipe you might follow is:

-   Use rvest to scrape a single page

-   Introduce functions, and functionalize the code you wrote for scraping a single page

-   Use the function to scrape three pages, one by one, and bind the data together

-   Introduce iteration, and map the function you wrote across many pages

You can find an example of this approach in a paper I recently published with Mine Dogucu [here](https://github.com/mdogucu/web-scrape "Web Scraping in the Statistics and Data Science Curriculum: Challenges and Opportunities"), where we follow the recipe I outlined above to scrape data from [OpenSecrets](https://www.opensecrets.org/ "OpenSecrets.org"). We have also made the code available in [an RStudio Cloud project](https://rstudio.cloud/project/797118 "Link to RStudio Cloud project with web scraping code") to make it easier for readers to try it out.

Before we wrap up this post I want to expand a bit more on why I think it's worthwhile to discuss the mechanics of iteration prior to introducing statistical inference, especially if you're teaching simulation-based inference where there is lots of "resampling over and over". A few years ago I was introducing students to for loops at the same time as I was introducing them to the concept of bootstrapping, i.e. motivating the computational mechanics with statistical inference. But statistical inference is hard to wrap one's head around, and for loops aren't necessarily easy for novice programmers either. By introducing the mechanics of iteration (whether via for loops or via functional programming with purrr) I feel like I can spend more time on the *why* of simulation-based statistical inference rather than the *how*. After a few examples on bootstrapping where we explicitly write the code for how to resample, I introduce the [infer](https://infer.netlify.com/ "Link to infer package website") package and offload the computational details to its functions while keeping the focus in the class on the statistical ideas.

I think I can summarise this post on "when to purrr?" in four bullet points:

-   There are many ways to solve iterative problems in R.
-   Some ways need more scaffolding than others.
-   It's worth considering how much of purrr fits into your introductory data science curriculum, especially if you're feeling like your syllabus is crammed and you need to make room for other topics or for more practice.
-   For a more advanced data science or statistical programming course, purrr is a great introduction to functional programming.

------------------------------------------------------------------------

That's the end of the "Teaching the Tidyverse in 2020" series, thank you for sticking with me! Over the four posts in the series we talked a lot about tooling. Before we wrap things up I also want to give a list (in no particular order) of resources that can enhance and supplement your teaching materials:

-   [Illustrations os statistical topics and R packages](Allison%20Horst's "Allison Horst's illustrations os statistical topics and R packages") by Allison Horst
-   [Animations of tidyverse verbs using R, the tidyverse, and gganimate](https://www.garrickadenbuie.com/project/tidyexplain/ "Garrick Aden-Buie's animations of tidyverse verbs") by Garrick Aden-Buie
-   [\#TwoFunctionsMostDays](https://twitter.com/search?q=%23TwoFunctionsMostDays%20from%3Asharlagelfand&src=recent_search_click&f=live "Two functions most days by Sharla Gelfand") by Sharla Gelfand (not actively updated, but lots of gems nonetheless!)
-   [TidyTuesday](https://github.com/rfordatascience/tidytuesday "Tidy Tuesday by the R for Data Science Community") by the R for Data Science Community
-   The [R-Ladies Global channel](https://www.youtube.com/c/RLadiesGlobal/) on YouTube as well as many other [R-Ladies channels](https://www.youtube.com/c/RLadiesGlobal/channels) on YouTube (many of which have videos in languages other than English!)
-   [All the useR! 2020 videos](https://www.youtube.com/channel/UC_R5smHVXRYGhZYDJsnXTwg/videos "Videos by the R Consortium") (and videos from the past useR! conferences) by the R Consortium

And of course, the [\#rstats hashtag on Twitter](https://twitter.com/search?q=%23rstats&src=typed_query&f=live "#rstats hashtag on Twitter") for a constant stream of R inspiration!
