######################
### dplyr#############
######################
install.packages("tidyverse")
library(dplyr)
data(iris)

### Summarize#############
sum <- summarise(iris, Mean.width = mean(iris$Sepal.Width))
head(sum)

### Manipulate#############
### select
# (1) by column names
selection1 <- dplyr::select(iris, Sepal.Length, Sepal.Width, Petal.Length)
head(selection1) 
# (2) by column range
selection2 <- dplyr::select(iris, Sepal.Length:Petal.Length)
head(selection2, 4)
# (3) by column range number
selection3 <- dplyr::select(iris,c(2:5))
head(selection3)
# Use [-] to hide a particular column
selection4 <- dplyr::select(iris, -Sepal.Length, -Sepal.Width)
head(selection4)

### filter
# (1) Select setosa species
filtered1 <- filter(iris, Species == "setosa" )
head(filtered1,3)
# (2) Select versicolor species with Sepal width more than 3
filtered2 <- filter(iris, Species == "versicolor", Sepal.Width > 3)
tail(filtered2)

### mutate <- create new columns 
# (1) To create a column “Greater.Half” which stores a logical vector (T/F)
mutated1 <- mutate(iris, Greater.Half = Sepal.Width > 0.5 * Sepal.Length)
tail(mutated1)
head(mutated1)
table(mutated1$Greater.Half)

### arrange
# (1) Sepal Width by ascending order
arranged1 <- arrange(iris, Sepal.Width)
head(arranged1)
# (2) Sepal Width by descending order [desc]
arranged2 <- arrange(iris, desc(Sepal.Width))
arranged2 <- arrange(iris, -Sepal.Width)
head(arranged2)

### group_by
# Mean sepal width by Species
gp <- group_by(iris, Species)
gp.mean <- summarise(gp,Mean.Sepal = mean(Sepal.Width))
gp.mean

### Pipe operator############





