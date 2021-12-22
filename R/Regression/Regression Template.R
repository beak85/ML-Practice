# _____ Regression
# 

# Get the dataset
# No splitting - small dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


#Fitting Polynomial Regression
#Create a regressor here
regressor = 

#Predicting 
y_poly_pred = predict(regressor, newdata = data.frame(Level = 6.5))


#Visualizing the Regression Results
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             color='red') +
  geom_line(aes(x=dataset$Level, y=predict(regressor, newdata = dataset)),
            color='green') +
  ggtitle('Salary ~ Grade Regressor') +
  xlab('Job Grade') +
  ylab('Salary')

#Visualizing the Regression Results - High Res
#install.packages('ggplot2')
library(ggplot2)

#Make level at .1 resolution
x_grid = seq(min(dataset$Level), max(dataset$Level), .1)

#plot
ggplot() +
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             color='red') +
  geom_line(aes(x=x_grid, y=predict(regressor, newdata = data.frame(Level + x_grid))),
            color='green') +
  ggtitle('Salary ~ Grade Regressor') +
  xlab('Job Grade') +
  ylab('Salary')





