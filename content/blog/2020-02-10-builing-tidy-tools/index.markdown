---
title: Building Tidy Tools Workshop at rstudio::conf(2020)
author:
  - "[Charlotte Wickham](https://cwick.co.nz/)"
date: '2020-02-10'
slug: building-tidy-tools
description: |
   A guide to the content and guiding principles of the Building Tidy
   Tools Workshop.
categories:
  - learn
  - events
photo:
  url: https://unsplash.com/photos/YVT5aF2QM7M
  author: Lachlan Donald
---



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

#cewjrajxid .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  /* table.margin.left */
  margin-right: auto;
  /* table.margin.right */
  color: #333333;
  font-size: 16px;
  /* table.font.size */
  background-color: #FFFFFF;
  /* table.background.color */
  width: auto;
  /* table.width */
  border-top-style: solid;
  /* table.border.top.style */
  border-top-width: 2px;
  /* table.border.top.width */
  border-top-color: #A8A8A8;
  /* table.border.top.color */
  border-bottom-style: solid;
  /* table.border.bottom.style */
  border-bottom-width: 2px;
  /* table.border.bottom.width */
  border-bottom-color: #A8A8A8;
  /* table.border.bottom.color */
}

#cewjrajxid .gt_heading {
  background-color: #FFFFFF;
  /* heading.background.color */
  border-bottom-color: #FFFFFF;
  /* table.background.color */
  border-left-style: hidden;
  /* heading.border.lr.style */
  border-left-width: 1px;
  /* heading.border.lr.width */
  border-left-color: #D3D3D3;
  /* heading.border.lr.color */
  border-right-style: hidden;
  /* heading.border.lr.style */
  border-right-width: 1px;
  /* heading.border.lr.width */
  border-right-color: #D3D3D3;
  /* heading.border.lr.color */
}

#cewjrajxid .gt_title {
  color: #333333;
  font-size: 125%;
  /* heading.title.font.size */
  font-weight: initial;
  /* heading.title.font.weight */
  padding-top: 4px;
  /* heading.top.padding - not yet used */
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  /* table.background.color */
  border-bottom-width: 0;
}

#cewjrajxid .gt_subtitle {
  color: #333333;
  font-size: 85%;
  /* heading.subtitle.font.size */
  font-weight: initial;
  /* heading.subtitle.font.weight */
  padding-top: 0;
  padding-bottom: 4px;
  /* heading.bottom.padding - not yet used */
  border-top-color: #FFFFFF;
  /* table.background.color */
  border-top-width: 0;
}

#cewjrajxid .gt_bottom_border {
  border-bottom-style: solid;
  /* heading.border.bottom.style */
  border-bottom-width: 2px;
  /* heading.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* heading.border.bottom.color */
}

#cewjrajxid .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  padding-top: 4px;
  padding-bottom: 4px;
}

#cewjrajxid .gt_col_headings {
  border-top-style: solid;
  /* column_labels.border.top.style */
  border-top-width: 2px;
  /* column_labels.border.top.width */
  border-top-color: #D3D3D3;
  /* column_labels.border.top.color */
  border-bottom-style: solid;
  /* column_labels.border.bottom.style */
  border-bottom-width: 2px;
  /* column_labels.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* column_labels.border.bottom.color */
  border-left-style: none;
  /* column_labels.border.lr.style */
  border-left-width: 1px;
  /* column_labels.border.lr.width */
  border-left-color: #D3D3D3;
  /* column_labels.border.lr.color */
  border-right-style: none;
  /* column_labels.border.lr.style */
  border-right-width: 1px;
  /* column_labels.border.lr.width */
  border-right-color: #D3D3D3;
  /* column_labels.border.lr.color */
}

#cewjrajxid .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  /* column_labels.background.color */
  font-size: 100%;
  /* column_labels.font.size */
  font-weight: normal;
  /* column_labels.font.weight */
  text-transform: inherit;
  /* column_labels.text_transform */
  vertical-align: middle;
  padding: 5px;
  margin: 10px;
  overflow-x: hidden;
}

#cewjrajxid .gt_sep_right {
  border-right: 5px solid #FFFFFF;
}

#cewjrajxid .gt_group_heading {
  padding: 8px;
  /* row_group.padding */
  color: #333333;
  background-color: #FFFFFF;
  /* row_group.background.color */
  font-size: 100%;
  /* row_group.font.size */
  font-weight: initial;
  /* row_group.font.weight */
  text-transform: inherit;
  /* row_group.text_transform */
  border-top-style: solid;
  /* row_group.border.top.style */
  border-top-width: 2px;
  /* row_group.border.top.width */
  border-top-color: #D3D3D3;
  /* row_group.border.top.color */
  border-bottom-style: solid;
  /* row_group.border.bottom.style */
  border-bottom-width: 2px;
  /* row_group.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* row_group.border.bottom.color */
  border-left-style: none;
  /* row_group.border.left.style */
  border-left-width: 1px;
  /* row_group.border.left.width */
  border-left-color: #D3D3D3;
  /* row_group.border.left.color */
  border-right-style: none;
  /* row_group.border.right.style */
  border-right-width: 1px;
  /* row_group.border.right.width */
  border-right-color: #D3D3D3;
  /* row_group.border.right.color */
  vertical-align: middle;
}

#cewjrajxid .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  /* row_group.background.color */
  font-size: 100%;
  /* row_group.font.size */
  font-weight: initial;
  /* row_group.font.weight */
  border-top-style: solid;
  /* row_group.border.top.style */
  border-top-width: 2px;
  /* row_group.border.top.width */
  border-top-color: #D3D3D3;
  /* row_group.border.top.color */
  border-bottom-style: solid;
  /* row_group.border.bottom.style */
  border-bottom-width: 2px;
  /* row_group.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* row_group.border.bottom.color */
  vertical-align: middle;
}

#cewjrajxid .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
  /* row.striping.background_color */
}

#cewjrajxid .gt_from_md > :first-child {
  margin-top: 0;
}

#cewjrajxid .gt_from_md > :last-child {
  margin-bottom: 0;
}

#cewjrajxid .gt_row {
  padding-top: 8px;
  /* data_row.padding */
  padding-bottom: 8px;
  /* data_row.padding */
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  /* table_body.hlines.style */
  border-top-width: 1px;
  /* table_body.hlines.width */
  border-top-color: #D3D3D3;
  /* table_body.hlines.color */
  border-left-style: none;
  /* table_body.vlines.style */
  border-left-width: 1px;
  /* table_body.vlines.width */
  border-left-color: #D3D3D3;
  /* table_body.vlines.color */
  border-right-style: none;
  /* table_body.vlines.style */
  border-right-width: 1px;
  /* table_body.vlines.width */
  border-right-color: #D3D3D3;
  /* table_body.vlines.color */
  vertical-align: middle;
  overflow-x: hidden;
}

#cewjrajxid .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  /* stub.background.color */
  font-weight: initial;
  /* stub.font.weight */
  text-transform: inherit;
  /* stub.text_transform */
  border-right-style: solid;
  /* stub.border.style */
  border-right-width: 2px;
  /* stub.border.width */
  border-right-color: #D3D3D3;
  /* stub.border.color */
  padding-left: 12px;
}

#cewjrajxid .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  /* summary_row.background.color */
  text-transform: inherit;
  /* summary_row.text_transform */
  padding-top: 8px;
  /* summary_row.padding */
  padding-bottom: 8px;
  /* summary_row.padding */
  padding-left: 5px;
  padding-right: 5px;
}

#cewjrajxid .gt_first_summary_row {
  padding-top: 8px;
  /* summary_row.padding */
  padding-bottom: 8px;
  /* summary_row.padding */
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  /* summary_row.border.style */
  border-top-width: 2px;
  /* summary_row.border.width */
  border-top-color: #D3D3D3;
  /* summary_row.border.color */
}

#cewjrajxid .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  /* grand_summary_row.background.color */
  text-transform: inherit;
  /* grand_summary_row.text_transform */
  padding-top: 8px;
  /* grand_summary_row.padding */
  padding-bottom: 8px;
  /* grand_summary_row.padding */
  padding-left: 5px;
  padding-right: 5px;
}

#cewjrajxid .gt_first_grand_summary_row {
  padding-top: 8px;
  /* grand_summary_row.padding */
  padding-bottom: 8px;
  /* grand_summary_row.padding */
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  /* grand_summary_row.border.style */
  border-top-width: 6px;
  /* grand_summary_row.border.width */
  border-top-color: #D3D3D3;
  /* grand_summary_row.border.color */
}

#cewjrajxid .gt_table_body {
  border-top-style: solid;
  /* table_body.border.top.style */
  border-top-width: 2px;
  /* table_body.border.top.width */
  border-top-color: #D3D3D3;
  /* table_body.border.top.color */
  border-bottom-style: solid;
  /* table_body.border.bottom.style */
  border-bottom-width: 2px;
  /* table_body.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* table_body.border.bottom.color */
}

#cewjrajxid .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  /* footnotes.background.color */
  border-bottom-style: none;
  /* footnotes.border.bottom.style */
  border-bottom-width: 2px;
  /* footnotes.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* footnotes.border.bottom.color */
  border-left-style: none;
  /* footnotes.border.lr.color */
  border-left-width: 2px;
  /* footnotes.border.lr.color */
  border-left-color: #D3D3D3;
  /* footnotes.border.lr.color */
  border-right-style: none;
  /* footnotes.border.lr.color */
  border-right-width: 2px;
  /* footnotes.border.lr.color */
  border-right-color: #D3D3D3;
  /* footnotes.border.lr.color */
}

#cewjrajxid .gt_footnote {
  margin: 0px;
  font-size: 90%;
  /* footnotes.font.size */
  padding: 4px;
  /* footnotes.padding */
}

#cewjrajxid .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  /* source_notes.background.color */
  border-bottom-style: none;
  /* source_notes.border.bottom.style */
  border-bottom-width: 2px;
  /* source_notes.border.bottom.width */
  border-bottom-color: #D3D3D3;
  /* source_notes.border.bottom.color */
  border-left-style: none;
  /* source_notes.border.lr.style */
  border-left-width: 2px;
  /* source_notes.border.lr.style */
  border-left-color: #D3D3D3;
  /* source_notes.border.lr.style */
  border-right-style: none;
  /* source_notes.border.lr.style */
  border-right-width: 2px;
  /* source_notes.border.lr.style */
  border-right-color: #D3D3D3;
  /* source_notes.border.lr.style */
}

#cewjrajxid .gt_sourcenote {
  font-size: 90%;
  /* source_notes.font.size */
  padding: 4px;
  /* source_notes.padding */
}

#cewjrajxid .gt_left {
  text-align: left;
}

#cewjrajxid .gt_center {
  text-align: center;
}

#cewjrajxid .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#cewjrajxid .gt_font_normal {
  font-weight: normal;
}

#cewjrajxid .gt_font_bold {
  font-weight: bold;
}

#cewjrajxid .gt_font_italic {
  font-style: italic;
}

#cewjrajxid .gt_super {
  font-size: 65%;
}

#cewjrajxid .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="cewjrajxid" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
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
