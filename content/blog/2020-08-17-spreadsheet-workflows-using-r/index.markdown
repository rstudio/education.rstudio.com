---
title: Spreadsheet workflows in R
date: '2020-08-17'
slug: spreadsheets-using-r
categories:
  - learn
tags:
  - spreadsheets
  - tidyverse
author:
  - Devin Johnson
photo:
  url: https://unsplash.com/photos/Wpnoqo2plFA
  author: Mika Baumeister
---

There's so much to discover and learn when working with spreadsheets. 
As a summer intern at RStudio my project has focused on creating a resource that lies at the intersection between spreadsheets and R, aimed at users who either exclusively use one or the other or whose work lives in the intersection of the two. 
This project has focused on a plethora of topics from comparing numerous R package functionalities that work with spreadsheets, to writing about tips and tricks on best practices for working in both a spreadsheet software and in R. 

In this post I'd like to share a part of this work, specifically focused on the R versions of common spreadsheet workflows. 
To do that we'll assume the role of a data analyst in two hypothetical scenarios and walk through the tidyverse equivalent of common analyses and tasks one is likely to come across when working with data stored in spreadsheets. 

For our first story, it's day one as a new data analyst and our boss has asked us to take a look at the company's finances.
They send you a spreadsheet, available in an Excel workbook, and ask you to analyze spending patterns over the current year and give your assessment into where spending is going overboard.

We've decided to run our analysis in R to take advantage of data wrangling and visualization functions from the tidyverse as well as to create a reproducible workflow in case we want to revisit this analysis later. 
First, let's load in our data and take a look at it in R 

If you would like to follow along, you can download the Excel file called `spending.xlsx` [here](https://drive.google.com/file/d/1_euqWVOt2lx79POl0upk5oQKXG_70dsS/view?usp=sharing) by clicking on the Download icon (arrow pointing down) on the top right corner. 
Note that in the code chunk below we are reading this file from a folder called `data` so we recommend you create such a folder in your working directory and place the file you downloaded there. 
You can also follow along with the analysis on RStudio Cloud [here](https://rstudio.cloud/project/1523407).


```r
library(tidyverse)
library(readxl)

spending <- read_excel("data/spending.xlsx")
spending
```

```
## # A tibble: 48 x 5
##    month expense  amount num_of_expenses budget
##    <chr> <chr>     <dbl>           <dbl>  <dbl>
##  1 Jan   lawsuits   9916              17   6422
##  2 Feb   lawsuits   9575              16   3125
##  3 Mar   lawsuits   5760              33   3913
##  4 Apr   lawsuits   3828              36   4062
##  5 May   lawsuits   5322              25   6347
##  6 Jun   lawsuits   6809              32    643
##  7 Jul   lawsuits   8568              37   5985
##  8 Aug   lawsuits   7562              34  10709
##  9 Sep   lawsuits   5682              26   9719
## 10 Oct   lawsuits   3689              16   7887
## # … with 38 more rows
```

We take note of the month column as well as amount spent, budget, and, expense type. 
We'll hold off on looking at the column `num_of_expenses`, it may prove useful down the line but not pressing for a quick look into the data.


## IF statements with nested logic

One advantage of spreadsheets is that we can use formulas to dictate what should happen in a specific cell and, in a broader application of this, apply them to an entire column. 
Back to our spending sheet, while data for all 12 months is useful for our summary we want to take a look at spending by quarter, something not provided in the initial data set, so we'll need to make our own quarter variable. 
We can see how this process works in spreadsheets, manipulating our data in an Excel workbook.

<img src="screenshots/nested-logic.png" width="100%" />

It's a bit difficult to see the formula bar in the image above, so the formula to create used for creating the quarter column is provided below.

```{}
=IF(OR(A2="Jan",A2="Feb",A2="Mar"),"Q1",IF(OR(A2="Apr",A2="May",A2="Jun"),"Q2",IF(OR(A2="Jul",A2="Aug",A2="Sep"),"Q3",IF(OR(A2="Oct",A2="Nov",A2="Dec"),"Q4","NA"))))
```

For our tidyverse comparison, When creating a column that requires multiple or *nested* logical conditions, we can take advantage of the `case_when()` function from dplyr. 
Similar to a CASE statement in SQL, we can set parameters for what a given value should be based on conditions from other rows or columns in our data. 
To do this we can create a new column using the `mutate()` function and apply `case_when()` within that call.


```r
spending_quarter <- spending %>%
  mutate(quarter = case_when(
    month %in% c("Jan", "Feb", "Mar") ~ "Q1",
    month %in% c("Apr", "May", "Jun") ~ "Q2",
    month %in% c("Jul", "Aug", "Sep") ~ "Q3",
    month %in% c("Oct", "Nov", "Dec") ~ "Q4",
    TRUE ~ "NA"
  ))

spending_quarter
```

```
## # A tibble: 48 x 6
##    month expense  amount num_of_expenses budget quarter
##    <chr> <chr>     <dbl>           <dbl>  <dbl> <chr>  
##  1 Jan   lawsuits   9916              17   6422 Q1     
##  2 Feb   lawsuits   9575              16   3125 Q1     
##  3 Mar   lawsuits   5760              33   3913 Q1     
##  4 Apr   lawsuits   3828              36   4062 Q2     
##  5 May   lawsuits   5322              25   6347 Q2     
##  6 Jun   lawsuits   6809              32    643 Q2     
##  7 Jul   lawsuits   8568              37   5985 Q3     
##  8 Aug   lawsuits   7562              34  10709 Q3     
##  9 Sep   lawsuits   5682              26   9719 Q3     
## 10 Oct   lawsuits   3689              16   7887 Q4     
## # … with 38 more rows
```

Excellent! We've got our new quarter column set up. 
Here we specified which months make up each quarter and as in our spreadsheet formula for good measure added an NA condition in the event we've missed something. 
We can do a quick sanity check for our `case_when()` statement by examining our data and seeing if any NA values show up in the new column we generated, which would indicate if a month is spelled differently than what's listed in our conditions or if there's an error in our code. 


## Pivot tables 

Pivot tables are a powerful tool spreadsheets offer, allowing us to generate summaries of large quantities of data. 
Let's take a look at how we create our basic Pivot table in spreadsheets and then see how we can create summary tables using functions from the `tidyverse` 

First we'll create a separate sheet for our pivot table, specifying the range of the data we want it to be based on. 

<img src="screenshots/pivot-set-up.png" width="100%" />

And then, it's as simple as dragging and dropping our variables of interest into specific order with `expense` and `quarter` in rows and `budget` and `amount` in values, specifying a *sum* calculation.

<img src="screenshots/pivot-table.png" width="100%" />

For our tidyverse comparison, we can create summary tables as well. 
Let's take a look total expenses and budget by expense type and quarter. 


```r
spending_table <- spending_quarter %>%
  group_by(expense, quarter) %>%
  summarise(
    total_expenses = sum(num_of_expenses),
    total_expense_amt = sum(amount),
    total_budget_amt = sum(budget),
    .groups = "drop"
    )

spending_table
```

```
## # A tibble: 16 x 5
##    expense           quarter total_expenses total_expense_amt total_budget_amt
##    <chr>             <chr>            <dbl>             <dbl>            <dbl>
##  1 consulting        Q1                  70             16266            17949
##  2 consulting        Q2                  33             11329            22345
##  3 consulting        Q3                  93             17997            17460
##  4 consulting        Q4                  82             16622            17358
##  5 lawsuits          Q1                  66             25251            13460
##  6 lawsuits          Q2                  93             15959            11052
##  7 lawsuits          Q3                  97             21812            26413
##  8 lawsuits          Q4                  56             14829            17939
##  9 office happy hour Q1                  32             17749            18688
## 10 office happy hour Q2                  56              7879            17658
## 11 office happy hour Q3                  39             16876            12384
## 12 office happy hour Q4                  38             14752            18058
## 13 office supplies   Q1                  83             13460            25251
## 14 office supplies   Q2                  45             12517            19140
## 15 office supplies   Q3                  67              7527            21819
## 16 office supplies   Q4                  91              9401            14342
```


## New variables

Sometimes we make a table and realize we can use the summary data to create new variables that can better answer our question. 
Coming back to our finance example, let's say we want to examine how much money is left over from each quarter based off of budget and amount spent. 
A quick work around could be to manually add in a formula in a cell adjacent to our table and drag it down to each respective row, a process depicted below.

<img src="screenshots/left-over-calculation.png" width="80%" />

Alternatively, using the `mutate()` function from dplyr, we can create a new column in our summary table and save that as a new data frame. 


```r
left_over <- spending_table %>%
  mutate(left_over = total_budget_amt - total_expense_amt) %>%
  arrange(left_over)

left_over
```

```
## # A tibble: 16 x 6
##    expense    quarter total_expenses total_expense_a… total_budget_amt left_over
##    <chr>      <chr>            <dbl>            <dbl>            <dbl>     <dbl>
##  1 lawsuits   Q1                  66            25251            13460    -11791
##  2 lawsuits   Q2                  93            15959            11052     -4907
##  3 office ha… Q3                  39            16876            12384     -4492
##  4 consulting Q3                  93            17997            17460      -537
##  5 consulting Q4                  82            16622            17358       736
##  6 office ha… Q1                  32            17749            18688       939
##  7 consulting Q1                  70            16266            17949      1683
##  8 lawsuits   Q4                  56            14829            17939      3110
##  9 office ha… Q4                  38            14752            18058      3306
## 10 lawsuits   Q3                  97            21812            26413      4601
## 11 office su… Q4                  91             9401            14342      4941
## 12 office su… Q2                  45            12517            19140      6623
## 13 office ha… Q2                  56             7879            17658      9779
## 14 consulting Q2                  33            11329            22345     11016
## 15 office su… Q1                  83            13460            25251     11791
## 16 office su… Q3                  67             7527            21819     14292
```

Great! Using the `arrange()` function we can also bring the largest instances of overspending to the top of our table to focus our attention.
In Excel, this is something you'd normally do via *Data > Sort*.

We can also filter our table if we're interested in a specific expense type.
In Excel, you could to this via *Data > Filter*.
Let's hone in on spending for office happy hours.


```r
left_over %>%
  filter(expense == "office happy hour")
```

```
## # A tibble: 4 x 6
##   expense     quarter total_expenses total_expense_a… total_budget_amt left_over
##   <chr>       <chr>            <dbl>            <dbl>            <dbl>     <dbl>
## 1 office hap… Q3                  39            16876            12384     -4492
## 2 office hap… Q1                  32            17749            18688       939
## 3 office hap… Q4                  38            14752            18058      3306
## 4 office hap… Q2                  56             7879            17658      9779
```

Hmm, a lot of *over*spending in Quarter 3, which might make sense as these are the summer months. 
Alternatively, we can take advantage of Sort and Filter in spreadsheets to accomplish the same thing. 


## VLOOKUPs and joins

We don't always have all of the information we need in a single data file and many times we need to bring in data from other sources to supplement and augment our existing data in the course of an analysis. 

For our second scenario, we'll leave the finance world and move on to something that is perhaps a little more exciting: superheroes!

Below is a data set containing information on various comic book characters with our first sheet providing some basic information on each character.

<img src="screenshots/heroes.png" width="65%" />

And a second sheet containing information on each character's alter ego.

<img src="screenshots/alter-egos.png" width="60%" />

Over time this data set has been expanded on with multiple sheets including new information. 
Before we start exploring, we'll need to join the relevant data from the two sheets so we can conduct some fun analyses.

Let's first walk through the spreadsheet approach and utilize a VLOOKUP to bring together these data. 
In each sheet, we notice there is a `hero` column that allows us to match data from one sheet to the other. 
The example below shows the process of pulling the `alter_ego` column from our alter egos sheet into our initial heroes data set. 

<img src="screenshots/VLOOKUP.png" width="100%" />

Starting our tidyverse comparison, we'll first load our data. 
Our data set contains two sheets so we'll load them in separately as two distinct data frames.

If you would like to follow along, you can download the Excel file called `superheroes.xlsx` [here](https://drive.google.com/file/d/1KAOAMA_iRdMrl0erYd2DTm7uUKCsDuM9/view?usp=sharing) and remember that you can also follow along with the analysis on RStudio Cloud [here](https://rstudio.cloud/project/1523407). 


```r
superheroes <- read_excel("data/superheroes.xlsx", sheet = "heroes")
identities <- read_excel("data/superheroes.xlsx", sheet = "alter_egos")
```

Let's take a look at the sheet with data on superheroes.


```r
superheroes
```

```
## # A tibble: 26 x 4
##    hero            universe has_powers first_appearance   
##    <chr>           <chr>    <chr>      <dttm>             
##  1 Superman        DC       yes        1938-04-18 00:00:00
##  2 Batman          DC       no         1939-03-30 00:00:00
##  3 Spider-Man      Marvel   yes        1962-08-01 00:00:00
##  4 Green Lantern   DC       yes        1971-12-01 00:00:00
##  5 Daredevil       Marvel   no         1964-04-01 00:00:00
##  6 Wonder Woman    DC       yes        1941-10-01 00:00:00
##  7 Black Widow     Marvel   no         1964-04-01 00:00:00
##  8 Captain America Marvel   yes        1941-03-01 00:00:00
##  9 Hulk            Marvel   yes        1962-05-01 00:00:00
## 10 Thor            Marvel   yes        1962-08-01 00:00:00
## # … with 16 more rows
```

And now let's take a look at the sheet listing the alter ego of each character.


```r
identities
```

```
## # A tibble: 26 x 3
##    hero            alter_ego        is_secret
##    <chr>           <chr>            <chr>    
##  1 Superman        Clark Kent       yes      
##  2 Batman          Bruce Wayne      yes      
##  3 Spider-Man      Peter Parker     yes      
##  4 Green Lantern   John Stewart     yes      
##  5 Daredevil       Matt Murdock     yes      
##  6 Wonder Woman    Diana Prince     yes      
##  7 Black Widow     Natasha Romanova no       
##  8 Captain America Steve Rogers     no       
##  9 Hulk            Bruce Banner     no       
## 10 Thor            Donald Blake     yes      
## # … with 16 more rows
```

Using `left_join()` from the dplyr package, we can bring in the data from the identities data frame into our superheroes data frame.

To do this we'll call `left_join()` on superheroes, putting the identities data set as our first argument and specify our common variable with the `by` argument.


```r
superhero_identities <- superheroes %>%
  left_join(identities, by = "hero")

superhero_identities
```

```
## # A tibble: 26 x 6
##    hero          universe has_powers first_appearance    alter_ego     is_secret
##    <chr>         <chr>    <chr>      <dttm>              <chr>         <chr>    
##  1 Superman      DC       yes        1938-04-18 00:00:00 Clark Kent    yes      
##  2 Batman        DC       no         1939-03-30 00:00:00 Bruce Wayne   yes      
##  3 Spider-Man    Marvel   yes        1962-08-01 00:00:00 Peter Parker  yes      
##  4 Green Lantern DC       yes        1971-12-01 00:00:00 John Stewart  yes      
##  5 Daredevil     Marvel   no         1964-04-01 00:00:00 Matt Murdock  yes      
##  6 Wonder Woman  DC       yes        1941-10-01 00:00:00 Diana Prince  yes      
##  7 Black Widow   Marvel   no         1964-04-01 00:00:00 Natasha Roma… no       
##  8 Captain Amer… Marvel   yes        1941-03-01 00:00:00 Steve Rogers  no       
##  9 Hulk          Marvel   yes        1962-05-01 00:00:00 Bruce Banner  no       
## 10 Thor          Marvel   yes        1962-08-01 00:00:00 Donald Blake  yes      
## # … with 16 more rows
```

Great, we've joined the data frames with no problem!

There are, of course, instances in which we'll need to pull in data from multiple sheets, and the superheroes data set is no exception. 
We've been informed there are an additional two sheets that have recently been added. 
One containing information on the main power or skill of each character, 


```r
powers <- read_excel("data/superheroes.xlsx", sheet = "powers")
powers
```

```
## # A tibble: 26 x 2
##    hero            main_power           
##    <chr>           <chr>                
##  1 Superman        flight               
##  2 Batman          inexhaustable wealth 
##  3 Spider-Man      wall-crawling        
##  4 Green Lantern   power ring           
##  5 Daredevil       echo-location        
##  6 Wonder Woman    super strength       
##  7 Black Widow     training             
##  8 Captain America peak physical fitness
##  9 Hulk            super strength       
## 10 Thor            magic hammer         
## # … with 16 more rows
```

and the other containing the occupation of the alter ego of each superhero. 


```r
occupation <- read_excel("data/superheroes.xlsx", sheet = "occupation")
occupation
```

```
## # A tibble: 26 x 2
##    name             occupation          
##    <chr>            <chr>               
##  1 Clark Kent       Reporter            
##  2 Bruce Wayne      CEO                 
##  3 Peter Parker     Photogragpher       
##  4 John Stewart     U.S. Marine         
##  5 Matt Murdock     Lawyer              
##  6 Diana Prince     Intelligence Officer
##  7 Natasha Romanova Spy/Assassin        
##  8 Steve Rogers     Solider             
##  9 Bruce Banner     Scientist           
## 10 Donald Blake     Doctor              
## # … with 16 more rows
```

We see that the powers sheet has a `hero` column allowing for another simple left join. 
However, the occupation sheet doesn't have a common column by that specific name, but we do recognize that the information in the `name` column is the same for the `alter_ego` column from our identities spreadsheet.
We can take advantage of this relationship to bring these data frames together as shown in the code below. 


```r
heroes_full <- superhero_identities %>%
  left_join(powers, by = "hero") %>%
  left_join(occupation, by = c("alter_ego" = "name"))
```

Here we conduct a simple left join bringing in the data from the powers data set, and then another left join to bring in the data from the occupation spreadsheet.
In the `by` argument we specify that the column `alter_ego` should be matched to the `name` column from the occupation data frame. 

We've expanded our dataset quite a bit. 
Let's take an alternative approach to view it using the `glimpse()` function from dplyr. 


```r
glimpse(heroes_full)
```

```
## Rows: 26
## Columns: 8
## $ hero             <chr> "Superman", "Batman", "Spider-Man", "Green Lantern",…
## $ universe         <chr> "DC", "DC", "Marvel", "DC", "Marvel", "DC", "Marvel"…
## $ has_powers       <chr> "yes", "no", "yes", "yes", "no", "yes", "no", "yes",…
## $ first_appearance <dttm> 1938-04-18, 1939-03-30, 1962-08-01, 1971-12-01, 196…
## $ alter_ego        <chr> "Clark Kent", "Bruce Wayne", "Peter Parker", "John S…
## $ is_secret        <chr> "yes", "yes", "yes", "yes", "yes", "yes", "no", "no"…
## $ main_power       <chr> "flight", "inexhaustable wealth", "wall-crawling", "…
## $ occupation       <chr> "Reporter", "CEO", "Photogragpher", "U.S. Marine", "…
```

For doing this same task in Excel, we can continue to utilize VLOOKUPS for each additional column of data we want to pull into our main sheet. 
To bring in our occupation data we simply adjust the initial reference point in our formula from column A2 which houses hero name to E2 which houses alter egos which was also added via a VLOOKUP. 

<img src="screenshots/full-join.png" width="100%" />

There we have it, a fully combined data set ready for analysis! 
Hmmm, now that we think about it, let's hope we aren't sharing this data with any super villains. 
We may be an ace at working with spreadsheet data but we're also an ethical data analyst!

I hope you've found this blog post useful and enjoyed reading through each example. 
It's been such a pleasure working with Jenny Bryan and Mine Çetinkaya-Rundel on this project and we're excited to share more of the Spreadsheets Using R resource with readers in the future. 
Until then, no matter what tools you're using to work with your data, happy analyzing! 
