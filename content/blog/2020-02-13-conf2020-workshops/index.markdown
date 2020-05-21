---
title: 'Workshop wrap-up from rstudio::conf(2020)'
date: '2020-02-13'
description: 'rstudio::conf(2020) workshop materials now available.'
slug: conf2020-workshops
categories: [learn, teach]
tags: [conf2020]
author:
  - alison
photo:
  url: https://unsplash.com/photos/tVyrFo50iiI
  author: Susie Ho
---

In January, we wrapped up [rstudio::conf(2020)](https://rstudio.com/conference/)&mdash;our fourth conference about all things R, RStudio, and data science. This year, the conference was held in San Francisco, California. Before the conference, we offered 19 (mostly) two-day workshops taught by RStudio staff as well as experts throughout the R community. Topics ranged from R for Excel Users, Javascript for Shiny Users, to Deep Learning with Keras and Tensorflow. With a teaching staff of 102 and 1307 workshop attendees, our instructors worked overtime to craft learning experiences that both challenged and empowered learners.

This year, the RStudio Education team designed a workshop line-up that we hope offered something for everyone. Some of our tried-and-true workshops were offered, but we also welcomed some new kids on the block, many by popular demand from attendees who weighed in on our post-conf surveys in the past. We were excited to work with new instructors from around the world, and to bring our conference attendees a slate of unique R-focused workshops.

For learners who attended workshops as well as those who could not join us, all workshop materials this year are available [online](https://github.com/rstudio-conf-2020) with [CC BY-SA 4.0 licenses](#licensing). Even though the materials alone cannot replace the actual workshop experience, we hope that you’ll find them useful. Instructors will be blogging individually about their workshops as well, so [watch this space](/tags/conf2020) for some repo roadmaps to help you navigate their workshop materials. RStudio also regularly hosts workshops throughout the year so please subscribe to [training updates](https://www.rstudio.com/about/subscription-management/). 

Thanks to all our instructors, teaching assistants, and workshop attendees this year&mdash;we hope to teach and learn together again in 2021 in [Orlando](https://rstd.io/conf)!

## Links

<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#xxcqmyjwdi .gt_table {
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

#xxcqmyjwdi .gt_heading {
  background-color: #FFFFFF;
  border-bottom-color: #FFFFFF;
  border-left-style: hidden;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: hidden;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#xxcqmyjwdi .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#xxcqmyjwdi .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#xxcqmyjwdi .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xxcqmyjwdi .gt_col_headings {
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

#xxcqmyjwdi .gt_col_heading {
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

#xxcqmyjwdi .gt_column_spanner {
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

#xxcqmyjwdi .gt_group_heading {
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

#xxcqmyjwdi .gt_empty_group_heading {
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

#xxcqmyjwdi .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#xxcqmyjwdi .gt_from_md > :first-child {
  margin-top: 0;
}

#xxcqmyjwdi .gt_from_md > :last-child {
  margin-bottom: 0;
}

#xxcqmyjwdi .gt_row {
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

#xxcqmyjwdi .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#xxcqmyjwdi .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xxcqmyjwdi .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#xxcqmyjwdi .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xxcqmyjwdi .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#xxcqmyjwdi .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xxcqmyjwdi .gt_footnotes {
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

#xxcqmyjwdi .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#xxcqmyjwdi .gt_sourcenotes {
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

#xxcqmyjwdi .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#xxcqmyjwdi .gt_left {
  text-align: left;
}

#xxcqmyjwdi .gt_center {
  text-align: center;
}

#xxcqmyjwdi .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#xxcqmyjwdi .gt_font_normal {
  font-weight: normal;
}

#xxcqmyjwdi .gt_font_bold {
  font-weight: bold;
}

#xxcqmyjwdi .gt_font_italic {
  font-style: italic;
}

#xxcqmyjwdi .gt_super {
  font-size: 65%;
}

#xxcqmyjwdi .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="xxcqmyjwdi" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">workshop</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">blog post</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">instructors</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-dataviz'>A Practical Introduction to Data Visualization with ggplot2 Workshop</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='/blog/2020/02/conf20-dataviz/'><!--html_preserve--><i class="fas  fa-paperclip "></i><!--/html_preserve--></a></p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Kieran Healy</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-applied-ml'>Applied Machine Learning Workshop</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Max Kuhn</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-big-data'>Big Data with R Workshop</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Edgar Ruiz, James Blair</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-tidy-tools'>Building Tidy Tools Workshop</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='/blog/2020/02/conf20-tidy-tools/'><!--html_preserve--><i class="fas  fa-paperclip "></i><!--/html_preserve--></a></p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Charlotte Wickham, Hadley Wickham</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-dl'>Deep Learning with Keras and TensorFlow in R Workshop</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Bradley Boehmke</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-design-ds-class'>Designing the Data Science Classroom Workshop</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Mine Cetinkaya-Rundel</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-ds-tidy'>Introduction to Data Science in the Tidyverse Workshop</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Amelia McNamara, Hadley Wickham</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-intro-ml'>Introduction to Machine Learning with the Tidyverse Workshop</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='/blog/2020/02/conf20-intro-ml/'><!--html_preserve--><i class="fas  fa-paperclip "></i><!--/html_preserve--></a></p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Alison Hill, Garrett Grolemund</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-js4shiny'>JavaScript for Shiny Users Workshop</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Garrick Aden-Buie</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-geospatial'>Modern Geospatial Data Analysis with R Workshop</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Zev Ross</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-org-pkg'>My Organization's First R Package Workshop</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Rich Iannone, Malcolm Barrett</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-r-excel'>R for Excel Users Workshop</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='/blog/2020/02/conf20-r-excel/'><!--html_preserve--><i class="fas  fa-paperclip "></i><!--/html_preserve--></a></p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Julia Lowndes, Allison Horst</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-rmd-dash'>R Markdown and Interactive Dashboards Workshop</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Carl Howe, Yihui Xie</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-instructor'>RStudio Instructor Training Workshop (1-day)</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Greg Wilson</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-pro'>RStudio Professional Products Administration Workshop</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Andrie de Vries</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-intro-shiny'>Shiny From Start To Finish Workshop</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'></div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Danny Kaplan</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-tidytext'>Text Mining with Tidy Data Principles Workshop</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='/blog/2020/02/conf20-tidytext/'><!--html_preserve--><i class="fas  fa-paperclip "></i><!--/html_preserve--></a></p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Julia Silge</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-ts'>Tidy Time Series and Forecasting in R Workshop</a></p>
</div></td>
      <td class="gt_row gt_center gt_striped"><div class='gt_from_md'><p><a href='/blog/2020/02/conf20-ts/'><!--html_preserve--><i class="fas  fa-paperclip "></i><!--/html_preserve--></a></p>
</div></td>
      <td class="gt_row gt_left gt_striped"><div class='gt_from_md'><p>Rob Hyndman</p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='https://rstd.io/conf20-wtf'>What They Forgot to Teach You about R Workshop</a></p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href='/blog/2020/02/conf20-wtf/'><!--html_preserve--><i class="fas  fa-paperclip "></i><!--/html_preserve--></a></p>
</div></td>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Kara Woo, Jenny Bryan, Jim Hester</p>
</div></td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->

## Licensing

All workshop materials are
licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).

<center>
<i class="fab fa-creative-commons fa-2x"></i><i class="fab fa-creative-commons-by fa-2x"></i><i class="fab fa-creative-commons-sa fa-2x"></i>
</center>

*This is a human-readable summary of (and not a substitute for) the license.
Please see <https://creativecommons.org/licenses/by-sa/4.0/legalcode> for the full legal text.*

**You are free to:**

- **Share**---copy and redistribute the material in any medium or
  format

- **Adapt**---remix, transform, and build upon the material
  for any purpose, even commercially. 

The licensor cannot revoke these freedoms as long as you follow the
license terms.

**Under the following terms:**

- **Attribution**---You must give appropriate credit, provide a link
  to the license, and indicate if changes were made. You may do so in
  any reasonable manner, but not in any way that suggests the licensor
  endorses you or your use.

- **ShareAlike**---If you remix, transform, or build upon the material, 
  you must distribute your contributions under the 
  [same license](https://creativecommons.org/licenses/by-sa/4.0/) as 
  the original. 
  
No additional restrictions — You may not apply legal terms or technological 
measures that legally restrict others from doing anything the license permits. 

**Notices:**

You do not have to comply with the license for elements of the
material in the public domain or where your use is permitted by an
applicable exception or limitation.

No warranties are given. The license may not give you all of the
permissions necessary for your intended use. For example, other rights
such as publicity, privacy, or moral rights may limit how you use the
material.
