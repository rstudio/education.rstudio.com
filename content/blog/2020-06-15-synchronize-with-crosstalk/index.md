---
title: Synchronize your HTML Widgets with Crosstalk
author: carl
date: '2020-06-15'
categories:
- events
- learn
tags:
- conf2020
slug: conf20-crosstalk
photo:
  url: https://unsplash.com/photos/U6tYeEhEVTk
  author: Dhahi Alsaeedi via Unsplash
output: hugodown::hugo_document
rmd_hash: ca2613943a486b95
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
- <link href="datatables-css-0.0.0/datatables-crosstalk.css" rel="stylesheet" />
- <script src="datatables-binding-0.13.2/datatables.js"></script>
- <link href="dt-core-1.10.20/css/jquery.dataTables.min.css" rel="stylesheet" />
- <link href="dt-core-1.10.20/css/jquery.dataTables.extra.css" rel="stylesheet" />
- <script src="dt-core-1.10.20/js/jquery.dataTables.min.js"></script>
- <link href="crosstalk-1.1.0.1/css/crosstalk.css" rel="stylesheet" />
- <script src="crosstalk-1.1.0.1/js/crosstalk.min.js"></script>
- <link href="leaflet-easybutton-1.3.1/easy-button.css" rel="stylesheet" />
- <script src="leaflet-easybutton-1.3.1/easy-button.js"></script>
- <script src="leaflet-easybutton-1.3.1/EasyButton-binding.js"></script>
- <link href="leaflet-locationfilter2-0.1.1/locationfilter.css" rel="stylesheet" />
- <script src="leaflet-locationfilter2-0.1.1/locationfilter.js"></script>
- <script src="leaflet-locationfilter2-0.1.1/locationfilter-bindings.js"></script>
- <link href="ionicons-2.0.1/ionicons.min.css" rel="stylesheet" />
- <meta name="viewport" content="width=device-width, initial-scale=1" />
- <link href="bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet" />
- <script src="bootstrap-3.3.2/js/bootstrap.min.js"></script>
- <link href="ionrangeslider-2.1.2/css/ion.rangeSlider.css" rel="stylesheet" />
- <link href="ionrangeslider-2.1.2/css/ion.rangeSlider.skinShiny.css" rel="stylesheet"
  />
- <script src="ionrangeslider-2.1.2/js/ion.rangeSlider.min.js"></script>
- <script src="strftime-0.9.2/strftime-min.js"></script>
- <link href="selectize-0.11.2/css/selectize.bootstrap3.css" rel="stylesheet" />
- <script src="selectize-0.11.2/js/selectize.min.js"></script>
- <script src="plotly-binding-4.9.2/plotly.js"></script>
- <script src="typedarray-0.1/typedarray.min.js"></script>
- <link href="plotly-htmlwidgets-css-1.52.2/plotly-htmlwidgets.css" rel="stylesheet"
  />
- <script src="plotly-main-1.52.2/plotly-latest.min.js"></script>

---


## Crosstalk: the quick summary

Yihui Xie and I taught the [R Markdown and Interactive Dashboards Workshop](https://rstd.io/RMAID) at rstudio::conf(2020). Based on some feedback we received from students there, I want to introduce you to the crosstalk package that we used to make HTML widgets interact in our R Markdown dashboards. Crosstalk is interesting to learn about because it:

- **Isn't widely known**. Several workshop attendees said that learning about this package was worth the entire cost of the workshop, despite the fact that it's been around since 2016.
- **Adds simple interactivity without a lot of complexity**. We frequently use [HTML widgets](http://www.htmlwidgets.org) to make R Markdown dashboards interactive. The crosstalk package allows those HTML widgets to interact with one another without using Shiny. For reference, you can refer to the [crosstalk online documentation](https://rstudio.github.io/crosstalk/)
- **Works with the most commonly used HTML widgets**. HTML widgets have to be explicity designed to use crosstalk. However, crosstalk works out of the box with commonly used widgets such as `plotly`, `DT`, `leaflet`. Even if you only use those three widgets, you can build some very impressive dashboards. 

## Crosstalk adds meaningful interactivity to R Markdown dashboards

I want to begin by defining who should use crosstalk and why. Crosstalk is designed for people who:

- **Build interactive dashboards with R Markdown and HTML widgets**. [R Markdown](https://rmarkdown.rstudio.com) allows you to create a dashboard from simple text annotations and code chunks while [HTML Widgets](https://www.htmlwidgets.org) add interactivity to what would normally be static R Markdown documents. 
- **Want to coordinate the responses of multiple HTML widgets**. Crosstalk allows multiple HTML Widgets to synchronize their views of a shared dataframe and to filter what's shown. 

To get a sense of how this works, let's look at the simple example code we presented in the workshop. For the purposes of this blog post, I'm leaving out the R Markdown layout elements and simply showing the outputs.


```r
library(crosstalk)
library(leaflet)
library(DT)
shared_df <- quakes[sample(nrow(quakes), 10),]
leaflet(shared_df) %>% addTiles() %>% addMarkers(~long, ~lat)
datatable(shared_df)
```

<!--html_preserve--><div id="htmlwidget-df69c8d0882e61cdfb28" style="width:700px;height:415.296px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-df69c8d0882e61cdfb28">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addMarkers","args":[[-20.45,-23.61,-27.33,-14.72,-19.6,-19.68,-25,-21.56,-19.77,-15.54],[181.85,180.27,182.6,167.51,181.87,184.14,180,183.23,181.4,187.15],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},null,null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[-27.33,-14.72],"lng":[167.51,187.15]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve--><!--html_preserve--><div id="htmlwidget-fa54f1d1cac3f131d24e" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-fa54f1d1cac3f131d24e">{"x":{"filter":"none","data":[["185","788","333","27","614","302","704","709","374","985"],[-20.45,-23.61,-27.33,-14.72,-19.6,-19.68,-25,-21.56,-19.77,-15.54],[181.85,180.27,182.6,167.51,181.87,184.14,180,183.23,181.4,187.15],[534,537,42,155,597,242,488,271,630,60],[4.1,5,4.4,4.6,4.2,4.8,4.5,4.4,5.1,4.5],[14,63,11,18,18,40,10,36,54,17]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>lat<\/th>\n      <th>long<\/th>\n      <th>depth<\/th>\n      <th>mag<\/th>\n      <th>stations<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

All we've done here is show 10 earthquakes near Fiji on a map and shown the same data in a data table. The two presentations of the data in the map and datatable HTML widgets are independent -- searches done in the data table don't affect the map. Similarly, while you can scale the map, the map elements themselves aren't editable.

But what if we wanted to have the two widgets synchronize with one another? For example, could we have searches and row selections in the datatable drive which earthquakes are shown on the map?

The answer, of course, is yes. But the remarkable thing about crosstalk is how easy it is to create that synchronization: We only have to change one line at the beginning of the code. We simply change this line


```r
shared_df <- quakes[sample(nrow(quakes), 10),]
```

to this:


```r
shared_df <- SharedData$new(quakes[sample(nrow(quakes), 10),])
```

Now if we run that chunk of code with that simple change, the two HTML widgets interact as we want them to. Selected rows in the datatable highlight the appropriate location indicators in the map. Similarly, if you click the selection icon below the + and - zoom controls on the map and draw a box around only a few earthquakes (that's referred to as a *draggable selection*), only the rows for those earthquakes show up in the datatable below.



```r
library(crosstalk)
library(leaflet)
library(DT)
## The line below is what we changed.
shared_df <- SharedData$new(quakes[sample(nrow(quakes), 10),])
leaflet(shared_df) %>% addTiles() %>% addMarkers(~long, ~lat)
```

<!--html_preserve--><div id="htmlwidget-0a2b71a046cb2e88acc5" style="width:700px;height:415.296px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-0a2b71a046cb2e88acc5">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addSelect","args":["SharedDatafa54f1d1"]},{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addMarkers","args":[[-19.6,-19.44,-15.86,-22.42,-20.94,-22.06,-30.17,-18,-14.85,-20.9],[185.2,183.5,166.98,171.4,181.26,180.47,182.02,180.62,167.24,182.02],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},null,null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},{"ctKey":["480","106","969","721","393","559","354","462","252","809"],"ctGroup":"SharedDatafa54f1d1"}]}],"limits":{"lat":[-30.17,-14.85],"lng":[166.98,185.2]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
datatable(shared_df)
```

<!--html_preserve--><div id="htmlwidget-d4da3fb19a7e35e0831d" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-d4da3fb19a7e35e0831d">{"x":{"crosstalkOptions":{"key":["480","106","969","721","393","559","354","462","252","809"],"group":"SharedDatafa54f1d1"},"filter":"none","data":[["480","106","969","721","393","559","354","462","252","809"],[-19.6,-19.44,-15.86,-22.42,-20.94,-22.06,-30.17,-18,-14.85,-20.9],[185.2,183.5,166.98,171.4,181.26,180.47,182.02,180.62,167.24,182.02],[125,293,60,86,556,587,56,636,97,402],[4.4,4.2,4.8,4.7,4.4,4.6,5.5,5,4.5,4.3],[13,15,25,33,21,28,68,100,26,18]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>lat<\/th>\n      <th>long<\/th>\n      <th>depth<\/th>\n      <th>mag<\/th>\n      <th>stations<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false},"selection":{"mode":"multiple","selected":null,"target":"row"}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


## Crosstalk works by having widgets share a dynamic dataframe

This interactivity and synchronization is made possible by the `shared_df` object we created. `Shared_df` is an [R6 object ](https://adv-r.hadley.nz/r6.html). If you're not familiar with R6 objects, it doesn't matter -- all you need to know is that when we called `SharedData$new`, it created a new object called `shared_df` that walks, acts, and quacks like an ordinary data frame, but can dynamically change based on interactions with HTML widgets.

Only some HTML widgets work with crosstalk. You can read [the full list of HTML widgets that work with crosstalk here](https://rstudio.github.io/crosstalk/widgets.html), but here are my 3 personal go-tos:

- `leaflet`, the mapping widget we used in this example
- `DT`, the datatable widget we used in the example
- `plotly`, a general purpose plotting widget that also can make any ggplot interactive.

With crosstalk and these three HTML widgets in our toolbag, we can make a lot of very impressive interactive dashboards. However, crosstalk really shines when we add one more feature: interactive filters.

## Filter functions give the user direct control over plotting

Sometimes you want to explicitly specify the data to be plotted instead of relying on the user selecting rows or brushing across a plot. Crosstalk's three filter operatings do exactly this with the following functions:

- `filter_checkbox`: include rows in the shared dataframe whose column value equals any checked values. This is particularly useful for columns containing categorical values or factors.
- `filter_slider`: include rows in the shared dataframe whose numeric column values fit within a range of specified values.
- `filter_select`: include rows in the shared dataframe whose column value equals one of a list of possibilities. As with `filter_checkbox`, this is most useful for columns with categorical values or factors.

Let's demonstrate all these filter functions by looking at our favorite(?) data set, `mtcars`. We'll generate a plot using the `ggplotly` function of the `plotly` HTML widget, and then filter that data by the number of cylinders, horsepower, and whether the car has an automatic transmission or not. Because I'm publishing this in a blogdown post, I'm not going to try to make the plot look beautiful, but will just stack the filters inline ahead of the plot. If I were building an actual dashboard, I'd put the filter widgets inside a sidebar and dedicate most of the screen to the plot using an R Markdown layout.

The code is shown below. Play with the filter selectors and watch the plot change in response to your selections. I find it particularly fun to set the slider filter to a small range of values and then to slide the entire selection back and forth to show sub-ranges of horsepower values.


```r
library(crosstalk)
library(plotly)
#> Loading required package: ggplot2
#> 
#> Attaching package: 'plotly'
#> The following object is masked from 'package:ggplot2':
#> 
#>     last_plot
#> The following object is masked from 'package:stats':
#> 
#>     filter
#> The following object is masked from 'package:graphics':
#> 
#>     layout
new_mtcars <- mtcars %>% mutate(cyl = as.factor(cyl))
shared_mtcars <- SharedData$new(new_mtcars)
filter_checkbox("cyl", "Cylinders", shared_mtcars, ~cyl, inline = TRUE) ## that's a tilda in front of cyl, no a minus
```

<!--html_preserve--><div id="cyl" class="form-group crosstalk-input-checkboxgroup crosstalk-input">
<label class="control-label" for="cyl">Cylinders</label>
<div class="crosstalk-options-group">
<label class="checkbox-inline">
<input type="checkbox" name="cyl" value="4"/>
<span>4</span>
</label>
<label class="checkbox-inline">
<input type="checkbox" name="cyl" value="6"/>
<span>6</span>
</label>
<label class="checkbox-inline">
<input type="checkbox" name="cyl" value="8"/>
<span>8</span>
</label>
</div>
<script type="application/json" data-for="cyl">{
  "map": {
    "4": ["3", "8", "9", "18", "19", "20", "21", "26", "27", "28", "32"],
    "6": ["1", "2", "4", "6", "10", "11", "30"],
    "8": ["5", "7", "12", "13", "14", "15", "16", "17", "22", "23", "24", "25", "29", "31"]
  },
  "group": ["SharedDatacac3f131"]
}</script>
</div><!--/html_preserve-->

```r
filter_slider("hp", "Horsepower", shared_mtcars, ~hp, width = "40%")
```

<!--html_preserve--><div class="form-group crosstalk-input crosstalk-input-slider js-range-slider" id="hp" style="width: 40%;">
<label class="control-label" for="hp">Horsepower</label>
<input data-type="double" data-min="52" data-max="335" data-from="52" data-to="335" data-step="1" data-grid="true" data-grid-num="9.75862068965517" data-grid-snap="false" data-prettify-separator="," data-keyboard="true" data-keyboard-step="0.353356890459364" data-drag-interval="true" data-data-type="number"/>
<script type="application/json" data-for="hp">{
  "values": [52, 62, 65, 66, 66, 91, 93, 95, 97, 105, 109, 110, 110, 110, 113, 123, 123, 150, 150, 175, 175, 175, 180, 180, 180, 205, 215, 230, 245, 245, 264, 335],
  "keys": ["19", "8", "20", "18", "26", "27", "3", "9", "21", "6", "32", "1", "2", "4", "28", "10", "11", "22", "23", "5", "25", "30", "12", "13", "14", "15", "16", "17", "7", "24", "29", "31"],
  "group": ["SharedDatacac3f131"]
}</script>
</div><!--/html_preserve-->

```r
filter_select("auto", "Automatic", shared_mtcars, ~ifelse(am == 0, "Yes", "No"))
```

<!--html_preserve--><div id="auto" class="form-group crosstalk-input-select crosstalk-input">
<label class="control-label" for="auto">Automatic</label>
<div>
<select multiple></select>
<script type="application/json" data-for="auto">{
  "items": {
    "value": ["No", "Yes"],
    "label": ["No", "Yes"]
  },
  "map": {
    "No": ["1", "2", "3", "18", "19", "20", "26", "27", "28", "29", "30", "31", "32"],
    "Yes": ["4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "21", "22", "23", "24", "25"]
  },
  "group": ["SharedDatacac3f131"]
}</script>
</div>
</div><!--/html_preserve-->

```r
g <- ggplot(shared_mtcars) + geom_point(aes(x = wt, y = mpg, color = cyl))
ggplotly(g)
```

<!--html_preserve--><div id="htmlwidget-c7babfcb9cbf14bd50b1" style="width:700px;height:415.296px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-c7babfcb9cbf14bd50b1">{"x":{"data":[{"x":[2.32,3.19,3.15,2.2,1.615,1.835,2.465,1.935,2.14,1.513,2.78],"y":[22.8,24.4,22.8,32.4,30.4,33.9,21.5,27.3,26,30.4,21.4],"text":["wt: 2.320<br />mpg: 22.8<br />cyl: 4<br />.crossTalkKey: 3","wt: 3.190<br />mpg: 24.4<br />cyl: 4<br />.crossTalkKey: 8","wt: 3.150<br />mpg: 22.8<br />cyl: 4<br />.crossTalkKey: 9","wt: 2.200<br />mpg: 32.4<br />cyl: 4<br />.crossTalkKey: 18","wt: 1.615<br />mpg: 30.4<br />cyl: 4<br />.crossTalkKey: 19","wt: 1.835<br />mpg: 33.9<br />cyl: 4<br />.crossTalkKey: 20","wt: 2.465<br />mpg: 21.5<br />cyl: 4<br />.crossTalkKey: 21","wt: 1.935<br />mpg: 27.3<br />cyl: 4<br />.crossTalkKey: 26","wt: 2.140<br />mpg: 26.0<br />cyl: 4<br />.crossTalkKey: 27","wt: 1.513<br />mpg: 30.4<br />cyl: 4<br />.crossTalkKey: 28","wt: 2.780<br />mpg: 21.4<br />cyl: 4<br />.crossTalkKey: 32"],"key":["3","8","9","18","19","20","21","26","27","28","32"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(248,118,109,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(248,118,109,1)"}},"hoveron":"points","set":"SharedDatacac3f131","name":"4","legendgroup":"4","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","_isNestedKey":false,"frame":null},{"x":[2.62,2.875,3.215,3.46,3.44,3.44,2.77],"y":[21,21,21.4,18.1,19.2,17.8,19.7],"text":["wt: 2.620<br />mpg: 21.0<br />cyl: 6<br />.crossTalkKey: 1","wt: 2.875<br />mpg: 21.0<br />cyl: 6<br />.crossTalkKey: 2","wt: 3.215<br />mpg: 21.4<br />cyl: 6<br />.crossTalkKey: 4","wt: 3.460<br />mpg: 18.1<br />cyl: 6<br />.crossTalkKey: 6","wt: 3.440<br />mpg: 19.2<br />cyl: 6<br />.crossTalkKey: 10","wt: 3.440<br />mpg: 17.8<br />cyl: 6<br />.crossTalkKey: 11","wt: 2.770<br />mpg: 19.7<br />cyl: 6<br />.crossTalkKey: 30"],"key":["1","2","4","6","10","11","30"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,186,56,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(0,186,56,1)"}},"hoveron":"points","set":"SharedDatacac3f131","name":"6","legendgroup":"6","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","_isNestedKey":false,"frame":null},{"x":[3.44,3.57,4.07,3.73,3.78,5.25,5.424,5.345,3.52,3.435,3.84,3.845,3.17,3.57],"y":[18.7,14.3,16.4,17.3,15.2,10.4,10.4,14.7,15.5,15.2,13.3,19.2,15.8,15],"text":["wt: 3.440<br />mpg: 18.7<br />cyl: 8<br />.crossTalkKey: 5","wt: 3.570<br />mpg: 14.3<br />cyl: 8<br />.crossTalkKey: 7","wt: 4.070<br />mpg: 16.4<br />cyl: 8<br />.crossTalkKey: 12","wt: 3.730<br />mpg: 17.3<br />cyl: 8<br />.crossTalkKey: 13","wt: 3.780<br />mpg: 15.2<br />cyl: 8<br />.crossTalkKey: 14","wt: 5.250<br />mpg: 10.4<br />cyl: 8<br />.crossTalkKey: 15","wt: 5.424<br />mpg: 10.4<br />cyl: 8<br />.crossTalkKey: 16","wt: 5.345<br />mpg: 14.7<br />cyl: 8<br />.crossTalkKey: 17","wt: 3.520<br />mpg: 15.5<br />cyl: 8<br />.crossTalkKey: 22","wt: 3.435<br />mpg: 15.2<br />cyl: 8<br />.crossTalkKey: 23","wt: 3.840<br />mpg: 13.3<br />cyl: 8<br />.crossTalkKey: 24","wt: 3.845<br />mpg: 19.2<br />cyl: 8<br />.crossTalkKey: 25","wt: 3.170<br />mpg: 15.8<br />cyl: 8<br />.crossTalkKey: 29","wt: 3.570<br />mpg: 15.0<br />cyl: 8<br />.crossTalkKey: 31"],"key":["5","7","12","13","14","15","16","17","22","23","24","25","29","31"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(97,156,255,1)","opacity":1,"size":5.66929133858268,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(97,156,255,1)"}},"hoveron":"points","set":"SharedDatacac3f131","name":"8","legendgroup":"8","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","_isNestedKey":false,"frame":null}],"layout":{"margin":{"t":27.8398449544113,"r":7.30593607305936,"b":41.7941828539547,"l":37.2602739726027},"plot_bgcolor":"rgba(235,235,235,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[1.31745,5.61955],"tickmode":"array","ticktext":["2","3","4","5"],"tickvals":[2,3,4,5],"categoryorder":"array","categoryarray":["2","3","4","5"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"wt","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[9.225,35.075],"tickmode":"array","ticktext":["10","15","20","25","30","35"],"tickvals":[10,15,20,25,30,35],"categoryorder":"array","categoryarray":["10","15","20","25","30","35"],"nticks":null,"ticks":"outside","tickcolor":"rgba(51,51,51,1)","ticklen":3.65296803652968,"tickwidth":0.66417600664176,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(255,255,255,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"mpg","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.88976377952756,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895},"y":0.899739220700306},"annotations":[{"text":"cyl","x":1.02,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"left","yanchor":"bottom","legendTitle":true}],"hovermode":"closest","barmode":"relative","dragmode":"zoom"},"config":{"doubleClick":"reset","showSendToCloud":false},"source":"A","attrs":{"8e652748558c":{"x":{},"y":{},"colour":{},"key":{},"type":"scatter"}},"cur_data":"8e652748558c","visdat":{"8e652748558c":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0,"ctGroups":["SharedDatacac3f131"]},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


## Why not use Shiny instead of the crosstalk package?

Those of you who have built R Markdown dashboards before are probably wondering, "Why bother with crosstalk when we can do all of this and more in Shiny?" For some applications, R Markdown, HTML widgets, and crosstalk are a better choice for creating interactive applications because they:

- **Don't require R once the dashboard is published**. Shiny apps require a back end R environment to interact with the user, while an R Markdown dashboard with HTML widgets and crosstalk don't.
- **Generate standalone documents**. Not only do documents created using R Markdown, HTML widgets, and crosstalk not require an R back end -- they don't require any back end support whatsoever. Once your document has been knit, it runs entirely within the user's browser.
- **Can be published and viewed in any environment that hosts web pages**. Interactive applications built this way can be emailed, hosted on ordinary web servers, and used by people who don't use R at all. If the person's browser supports Javascript and HTML, that person can use your interactive document.

## But there are real limitations too

While R Markdown, HTML widgets and crosstalk are wonderful tools, using them isn't all rainbows and unicorns. Documents built using these tools aren't nearly as flexible as Shiny apps, and crosstalk imposes significant limitations to what you can do. Should you use crosstalk and HTML widgets to build an interactive application, be aware that:

- **The HTML widgets you use must support crosstalk**. While the HTML widgets we've chosen are some of the most popular, only a few others support crosstalk. Again, check with  [the full list of HTML widgets that work with crosstalk](https://rstudio.github.io/crosstalk/widgets.html) before committing to using crosstalk.
- **Your data must be in a data frame or tibble**. The foundation of crosstalk is an R6 shared dataframe object, so any data you want to use with crosstalk must be in that format.
- **All your data must fit in memory**. Because all your data will be loaded into the user's browser, crosstalk is not the tool you want if you're going to be browsing a multi-gigabyte data set.
- **Layouts and interactivity are limited**. R Markdown and crosstalk typically work with grid-based layouts built from static data. If you want a document that dynamically changes in response to real-time data, you should probably be using Shiny instead.

## Conclusion: try using crosstalk in your next interactive R Markdown project

As you can see from this posting, HTML widgets and crosstalk aren't limited to standalone dashboards; they can be embedded in most R markdown documents that generate HTML, including blodown posts and emails. And of course, you can publish them on RStudio Connect or RPubs.com -- you don't need a Shiny server to share them.

I find the best part about crosstalk and its associated HTML widgets is that they seem to work well with my typical workflow. I spend much of my time exploring teaching survey data, and I usually plot results using `ggplot` and also show the raw data using the `DT` datatable package. To make those plots interactive, I only have to share my survey dataframe with `SharedData$new()`, adjust my `ggplot` and `DT` code to use `ggplotly` and my shared dataframe, and voila -- I have an interactive way to explore my dataset. Learning to use crosstalk has saved me days of time; if you give it a try, it might do the same for you.

## Resources

If you are interested in seeing the crosstalk materials we presented during the workshop, check out the [workshop slides (in PDF form)](https://github.com/rstudio-conf-2020/rmarkdown-dashboard/blob/master/materials/slides/04-RMAID-client-side-dashboards.pdf) and the [exercises](https://github.com/rstudio-conf-2020/rmarkdown-dashboard/tree/master/materials/exercises/04-Web-based-Dashboards). You can also review the [full set of workshop materials on github](https://rstd.io/RMAID).
