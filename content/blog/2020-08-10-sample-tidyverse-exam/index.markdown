---
title: Another sample Tidyverse exam
author:
  - greg
date: '2020-08-10'
categories:
  - certify
tags:
  - certify
description: |
  A sample of the kinds of questions we ask in the Tidyverse certification exam.
slug: sample-tidyverse-exam
photo:
  author: Greg Wilson
---

To help everyone who is preparing to certify as a tidyverse instructor,
here are examples of the kinds of questions we have been using recently. Candidates can use any reference material they want (books, online resources, old code, or YouTube videos), but may not ask another person for help, and must complete the whole exam in 90 minutes.

## Basic Operations

1.  Read the file [`person.csv`](./person.csv) and store the result in a tibble called `person`.

1.  Create a tibble containing only family and personal names, in that order. You do not need to assign this tibble or any others to variables unless explicitly asked to do so. However, as noted in the introduction, you *must* use the pipe operator `%>%` and code that follows the tidyverse style guide.

1.  Create a new tibble containing only the rows in which family names come *before* the letter `M`. Your solution should work for tables with more rows than the example, i.e., you cannot rely on row numbers or select specific names.

1.  Display all the rows in `person` sorted by family name length with the longest name first.

## Cleaning and Counting

1.  Read the file [`measurements.csv`](./measurements.csv) to create a tibble called `measurements`. (The strings `"rad"`, `"sal"`, and `"temp"` in the `quantity` column stand for "radiation", "salinity", and "temperature" respectively.)

1.  Create a tibble containing only rows where *none* of the values are `NA` and save in a tibble called `cleaned`.

1.  Count the number of measurements of each type of quantity in `cleaned`. Your result should have one row for each quantity `"rad"`, `"sal"`, and `"temp"`.

1.  Display the minimum and maximum value of `reading` separately for each quantity in `cleaned`. Your result should have one row for each quantity `"rad"`, `"sal"`, and `"temp"`.

1.  Create a tibble in which all salinity (`"sal"`) readings greater than 1 are divided by 100. (This is needed because some people wrote percentages as numbers from 0.0 to 1.0, but others wrote them as 0.0 to 100.0.)

## Combining Data

1.  Read [`visited.csv`](./visited.csv) and drop rows containing any `NA`s, assigning the result to a new tibble called `visited`.

1.  Use an inner join to combine `visited` with `cleaned` using the `visit_id` column for matches.

1.  Find the highest radiation (`"rad"`) reading at each site. (Sites are identified by values in the `site_id` column.)

1.  Find the date of the highest radiation reading at each site.

## Plotting

1.  The code below is supposed to read the file `home-range-database.csv` to create a tibble called `hra_raw`, but contains a bug. Describe and fix the problem. (There are several ways to fix it: please use whichever you prefer.)
    ```
    hra_raw <- read_csv(here::here("data", "home-range-database.csv"))
    ```

1.  Convert the `class` column (which is text) to create a factor column `class_fct` and assign the result to a tibble `hra`. Use `forcats` to order the factor levels as:
    1.  mammalia
    2.  reptilia
    3.  aves
    4.  actinopterygii

1.  Create a scatterplot showing the relationship between `log10.mass` and `log10.hra` in `hra`.

1.  Colorize the points in the scatterplot by `class_fct`.

1.  Display a scatterplot showing only data for birds (class `aves`) and fit a linear regression to that data using the `lm` function.

## Functional Programming

1.  Write a function called `summarize_table` that takes a title string and a tibble as input and returns a string that says something like, "*title* has *#* rows and *#* columns". For example, `summarize_table('our table', person)` should return the string `"our table has 5 rows and 3 columns"`.

1.  Write another function called `show_columns` that takes a string and a tibble as input and returns a string that says something like, "*table* has columns *name*, *name*, *name*". For example, `show_columns('person', person)` should return the string `"person has columns person_id, personal_name, family_name"`.

1.  The function `rows_from_file` returns the first *N* rows from a table in a CSV file given the file's name and the number of rows desired. Modify it so that if no value is specified for the number of rows, a default of 3 is used.
    ```
    rows_from_file <- function(filename, num_rows) {
      readr::read_csv(filename) %>% head(n = num_rows)
    }

    rows_from_file("measurements.csv") # should show 3 rows
    ```

1.  The function `long_name` checks whether a string is longer than 4 characters. Use this function and a function from `purrr` to create a logical vector that contains the value `TRUE` where family names in the tibble `person` are longer than 4 characters, and `FALSE` where they are 4 characters or less.
    ```
    long_name <- function(name) {
      stringr::str_length(name) > 4
    }
    ```

## Wrapping Up

1.  Modify the YAML header of this file so that a table of contents is automatically created each time this document is knit, and fix any errors that are preventing the document from knitting cleanly.
    ```
    ---
    title: "Tidyverse Exam Verson 2.0"
    output:
    html_document:
        theme: flatly
    ---
    ```

