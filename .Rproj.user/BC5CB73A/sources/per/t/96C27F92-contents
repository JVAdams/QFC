# HTML Widgets for Interactive Visualizations in R
# author: Jean V. Adams
# date: 13 February 2018

# Install packages
install.packages(c(
  "DT",
  "plotly",
  "leaflet",
  "heatmaply"
))

# Read in the data
load(url(
  "https://github.com/JVAdams/QFC/raw/master/TIQS.RData"
))

ls()

# Look at the data
head(enrollment)
head(survey)
head(catch)
head(smelt)



#### Data table ####

library(DT)
datatable(survey)

# Add the ability to filter
datatable(survey, filter="top")
# A few other options
datatable(survey,
  caption="Lake Huron bottom trawl operations",
  rownames=FALSE,
  options=list(pageLength=5)
)



#### Plotly  ####

# 2D scatter plot
library(plotly)
plot_ly(data=enrollment, x=~Year, y=~Number,
    color=~Degree,
    type="scatter", mode="markers") %>%
  layout(title=
      "MSU Degrees Conferred, 1861-2017")

# 3D scatter plot
plot_ly(data=smelt, x=~year, y=~lat, z=~depth,
  color=~n^0.2,
  type="scatter3d", mode="markers")



#### Leaflet ####

library(leaflet)
leaflet(data=survey) %>%
  addTiles() %>%
  addMarkers(lng=~long, lat=~lat,
    label=~as.character(opid))

# Color symbols by depth
mypalette <- colorNumeric(
  palette="RdBu", domain=NULL)
leaflet(data=survey) %>%
  addTiles() %>%
  addCircleMarkers(lng=~long, lat=~lat,
    color=~mypalette(depth)) %>%
  addLegend(pal=mypalette, values=~depth,
    position="bottomleft", opacity=1,
    title="Depth (m)")



#### Heatmaply ####

library(heatmaply)
heatmaply(sqrt(catch),
  xlab="Species", ylab="Depth (m)",
  main="Lake Huron, 2006-2010",
  margins = c(150, 60, 30, 0))

# Don't reorder rows
heatmaply(sqrt(catch), Rowv=NULL,
  xlab="Species", ylab="Depth (m)",
  main="Lake Huron, 2006-2010",
  margins = c(150, 60, 30, 0))



# More Information
# HTML Widgets - http://www.htmlwidgets.org/
# Data tables - https://rstudio.github.io/DT/
# Plotly - https://plot.ly/r/
# Leaflet - http://rstudio.github.io/leaflet/
# Heatmaply -
#   https://cran.r-project.org/web/packages/heatmaply/vignettes/heatmaply.html
