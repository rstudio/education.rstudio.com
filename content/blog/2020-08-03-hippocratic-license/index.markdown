---
title: The Hippocratic License
author:
  - greg
date: '2020-08-03'
categories:
  - teach
tags:
  - teach
description: |
  A new open license is intended to prevent unethical use of software.
slug: hippocratic-license
photo:
  url: https://unsplash.com/photos/sCqkCcYmtlM
  author: Daniele D'Andreti
---

Over the past few years,
more and more people have become concerned with
the ethical implications of work in data science and machine learning.
From algorithmic bias to facial recognition,
the tools we teach people to build and use have the potential to do great harm;
as teachers,
we have a responsibility to make our students aware of the issues
in the same way that the medical profession teaches nurses and doctors
to think about the human implications of what they do.

One example of how we can do this comes up when we discuss software licensing and intellectual property.
Until recently,
researchers had three principal options:

-   Make their work closed source, so that others could not use it without permission.

-   Use the [MIT License](https://opensource.org/licenses/MIT) or something equivalent,
    which allows users to do whatever they want.

-   Use the [GNU Public License](https://www.gnu.org/licenses/gpl-3.0.en.html) (GPL),
    which allows users to do what they want
    but also requires them to share the source of any project
    that modifies or incorporates GPL'd software.

A fourth option has recently been developed
by [Coraline Ada Ehmke](https://where.coraline.codes/)
(best known until now for creating the [Contributor Covenant](https://www.contributor-covenant.org/)
used by many open source projects).
Like other open licenses,
the [Hippocratic License](https://firstdonoharm.dev/) allows people to use and share the software,
but where the GPL requires them to share their own work,
the Hippocratic License prevents anyone from using the software to do harm.
To avoid wrangling over what exactly that means,
the license specifically forbids anyone from using software in ways that violate
the [United Nations Universal Declaration of Human Rights](https://www.un.org/en/universal-declaration-human-rights/)
and the [United Nations Global Compact](https://www.unglobalcompact.org/).
These are regarded as landmarks in the history of human rights,
and more practically,
have been ratified by many countries
and argued over by lawyers and scholars
so that their scope and meaning is clear.

Making students aware of the Hippocratic License
and adopting it for our own projects
is a small step toward a better world,
but it *is* a step.
From a teaching point of view,
discussing it and its implications can turn an otherwise abstract lecture on ethics
into a lively debate,
and can give students practice discussing what they *should* do
rather than what they *could* do.


If you'd like to read more, [Dr. Nick Horton](https://twitter.com/askdrstats) wrote a [post](https://teachdatascience.com/oath/) about this license on the ["Teach Data Science" blog](https://teachdatascience.com/). And here is a list of adopters as of the time of this post, with links to their projects:
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#wlgxzwuigd .gt_table {
  display: table;
  border-collapse: collapse;
  max-width: 100%;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#wlgxzwuigd .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#wlgxzwuigd .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#wlgxzwuigd .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#wlgxzwuigd .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wlgxzwuigd .gt_col_headings {
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

#wlgxzwuigd .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#wlgxzwuigd .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#wlgxzwuigd .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#wlgxzwuigd .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#wlgxzwuigd .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#wlgxzwuigd .gt_group_heading {
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

#wlgxzwuigd .gt_empty_group_heading {
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

#wlgxzwuigd .gt_from_md > :first-child {
  margin-top: 0;
}

#wlgxzwuigd .gt_from_md > :last-child {
  margin-bottom: 0;
}

#wlgxzwuigd .gt_from_md p {
  line-height: 1em;
  margin-bottom: 0em;
  margin-top: 0em;
}

#wlgxzwuigd .gt_row {
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

#wlgxzwuigd .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#wlgxzwuigd .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#wlgxzwuigd .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#wlgxzwuigd .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#wlgxzwuigd .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#wlgxzwuigd .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#wlgxzwuigd .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wlgxzwuigd .gt_footnotes {
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

#wlgxzwuigd .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#wlgxzwuigd .gt_sourcenotes {
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

#wlgxzwuigd .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#wlgxzwuigd .gt_left {
  text-align: left;
}

#wlgxzwuigd .gt_center {
  text-align: center;
}

#wlgxzwuigd .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#wlgxzwuigd .gt_font_normal {
  font-weight: normal;
}

#wlgxzwuigd .gt_font_bold {
  font-weight: bold;
}

#wlgxzwuigd .gt_font_italic {
  font-style: italic;
}

#wlgxzwuigd .gt_super {
  font-size: 65%;
}

#wlgxzwuigd .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="wlgxzwuigd" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Project</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">URL</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Animus</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/SplittyDev/Animus">https://github.com/SplittyDev/Animus</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>cachish</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/thusoy/cachish">https://github.com/thusoy/cachish</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>DCAN</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/DecentralizedCAN/CAN">https://github.com/DecentralizedCAN/CAN</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>DimeNet</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/klicperajo/dimenet">https://github.com/klicperajo/dimenet</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>FODA Card Game</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/rafaelcastrocouto/foda">https://github.com/rafaelcastrocouto/foda</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>format_parser</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://rubygems.org/gems/format_parser">https://rubygems.org/gems/format_parser</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Functional Programming for Mortals with Cats in Scala (book)</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://leanpub.com/fpmortals-cats">https://leanpub.com/fpmortals-cats</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Gryphon</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/vinivendra/Gryphon">https://github.com/vinivendra/Gryphon</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Honeycomb Serilog Sink</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/evilpilaf/HoneycombSerilogSink">https://github.com/evilpilaf/HoneycombSerilogSink</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Kommit</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/kommitapp/kom-web">https://github.com/kommitapp/kom-web</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>Launchlet</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/launchlet/launchlet">https://github.com/launchlet/launchlet</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>leisure</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://leisure.tdreyno.com">https://leisure.tdreyno.com</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>libhoney-kotlin</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/imavroukakis/libhoney-kotlin">https://github.com/imavroukakis/libhoney-kotlin</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>NLPIA-bot Chatbot</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/nlpia/nlpia-bot">https://github.com/nlpia/nlpia-bot</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>postgres-mitm</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/thusoy/postgres-mitm">https://github.com/thusoy/postgres-mitm</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>rack-read_only</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://rubygems.org/gems/rack-read_only">https://rubygems.org/gems/rack-read_only</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>suo</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/dieseltravis/suo">https://github.com/dieseltravis/suo</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>TidyBlocks</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="http://tidyblocks.tech">http://tidyblocks.tech</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>VCR</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/vcr/vcr">https://github.com/vcr/vcr</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>zip_tricks</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/wetransfer/zip_tricks">https://github.com/wetransfer/zip_tricks</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>logitechd</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/FFY00/logitechd">https://github.com/FFY00/logitechd</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>dbus-objects</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/FFY00/dbus-objects">https://github.com/FFY00/dbus-objects</a></p>
</div></td>
    </tr>
    <tr>
      <td class="gt_row gt_left"><div class='gt_from_md'><p>python-install</p>
</div></td>
      <td class="gt_row gt_center"><div class='gt_from_md'><p><a href="https://github.com/FFY00/python-install">https://github.com/FFY00/python-install</a></p>
</div></td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->

