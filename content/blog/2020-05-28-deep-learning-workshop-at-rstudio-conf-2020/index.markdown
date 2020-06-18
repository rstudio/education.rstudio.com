---
title: Deep Learning Workshop at rstudio::conf(2020)
author:
  - '[Brad Boehmke](http://bradleyboehmke.github.io/)'
date: '2020-05-28'
categories:
  - learn
  - teach
tags:
  - conf2020
slug: conf20-dl
description: |
  Synopsis of the two-day rstudio::conf(2020) workshop on deep learning.
photo:
  url: https://unsplash.com/photos/n6B49lTx7NM
  author: Pietro Jeng
---

> tl;dr: all workshop materials are available here: <br> <i class="fab fa-github"></i> <https://rstd.io/conf20-dl> <br> <i class="fab fa-creative-commons fa-fw"></i> [License: CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/legalcode)

This past January I attended [rstudio::conf(2020)](https://rstd.io/conf). Seems odd to say that I attended a conference in 2020 but I did, along with over 2,000 others. This was my second rstudio::conf and if you have not attended, you definitely need to put it on your radar for future years - the people, community, resources and education are great bar none.

This year I had the opportunity to teach the *[Deep Learning with Keras and TensorFlow in R](https://github.com/rstudio-conf-2020/dl-keras-tf)* [workshop](https://github.com/rstudio-conf-2020/dl-keras-tf). The workshop had max capacity attendence and was sold out within the first couple of months of opening up; showing a strong thirst for deep learning within the R community. With unbelievable support from TAs and RStudio, the workshop was a great success.

<iframe src="https://rstudio-conf-2020.github.io/dl-keras-tf/01-intro.html#1" width="100%" height="400px"></iframe>

## State of deep learning resources

There is no lack of deep learning resources. Almost any tech learning platform you look at (i.e. [coursera](https://www.coursera.org/courses?query=deep%20learning), [Udemy](https://www.udemy.com/topic/deep-learning/)) is filled with deep learning courses, publishers are filling [virtual deep learning bookshelves](https://www.amazon.com/slp/deep-learning/qh2mz33y5875zb7), and deep learning blog posts are a dime a dozen. But with all these resources I often find two road blocks for people being able to understand and implement deep learning solutions:

1.  Often the material over-emphasizes algorithmic complexity and uniqueness of deep learning. However, when you simplify most deep learning methods down to their basic ingredients, people that understand basic statistical concepts and common "shallow" learning models such as linear regression can fully grasp deep learning concepts.
2.  Most material use Python and leads R programmers to think that they need to leave the comfort of their current language to do deep learning tasks.

This workshop was designed to debunk both of these myths and provide an intuitive understanding of the architectures and engines that make up deep learning models, apply a variety of deep learning algorithms (i.e. MLPs, CNNs, RNNs, LSTMs, collaborative filtering), understand when and how to tune the various hyperparameters, and be able to interpret model results...all with the simplicity, comfort and beauty of R! [^1]

[^1]: This is not to say that some deep learning concepts don't become extremely complex; however, I would argue that they are no more complex than advanced extensions of generalized linear models...GAMs anyone??? Also, I am a huge proponent of learning multiple programming languages so this has nothing to do with the ridiculous R vs Python vs ... argument! In fact, the more you know about Python the easier it is to debug Tensorflow and Keras problems within R.

So how did we approach this?

## Understanding the ingredients

The first 90 minutes we spent working through a [notebook](https://rstudio-conf-2020.github.io/dl-keras-tf/notebooks/01-main-ingredients.nb.html) that illustrates how feedforward deep learning models solve very simple linear regression, binary and multi-class classification problems. We simplified these procedures to the bare minimum so folks can understand:

-   how the model architecture relates to common models they've used before,
-   how the models learn via gradient descent,
-   what activation functions are,
-   the idea of learning rate and momentum,
-   how model capacity impacts performance,
-   why we care about batch sizes,
-   and the importance of data prep.

Wow, that seems like a lot...and it was! But by working through very simple examples and illustrations the students started to realize that these concepts are not overly complicated. In fact, many started to see a very obvious relationship to non-deep learning concepts they already know.

<img src="fig1-ingredients.png" width="50%" style="display: block; margin: auto;" />

## Follow a recipe

After getting a basic understanding of key deep learning concepts and terminology, we spent the rest of the morning discussing how to strategically approach training a deep learning model. I've gotta admit, finding an optimal deep learning model is far more difficult and time consuming than traditional shallow models. In fact, its rare that you will actually find an optimal model!

As data scientists we can accept this but we still need to have a good mental model that gives us a high probability of finding a near optimal one while reducing overall model exploratory time. For deep learning models, this can be reduced to:

1.  Prepare data
2.  Balance batch size with a default learning rate
3.  Tune the adaptive learning rate optimizer
4.  Add callbacks to control training
5.  Explore model capacity
6.  Regularize overfitting
7.  Repeat steps 1-6
8.  Evaluate final model results

Once folks understood what each one of these steps were doing and how to implement them, they definitely gained confidence in their ability to apply an initial model and then start iterating to improve model performance.

<img src="fig2-recipe.png" width="50%" style="display: block; margin: auto;" />

## A basic cookbook

Once students had a good mental model of the basic ingredients of deep learning models and a general recipe for approaching training models, the rest of the workshop was spent building on top of a basic feedforward model and working through the concepts of:

-   computer vision with convolution neural networks,
-   the idea of re-using previously trained models (aka *transfer learning*),
-   encoding text with word embeddings,
-   applying a deep learning approach for collaborative filtering with customized functional models,
-   using recurrent neural networks and long short term memory networks for analyzing sequential data (i.e. text, time series, videos).

Each of these models builds onto the foundational knowledge with new key concepts. Along the way we trained over a dozen different types of models and data sets...some small and some big. But working through these different concepts gave folks the exposure to common problems where deep learning shines and also where some models have a hard time improving over a simpler shallow classification model.

<img src="fig3-cookbook.png" width="50%" style="display: block; margin: auto;" />

## Workshop approach

As you may infer, the workshop was very hands-on and covered a lot of material using a variety of approaches. If you peruse the [repo](https://github.com/rstudio-conf-2020/dl-keras-tf), you will notice that we worked through notebooks for interactive analysis, used slides to emphasize key concepts and illustrations, and even opened up an Excel file to help demonstrate what's going on with basic collaborative filtering and word embeddings!

<img src="fig4-approach.png" width="50%" style="display: block; margin: auto;" />

In fact, I knew going into the workshop that I probably had too much material. But my hopes was that the workshop provided an opportunity to explore the concepts while also allowing folks to easily work through notebooks and compare solutions on their own. So if you missed out on the workshop, all the data and code to reproduce the notebook content and slides are [available](https://github.com/rstudio-conf-2020/dl-keras-tf/blob/master/README.md#schedule). I even provide extra content that we didn't have time to cover such as visualizing CNN models, performing grid searches, and more.

[![Workshop schedule](fig5-schedule.png "Workshop schedule")](https://github.com/rstudio-conf-2020/dl-keras-tf/blob/master/README.md#schedule)

Plus, all the content is licensed as [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) so people can feel free to reuse slides, notebooks, exercises and the like.

## Appreciation

I had an absolute blast developing and delivering this workshop. The attendees were fantastic and asked valuable (and challenging!) questions; making the 2-days very interactive and personable.

The workshop was also result of a fantastic TA team! I really enjoyed meeting and getting to know them:

<iframe src="https://rstudio-conf-2020.github.io/dl-keras-tf/01-intro.html#27" width="100%" height="400px"></iframe>

I also could not have pulled it off without the incredible RStudio infrastructure team dedicated to supporting us ([Cole Arendt](https://github.com/colearendt) and [Alex Gold](https://github.com/akgold)) and the entire RStudio Education team. The infrastructure team made using AWS and GPUs as simple as making pop tarts and the education team made everything smoooth and seemless!

<iframe src="thanks.gif" width="672" height="400px"></iframe>

## Enjoy!

I hope the materials developed for this workshop are useful to learners and educators alike. If they are, please [let me know](https://twitter.com/bradleyboehmke), I'd love to hear about it.

<div class="hline-top">
<i class="fas fa-binoculars"></i>&nbsp;&nbsp;&nbsp;<a href='/blog/2020/02/conf2020-workshops/'><em>Check out materials from the 18 other rstudio::conf(2020) workshops...</em></a>
</div>
