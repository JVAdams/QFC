# install packages
install.packages(c(
  "DT",
  "plotly",
  "leaflet",
  "heatmaply"
)


# read in data
tiqsdat <- "https://github.com/JVAdams/vizzy/raw/master/TIQS.RData"
load(url(tiqsdat))

head(enrollment)
head(survey)
head(catch)
head(smelt)


# data tables
library(DT)
datatable(survey)

datatable(survey, filter="top")

datatable(survey,
  caption="Lake Huron bottom trawl operations",
  rownames=FALSE,
  options=list(pageLength=5)
)


# 2D and 3D scatterplots
library(plotly)
plot_ly(data=enrollment, x=~Year, y=~Number, color=~Degree,
  type="scatter", mode="markers") %>%
  layout(title="MSU Degrees Conferred, 1861-2017")

plot_ly(data=smelt, x=~year, y=~lat, z=~depth, color=~n^0.2,
  type="scatter3d", mode="markers")


# Maps
library(leaflet)
leaflet(data=survey) %>%
  addTiles() %>%
  addMarkers(lng=~long, lat=~lat, label=~as.character(opid))

mypalette <- colorNumeric(palette="RdBu", domain=NULL)
leaflet(data=survey) %>%
  addTiles() %>%
  addCircleMarkers(lng=~long, lat=~lat, color=~mypalette(depth)) %>%
  addLegend(pal=mypalette, values=~depth,
    position="bottomleft", opacity=1, title="Depth (m)")


# Heat map
library(heatmaply)
heatmaply(sqrt(catch),
  xlab="Species", ylab="Depth (m)", main="Lake Huron, 2006-2010",
  margins = c(150, 60, 30, 0))

heatmaply(sqrt(catch), Rowv=NULL, k_col=4,
  xlab="Species", ylab="Depth (m)", main="Lake Huron, 2006-2010",
  margins = c(150, 60, 30, 0))


