#Multiple Linear Regression w/ Backward Elimination

# Get the dataset
dataset = read.csv('50_Startups.csv')


# Splitting into training and test sets
library(caTools) #or check it in packages tab
set.seed(123) #just so the examples match

split = sample.split(dataset$Profit, 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)



#Fitting Simple Linear Regression to the Training Set
#Each independent variable listed separately
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset) #could use training set - full dataset gives better results
summary(regressor)

#Remove State - not significant
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset) 
summary(regressor)

#Remove Administration - not significant
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset)
summary(regressor)

#Remove Marketing.Spend? - not significant - but very close .06
regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset) 
summary(regressor)

#Predicting the test results
y_pred = predict(regressor, newdata = test_set)
y_pred
