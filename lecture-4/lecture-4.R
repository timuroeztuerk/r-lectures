# -------------------------------------------
# Introduction to ggplot2 + sf
# -------------------------------------------
##########---------------------
##########---- 1. Packages ----
##########---------------------
# Run once if needed:
# install.packages(c("tidyverse", "sf"))
library(tidyverse)   # loads ggplot2, dplyr, etc.
library(sf)

##########---------------------
##########----- 2. ggplot2 ----
##########---------------------
# ggplot2 builds plots layer by layer with different geometric objects
# We can first use the classic miles per gallon example.
data(mpg, package = "ggplot2")
head(mpg)

# Basic Data Exploration and creating figures.
# Scatterplot
# 1. Data (mpg)
# 2. Aesthetic mappings (x = displ, y = hwy)
# 3. Geometric objects (points)
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  labs(title = "Engine size vs. highway MPG",
      x = "Engine displacement (L)", 
      y = "Highway MPG")

# There are also very easy possibilities if you would like to display
# several categories in one figure, called "facet"s.
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~ cyl) +
  labs(title = "Fuel economy by cylinders")

# As you might imagine, saving a figure is also relatively easy.
ggsave("figures/fuel_economy.png", width = 6, height = 4, dpi = 300)

# Adding other components to make our graph nicer.
ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  labs(title = "Fuel economy by vehicle class",
       subtitle = "Relationship between engine size and efficiency",
       caption = "Source: EPA fuel economy data") +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    plot.title = element_text(face = "bold"),
    panel.grid.minor = element_blank()
  )

##########------- Exercise Set 1 -------------
# Question 1: Please change the labels on X and Y axis to your liking.
# Question 2: Then save the figure again like we did above, observe the change.
##########-------------------------------------

# Remember the OOP principles. We can already create a theme for ourselves
# and then use it in later figures.
my_theme <- theme_light() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    axis.title = element_text(face = "italic"),
    legend.position = "bottom"
  )

# Apply the custom theme
ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  labs(title = "Using a custom theme") +
  my_theme

##########------- Exercise Set 2 -------------
# Question 1: Please go to the ggplot2 documentation.
# Question 2: Create a theme for yourself, you should have at least 10 lines.
##########------------------------------------

##########---------------------
##########----- 3. Spatial data with sf ----

# https://r-spatial.github.io/sf/index.html
# https://r-spatial.github.io/sf/articles/sf1.html
# https://r-spatial.org/book/01-hello.html

library(sf)
nc <- st_read(system.file("shape/nc.shp", package="sf"))

class(nc)
print(nc)
print(nc[9:15], n = 3)
st_crs(nc)

nc.no_sf <- as.data.frame(nc)
class(nc.no_sf)

##########---------------------
# Simple outline map
ggplot(nc) +
  geom_sf() +
  labs(title = "North Carolina counties")

##########---------------------
# Visualizing attributes with point size
ggplot(nc) +
  geom_sf(aes(size = AREA), color = "navy", fill = "lightblue", alpha = 0.5) +
  labs(title = "North Carolina counties by area",
       size = "Area") +
  theme_minimal()

##########---------------------
# Births
ggplot(nc) +
  geom_sf(aes(fill = BIR74)) +
  scale_fill_viridis_c(option = "plasma") +
  labs(title = "births (1974-78)",
       fill = "Rate")

##########---------------------
# Example from the book.
# Data manipulation. (Advanced with dpylr, skip if confused)
nc |> select(SID74, SID79) |> pivot_longer(starts_with("SID")) -> nc_longer

# Label Management.
year_labels <- c("SID74" = "1974 - 1978", "SID79" = "1979 - 1984")
# Plotting.
ggplot() + geom_sf(data = nc_longer, aes(fill = value), linewidth = 0.4) + 
  facet_wrap(~ name, ncol = 1, labeller = labeller(name = year_labels)) +
  scale_y_continuous(breaks = 34:36) +
  scale_fill_gradientn(colors = sf.colors(20)) +
  theme(panel.grid.major = element_line(color = "white"))
