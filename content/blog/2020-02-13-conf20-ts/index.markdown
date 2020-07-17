---
title: Tidy Time Series and Forecasting in R
author:
  - '[Rob J Hyndman](https://robjhyndman.com/)'
date: '2020-02-13'
slug: conf20-ts
categories: [learn, teach]
tags: [conf2020]
description: This is what we covered in the Tidy Time Series workshop at rstudio::conf2020.
photo:
  url: https://unsplash.com/photos/1C8Zgr-vnfA
  author: Alessandro Venturi
---





> tl;dr: all workshop materials are available here: <br>
> <i class="fab fa-github fa-fw"></i> https://rstd.io/conf20-ts <br>
> 📖 [Forecasting: Principles and Practice](https://otexts.com/fpp3/) <br>
> <i class="fab fa-creative-commons fa-fw"></i> [License: CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/legalcode)

For the last couple of years I've watched the twitter feed from the Rstudio conference with jealousy --- not just FOMO but KIWMO (Knowing I Was Missing Out). So when I was asked to teach a workshop on Tidy Time Series as part of rstudio::conf2020, I agreed without hesitation. The idea was to teach a workshop using a tidy approach to time series --- something that has only been possible very recently.

It is now very common for organizations to collect huge amounts of data over time, and existing time series analysis tools are often unable to handle the scale, frequency and structure of the data collected. In response, I have been working with Earo Wang, Mitch O'Hara-Wild and Di Cook to develop a suite of packages to handle modern time series data in a tidy framework. This workshop was an introduction to how to use these packages.

All the materials for the workshop are on [a github repository](https://github.com/rstudio-conf-2020/time-series-forecasting). The workshop was based on the [new edition of my textbook](https://OTexts.com/fpp3) with George Athanasopoulos.

I was very lucky to have four awesome teaching assistants in [Mitch O'Hara-Wild](https://www.mitchelloharawild.com/), [Rhian Davies](https://trianglegirl.rbind.io/), [Phillip Lear](https://education.rstudio.com/trainers/people/lear+phillip/), and [Steven Lawrence](https://www.linkedin.com/in/steven-lawrence-bio-math/).

## Day 1

On day 1, we looked at the `tsibble`, `lubridate` and `feasts` packages (along with the `tidyverse` of course). We introduced the `tsibble` data structure for flexibly managing collections of related time series, and explored how to do data wrangling, data visualizations and exploratory data analysis, along with some feature-based methods to explore time series data in high dimensions.

Links to slides for day 1 are given below.

  0. [Background](https://github.com/rstudio-conf-2020/time-series-forecasting/raw/master/materials/0-intro.pdf)
  1. [Introduction to tsibbles](https://github.com/rstudio-conf-2020/time-series-forecasting/raw/master/materials/1-tsibbles.pdf)
  2. [Time series graphics](https://github.com/rstudio-conf-2020/time-series-forecasting/raw/master/materials/2-graphics.pdf)
  3. [Transformations](https://github.com/rstudio-conf-2020/time-series-forecasting/raw/master/materials/3-transformations.pdf)
  4. [Seasonality and trends](https://github.com/rstudio-conf-2020/time-series-forecasting/raw/master/materials/4-decompositions.pdf)
  5. [Time series features](https://github.com/rstudio-conf-2020/time-series-forecasting/raw/master/materials/5-feasts.pdf)

## Day 2

Day 2 was about forecasting using the `fable` package. We looked at several well-known time series forecasting models and how they are automated in the `fable` package. We also discussed ensemble forecasts. Finally, we looked at forecast reconciliation, allowing millions of time series to be forecast in a relatively short time while accounting for constraints on how the series are related.

Links to slides for day 2 are given below.

  6. [Introduction to forecasting](https://github.com/rstudio-conf-2020/time-series-forecasting/raw/master/materials/6-fable.pdf)
  7. [Exponential smoothing](https://github.com/rstudio-conf-2020/time-series-forecasting/raw/master/materials/7-ets.pdf)
  8. [ARIMA models](https://github.com/rstudio-conf-2020/time-series-forecasting/raw/master/materials/8-arima.pdf)
  9. [Dynamic regression](https://github.com/rstudio-conf-2020/time-series-forecasting/raw/master/materials/9-dynamic-regression.pdf)
  10. [Hierarchical forecasting](https://github.com/rstudio-conf-2020/time-series-forecasting/raw/master/materials/10-reconciliation.pdf)

## Lab Sessions

We alternated between me presenting and lab sessions where participants worked with time series data in R. The [instructions for the lab sessions](https://github.com/rstudio-conf-2020/time-series-forecasting/blob/master/Labs.md) are available on the repo.

R code providing [solutions to the lab exercises](https://github.com/rstudio-conf-2020/time-series-forecasting/blob/master/materials/labs.R) are also available here.

<div class="hline-top">
<i class="fas fa-binoculars"></i>&nbsp;&nbsp;&nbsp;<a href='/blog/2020/02/conf2020-workshops/'><em>Check out materials from the 18 other rstudio::conf(2020) workshops...</em></a>
</div>
