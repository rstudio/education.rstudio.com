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

<!--html_preserve--><div id="htmlwidget-e41e1f3e77863381a736" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-e41e1f3e77863381a736">{"x":{"filter":"none","data":[["920","612","157","761","858","93","604","103","597","318"],[-17.85,-22.75,-11.75,-20.7,-15.65,-20.64,-21.24,-21.88,-12.84,-18.77],[181.44,170.99,166.07,184.3,185.17,182.02,180.86,180.39,166.78,169.24],[589,67,69,182,315,497,615,608,150,218],[5.6,4.8,4.2,4.3,4.1,5.2,4.9,4.7,4.9,5.3],[115,35,14,17,15,64,23,30,35,53]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>lat<\/th>\n      <th>long<\/th>\n      <th>depth<\/th>\n      <th>mag<\/th>\n      <th>stations<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

Is CSS broken?
