---
title: Building Tidy Tools Workshop at rstudio::conf(2020)
author:
  - '[Charlotte Wickham](https://cwick.co.nz/)'
date: '2020-02-18'
categories: [learn, teach]
tags: [conf2020]
slug: conf20-tidy-tools
description: |
  A guide to the content and guiding principles of the Building Tidy Tools Workshop.
photo:
  url: https://unsplash.com/photos/YVT5aF2QM7M
  author: Lachlan Donald
---



> tl;dr: all workshop materials are available here: <br>
> <i class="fab fa-github"></i> https://rstd.io/conf20-tidy-tools <br>
> <i class="fab fa-creative-commons fa-fw"></i> [License: CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/legalcode)

It was my pleasure to co-teach Building Tidy Tools 
at `rstudio::conf(2020)` with my brother Hadley.  
[This workshop](https://github.com/rstudio-conf-2020/build-tidy-tools/) was advertised for

> ... those who have embraced the tidyverse and now want to expand it to meet their own needs. 

In practice, this means
we talk a lot about package development, 
since packages are the easiest way 
to develop (and share) a set of
related functions, 
but we also touch on workflow, design,
and specific implementation details.

In this post, I'll outline a few things that aren't
as obvious from just browsing the materials: 
the philosophy and themes that guide the entire workshop, as 
well as some of the details of delivering the materials.

## Philosophy and Themes

This piece of advice shows up in the workshop when talking about 
`R CMD check` (which runs a set of automated package checks):

> "If it hurts, do it more often"
-- [Martin Fowler](https://martinfowler.com/bliki/FrequencyReducesDifficulty.html)

But I feel like it sums up the philosophy of the entire workshop, 
with perhaps an addendum: 

> "If it hurts, there is probably a usethis or devtools function for it.  
> If it still hurts, do it more often"

In the case of `R CMD check`, 
the devtools `check()` function is only a keyboard shortcut away, 
so there is no excuse for not running it.
But, it still hurts, 
because `check()` is always pointing out what is wrong with your package.

Running `check()` often, not only 
reduces the chance you've introduced many new problems, 
it also desensitizes you to any feelings of failure you might get
when you receive its report card on your package.
To help participants overcome these feelings we employ two strategies:

1. We demonstrate how to treat `check()` more like a todo list, 
than a report card. 
I think it's useful to see
even Hadley doesn't rely only on his memory to build a package from scratch, 
he does what he remembers, 
then figures out what he forgot by running `check()`.

2. We get participants used to running `check()` often, 
by setting the goal of a `check()` with no errors, warnings or notes 
in many of the your turn exercises. 

Another example of something that can hurt 
is getting a package started. 
This is where usethis and devtools really shine! 
In the first session of the workshop we
cover `usethis::create_package()`, `usethis::use_r()`, 
`devtools::load_all()`, `devtools::check()`, `devtools::document()`, `usethis::use_mit_license()` and `devtools::install()`.
And that's enough to have a fully functioning package 
before the morning coffee break!

It takes about 20mins to create a package from scratch
using this workflow for the first time, 
but participants then practice this workflow, 
adding a few extra steps, throughout the two days.
By the end of the workshop 
they have built 3-5 packages from scratch, 
and hopefully find it a pain-free experience.

These are both examples of one of the big themes in the workshop: 
**Workflow**. 
Embracing certain workflows when you switch to package development
leads to big payoffs. 
Some of these payoffs are short term. 
For example, following the package convention of 
putting functions in script files
inside an `R/` folder, 
along with loading them with `devtools::load_all()`,
is immediately much more streamlined and less error prone,
than sourcing functions individually with keyboard shortcuts, or `source()`.

Other payoffs are long term, for example, 
writing tests adds work up front (although usethis helps a lot with the initial setup)
but the long term payoff is huge: 
a package that is more reliable, 
easier to maintain, and 
easier to extend.

The other two big themes in the workshop are **Interface** and **Implementation**:

* **Interface** describes the user facing side of your package.
Your decisions about interface govern 
how easy users find your package to learn and use.
One of the core values of the packages in the tidyverse is to
"Design for humans".
In the workshop, 
we work through some case studies to elucidate what this value means and
how to identify areas for improvement in your own packages.

* **Implementation** describes the code inside your package. 
In the workshop we pick just a couple of topics to delve into,
those we think are the most useful to know about: 
    
    * Dependencies: how and when to rely on code in other packages
    * Using the tidyverse inside packages: the common problems that you
    run into when using tidyverse functions inside your own functions, 
    and their solutions.
    * The S3 object oriented system: why and how you might use it in your own packages.  

## Teaching Materials

We used the breaks to split the workshop into 8 sessions.  Each session, of 1.5 hours, is a different topic, 
except for *Interface* which took up two sessions for a total of 3 hours.




<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#papgkgqhtl .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
}

#papgkgqhtl .gt_heading {
  background-color: #FFFFFF;
  border-bottom-color: #FFFFFF;
  border-left-style: hidden;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: hidden;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#papgkgqhtl .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#papgkgqhtl .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#papgkgqhtl .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#papgkgqhtl .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#papgkgqhtl .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  vertical-align: bottom;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#papgkgqhtl .gt_column_spanner {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  vertical-align: bottom;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  padding-top: 4px;
  padding-bottom: 4px;
  overflow-x: hidden;
  display: inline-block;
  width: 97%;
}

#papgkgqhtl .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#papgkgqhtl .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#papgkgqhtl .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#papgkgqhtl .gt_from_md > :first-child {
  margin-top: 0;
}

#papgkgqhtl .gt_from_md > :last-child {
  margin-bottom: 0;
}

#papgkgqhtl .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#papgkgqhtl .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#papgkgqhtl .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#papgkgqhtl .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#papgkgqhtl .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#papgkgqhtl .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#papgkgqhtl .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#papgkgqhtl .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#papgkgqhtl .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#papgkgqhtl .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#papgkgqhtl .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#papgkgqhtl .gt_left {
  text-align: left;
}

#papgkgqhtl .gt_center {
  text-align: center;
}

#papgkgqhtl .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#papgkgqhtl .gt_font_normal {
  font-weight: normal;
}

#papgkgqhtl .gt_font_bold {
  font-weight: bold;
}

#papgkgqhtl .gt_font_italic {
  font-style: italic;
}

#papgkgqhtl .gt_super {
  font-size: 65%;
}

#papgkgqhtl .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="papgkgqhtl" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Day</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Session</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Taught by</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Theme</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">Materials</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>The Whole Game</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Charlotte</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Workflow</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/rstudio-conf-2020/build-tidy-tools/blob/master/1-intro.pdf"><code>1-intro.pdf </code></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Testing</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Charlotte</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Workflow</p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href="https://github.com/rstudio-conf-2020/build-tidy-tools/blob/master/2-testing.pdf"><code>2-testing.pdf </code></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Documentation / Sharing</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Charlotte</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Workflow</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/rstudio-conf-2020/build-tidy-tools/blob/master/3-sharing.pdf"><code>3-sharing.pdf </code></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>1</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Dependencies</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Hadley</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Implementation</p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href="https://github.com/rstudio-conf-2020/build-tidy-tools/blob/master/script/3-dependencies.Rmd"><code>3-dependencies.Rmd </code></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>2</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Using the Tidyverse</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Charlotte</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Implementation</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/rstudio-conf-2020/build-tidy-tools/blob/master/script/4-tidyverse.Rmd"><code>4-tidyverse.Rmd </code></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right gt_striped"><div class='gt_from_md'><p>2</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Interface</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Hadley</p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Interface</p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href="https://github.com/rstudio-conf-2020/build-tidy-tools/blob/master/script/5-interface.Rmd"><code>5-interface.Rmd </code></a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_right"><div class='gt_from_md'><p>2</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>OO programming / S3</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Charlotte</p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Implementation</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/rstudio-conf-2020/build-tidy-tools/blob/master/script/7-oop.Rmd"><code>7-oop.Rmd </code></a></p>
</div></td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->

You might notice some numbering inconsistencies --- 
`3-dependencies.Rmd` is presented after `3-sharing.pdf` 
and there is no `6-`... 🤷.

The first three sections have slide decks (created in Apple Keynote), 
but the other sections have an R Markdown file that acts as a script 
(in [`script/`](https://github.com/rstudio-conf-2020/build-tidy-tools/tree/master/script))
 **and** another R Markdown file that records what was actually typed 
(in [`notes/`](https://github.com/rstudio-conf-2020/build-tidy-tools/tree/master/notes)).

Hadley and I refer to the script as we teach 
(usually open on another device like a phone or ipad), 
but create and update the notes version as the session progresses,
and commit it to GitHub regularly.
Participants would have their web browser pointing at the notes version on GitHub, 
refreshing when needed to grab any code required for the "Your Turn" exercises.  

The script approach encourages live coding and 
allows for some digressions if participants raise specific questions.
From an instructor perspective, 
it's nice to have a record of both what you planned to teach and 
what you actually taught --- 
you can look back and see how the timing worked, 
or questions participants raised.

The early sections 
(the "Whole Game", Testing and Documentation) 
focus more on workflow and are harder to document in a live code script, 
since unlike code for scripts or functions, 
much of the code is run on the console and involves context switching --- 
switching to a new RStudio session, 
switching to a script file that has opened in the Source Editor, 
or getting something running in the "Build" pane. 
So, I think keeping these initial sections as slides worked in this case.

## Thanks

Our workshop wouldn't have been as successful (or as fun!) without
our fantastic teaching assistants: Julia Blum, Ingrid Rodriguez and François Michonneau.

These materials have been taught from and developed over a few years.
A big thank you to everyone that has contributed to them!
In particular, lots of credit belongs to Hadley and Jenny Bryan.


<div class="hline-top">
<i class="fas fa-binoculars"></i>&nbsp;&nbsp;&nbsp;<a href='/blog/2020/02/conf2020-workshops/'><em>Check out materials from the 18 other rstudio::conf(2020) workshops...</em></a>
</div>
