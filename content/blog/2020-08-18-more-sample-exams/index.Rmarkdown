---
title: More sample exams
author:
  - greg
date: '2020-08-18'
categories:
  - certify
tags:
  - certify
description: |
  More examples of the kinds of questions we ask on the tidyverse and teaching exams.
slug: more-example-exams
photo:
  author: Greg Wilson
---

To help everyone who is preparing to certify as an RStudio instructor,
here are examples of the kinds of questions we have been using recently.
Candidates can use any reference material they want (books, online resources, old code, or YouTube videos),
but may not ask another person for help, and must complete the exams in 90 minutes each.
(Most people schedule them at least a couple of weeks apart rather than back to back.)

## Tidyverse Exam

*[Brendan Cullen](https://education.rstudio.com/trainers/people/cullen+brendan/)
has posted [a solution guide](https://tidyverse-exam-v2-solutions.netlify.app/)
with [source available on GitHub](https://github.com/brendanhcullen/tidyverse-sample-exam-v2.0).*

### Basic Operations

1.  Read the file [`person.csv`](./person.csv) and store the result in a tibble called `person`.

1.  Create a tibble containing only family and personal names, in that order. You do not need to assign this tibble or any others to variables unless explicitly asked to do so. However, as noted in the introduction, you *must* use the pipe operator `%>%` and code that follows the tidyverse style guide.

1.  Create a new tibble containing only the rows in which family names come *before* the letter `M`. Your solution should work for tables with more rows than the example, i.e., you cannot rely on row numbers or select specific names.

1.  Display all the rows in `person` sorted by family name length with the longest name first.

### Cleaning and Counting

1.  Read the file [`measurements.csv`](./measurements.csv) to create a tibble called `measurements`. (The strings `"rad"`, `"sal"`, and `"temp"` in the `quantity` column stand for "radiation", "salinity", and "temperature" respectively.)

1.  Create a tibble containing only rows where *none* of the values are `NA` and save in a tibble called `cleaned`.

1.  Count the number of measurements of each type of quantity in `cleaned`. Your result should have one row for each quantity `"rad"`, `"sal"`, and `"temp"`.

1.  Display the minimum and maximum value of `reading` separately for each quantity in `cleaned`. Your result should have one row for each quantity `"rad"`, `"sal"`, and `"temp"`.

1.  Create a tibble in which all salinity (`"sal"`) readings greater than 1 are divided by 100. (This is needed because some people wrote percentages as numbers from 0.0 to 1.0, but others wrote them as 0.0 to 100.0.)

### Combining Data

1.  Read [`visited.csv`](./visited.csv) and drop rows containing any `NA`s, assigning the result to a new tibble called `visited`.

1.  Use an inner join to combine `visited` with `cleaned` using the `visit_id` column for matches.

1.  Find the highest radiation (`"rad"`) reading at each site. (Sites are identified by values in the `site_id` column.)

1.  Find the date of the highest radiation reading at each site.

### Plotting

1.  The code below is supposed to read the file [`home-range-database.csv`](./home-range-database.csv) to create a tibble called `hra_raw`, but contains a bug. Describe and fix the problem. (There are several ways to fix it: please use whichever you prefer.)
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

### Functional Programming

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

### Wrapping Up

1.  Modify the YAML header of this file so that a table of contents is automatically created each time this document is knit, and fix any errors that are preventing the document from knitting cleanly.
    ```
    ---
    title: "Tidyverse Exam Version 2.0"
    output:
    html_document:
        theme: flatly
    ---
    ```

## Teaching Exam

### Demonstration Lesson

Present the demonstration lesson you have developed for this
examination.

### Formative Assessment

You are teaching a one-day introductory workshop on the tidyverse to learners
with little or no previous programming experience. You have shown them how to
create a dplyr pipeline and how to use the basic verbs `select`, `filter`, and
`mutate`, as well as how to create simple plots using ggplot. The next step in
your lesson shows them `group_by` and `summarize`.

1.  Create a multiple choice question to test their understanding of these two
    functions. Include one right answer and at least two wrong answers, and
    explain clearly what misconceptions the wrong answers are intended to
    diagnose.

2.  Create a short fill-in-the-blanks coding exercise to test their ability to
    use these two functions in a dplyr pipeline. Provide the explanatory text
    you would give the learners and the template code they would fill in, and
    explain what answers you expect and what errors you expect learners to make.

### Teaching Methods

To support a popular online class for people who are learning how to use regular
expressions in R, your colleague has suggested having the learners grade each
other's exercises.

-   Each learner submits their code by pasting it into an online system.

-   They are then shown the submissions of 3 other learners, one at a
    time.

-   For each submission, they are able to put a `+` or `-` beside each line of
    code to indicate whether they like it or don't like it. (They don't have to
    mark or comment on lines, but are not able to submit their review unless
    they have marked at least 5 lines.)

-   They are also able to add an overall paragraph-length comment on each
    submission.

Please describe two strengths and two weaknesses of this tool from the point of
view of the learner and from the point of view of the teacher. Please connect
your points to specific aspects of educational theory where you can.

### Mental Models

You are preparing a lesson on handling missing values in data science.  Draw a
concept map with 4-5 concepts and 6-8 links.

### Being an Ally

For each of the scenarios below, describe three things you would do in
escalation order (i.e., the first thing you would try, then what you would do if
that didn't work, and then your final option).

#### Scenario 1

You have been sent to a company to deliver a week-long introduction to R
and the tidyverse to a team of 8 statisticians who have been using SAS
for many years. Most of them seem interested, but one is obviously not:
they are answering email during lessons, not bothering to do exercises,
shrugging off questions, etc.

You spoke with them at the end of the first day to say that their
behavior is demotivating other learners. After telling you that they
don't think the class is worthwhile---they can do everything they need
to in SAS and they don't see why the company is forcing them to
switch---they promised to do better. However, it is now mid-morning on
day 2 and if anything their behavior is worse. What are the next three
steps you would take, assuming that they continue to promise to make
changes but actually don't?

#### Scenario 2

You are co-teaching a workshop at a conference with a senior (relatively
famous) data scientist you have never met in person before. After an
hour, you notice that they only ever ask male students to share their
work with the class. You have pointed this out as gently as you can and
they have become very defensive. What are the next steps you would take,
assuming that each step makes them even more defensive or argumentative?

### Feedback

Watch 4 minutes of the video embedded below and list feedback you would give the
presenter about what they're doing well and what they could improve.

<https://youtu.be/whmLRd5nibc?t=1265>

|          | Content | Presentation |
| -------- | ------- | ------------ |
| Positive |         |              |
| Negative |         |              |
