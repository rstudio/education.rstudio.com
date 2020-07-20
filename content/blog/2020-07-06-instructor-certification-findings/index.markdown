---
title: Instructor Certification Findings
author:
  - greg
date: '2020-07-06'
categories:
  - certify
tags:
  - certify
slug: instructor-certification-findings
description: |
  What do our certified instructors think of the program?
photo:
  author: Greg Wilson
---





We recently surveyed people who have taken part in our
[instructor training and certification program](http://education.rstudio.com/trainers/) during the past 18 months. 92 people responded, and as the figures below show (on a 1-5 Likert scale), most seemed to think it useful, though actual adoption lags a little behind enthusiasm:

<div class="figure" style="text-align: center">
<img src="/blog/2020-07-06-instructor-certification-findings/index_files/figure-html/useful-1.png" alt="How much of what you learned in the training class have you found useful?" width="672" />
<p class="caption">Figure 1: How much of what you learned in the training class have you found useful?</p>
</div>

<div class="figure" style="text-align: center">
<img src="/blog/2020-07-06-instructor-certification-findings/index_files/figure-html/applied-1.png" alt="How much of what you learned in the training class have you applied in your training?" width="672" />
<p class="caption">Figure 2: How much of what you learned in the training class have you applied in your training?</p>
</div>

<div class="figure" style="text-align: center">
<img src="/blog/2020-07-06-instructor-certification-findings/index_files/figure-html/satisfied-1.png" alt="How satisfied are you with the certification program overall?" width="672" />
<p class="caption">Figure 3: How satisfied are you with the certification program overall?</p>
</div>

Perhaps the most important thing is that our [net promoter score](https://en.wikipedia.org/wiki/Net_Promoter) is 77, which makes us pretty happy:

<div class="figure" style="text-align: center">
<img src="/blog/2020-07-06-instructor-certification-findings/index_files/figure-html/recommend-1.png" alt="How likely are you to recommend this workshop to your friends and collagues?" width="672" />
<p class="caption">Figure 4: How likely are you to recommend this workshop to your friends and collagues?</p>
</div>

## Qualitative results

We also asked several open-ended questions. Some people gave multiple answers for each, while others skipped some or all of them, but some patterns did emerge.

### What did you like best and/or find most useful?

The ten most common responses (in order) were:

-   Learner personas
-   Concept maps
-   Formative assessment
-   Online teaching methods
-   Reverse instructional design
-   Cognitive load
-   Parsons Problems
-   Faded examples
-   Format of training course
-   Summative assessment

Personas and concept maps are the first two topics we introduce, but that doesn't necessarily imply people are choosing them because of that: we put them first in order to demonstrate value early.

### What did you like least and/or find least useful?

Only eight items were mentioned more than once:

-   Concept maps (people either love 'em or hate 'em)
-   Course as a whole too short
-   Online format
-   Lack of tips for online/asynchronous teaching
-   Time of day
-   No explicit coverage of Tidyverse/Shiny exam material
-   Material on psychology of learning not new
-   Sessions too long

We're going to add more material about online teaching starting in July based on [these](https://rstudio.com/resources/webinars/teaching-online-at-short-notice/) [three](https://rstudio.com/resources/webinars/teaching-r-online-with-rstudio-cloud/) [webinars](https://rstudio.com/resources/webinars/sharing-on-short-notice-how-to-get-your-materials-online-with-r-markdown/). It will mean lengthening the class by an hour, but under the current circumstances, it seems essential

### What else do you think we should know about the program and how to improve it?

There was even more spread here---only five things were mentioned more than once:

-   More guidance about exam content (now addressed by providing [sample exams](https://education.rstudio.com/blog/2020/02/instructor-certification-exams/))
-   More tidyverse-specific content
-   Refresher seminars and other follow-up
-   More about online teaching (see the comment in the previous section)
-   Spread the course out and take more time on each part

Regarding the last point, we've asked in the past about running the class as four blocks of two hours rather than two half-day blocks. People seem to like the idea in theory, but when the time comes to put it in their calendar, they seem to find the latter easier to manage.

## One random finding

Finally, we asked the certified instructors whether their dplyr pipelines use filter then select, or select then filter:

| Response | Count |
| :------- | --: |
| filter then select | 37 |
| select then filter | 24 |
| mixed/never really thought about it | 34 |

We have many theories for this, but on reflection, have decided that some things in life should remain a mystery.
