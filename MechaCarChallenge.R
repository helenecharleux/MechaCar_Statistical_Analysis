library(dplyr)
MechaCar_mpg <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)

head(MechaCar_mpg)
?lm()
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)) #generate summary statistics

Suspension_coil <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F)

library(dplyr)
head(Suspension_coil)
?summarize()

Suspension_coil_summary <- Suspension_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

Summary_Suspension_lot <- Suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#One_sample t-test
?t.test()
library(ggplot2)
plt <- ggplot(Suspension_coil,aes(x=log(PSI))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

# Creating the 3 lots to test
?subset()
lot1_sample <- subset(Suspension_coil, Manufacturing_Lot== 'Lot1', select = c(Manufacturing_Lot,PSI))
lot2_sample <- subset(Suspension_coil, Manufacturing_Lot== 'Lot2', select = c(Manufacturing_Lot,PSI))
lot3_sample <- subset(Suspension_coil, Manufacturing_Lot== 'Lot3', select = c(Manufacturing_Lot,PSI))

# Comparing the overall population with a population mean of 1,500 pounds
t.test(Suspension_coil$PSI, mu=1500)

# Comparing lot 1 with a population mean of 1,500 pounds
t.test(lot1_sample$PSI, mu=1500)

# Comparing lot 2 with a population mean of 1,500 pounds
t.test(lot2_sample$PSI, mu=1500)

# Comparing lot 3 with a population mean of 1,500 pounds
t.test(lot3_sample$PSI, mu=1500)

# MechaCar against competitor Audi

overallmpg_data <- read.csv('***.csv')
MechaCar_mpg <- overallmpg_data %>% filter(manufacturer=="MechaCar")
Audi_mpg <- overallmpg_data %>% filter(manufacturer=="audi")

t.test(MechaCar_mpg$cty,Audi_mpg$cty,paired = T)
