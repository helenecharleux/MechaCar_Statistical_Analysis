# MechaCar_Statistical_Analysis

## 1. Linear Regression to Predict MPG

We have used the MechaCar_mpg dataset to work on a prediction of the mile per gallon (MPG) data. The variables available are the following:
  - the vehicle length
  - the vehicle weight
  - the spoiler angle
  - the ground clearance
  - and AWD.
  - 
In order to find the variable/coefficient which provides a non-random amount of variance to the MPG values in the dataset, we have to analyze our p-value. The p-value tells us the likelihood that we would see similar results if we tested our dataset again. If the p-value is inferior to our significance level (alpha), our null hypothesis is FALSE and we can conclude that the results are not influenced by random events. 

To determine the p-value for our dataset, we did first a multiple linear regression analysis. On our multiple linear regression model, we use the summary() function to claculate the p-value.

![p-value_1](https://user-images.githubusercontent.com/85641189/135129805-a27869be-8264-4ece-a83a-a142e2594e04.png)

In the summary output, each Pr(>|t|) value represents the probability that each variable/coefficient contributes a random amount of variance to the linear model. According to our results, vehicle length and ground clearance are statistically unlikely to provide random amounts of variance to the linear model.

The slope of the linear model is provided by the multiple linear regression analysis. The coefficients for each variable in the linear equation is as follow:

![reg_coeff](https://user-images.githubusercontent.com/85641189/135129846-b1b05f18-3c14-4435-b33c-3cec254503b9.png)

Only two variables are significant in our analysis. We can't conlcude that this linear model predict mpg of MechaCar prototypes effectively. We might go further with our analysis and find if there are other variables that can help explain the variability of our dependent variable that have not been included in our model. 
Despite the number of significant variables, the r-squared value of our linear model is 0.71, which means that roughly 71% of the variablilty of our dependent variable (MPG) is explained using this linear model. However we have to highlight that the p-value is insignificant (p-value: 5.35e-11).

## 2. Summary Statistics on Suspension Coils

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. The overall variance for our dataset is 62,29 as seen is the below table: 

![Total_var](https://user-images.githubusercontent.com/85641189/135143821-f572ac1f-5abc-47c6-9987-361dd19efbf1.png)

However, the analysis of the variance for the three different lots reveals that the lot number 3 does not meet the design specifications. The lot 3's variance is 170,3.

![Lot_var](https://user-images.githubusercontent.com/85641189/135143929-8b5b400b-d94c-4e27-9de4-09e24176a19a.png)

## 3. T-Tests on Suspension Coils

Assuming our significance level was the common 0.05 percent, the p-value for the overall population is above the significance level with a p-value of 0,06. 

![Overall_pop_pvalue](https://user-images.githubusercontent.com/85641189/135186695-64c8c9a3-d0f0-4895-8e5d-68c8db45b381.png)

Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the PSI across all manufacturing lots is statistically similar to the population mean of 1,500 pounds per square inch.

We have then created three samples (lot1, lot2, lot3) corresponding to the three lots in order to check each of it. We have used the same t.test() function with the following code:

``t.test(lot1_sample$PSI, mu=1500)``

The statistical results below highlight the fact that lot1 and lot2 have a p-value above the significance level of 0,05. We would state that we don't have sufficient evidence to reject the null hypothesis. As concluded for the overall population, we would state that the PSI across the manufacturing lots 1 and 2 is statistically similar to the population mean of 1,500 pounds per square inch.

![Lot1_2_pvalue](https://user-images.githubusercontent.com/85641189/135188692-36bb07e1-9d6f-4640-8f1e-a1cbd973de5b.png)

Regarding lot3, the p-value is equal to 0,04, below our significance level. In this case, we will state that we have sufficient statistical evidence to conclude that the null hypothesis is not true and the lot 3 is statistically different from the population mean of 1,500 pounds per square inch.

![Lot3_pvalue](https://user-images.githubusercontent.com/85641189/135188800-0713932c-e47a-416a-8f7d-a899c0f041bd.png)

## 4. Study Design: MechaCar vs Competition

The management team have asked us to quantify how the MechaCar performs against the competition. We are interested in several metrics we already have available, as the city fuel efficiency (cty), the average highway fuel economy (hwy), the cylinder size (cyl), and the size of each car engine (displ). We will start our analysis using the city fuel efficiency. It will be possible to extend the analysis done to the other variables in order to have a complete performance analysis of the MechaCar against the competition.

For this analysis, we will compare two samples, each from a different population. The first population will be the MechaCar and the second will be one of its competitors (for instance Audi). We have chosen to use a pair t-test. The paired t-test hypotheses are:

H0 : The difference between our paired observations is equal to zero.
Ha : The difference between our paired observations is not equal to zero.

First, we will have to generate our two data samples using the following code:

``
overallmpg_data <- read.csv('***.csv')
MechaCar_mpg <- overallmpg_data %>% filter(manufacturer=="MechaCar")
Audi_mpg <- overallmpg_data %>% filter(manufacturer=="audi")
``

Then we can use a paired t-test to determine if there is a statistical difference in overall city fuel efficiency between MechaCar vehicles versus Audi vegicles. In other words, we are testing our null hypothesis—that the overall difference is zero. Using our t.test() function in R, our code would be as follows:

``
t.test(MechaCar_mpg$cty,Audi_mpg$cty,paired = T)
``
We will be able to perform the same pair t-test with the average highway fuel economy (hwy), the cylinder size (cyl), and the size of each car engine (displ) because we are dealing with continuous variables.
