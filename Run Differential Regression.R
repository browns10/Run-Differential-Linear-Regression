#Read in Data
read.csv("baseball.csv")
str(baseball)
baseball = read.csv("baseball.csv")

#Subset to only include moneyball years
moneyball = subset(baseball, Year < 2002)

#Compute Run Differential 
moneyball$RD = moneyball$RS - moneyball$RA

#Scatterplot to check for linear relationship
plot(moneyball$RD, moneyball$W, main = "Wins vs Run Differential", 
     xlab = "Run Differential", ylab = "Wins")
#There is an obvious positive correlation

#Regression Model to predict Wins
lm(W ~ RD, data=moneyball)
WinsReg = lm(W ~ RD, data=moneyball)
summary(WinsReg)

#Add regression line, coeffecients of 
abline(80.881375, 0.105766)

#There will be a greater Run Differential if the team scores more runs


#Regression Model to predict runs scored
lm(RS ~ OBP + SLG + BA, data=moneyball)
RunsReg = lm(RS ~ OBP + SLG + BA, data=moneyball) 
summary(RunsReg)

#Call:
  lm(formula = RS ~ OBP + SLG + BA, data = moneyball)

#Residuals:
#  Min      1Q  Median      3Q     Max 
#-70.941 -17.247  -0.621  16.754  90.998 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  -788.46      19.70 -40.029  < 2e-16 ***
#  OBP          2917.42     110.47  26.410  < 2e-16 ***
#  SLG          1637.93      45.99  35.612  < 2e-16 ***
#  BA           -368.97     130.58  -2.826  0.00482 ** 
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 24.69 on 898 degrees of freedom
#Multiple R-squared:  0.9302,	Adjusted R-squared:   0.93 
#F-statistic:  3989 on 3 and 898 DF,  p-value: < 2.2e-16


RunsReg = lm(RS ~ OBP + SLG, data=moneyball)
summary(RunsReg)

#Call:
  lm(formula = RS ~ OBP + SLG, data = moneyball)

#Residuals:
#  Min      1Q  Median      3Q     Max 
#-70.838 -17.174  -1.108  16.770  90.036 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  -804.63      18.92  -42.53   <2e-16 ***
#  OBP          2737.77      90.68   30.19   <2e-16 ***
#  SLG          1584.91      42.16   37.60   <2e-16 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 24.79 on 899 degrees of freedom
#Multiple R-squared:  0.9296,	Adjusted R-squared:  0.9294 
#F-statistic:  5934 on 2 and 899 DF,  p-value: < 2.2e-16

