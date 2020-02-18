---
title: Text Mining Workshop Materials from rstudio::conf(2020)
author:
  - '[Julia Silge](https://juliasilge.com/)'
date: '2020-02-13'
categories: [learn, teach]
tags: [conf2020]
slug: conf20-tidytext
description: |
  Check out slides and other materials on text mining and modeling using tidy data principles.
photo:
  url: https://unsplash.com/photos/_M-DrbiNFa4
  author: Eli Francis
---

> tl;dr: all workshop materials are available here: <br>
> <i class="fab fa-github fa-fw"></i> https://rstd.io/conf20-tidytext <br>
> 🔗 [bit.ly/silge-rstudioconf-1](http://bit.ly/silge-rstudioconf-1) and [bit.ly/silge-rstudioconf-2](http://bit.ly/silge-rstudioconf-2) <br>
> <i class="fab fa-creative-commons fa-fw"></i> [License: CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/legalcode)

At rstudio::conf(2020) in January, I had the pleasure of teaching a two-day workshop on text analysis using tidy data principles. With two whole days to dedicate to this topic, we had the opportunity to cover a lot of ground and go into significant detail. On the first day, we focused on **exploratory data analysis for text**, and on the second day, we addressed **modeling for text**, with a bit of both supervised and unsupervised machine learning.

In our workshop, we had three skilled and supportive TAs:

- [Jeroen Claes](http://www.jeroenclaes.be/)
- [Emil Hvitfeldt](https://www.hvitfeldt.me/)
- [Kasia Kulma](https://r-tastic.co.uk/)

Similar to many of the other workshops at rstudio::conf(2020), our workshop TAs had such deep teaching and subject matter expertise that they could have been the ones teaching! Jeroen is a linguist by background and a [Tidyverse Certified Trainer](https://education.rstudio.com/trainers/#info) himself, Emil is the author of several R packages for text modeling, and Kasia has taught many R workshops, including those focused on natural language processing. Having a team of such capable and caring TAs contributed to our workshop going remarkably smoothly.

However, workshops that involve dozens of participants, live coding, Wi-Fi, and package installation are bound to run into a few hiccups and we were no exception. One of the things I took away from my own experience in RStudio's training certification is how, when handled well, those kinds of challenges can be valuable learning opportunities. During this workshop, I (inadvertently) introduced a bug in the second day's slides. The bug jumped out at me as we were working through our supervised machine learning example. I had used `select()` where I should have used `distinct()` in some data preparation, resulting in ["leakage"](https://www.kaggle.com/dansbecker/data-leakage) of training data into the test set. Data leakage is a [huge problem in machine learning](https://dl.acm.org/doi/10.1145/2020408.2020496) and so, so easy to stumble into; although I never enjoy making mistakes in front of people, it was great to have such a concrete reason to talk about it in detail.

The materials for this workshop are [available on GitHub](https://github.com/rstudio-conf-2020/text-mining); you'll find an outline of what we covered, the code that created the slides, and the `.Rmd` files that participants worked through during the two days. (The data leakage bug has been fixed, in case you are wondering.) 

I like to use [xaringan](https://github.com/yihui/xaringan) for code-heavy workshop slides these days, and I used GitHub Pages to serve the slides as HTML. The slides for the [first day on exploratory data analysis](http://bit.ly/silge-rstudioconf-1) start from what we mean by a tidy data structure for text and then work through other exploratory approaches for text such as sentiment lexicons and tf-idf. The first day wrapped up with moving beyond single words to n-grams and the rich kinds of analysis larger units of text can open up, such as network analysis. The slides for the [second day on modeling](http://bit.ly/silge-rstudioconf-2) start with an example of unsupervised machine learning for text (topic modeling) and end with an example of supervised machine learning (regularized regression, which works great for text).

Throughout both days, participants chose their own [text datasets from Project Gutenberg](https://www.gutenberg.org/browse/scores/top) to use during the workshop. There is value in learners being able to have some autonomy in what they spend two long days looking at over and over again, and also in seeing how their results differ from their neighbors'. Seeing our participants engage deeply with learning about text analysis and with each other was a highlight of my conference experience this year!


<div class="hline-top">
<i class="fas fa-binoculars"></i>&nbsp;&nbsp;&nbsp;<a href='/blog/2020/02/conf2020-workshops/'><em>Check out materials from the 18 other rstudio::conf(2020) workshops...</em></a>
</div>


