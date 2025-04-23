# Vectors, matrices and dataframes.
age <- c(28, 48, 47, 71, 22, 80, 48, 30, 31)
# Interaction between a vector and a scalar.
age_months <- age * 12
# Another vector.
purchase <- c(20, 59, 2, 12, 22, 160, 34, 34, 29)
# What if we put two or more vectors together?
bookstore <- data.frame(age, purchase)

# When we enter data into a vector, we can put line breaks between the commas:
distances <- c(687, 5076, 7270, 967, 6364, 1683, 9394, 5712, 5206,
               4317, 9411, 5625, 9725, 4977, 2730, 5648, 3818, 8241,
               5547, 1637, 4428, 8584, 2962, 5729, 5325, 4370, 5989,
               9030, 5532, 9623)
distances

sqrt(pi)
exp(2) * log(4, base = 10)

# or
exp(2) * log(4)
test <- sqrt(-1)

# Let's talk about packages you will need.
install.packages('ggplot2')
library(ggplot2)

# MSR Book follows the 'msleep' dataset example.
View(msleep)

# There are several functions that are useful for exploring the data.
head(msleep)
tail(msleep)
dim(msleep)
str(msleep)
names(msleep)

# Still, this 'msleep' object is not in our environment.
?msleep
# Let's import it to our folder.
data(msleep)
summary(msleep)

# --------------
# Numerical Data
# --------------
msleep$sleep_total

mean(msleep$sleep_total)      # Mean
median(msleep$sleep_total)    # Median
max(msleep$sleep_total)       # Max
min(msleep$sleep_total)       # Min
sd(msleep$sleep_total)        # Standard deviation
var(msleep$sleep_total)       # Variance
quantile(msleep$sleep_total)  # Various quantiles

# You can, of course, filter as well. 
sum(msleep$sleep_total > 8)   # Frequency (count)
mean(msleep$sleep_total > 8)  # Relative frequency (proportion)

# --------------
# Working with NA. 
# --------------
# Important concept for programming. 
# Common 'problem' that people who are beginners encounter.

mean(msleep$sleep_rem)
?mean
mean(msleep$sleep_rem, na.rm = TRUE)
cor(msleep$sleep_total, msleep$sleep_rem)
cor(msleep$sleep_total, msleep$sleep_rem, use = "complete.obs")

# --------------
# Categorical Data
# --------------
msleep$vore
proportions(table(msleep$vore))

# Counts:
table(msleep$vore, msleep$conservation)

# Proportions, per row:
proportions(table(msleep$vore, msleep$conservation),
            margin = 1)

# Proportions, per column:
proportions(table(msleep$vore, msleep$conservation),
            margin = 2)

# Proportions, out of total:
proportions(table(msleep$vore, msleep$conservation))

ggplot(msleep, aes(brainwt, sleep_total, colour = vore)) + 
  geom_point() +
  labs(x = "Brain weight",
       y = "Total sleep time") +
  xlim(0, 0.2) +
  ylim(0, 20)

myPlot <- ggplot(msleep, aes(brainwt, sleep_total)) + 
  geom_point() +
  labs(x = "Brain weight (logarithmic scale)",
       y = "Total sleep time") +
  scale_x_log10() +
  facet_wrap(~ vore)

ggsave("test.pdf", myPlot, width = 5, height = 5)

# --------------
# Ex. 2.11.
# --------------
# Install and load the palmerpenguins package.
# In this exercise, we’ll study the penguins dataset contained in said package.

# View the documentation for the penguins data and read about its variables.

# Check the data structures: how many observations and variables and what type of variables (numeric, categorical, etc.) are there?
  
# Compute summary statistics (means, median, min, max, counts for categorical variables). Are there any missing values?

ggplot(penguins, aes(bill_length_mm, flipper_length_mm, colour = species)) +
  geom_point() +
  labs(x = "Bill length (mm)",
       y = "Flipper length (mm)")


ggplot(penguins, aes(bill_length_mm, flipper_length_mm, colour = species)) +
  geom_point(alpha = 1) +
  labs(x = "Bill length (mm)",
       y = "Flipper length (mm)")


ggplot(penguins, aes(bill_length_mm, flipper_length_mm,
                     colour = species,
                     shape = island)) +
  geom_point() +
  labs(x = "Bill length (mm)",
       y = "Flipper length (mm)")

ggplot(penguins, aes(bill_length_mm, 
                     flipper_length_mm,
                     colour = species, 
                     shape = island,size = body_mass_g)) + 
  geom_point(alpha = 0.5) +  
  labs(x = "Bill length (mm)",y = "Flipper length (mm)")