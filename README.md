# Introduction
In this repository I have included my work from activity 9 from STAT 184. In this activity I used the diamonds, penguins, and babynames datasets, all part of different libraries that can be found in R, and created data visualizations for each of them. For the diamonds dataset I evaluated the relationship between cut, price, and depth. For the penguins dataset I looked at the relationship between the body mass of a penguin and what island they are from over time. For the last dataset, BabyNames, I looked at the popularity of 4 names, Brian, Mary, Michael, and Sherry, from 1880-2013.

# Implementation
For all of the plots I created, I used functions from the gg_plot2 package. I used these functions to give point/font sizes, set colors for certain attributes, and add labels to the axes and titles.

Problems I ran into:
Diamonds:
For this dataset, I started out by using all of the data that was given, but quickly realized that there would just be way too much, so I decided to cut it down using the filter function, as seen below. 

diamondsFiltered <- diamonds %>%
filter(depth >= 55L & depth <= 70L)

BabyNames:
The data visualization for this dataset took an extra step than the others. After I picked the names I wanted, I had to wrangle the data so that only those names would be included. This extended beyong just filtering out every other name, I had to account for the fact that the gender of the child didn't matter in terms of measureing the popularity of the name. To do this, I used the group_by function for the attributes name and year and piped the summarize function with the sum of the counts, so that the result would be all of the names, boys and girls combined. 

BabyNamesFiltered <- BabyNames %>% 
filter(name == "Mary" | name == "Michael" | name == "Sherry" | name == "Brian") %>% 
group_by(name, year) %>% 
summarize( 
count = sum(count)
)

# Resulting Data Visualizations
The results of this activity yielded 3 data visualizations.
Diamonds:
A scatterplot that shows the relationship between price, depth, and cut of a diamond with price being the x axis, depth being the y axis, and the different cuts being different colors. 

![image](https://github.com/user-attachments/assets/00c6cc21-c268-45db-a4ed-1f488243b622)

Penguins:
A line graph that shows the trend between the body mass of a penguin and the island that it is from over the course of 2007-2009. Year is the x axis, body mass in grams in the y axis, and the different lines/colors show different islands. The bubbles around the lines show the confidence intervals for the averages shown by the solid lines. 

![image](https://github.com/user-attachments/assets/4e7359fb-dfe5-4c47-aa8e-38bef264624d)

BabyNames:
A line graph that shows the popularity of the names Brian, Mary, Michael, and Sherry from 1880-2013, regardless of gender. The x axis displays the year, the y axis displays the count of the name, and the different colored lines are used to represent each of the four names with the legend on the right clarifying which is which. 

![image](https://github.com/user-attachments/assets/62b72dd3-bc05-45de-83c1-80a2b80dc399)

# Contact
Any comments or questions? Reach out to me: azk6339@psu.edu
