---
title: testing dt
author: alison
date: '2020-05-19'
categories:
- teach
tags:
- learnr
- rmarkdown
photo:
  url: https://www.allisonhorst.com/
  author: Allison Horst
output: hugodown::hugo_document
rmd_hash: 1a8a22a132083c73
html_dependencies:
- <script src="htmlwidgets-1.5.1/htmlwidgets.js"></script>
- <script src="jquery-1.12.4/jquery.min.js"></script>
- <link href="datatables-css-0.0.0/datatables-crosstalk.css" rel="stylesheet" />
- <script src="datatables-binding-0.13.2/datatables.js"></script>
- <link href="dt-core-1.10.20/css/jquery.dataTables.min.css" rel="stylesheet" />
- <link href="dt-core-1.10.20/css/jquery.dataTables.extra.css" rel="stylesheet" />
- <script src="dt-core-1.10.20/js/jquery.dataTables.min.js"></script>
- <link href="crosstalk-1.1.0.1/css/crosstalk.css" rel="stylesheet" />
- <script src="crosstalk-1.1.0.1/js/crosstalk.min.js"></script>

---


+ make
+ sure
+ text
+ works


```r
library(DT)
shared_df <- quakes[sample(nrow(quakes), 10),]
datatable(shared_df)
```

<!--html_preserve--><div id="htmlwidget-3bf55f130100dec3b065" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-3bf55f130100dec3b065">{"x":{"filter":"none","data":[["917","100","594","313","848","636","646","440","208","598"],[-19.57,-24.57,-12.72,-18.6,-25.46,-18.82,-23.29,-16.1,-20.32,-17.02],[184.47,179.92,166.28,181.91,179.98,182.21,184,185.32,181.69,182.93],[202,484,70,442,479,417,164,257,508,406],[4.2,4.7,4.8,5.4,4.5,5.6,4.8,4.7,4.5,4],[28,33,47,82,27,129,50,30,14,17]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>lat<\/th>\n      <th>long<\/th>\n      <th>depth<\/th>\n      <th>mag<\/th>\n      <th>stations<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

Is CSS broken?
