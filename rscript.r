library(micromap)
library(nzcensus)
library(extrafont)
library(mbiemaps) # for the territorial authority map
library(tidyverse)
library(testthat)
library(scales)
library(ggrepel)

the_font <- "Calibri"
theme_set(theme_minimal(base_family = the_font))

#============polish up the example from the ?lmplot helpfile===============
data("USstates")
data("edPov")
setwd('/Users/ravirane/Desktop/GMU/STAT515/redesign')
# convert from SpatialPolygonsDataFrame into a data frame (similar to fortify)
statePolys <- create_map_table(USstates, 'ST')
USstates
edPov
stateData <- read.csv(file='data.csv', header=TRUE, sep=",")
# draw graphic
lmplot(stat.data = stateData,
       map.data = statePolys,
       panel.types = c('labels', 'bar', 'dot', 'dot','map'),
       panel.data = list('Name','DEN','TAX','CRM',NA),
       ord.by = 'HDI',
       grouping = 5,
       colors = brewer.pal(5, "Spectral"),
       median.row = TRUE,
       # how to merge the two data frames:
       map.link = c('Code', 'ID'),
       # stroke colour of the borders of previously-drawn areas:
       map.color2 = "white",
       # how to save the result:
       print.file = "0095-eg1.png",
       print.res = 800,
       plot.width = 12,
       plot.height = 12,
       # attributes of the panels:
       panel.att = list(
         list(1, header = "States",
              panel.width = 1,
              text.size = 0.8,
              align = 'right',
              panel.header.font = the_font,
              panel.header.face = "bold",
              text.font = the_font,
              left.margin = 2,
              right.margin = 1),
         list(2, header = "Population Density\nper sq mile",
              panel.width = 1.2,
              xaxis.title = 'Number of people',
              xaxis.ticks = list(100, 500, 1000),
              xaxis.labels = list(100, 500, 1000),
              graph.bgcolor = 'lightblue',
              graph.grid.color = "grey99",
              graph.border.color = "white",
              panel.header.font = the_font,
              panel.header.face = "bold"),
         list(3, header = "Tax contribution",
              panel.width = 1.2,
              xaxis.title = 'In Billions',
              xaxis.ticks = list(100, 200, 300, 400),
              xaxis.labels = list(100, 200, 300, 400),
              graph.bgcolor = 'lightblue',
              graph.grid.color = "grey99",
              graph.border.color = "white",
              panel.header.font = the_font,
              panel.header.face = "bold"),
         list(4, header = "Crime Rate per 10K",
              panel.width = 1.2,
              xaxis.title = 'Incident count',
              xaxis.ticks = list(20, 40, 60, 60),
              xaxis.labels = list(20, 40, 60, 60),
              graph.bgcolor = 'lightblue',
              graph.grid.color = "grey99",
              graph.border.color = "white",
              panel.header.font = the_font,
              panel.header.face = "bold"),
         list(5, header = 'Light gray means\nhighlighted above',
              panel.width = 0.8,
              panel.header.font = the_font,
              panel.header.face = "italic")
       ))
