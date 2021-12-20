#Multiple Linear Regression

# Get the dataset
dataset = read.csv('50_Startups.csv')


# Splitting into training and test sets
library(caTools) #or check it in packages tab
set.seed(123) #just so the examples match

split = sample.split(dataset$Profit, 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)



#Fitting Simple Linear Regression to the Training Set
regressor = lm(formula = Profit ~ .,
               data = training_set)


#Predicting the test results
y_pred = predict(regressor, newdata = test_set)
y_pred