# ===========================
# 1. Basic Calculations
# ===========================
2 + 3
total <- 5 * 5
timur <- 4*5
timur <- 10
number <- 1
numbers <- c(1, 2, 3, 4, 5)
object <- c("timur", TRUE, 4)
standard_deviation <- sd(numbers)
sigma_sq <- var(numbers)
quantile(numbers)
hist(numbers)

cat("Total: ", total, "\n")
#cat("Difference: ", diff, "\n")
#cat("Product: ", product, "\n")
#cat("Quotient: ", quot, "\n")
cat("Numbers :", numbers)

text <- "Numbers :"

cat(text, numbers)
# ===========================
# 2. Basic Data Types
# ===========================
x           <- 10               # numeric
x_num       <- 10L               # integer literal
x_chr       <- "Gandalf"           # character
x_logical   <- TRUE              # logical
print(x_num);    print(class(x_num))
print(x_chr);    print(class(x_chr))
print(x_logical);print(class(x_logical))

# ===========================
# 3. Data Structures
# ===========================
vec    <- c(1, 2, 3, 4, 5)                 # atomic vector
lst    <- list("apple", 10, TRUE)             # heterogeneous list
mat    <- matrix(1:9, ncol = 3,byrow=TRUE)                 # 3×3 matrix
arr    <- array(1:24, dim = c(2, 3, 4))           # 3D array
fctr   <- factor(c("yes", "no", "yes", "yes"))   # categorical
df     <- data.frame(Name = c("Frodo", "Sam", "Merry"),
                      Age = c(51, 39, 36),
                      City = c("Shire", "Shire", "Shire"))


# ===========================
# 4. Control Flow
# ===========================
a <- 5

if (a > 10) {
  message("a is greater than 10")
} else {
  message("a is not greater than 10")
}

for (louis in 1:1000000) message(louis)

i <- 1
while (i <= 5) {
  message(i)
  i <- i + 2
}

# ===========================
# 5. Functions
# ===========================
my_mean <- function(x) sum(x) / length(x)      # custom mean
v       <- c(1, 2, 3, 4, 5)
msg     <- paste("Mean is", my_mean(v))
message(msg)

add_xy <- function(x, y) x + y                  # adder
message("3+4 =", add_xy(3, 4))

# ===========================
# 6. Data Manipulation (dplyr)
# ===========================
library(dplyr)
data <- data.frame(
  ID   = 1:5,
  Name = c("Aragorn", "Frodo", "Sam", "Legolas", "Gimli"),
  Age  = c(88, 51, 39, 2931, 140)
)

filtered_data <- data %>%
  mutate(Group = if_else(Age < 40, "Young", "Old")) %>%
  filter(Group == "Young")
print(filtered_data)

# ===========================
# 7. Visualization (ggplot2)
# ===========================
library(ggplot2)
plot_df <- data.frame(x = 1:5, y = 2 * (1:5))

# static scatter + histogram
ggplot(plot_df, aes(x, y)) + geom_point() + labs(title="Scatter")
ggplot(plot_df, aes(x))   + geom_histogram(bins = 5) + labs(title = "Histogram")

# bar chart example
bar_df <- data.frame(Category = LETTERS[1:5], Value=c(10, 25, 15, 30, 20))
ggplot(bar_df, aes(Category, Value, fill = Category)) +
  geom_col(width = 0.7) + theme_minimal() + labs(title = "Bar Plot")