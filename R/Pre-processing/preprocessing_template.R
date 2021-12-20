# Get the dataset
dataset = read.csv('Data.csv')
#dataset = dataset[, column1:column2] #if we just need a subset of columns


# Splitting into training and test sets
# install.packages('caTools') #if not installed already
library(caTools) #or check it in packages tab
set.seed(123) #just so the examples match

split = sample.split(dataset$Purchased, 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Feature Scaling - numeric columns only!
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

