---
title: Sample Shiny exam
author:
  - greg
date: '2020-10-02'
categories:
  - certify
tags:
  - certify
description: |
  Examples of the kinds of questions we ask on the Shiny exam.
slug: example-shiny-exam
photo:
  author: Greg Wilson
---

To help everyone who is preparing to certify as a Shiny instructor,
here are examples of the kinds of questions we have used in the past.
Candidates can use any reference material they want (books, online resources, old code, or YouTube videos),
but may not ask another person for help, and must complete the exams in 90 minutes each.

## Question 1

In this question you will be asked to debug and improve an app that uses a subset of the diamonds dataset from the ggplot2 package. While familiarity with the variables in the dataset is not required for successfully completing this question, the help file for this dataset contains a codebook that might be helpful.

The app code is provided in an RStudio Cloud project.


1.  There is one bug in the app: The summary under the "Overall" heading should be a full sentence that reads `There are ___ diamonds that match your selection criteria.` Instead it just reads `nrow`. Debug the app to correct this mistake.

2.  Improve the code in the server function by removing repeated instances of the following lines of code and making use of reactive expressions:

    ```
    diamonds %>%
      filter(
        cut %in% input$selected_cut,
        color %in% input$selected_color
      )
    ```

    Then, describe in 1-2 sentences how the reactive graph with the improvements you implemented will change.

3.  Revamp the app by replacing the standard HTML table under the "Data" heading with `shiny::dataTableOutput()` which uses the DataTables Javascript library to create an interactive table with more features.

4. Refactor the app so that the three outputs (Overall, Variable Summary, and Data) are in separate tabs.

## Question 2

The `ui.R`, `server.R`, and `global.R` files shown on the next page are used to build an app. Answer the following questions without actually running the app.

1.  What error will running the app using the "Run app" button or with the `runApp()` function yield? How would you resolve this error?

2.  Suppose you resolve the error in part (a). Now that the app is running successfully, you deploy the app. The four timestamps are printed in order from Time 1 to Time 4, but the times displayed are as followed:

    *    Time 4 is always the earliest time
    *    Time 1 is always next
    *    Time 2 is always next after that
    *    Time 3 is always the latest time

    Explain why these timestamps show up in exactly this order.

3.  You then share the URL of your deployed app with your friend, who immediately visits the app as well on their own computer. The two of you compare what you're seeing on your screens. Which of the four time stamps will be the same across your screens? Which will be different? Explain why.

4.  You take a screenshot of your app and save it. Then, you reload the deployed app (without redeploying it) by hitting the refresh button on your browser, and compare the app you're viewing in your browser to the screenshot you took before you reloaded. Which of the four time stamps will be the same between the app in your browser and the screenshot? Which will be different? Explain why.

```
# ui.R
library(shiny)
library(magrittr)

time_1 <- Sys.time() %>% format_custom()
Sys.sleep(10)

ui <- fluidPage(  
    h4(paste("Time 1:", time_1)), 
    h4(paste("Time 2:", Sys.time() %>% format_custom())),
    h4(textOutput(paste("Time 3:", time_3))),
    h4(paste("Time 4:", time_4))
)
```

```
# server.R
server <- function(input, output) {   
    # Time 3 ----
    output$time_3 <- renderText({
        paste("Time 3:", Sys.time() %>% format_custom())
    }) 
}
```
```
# global.R
format_custom <- function(x){
  format(x, "%d %b %Y %H:%M:%S")
}

time_4 <- Sys.time() %>% format_custom()
Sys.sleep(10)
```

## Question 3

The following are conceptual questions that come up often when teaching Shiny. Please respond to each in two or three sentences as if you were responding to an email from a student.

1.  The Reactivity overview article on the Shiny Dev Center states "observers [...] don't return a value; they are used for their side effects." Explain what a side effect means in this context and how this relates to the differences between reactives and observers.

2.  In what context should one use  `eventReactive()` vs.   `observeEvent()`?

3.  Suppose you have written an app that is slow to launch and slow to react to user actions. What are the first three things you would check to find the cause, and how would you do this?

4.  Why does each Shiny module need to start with the statement `ns <- NS(id)`, and what purpose does this statement serve in Shiny modules?

## Question 4

In this question you are asked to re-create a Shiny app based on the deployed app as well as a verbal description. The deployed app can be found online, and is described below. You can use the CSV sent to you before this exam file (which contains data from the mtcars data frame) to test the app, and are welcome to view online examples and re-use code from them.

-   The app is comprised of three columns with the titles "Data upload", "Data viewer", and "Data download". The middle column is twice as wide as the columns in the left and right.
-   The app's title is "Upload / Download" however note that the name shown in the browser tab where you view the deployed app is different than the title shown in the app.
-   On the left hand side the user can upload a CSV file, and has the option to randomly sample observations from the data file you uploaded. If the user checks this option, a new widget where the sample size can be set pops up. The minimum allowed sample size is 1 and the maximum allowed is 32.
-   Data should be displayed in the middle column with a DataTables style table output immediately after the upload is complete. The displayed data should be updated if the user selects to take a random sample.
-   On the right hand side the user can download a CSV file. This is either the same file they uploaded, or a random sample from it. The name of the downloaded file should be identical to the name of the uploaded file.

![](screenshot.png)
