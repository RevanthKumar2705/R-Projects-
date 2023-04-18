covid = read.csv(file = "D:\\DATA SCIENCE\\R_Projects_Datasets\\Covid_Dataset_For_R\\Covid_Dataset_For_R.csv")
df = data.frame(covid)
View(df)
##Removing unwanted columns
df2 <- df[,-20,-21]
fix(df2)
sum(is.na(df2))

rm(list=ls()) # removes all variables stored previously
library(Hmisc) # import

data <- read.csv("D:\\DATA SCIENCE\\R_Projects_Datasets\\Covid_Dataset_For_R\\Covid_Dataset_For_R.csv")
df = data.frame(data)
View(df)

describe(data) # Hmisc command
# cleaned up death column and created new column death_dummy
data$death_dummy <- as.integer(data$death != 0)
# death rate
sum(data$death_dummy) / nrow(data)

# AGE
# claim: people who die are older?
# 0--->"ALIVE" and 1--->"DEAD"
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
View(data)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)
# is this statistically significant?
t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.99)
# normally, if p-value < 0.05, we reject null hypothesis
# here, p-value ~ 0, so we reject the null hypothesis and 
# conclude that this is statistically significant

# GENDER
# claim: gender has no effect? who has more death?
men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm = TRUE) #8.5%!
mean(women$death_dummy, na.rm = TRUE) #3.7%
# is this statistically significant?
t.test(men$death_dummy, women$death_dummy, alternative="two.sided", conf.level = 0.99)
# 99% confidence: men have from 0.8% to 8.8% higher chance
# of dying.
# p-value = 0.002 < 0.05, so this is statistically
# significant

