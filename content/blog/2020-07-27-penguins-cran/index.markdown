---
title: Release the penguins
author:
  - '[Alison Hill](https://alison.rbind.io)'
  - '[Allison Horst](https://www.allisonhorst.com/)'
  - '[Kristen Gorman](https://www.uaf.edu/cfos/people/faculty/detail/kristen-gorman.php)'
date: '2020-07-27'
categories:
  - learn
  - package
description: |
  The palmerpenguins data package is now on CRAN! Here are some examples to highlight why it is a great replacement for the iris dataset.
slug: palmerpenguins-cran
photo:
  url: https://www.uaf.edu/cfos/people/faculty/detail/kristen-gorman.php
  author: Kristen Gorman
---





We are thrilled to share that the [palmerpenguins package](https://allisonhorst.github.io/palmerpenguins/) is now available on [CRAN](https://cloud.r-project.org/package=palmerpenguins)! <a href='https://allisonhorst.github.io/palmerpenguins/'><img src="penguins_cran.png" align="right" height="200" style="padding-left:20px;"/></a>

The `palmerpenguins` R package contains two datasets that we believe are a viable alternative to Anderson's **Iris** data (via [`datasets::iris`](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html)). And just in time for fall, the penguins have landed on CRAN :tada: They are pretty excited about this (as you can tell). Now, it will be easier for you and your students to get to know them. We also hope it makes it easier for educators and software developers to [move on from `iris`](https://www.garrickadenbuie.com/blog/lets-move-on-from-iris/). Here is just one example, plotting the lengths of penguin flippers versus their bills:

<img src="figs/flipper-bill-1.png" width="75%" style="display: block; margin: auto;" />

You can install the released version of palmerpenguins from [CRAN](https://CRAN.R-project.org) with:


```r
install.packages("palmerpenguins")
```

In this post, we'll share some highlights that we think make palmerpenguins fun for teaching data science and statistics. We'll use functions from the tidyverse to demonstrate:


```r
library(tidyverse)
library(palmerpenguins)
```

<img src="https://media.giphy.com/media/3og0IO5z8Rd30ktV6g/giphy.gif" width="50%" style="display: block; margin: auto;" />

*Note:* these are not Antarctic penguins; these are Magellanic penguins from the [Monterey Bay Aquarium](https://www.montereybayaquarium.org/visit/exhibits/splash-zone/meet-our-penguins) :penguin: But we love them anyway. And these South African penguins want to see what all the fuss about too.

## Meet the penguins

The `palmerpenguins` data contains size measurements, clutch observations, and blood isotope ratios for three penguin species observed on three islands in the Palmer Archipelago, Antarctica over a study period of three years.

<img src="gorman-penguins.jpg" alt="The 3 Antarctic penguin species" style="text-align: &apos;center&apos;" width="500"/>

These data were collected from 2007 - 2009 by Dr. Kristen Gorman with the [Palmer Station Long Term Ecological Research Program](https://pal.lternet.edu/), part of the [US Long Term Ecological Research Network](https://lternet.edu/). The data were imported directly from the [Environmental Data Initiative](https://environmentaldatainitiative.org/) (EDI) Data Portal, and are available for use by CC0 license ("No Rights Reserved") in accordance with the [Palmer Station Data Policy](https://pal.lternet.edu/data/policies). We gratefully acknowledge Palmer Station LTER and the US LTER Network. Special thanks to Marty Downs (Director, LTER Network Office) for help regarding the data license & use. Here is our intrepid package co-author, Dr. Gorman, in action collecting some penguin data:

<img src="penguin-expedition.jpg" alt="Dr Kristen Gorman collecting penguin data" style="text-align: &apos;center&apos;" width="500"/>

You can find this photo and others in a [shared Google slideshow](https://bit.ly/palmerpenguinspics), meant to help you teach with this data.

Here is a map of the study site:

<img src="antarctica-map.png" alt="3 study sites on a map of Antarctic Peninsula" style="text-align: &apos;center&apos;" width="500"/>

## The **palmerpenguins** package

This package contains two datasets:

1.  The raw data is available as `penguins_raw`.

2.  A curated subset of the raw data in the package named `penguins`, which can serve as an out-of-the-box alternative to `datasets::iris`.

When you first call either of these datasets, what you see depends on whether or not you have the [tibble package](https://tibble.tidyverse.org/) installed on your local workstation. If you *do* have the tibble package installed, then you will see the first 10 rows of data print as a nice tidy tibble. If not, you'll see the full dataset print to your console, just as `iris` does. This allowed us to keep palmerpenguins as lightweight as possible for all users, and yet still user-friendly for tidyverse beginners. A big thank you to Hadley Wickham for contributing this [creative solution](https://github.com/allisonhorst/palmerpenguins/blob/master/data/penguins.R)!

The curated `palmerpenguins::penguins` dataset contains 8 variables (n = 344 penguins). You can read more about the variables by typing `?penguins`.


```r
penguins
#> # A tibble: 344 x 8
#>    species island bill_length_mm bill_depth_mm flipper_length_… body_mass_g
#>    <fct>   <fct>           <dbl>         <dbl>            <int>       <int>
#>  1 Adelie  Torge…           39.1          18.7              181        3750
#>  2 Adelie  Torge…           39.5          17.4              186        3800
#>  3 Adelie  Torge…           40.3          18                195        3250
#>  4 Adelie  Torge…           NA            NA                 NA          NA
#>  5 Adelie  Torge…           36.7          19.3              193        3450
#>  6 Adelie  Torge…           39.3          20.6              190        3650
#>  7 Adelie  Torge…           38.9          17.8              181        3625
#>  8 Adelie  Torge…           39.2          19.6              195        4675
#>  9 Adelie  Torge…           34.1          18.1              193        3475
#> 10 Adelie  Torge…           42            20.2              190        4250
#> # … with 334 more rows, and 2 more variables: sex <fct>, year <int>
```

## Highlights

We don't want to ruin all the fun exploration, visualization, and potential analyses, so below are just a few examples to get you quickly waddling along with *penguins*. You can check out more in the ["Get started"](https://allisonhorst.github.io/palmerpenguins/articles/intro.html) and the ["Examples" vignettes](https://allisonhorst.github.io/palmerpenguins/articles/examples.html).

<img src="https://allisonhorst.github.io/palmerpenguins/reference/figures/lter_penguins.png" alt="Allison Horst illustration of 3 penguin species" style="display:block; margin-left: auto; margin-right: auto;" width="40%"/>

If you are teaching correlation and simple linear regression, penguin flipper length and body mass show a positive association for each of the 3 species:


```r
# Scatterplot example 1: penguin flipper length versus body mass
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, 
                 shape = species),
             size = 2) +
  scale_color_manual(values = c("darkorange","darkorchid","cyan4")) 
```

<img src="figs/unnamed-chunk-5-1.png" width="500px" style="display: block; margin: auto;" />

Penguin bill length and depth also show some interesting patterns. If you ignore species, you might think there is a negative correlation:


```r
# Scatterplot example 2: penguin bill length versus bill depth
ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE)
```

<img src="figs/unnamed-chunk-6-1.png" width="500px" style="display: block; margin: auto;" />

But, if you look at the correlations within species, bill length and depth are actually positive correlated. This is a nice "in the wild" example of [Simpson's paradox](https://en.wikipedia.org/wiki/Simpson%27s_paradox).


```r
# Scatterplot example 3: penguin bill length versus bill depth
ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(aes(color = species, 
                 shape = species),
             size = 2) + 
  geom_smooth(method = "lm", se = FALSE, aes(color = species)) +
  scale_color_manual(values = c("darkorange","darkorchid","cyan4"))
```

<img src="figs/unnamed-chunk-7-1.png" width="500px" style="display: block; margin: auto;" />

At this point, you may be also want to know how bill length and depth were actually measured. Luckily, [Allison Horst](https://www.allisonhorst.com/) drew up some illustrations to help explain this. Here is one for bill measurement:

<img src="https://allisonhorst.github.io/palmerpenguins/reference/figures/culmen_depth.png" alt="Allison Horst illustration of bill length and depth" width="500"/>

You can download this and other palmerpenguins art (useful for teaching with the data) directly from the [package website](https://allisonhorst.github.io/palmerpenguins/articles/art.html). If you use this artwork, please cite with: "Artwork by [@allison\_horst](https://www.allisonhorst.com/)".

Finally, you can get a pretty clear separation between all three species by looking at flipper length versus bill length:


```r
ggplot(penguins, aes(x = flipper_length_mm, y = bill_length_mm, colour = species, shape = species)) +
  geom_point() +
  scale_colour_manual(values = c("darkorange","purple","cyan4"))
```

<img src="figs/unnamed-chunk-8-1.png" width="500px" style="display: block; margin: auto;" />

This ends up leading to some nice results using principal components analysis, which is commonly done with `iris` as a "hello world" PCA example. We provide code to do a simple PCA using [tidymodels](https://www.tidymodels.org/) in the ["PCA with penguins and recipes" vignette](https://allisonhorst.github.io/palmerpenguins/articles/pca.html).

<img src="https://allisonhorst.github.io/palmerpenguins/articles/figs/pca-loadings-plot.png" alt="Results of principal components analysis" width="500"/>

We are also pleased to report that the penguins enjoy clustering as well. Here is an example using [K-means clustering](https://www.tidymodels.org/learn/statistics/k-means/) with two tidymodels packages, [broom](https://broom.tidymodels.org/) and [recipes](https://recipes.tidymodels.org/).

<img src="figs/unnamed-chunk-9-1.png" width="500px" style="display: block; margin: auto;" />

One more thing! If you want to give your students experience importing and wrangling data, we made a function that allows you to access the `.csv` files from within the package. Here is an example of how you use it:


```r
raw_csv <- readr::read_csv(path_to_file("penguins_raw.csv"))
raw_csv
#> # A tibble: 344 x 17
#>    studyName `Sample Number` Species Region Island Stage `Individual ID`
#>    <chr>               <dbl> <chr>   <chr>  <chr>  <chr> <chr>          
#>  1 PAL0708                 1 Adelie… Anvers Torge… Adul… N1A1           
#>  2 PAL0708                 2 Adelie… Anvers Torge… Adul… N1A2           
#>  3 PAL0708                 3 Adelie… Anvers Torge… Adul… N2A1           
#>  4 PAL0708                 4 Adelie… Anvers Torge… Adul… N2A2           
#>  5 PAL0708                 5 Adelie… Anvers Torge… Adul… N3A1           
#>  6 PAL0708                 6 Adelie… Anvers Torge… Adul… N3A2           
#>  7 PAL0708                 7 Adelie… Anvers Torge… Adul… N4A1           
#>  8 PAL0708                 8 Adelie… Anvers Torge… Adul… N4A2           
#>  9 PAL0708                 9 Adelie… Anvers Torge… Adul… N5A1           
#> 10 PAL0708                10 Adelie… Anvers Torge… Adul… N5A2           
#> # … with 334 more rows, and 10 more variables: `Clutch Completion` <chr>, `Date
#> #   Egg` <date>, `Culmen Length (mm)` <dbl>, `Culmen Depth (mm)` <dbl>,
#> #   `Flipper Length (mm)` <dbl>, `Body Mass (g)` <dbl>, Sex <chr>, `Delta 15 N
#> #   (o/oo)` <dbl>, `Delta 13 C (o/oo)` <dbl>, Comments <chr>
```

You can see the files available by using the `path_to_file()` function without any arguments:


```r
path_to_file()
#> [1] "penguins_raw.csv" "penguins.csv"
```

Credit goes to Jenny Bryan for this [function](https://allisonhorst.github.io/palmerpenguins/reference/path_to_file.html), inspired by a similar function in the [readxl package](https://readxl.tidyverse.org/).

And as a reminder, you can always read the data in from a url as well:


```r
peng_url <- readr::read_csv("https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv")
peng_url
#> # A tibble: 344 x 8
#>    species island bill_length_mm bill_depth_mm flipper_length_… body_mass_g
#>    <chr>   <chr>           <dbl>         <dbl>            <dbl>       <dbl>
#>  1 Adelie  Torge…           39.1          18.7              181        3750
#>  2 Adelie  Torge…           39.5          17.4              186        3800
#>  3 Adelie  Torge…           40.3          18                195        3250
#>  4 Adelie  Torge…           NA            NA                 NA          NA
#>  5 Adelie  Torge…           36.7          19.3              193        3450
#>  6 Adelie  Torge…           39.3          20.6              190        3650
#>  7 Adelie  Torge…           38.9          17.8              181        3625
#>  8 Adelie  Torge…           39.2          19.6              195        4675
#>  9 Adelie  Torge…           34.1          18.1              193        3475
#> 10 Adelie  Torge…           42            20.2              190        4250
#> # … with 334 more rows, and 2 more variables: sex <chr>, year <dbl>
```

The `.csv` files are located in the [package GitHub repository](https://github.com/allisonhorst/palmerpenguins) in the [`inst/extdata/`](https://github.com/allisonhorst/palmerpenguins/tree/master/inst/extdata) folder.

## Penguin sightings

You can access the palmerpenguins data outside of R too! Our sincere thanks to all the contributors who made the penguins popular. Here are some other places you might spot the palmerpenguins:

### Python

Python users can access the penguins data in the [seaborn data visualization library](https://github.com/mwaskom/seaborn). Example code to load the data in Python:


```python
import seaborn as sns
df = sns.load_dataset(‘penguins’) 
```

### Julia

Julia users can access the penguins data in the [PalmerPenguins.jl](https://github.com/devmotion/PalmerPenguins.jl) package. Example code to import the penguins data through PalmerPenguins.jl:


```r
julia> using PalmerPenguins
julia> table = PalmerPenguins.load()
```

### OpenML

[openml.org](https://openml.org/) is a public repository for machine learning data and experiments. Find the penguins here:

<https://www.openml.org/d/42585>

You can also download the penguins from the [openml.org](https://openml.org/) repository with Python using [scikit-learn](https://scikit-learn.org/stable/datasets/index.html#openml):


```python
from sklearn.datasets import fetch_openml
penguins = fetch_openml(name='penguins', version=1)
```

### Tidy Tuesday

The penguins are chuffed to be the dataset *this week*! Check out the announcement here: <https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-07-28/readme.md>

### Kaggle

<https://www.kaggle.com/parulpandey/palmer-archipelago-antarctica-penguin-data>

### Makeover Monday

[Makeover Monday](https://www.makeovermonday.co.uk/) featured the penguins on [2020/07/13](https://data.world/makeovermonday/2020w28).

### Meetups & talks

Here are recent highlights on our penguin radar!

-   Di Cook: [Going beyond 2D and 3D to visualise higher dimensions, for ordination, clustering and other models](https://www.dicook.org/files/visec2020/slides_tourr#1)

    ![Di Cook\'s tourr package gif](penguin-tour.gif)

-   Samantha Toet: [Building dashboards with flexdashboard and Shiny](https://www.meetup.com/rladies-charlottesville/events/270748602/)

    ![Sam Toet\'s penguin flexdashboard](penguin-dashboard.jpeg)

### Contribute your own examples

If you use palmerpenguins, please consider sharing with us and add it to our [user-contributed examples](https://allisonhorst.github.io/palmerpenguins/articles/user_contributions.html). And don't forget about the [photos](https://bit.ly/palmerpenguinspics) and [art](https://allisonhorst.github.io/palmerpenguins/articles/art.html) to help you teach with the palmerpenguins!

## Penguin citation

Please cite the palmerpenguins R package using:


```r
citation("palmerpenguins")
#> 
#> To cite palmerpenguins in publications use:
#> 
#>   Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer
#>   Archipelago (Antarctica) penguin data. R package version 0.1.0.
#>   https://allisonhorst.github.io/palmerpenguins/. doi:
#>   10.5281/zenodo.3960218.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {palmerpenguins: Palmer Archipelago (Antarctica) penguin data},
#>     author = {Allison Marie Horst and Alison Presmanes Hill and Kristen B Gorman},
#>     year = {2020},
#>     note = {R package version 0.1.0},
#>     doi = {10.5281/zenodo.3960218},
#>     url = {https://allisonhorst.github.io/palmerpenguins/},
#>   }
```

<img src="https://allisonhorst.github.io/palmerpenguins/reference/figures/palmerpenguins.png" alt="Palmer penguins hex logo" style="display:block; margin-left: auto; margin-right: auto;" width="30%"/>

Have fun with the Palmer Archipelago penguins!

## References

**Data originally published in:**

-   Gorman KB, Williams TD, Fraser WR (2014). Ecological sexual dimorphism and environmental variability within a community of Antarctic penguins (genus *Pygoscelis*). PLoS ONE 9(3):e90081. <https://doi.org/10.1371/journal.pone.0090081>

**Individual datasets:**

Individual data can be accessed directly via the [Environmental Data Initiative](https://environmentaldatainitiative.org/):

-   Palmer Station Antarctica LTER and K. Gorman, 2020. Structural size measurements and isotopic signatures of foraging among adult male and female Adélie penguins (*Pygoscelis adeliae*) nesting along the Palmer Archipelago near Palmer Station, 2007-2009 ver 5. Environmental Data Initiative. <https://doi.org/10.6073/pasta/98b16d7d563f265cb52372c8ca99e60f> (Accessed 2020-06-08).

-   Palmer Station Antarctica LTER and K. Gorman, 2020. Structural size measurements and isotopic signatures of foraging among adult male and female Gentoo penguin (*Pygoscelis papua*) nesting along the Palmer Archipelago near Palmer Station, 2007-2009 ver 5. Environmental Data Initiative. <https://doi.org/10.6073/pasta/7fca67fb28d56ee2ffa3d9370ebda689> (Accessed 2020-06-08).

-   Palmer Station Antarctica LTER and K. Gorman, 2020. Structural size measurements and isotopic signatures of foraging among adult male and female Chinstrap penguin (*Pygoscelis antarcticus*) nesting along the Palmer Archipelago near Palmer Station, 2007-2009 ver 6. Environmental Data Initiative. <https://doi.org/10.6073/pasta/c14dfcfada8ea13a17536e73eb6fbe9e> (Accessed 2020-06-08).

## Acknowledgements

A big thank you to all palmerpenguins contributors: [&#x0040;allisonhorst](https://github.com/allisonhorst), [&#x0040;amrrs](https://github.com/amrrs), [&#x0040;apreshill](https://github.com/apreshill), [&#x0040;brunj7](https://github.com/brunj7), [&#x0040;devmotion](https://github.com/devmotion), [&#x0040;eddelbuettel](https://github.com/eddelbuettel), [&#x0040;friendly](https://github.com/friendly), [&#x0040;hadley](https://github.com/hadley), [&#x0040;jannikbuhr](https://github.com/jannikbuhr), [&#x0040;jhk0530](https://github.com/jhk0530), [&#x0040;john-sandall](https://github.com/john-sandall), [&#x0040;karaesmen](https://github.com/karaesmen), [&#x0040;markvanderloo](https://github.com/markvanderloo), [&#x0040;trang1618](https://github.com/trang1618), and [&#x0040;ttimbers](https://github.com/ttimbers)
