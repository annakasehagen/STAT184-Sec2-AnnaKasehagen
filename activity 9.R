library(dplyr)
library(ggplot2)
library(esquisse)
library(plotly)
data(diamonds)

#View(diamonds)

#esquisser(diamonds)

diamondsFiltered <- diamonds %>%
  filter(depth >= 55L & depth <= 70L) #filters out certain depths so the visualization focuses more where the data in centered to be used for the graphic
ggplot(
    data = diamondsFiltered, #sets the data set to be the filtered diamonds
    mapping = aes(x = price, y = depth, colour = cut) #sets the axes to be price and depth and color the data points by the cut
  ) + 
  geom_point(size = 0.85) + #sets the point size for easier readability
  scale_color_manual(
    values = c(Fair = "#E25A50", #sets the colors for each of the cuts so they can be easilty distinguished
               Good = "#7474E1",
               `Very Good` = "#79DA5A",
               Premium = "#FF61D7",
               Ideal = "#41C5EF")
  ) +
  labs(x = "Price", #sets labels for the x axis, y axis, and legend
       y = "Depth",
       colour = "Cut",
       title = "Depth by Price by Cut") + #sets a title for the visualization so it is more clear what is being displayed
  theme_light() #sets the theme to light so that grid lines appear for easier tracking and a light border around the entire visualization to delineate what is not in the graphic

library(palmerpenguins)
View(penguins)
esquisser(penguins)

ggplot(
  data = penguins,
  mapping = aes(x = year, y = body_mass_g, fill = island)
  ) +  #sets the x axis to be year, y axis to be body mass, and fills everything by island
  geom_smooth(se = TRUE, colour = "#112446") + #uses the smooth graphic to represent the change in body mass over time
  scale_fill_manual(                        #sets the colors that represent the islands manually 
    values = c(Biscoe = "#A94943",  
               Dream = "#086914",
               Torgersen = "#B155C8")
  ) + #sets the labels of the axes to be more clear and creates a title
  labs(
    x = "Year",
    y = "Body Mass (g)",
    title = "Body Mass by Year by Island",
    fill = "Island"
  ) +
  theme_light()#sets the theme to light so that there is a light border around the outside


library(dcData)
View(BabyNames)

BabyNamesFiltered <- BabyNames %>% #wrangles the data from the BabyNames dataset
  filter(name == "Mary" | name == "Michael" | name == "Sherry" | name == "Brian") %>% #filters out all of the cases besides the ones that that have one of the four names
  group_by(name, year) %>% #groups by name and year since the gender of the baby who has the name doesn't matter in terms of measuring the popularity of the name
  summarize( #uses the summarize function so that the count is the sum of the counts for both boys and girls with the name
    count = sum(count)
  )
View(BabyNamesFiltered)

esquisser(BabyNamesFiltered)

ggplot(
  data = BabyNamesFiltered, #uses the filtered data of just the four names for the graphic
  mapping = aes(x = year, y = count, colour = name) ) + #sets the x axis to be year, y to be count, and the color of the lines to be the names
  geom_line(linewidth = 0.75) + #makes the line width 0.75 so it's easier to see
  scale_color_manual( #manually sets the colors that represents each of the names
    values = c(Brian = "#4740E8",
               Mary = "#E12BE4",
               Michael = "#66EC7A",
               Sherry = "#F92121")
  ) +
  labs( #creates labels for the axes and legend and creates a title
    x = "Year",
    y = "Count",
    title = "Popularity of Names Brian, Mary, Michael, and Sherry Over Time",
    color = "Names"
  ) +
  theme_light() #sets theme to light to add a border


