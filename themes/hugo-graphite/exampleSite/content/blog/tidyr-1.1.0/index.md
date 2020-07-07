---
output: hugodown::hugo_document
title: tidyr 1.1.0
date: '2020-05-26'
author: Hadley Wickham
description: |
  tidyr 1.1.0 includes a bunch of quality of life improvements, particularly for pivoting and rectangling.
photo:
  url: https://unsplash.com/photos/__ZMnefoI3k
  author: Jan Vasek
categories:
- package
tags:
- tidyr
rmd_hash: 30c462a7ea1d88ca

---


We're delighted to announce that [tidyr](http://tidyr.tidyverse.org/) 1.1.0 is now available from CRAN. tidyr provides a set of tools for transforming data frames to and from tidy data, where each variable is a column and each observation is a row. Tidy data is a convention for matching the semantics and structure of your data that makes using the rest of the tidyverse (and many other R packages) much easier.

You can install install tidyr with:


```r
install.packages("tidyr")
```

This release doesn't include any major new excitement but it includes a whole passel of minor improvements building on the major changes in [tidyr 1.0.0](https://www.tidyverse.org/blog/2019/09/tidyr-1-0-0/), and generally making everything easier to use and a bit more flexible. In this blog post, I'll give a quick run down on new pivoting features; see the [full release announcement](https://github.com/tidyverse/tidyr/releases/tag/v1.1.0) for the details of other changes.


```r
library(tidyr)
```

## `pivot_longer()`

*   `pivot_longer()` gains a new `names_transform` argument that allows you to
    transform column names before they turn into data. For example, you can
    use this new argument along with [`readr::parse_number()`][parse_number] to
    parse column names that really should be numbers:

    
    ```r
    df <- tibble(id = 1, wk1 = 0, wk2 = 4, wk3 = 9, wk4 = 25)
    df %>% pivot_longer(
      cols = starts_with("wk"),
      names_to = "week",
      names_transform = list(week = readr::parse_number),
    )
    #> # A tibble: 4 x 3
    #>      id  week value
    #>   <dbl> <dbl> <dbl>
    #> 1     1     1     0
    #> 2     1     2     4
    #> 3     1     3     9
    #> 4     1     4    25
    ```

*   `pivot_longer()` can now discard uninformative column names by setting 
    `names_to = character()`, thanks to idea and implementation from 
    [Mitch O'Hara Wild](https://github.com/mitchelloharawild):

    
    ```r
    df <- tibble(id = 1:2, fruitful_panda = 3:4, angry_aardvark = 5:6)  
    df %>% pivot_longer(-id, names_to = character())
    #> # A tibble: 4 x 2
    #>      id value
    #>   <int> <int>
    #> 1     1     3
    #> 2     1     5
    #> 3     2     4
    #> 4     2     6
    ```

*   `pivot_longer()` no longer creates a `.copy` variable in the presence of
    duplicate column names. This makes it more consistent with the handling
    of non-unique pivot specifications.
  
    
    ```r
    df <- tibble(id = 1:3, x = 1:3, x = 4:6, .name_repair = "minimal")  
    df %>% pivot_longer(-id)
    #> # A tibble: 6 x 3
    #>      id name  value
    #>   <int> <chr> <int>
    #> 1     1 x         1
    #> 2     1 x         4
    #> 3     2 x         2
    #> 4     2 x         5
    #> 5     3 x         3
    #> 6     3 x         6
    ```
    
*   `pivot_longer()` automatically disambiguates non-unique outputs, which can
    occur when the input variables include some additional component that you
    don't care about and want to discard. You can discard parts of column names
    either with `names_pattern` or with `NA` in `names_to`.
  
    
    ```r
    df <- tibble(id = 1:3, x_1 = 1:3, y_2 = 4:6, y_3 = 9:11)
    df %>% pivot_longer(-id, names_pattern = "(.)_.")
    #> # A tibble: 9 x 3
    #>      id name  value
    #>   <int> <chr> <int>
    #> 1     1 x         1
    #> 2     1 y         4
    #> 3     1 y         9
    #> 4     2 x         2
    #> 5     2 y         5
    #> 6     2 y        10
    #> 7     3 x         3
    #> 8     3 y         6
    #> 9     3 y        11
    
    df %>% pivot_longer(-id, names_sep = "_", names_to = c("name", NA))
    #> # A tibble: 9 x 3
    #>      id name  value
    #>   <int> <chr> <int>
    #> 1     1 x         1
    #> 2     1 y         4
    #> 3     1 y         9
    #> 4     2 x         2
    #> 5     2 y         5
    #> 6     2 y        10
    #> 7     3 x         3
    #> 8     3 y         6
    #> 9     3 y        11
    
    df %>% pivot_longer(-id, names_sep = "_", names_to = c(".value", NA))
    #> # A tibble: 6 x 3
    #>      id     x     y
    #>   <int> <int> <int>
    #> 1     1     1     4
    #> 2     1    NA     9
    #> 3     2     2     5
    #> 4     2    NA    10
    #> 5     3     3     6
    #> 6     3    NA    11
    ```

## `pivot_wider()`

*   `pivot_wider()` gains a `names_sort` argument which allows you to sort
    column names in order. The default, `FALSE`, orders columns by their 
    first appearance. I'm considering changing the default value to `TRUE`
    in a future version.
    
    
    ```r
    df <- tibble(
      day_int = c(4, 3, 5, 1, 2),
      day_fac = factor(day_int, labels = c("Mon", "Tue", "Wed", "Thu", "Fri"))
    )
    df %>% pivot_wider(
      names_from = day_fac, 
      values_from = day_int
    )
    #> # A tibble: 1 x 5
    #>     Thu   Wed   Fri   Mon   Tue
    #>   <dbl> <dbl> <dbl> <dbl> <dbl>
    #> 1     4     3     5     1     2
    df %>% pivot_wider(
      names_from = day_fac,
      names_sort = TRUE,
      values_from = day_int
    )
    #> # A tibble: 1 x 5
    #>     Mon   Tue   Wed   Thu   Fri
    #>   <dbl> <dbl> <dbl> <dbl> <dbl>
    #> 1     1     2     3     4     5
    ```
    
*   `pivot_wider()` gains a `names_glue` argument that allows you to construct
    output column names with a glue specification when `names_to` includes 
    multiple columns.
    
    
    ```r
    df <- tibble(
      first = "a",
      second = "1",
      third = "X",
      val = 1
    )
    df %>% pivot_wider(
      names_from = c(first, second, third), 
      values_from = val,
      names_glue = "{first}.{second}_{third}"
    )
    #> # A tibble: 1 x 1
    #>   a.1_X
    #>   <dbl>
    #> 1     1
    ```

*   `pivot_wider()` arguments `values_fn` and `values_fill` can now be single 
    values; you now only need to use a named list if you want to use different 
    values for different value columns. You'll also get better errors if 
    they're not of the correct type.

*   Finally, both `pivot_wider()` and `pivot_longer()` are considerably more 
    performant, thanks largely to improvements in the underlying vctrs code 
    by [Davis Vaughn](http://github.com/DavisVaughan).

## Acknowledgements

Thanks to all 135 people who contributed to this version of tidyr by discussing issues and suggesting new code! [&#x0040;abichat](https://github.com/abichat), [&#x0040;abiyug](https://github.com/abiyug), [&#x0040;adisarid](https://github.com/adisarid), [&#x0040;ahmohamed](https://github.com/ahmohamed), [&#x0040;akikirinrin](https://github.com/akikirinrin), [&#x0040;albertotb](https://github.com/albertotb), [&#x0040;alex-pax](https://github.com/alex-pax), [&#x0040;amirmazmi](https://github.com/amirmazmi), [&#x0040;andtheWings](https://github.com/andtheWings), [&#x0040;ashiklom](https://github.com/ashiklom), [&#x0040;atusy](https://github.com/atusy), [&#x0040;batpigandme](https://github.com/batpigandme), [&#x0040;bertrandh](https://github.com/bertrandh), [&#x0040;BillBlanc](https://github.com/BillBlanc), [&#x0040;billdenney](https://github.com/billdenney), [&#x0040;BrianDiggs](https://github.com/BrianDiggs), [&#x0040;bushdanielkwajaffa](https://github.com/bushdanielkwajaffa), [&#x0040;cderv](https://github.com/cderv), [&#x0040;CGMossa](https://github.com/CGMossa), [&#x0040;cgoo4](https://github.com/cgoo4), [&#x0040;charliejhadley](https://github.com/charliejhadley), [&#x0040;chester-gan](https://github.com/chester-gan), [&#x0040;cimentadaj](https://github.com/cimentadaj), [&#x0040;cjvanlissa](https://github.com/cjvanlissa), [&#x0040;cloversleaves](https://github.com/cloversleaves), [&#x0040;colearendt](https://github.com/colearendt), [&#x0040;dah33](https://github.com/dah33), [&#x0040;DanOvando](https://github.com/DanOvando), [&#x0040;dapperjapper](https://github.com/dapperjapper), [&#x0040;daranzolin](https://github.com/daranzolin), [&#x0040;davidhunterwalsh](https://github.com/davidhunterwalsh), [&#x0040;davisadamw](https://github.com/davisadamw), [&#x0040;DavisVaughan](https://github.com/DavisVaughan), [&#x0040;dchiu911](https://github.com/dchiu911), [&#x0040;dpastoor](https://github.com/dpastoor), [&#x0040;dpeterson71](https://github.com/dpeterson71), [&#x0040;dpprdan](https://github.com/dpprdan), [&#x0040;eantworth](https://github.com/eantworth), [&#x0040;earcanal](https://github.com/earcanal), [&#x0040;echasnovski](https://github.com/echasnovski), [&#x0040;enixam](https://github.com/enixam), [&#x0040;ericgunnink](https://github.com/ericgunnink), [&#x0040;florianm](https://github.com/florianm), [&#x0040;fmmattioni](https://github.com/fmmattioni), [&#x0040;franzbischoff](https://github.com/franzbischoff), [&#x0040;GegznaV](https://github.com/GegznaV), [&#x0040;geotheory](https://github.com/geotheory), [&#x0040;ggrothendieck](https://github.com/ggrothendieck), [&#x0040;gregorp](https://github.com/gregorp), [&#x0040;hadley](https://github.com/hadley), [&#x0040;HanOostdijk](https://github.com/HanOostdijk), [&#x0040;henry090](https://github.com/henry090), [&#x0040;iago-pssjd](https://github.com/iago-pssjd), [&#x0040;ifellows](https://github.com/ifellows), [&#x0040;infotroph](https://github.com/infotroph), [&#x0040;jam1015](https://github.com/jam1015), [&#x0040;jannikbuhr](https://github.com/jannikbuhr), [&#x0040;jasonpcasey](https://github.com/jasonpcasey), [&#x0040;jeffreypullin](https://github.com/jeffreypullin), [&#x0040;jennybc](https://github.com/jennybc), [&#x0040;jenren](https://github.com/jenren), [&#x0040;JenspederM](https://github.com/JenspederM), [&#x0040;jeonghyunwoo](https://github.com/jeonghyunwoo), [&#x0040;jjnote](https://github.com/jjnote), [&#x0040;jmh530](https://github.com/jmh530), [&#x0040;JohnCoene](https://github.com/JohnCoene), [&#x0040;joshua-theisen](https://github.com/joshua-theisen), [&#x0040;JosiahParry](https://github.com/JosiahParry), [&#x0040;jthomasmock](https://github.com/jthomasmock), [&#x0040;jwilliman](https://github.com/jwilliman), [&#x0040;kaneplusplus](https://github.com/kaneplusplus), [&#x0040;kaybenleroll](https://github.com/kaybenleroll), [&#x0040;kent37](https://github.com/kent37), [&#x0040;kiernann](https://github.com/kiernann), [&#x0040;krlmlr](https://github.com/krlmlr), [&#x0040;lionel-](https://github.com/lionel-), [&#x0040;Ljupch0](https://github.com/Ljupch0), [&#x0040;lymanmark](https://github.com/lymanmark), [&#x0040;maelle](https://github.com/maelle), [&#x0040;majazaloznik](https://github.com/majazaloznik), [&#x0040;mattantaliss](https://github.com/mattantaliss), [&#x0040;mattwarkentin](https://github.com/mattwarkentin), [&#x0040;maurolepore](https://github.com/maurolepore), [&#x0040;md0u80c9](https://github.com/md0u80c9), [&#x0040;mgirlich](https://github.com/mgirlich), [&#x0040;MikeEdinger](https://github.com/MikeEdinger), [&#x0040;mikemahoney218](https://github.com/mikemahoney218), [&#x0040;mikmart](https://github.com/mikmart), [&#x0040;mitchelloharawild](https://github.com/mitchelloharawild), [&#x0040;moodymudskipper](https://github.com/moodymudskipper), [&#x0040;msberends](https://github.com/msberends), [&#x0040;msgoussi](https://github.com/msgoussi), [&#x0040;mstackhouse](https://github.com/mstackhouse), [&#x0040;MyKo101](https://github.com/MyKo101), [&#x0040;nacnudus](https://github.com/nacnudus), [&#x0040;namelessjon](https://github.com/namelessjon), [&#x0040;ndrewGele](https://github.com/ndrewGele), [&#x0040;Nicktz](https://github.com/Nicktz), [&#x0040;npjc](https://github.com/npjc), [&#x0040;osorensen](https://github.com/osorensen), [&#x0040;PathosEthosLogos](https://github.com/PathosEthosLogos), [&#x0040;philipp-baumann](https://github.com/philipp-baumann), [&#x0040;PMSeitzer](https://github.com/PMSeitzer), [&#x0040;psychelzh](https://github.com/psychelzh), [&#x0040;randomgambit](https://github.com/randomgambit), [&#x0040;riinuots](https://github.com/riinuots), [&#x0040;romagnolid](https://github.com/romagnolid), [&#x0040;romainfrancois](https://github.com/romainfrancois), [&#x0040;rvino](https://github.com/rvino), [&#x0040;salim-b](https://github.com/salim-b), [&#x0040;shanepiesik](https://github.com/shanepiesik), [&#x0040;shannonpileggi](https://github.com/shannonpileggi), [&#x0040;sharleenw](https://github.com/sharleenw), [&#x0040;siddharthprabhu](https://github.com/siddharthprabhu), [&#x0040;simazhi](https://github.com/simazhi), [&#x0040;skr5k](https://github.com/skr5k), [&#x0040;skydavis435](https://github.com/skydavis435), [&#x0040;smingerson](https://github.com/smingerson), [&#x0040;smithjd](https://github.com/smithjd), [&#x0040;srnnkls](https://github.com/srnnkls), [&#x0040;stragu](https://github.com/stragu), [&#x0040;stufield](https://github.com/stufield), [&#x0040;tangcxx](https://github.com/tangcxx), [&#x0040;tdhock](https://github.com/tdhock), [&#x0040;the-Zian](https://github.com/the-Zian), [&#x0040;tomhopper](https://github.com/tomhopper), [&#x0040;topepo](https://github.com/topepo), [&#x0040;wgrundlingh](https://github.com/wgrundlingh), [&#x0040;wibeasley](https://github.com/wibeasley), [&#x0040;william3031](https://github.com/william3031), [&#x0040;wmoldham](https://github.com/wmoldham), [&#x0040;wolski](https://github.com/wolski), [&#x0040;xkdog](https://github.com/xkdog), [&#x0040;xtimbeau](https://github.com/xtimbeau), and [&#x0040;yusuzech](https://github.com/yusuzech).

[parse_number]: https://readr.tidyverse.org/reference/parse_number.html
