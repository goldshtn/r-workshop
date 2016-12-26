# This tutorial is based on Torfs and Brauer's "A very short introduction to R"
# from https://cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf
#
# You can follow the tutorial by executing bits of code from this window by
# selecting them and typing Ctrl+Enter (or Cmd+Enter on macOS). To execute a
# whole line, you don't have to select it -- just put the cursor on the line
# and type Ctrl+Enter (Cmd+Enter).

print("Welcome to R!")

# You can use R as a calculator:
100*(31/365)
10^2 + 136

# You can put values inside variables using `=` or `<-`:
weight = 112
height = 1.93
bmi <- weight/(height*height)
print(bmi)

# Vectors (arrays) are defined using `c`:
weights = c(112, 62, 86, 108)
heights = c(1.93, 1.65, 1.77, 1.98)

# You can perform computations on vectors as you can on scalars:
bmis = weights/(heights*heights)
print(bmis)

# You can access individual elements or slices using `[]`, starting from 1:
bmis[1]
weights[3:4]

# Some useful functions for working with vectors (and other types of data):
mean(weights)   # mean = average
sum(heights)
median(bmis)
summary(bmis)

# You can use logical operators to select a range of indices:
bmis > 27.5
bmis[bmis > 27.5]

# R can make a variety of graphs (plots). Here is an example. The `rnorm`
# function draws random values from a normal distribution with the specified
# mean and standard deviation. The plot will appear in the Plots pane on the
# right side of R Studio.
requests_per_second = rnorm(40, mean = 800, sd = 600)
requests_per_second[requests_per_second < 0] <- 0   # smooth negative values
plot(requests_per_second, type = "l")   # 'l' stands for "lines"
hist(requests_per_second)

# To get help for a specific function or concept, use `help` or `example`:
help(lines)
example("hist")

# A matrix is a two-dimensional vector:
apartments = matrix(c(130, 85, 65, 8000, 4700, 5500), ncol=2)
apartments
mean(apartments[,2])   # average rent

# A lot of data is easier to organize and work with in data frame. A data frame
# is a matrix with named columns. This is highly convenient:
apartments = data.frame(area = c(130, 85, 65, 95, 115), rent = c(8000, 4700, 5500, 5150, 5600))
apartments$area
summary(apartments)
plot(apartments, col = "red", lwd=3, pch=4, cex=2)

# You can set your working directory using the `setwd` function. This is where
# your scripts and data will be loaded from by default. Run the following
# line to try this -- there will be no change, of course, because the `getwd`
# function returns the current directory.
setwd(getwd())

# **TODO**: Use `setwd` to set the current directory to this script's location,
# which is where the following data file is (december-weather-murdoch.csv).

# To read a file, use `read.nnn` methods. There are built-in methods that will
# read a CSV into a data frame, for example.
weather = read.csv("december-weather-murdoch.csv")
summary(weather$temperature)
plot(weather$temperature, col = "blue", type = "l", xaxt="n", xlab="", ylab="")
par(new=TRUE)
plot(weather$pressure, col = "red", type = "l", xaxt="n", yaxt="n", xlab="", ylab="")
axis(4)

# R has many packages. To install a new package, use `install.packages` or the
# Packages pane in R Studio (on the right). Run the following line to install
# the dplyr package (sort of like LINQ for C# developers):
install.packages("dplyr")

# To load a package, use the `library` function or check the checkbox next to
# the package in the Packages pane:
library(dplyr)

# Here is an example of using dplyr's `filter` function and %>% operator:
weather %>% filter(temperature > 40)
