# Polynomial Regression
# (Technically a multiple linear regression model with polynomial terms)

# Get the dataset
# No splitting - small dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]



#Fitting Simple Linear Regression - for comparison
lin_regressor = lm(formula = Salary ~ .,
               data = dataset)


#Fitting Polynomial Regression
dataset$Level2 = dataset$Level^2 #create a new column with squares of the level
dataset$Level3 = dataset$Level^3 #cubes
dataset$Level4 = dataset$Level^4 #4ths
poly_regressor = lm(formula = Salary ~ .,
                    data = dataset)


#Visualizing the Linear Regression vs Polynomial Regression
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             color='red') +
  geom_line(aes(x=dataset$Level, y=predict(lin_regressor, newdata = dataset)),
            color='blue') +
  geom_line(aes(x=dataset$Level, y=predict(poly_regressor, newdata = dataset)),
            color='green') +
  ggtitle('Salary - Grade (Linear vs Polynomial Regression)') +
  xlab('Job Grade') +
  ylab('Salary')


#Predicting Linear
y_lin_pred = predict(lin_regressor, newdata = data.frame(Level = 6.5))

#Predicting Poly - supply levels 2,3,4 for 6.5
y_poly_pred = predict(poly_regressor, newdata = data.frame(Level = 6.5,
                                                           Level2 = 6.5^2,
                                                           Level3 = 6.5^3,
                                                           Level4 = 6.5^4))



