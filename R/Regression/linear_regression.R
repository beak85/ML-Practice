#Simple Linear Regression

# Get the dataset
dataset = read.csv('Salary_Data.csv')


# Splitting into training and test sets
library(caTools) #or check it in packages tab
set.seed(123) #just so the examples match

split = sample.split(dataset$Salary, 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)



#Fitting Simple Linear Regression to the Training Set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)



#Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)



#Visualize the Results
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             color='red') +
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata = training_set)),
            color='blue') +
  ggtitle('Salary vs. Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')


ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             color='red') +
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata = training_set)),
            color='blue') +
  ggtitle('Salary vs. Experience (Test Set)') +
  xlab('Years of Experience') +
  ylab('Salary')