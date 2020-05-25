---
title: testing leaflet
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
rmd_hash: b3b948c1cf09fdd5
html_dependencies:
- <script src="htmlwidgets-1.5.1/htmlwidgets.js"></script>
- <script src="jquery-1.12.4/jquery.min.js"></script>
- <link href="leaflet-1.3.1/leaflet.css" rel="stylesheet" />
- <script src="leaflet-1.3.1/leaflet.js"></script>
- <link href="leafletfix-1.0.0/leafletfix.css" rel="stylesheet" />
- <script src="Proj4Leaflet-1.0.1/proj4-compressed.js"></script>
- <script src="Proj4Leaflet-1.0.1/proj4leaflet.js"></script>
- <link href="rstudio_leaflet-1.3.1/rstudio_leaflet.css" rel="stylesheet" />
- <script src="leaflet-binding-2.0.3/leaflet.js"></script>

---


+ make
+ sure
+ text
+ works


```r
library(leaflet)
shared_df <- quakes[sample(nrow(quakes), 10),]
leaflet(shared_df) %>% addTiles() %>% addMarkers(~long, ~lat)
```

<!--html_preserve--><div id="htmlwidget-579ff2867b8ccb210901" style="width:700px;height:415.296px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-579ff2867b8ccb210901">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addMarkers","args":[[-20.21,-23.79,-22.64,-21.27,-21.31,-17.88,-12.16,-20.47,-21.63,-27.6],[183.83,179.89,180.64,173.49,180.84,181.47,167.03,185.68,180.77,182.4],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},null,null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[-27.6,-12.16],"lng":[167.03,185.68]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

Is CSS broken?
