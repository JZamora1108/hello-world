# Assignment: ASSIGNMENT 3 - COMMUNITY SURVEY
# Name: ZAMORA, JESSE
# Date: 06/27/2021


theme_set(theme_minimal())


setwd("c:/Users/14029/R Studio Projects/dsc520-master")

survey_df <- read.csv("data/acs-14-1yr-s0201.csv")

#1.What are the elements in your data? (Category and Data Type)
# ID - Continuous Ratio / Character
# ID2 - Continuous Ratio / Integer
# Geography - Categorical Nominal / Character
# PopGroupID - Ordinal / Integer
# PopGROUP.display-label - Categorical Nominal / Character
# RacesReported - Ordinal Variable / Integer
# HSDegree - Continuous Ratio / Numerical
# BachDegree - Continuous Ratio / Numerical

str(survey_df)
nrow(survey_df)
ncol(survey_df)

library(ggplot2)

ggplot(survey_df, aes(HSDegree))+ geom_histogram(fill="darkslategrey", color="black", binwidth = 1,bins = 30) +  ggtitle("HSDegree Percentages") + ylab("Count") + xlab("Percentage of Individuals with a Highschool Degree")

#Based on what you see in this histogram, is the data distribution unimodal? The data is unimodal
#Is it approximately symmetrical? No
#Is it approximately bell-shaped? Yes, there is a slight bell curve
#Is it approximately normal? yes with a left skew
#If not normal, is the distribution skewed? If so, in which direction? The histogram is left-skewed
#Include a normal curve to the Histogram that you plotted.
#Explain whether a normal distribution can accurately be used as a model for this data. There is a slight bell curve to the data but would be better described as left-skewed

##normal curve to the Histogram.

ggplot(data = survey_df) + 
  geom_histogram(mapping = aes(x = HSDegree, y=..density..), fill="darkslategrey", color="black", binwidth = 1,bins = 30) +
  ggtitle("HSDegree Percentages") + ylab("Frequency") + xlab("Percentage of Individuals with a Highschool Degree") +
  stat_function(fun = dnorm, color = "firebrick", args = list(mean = mean(survey_df$HSDegree), sd = sd(survey_df$HSDegree)))

##Probability Plot.

ggplot(survey_df, aes(sample=HSDegree)) + stat_qq(col="dodgerblue") + stat_qq_line(col="firebrick", lty=2)

##Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
#No, if it were a normal distribution the plot would be straight.

#If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
#the distribution is skewed left because both ends of the probability plot are below the straight line.

##Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
library(pastecs)
stat.desc(survey_df$HSDegree, basic = FALSE, norm = TRUE) 

## the results for the left-skewed resulted in both the histogram and probability plot were defined pretty well and apparent as shown.
# The data does show a light tail in reference to the kurtosis of the histogram with the plot being left-skewed
# the z-score is in reference to the amount of values that are above or below the mean value that is being observed.
# If there were a large increase to the data sample size there may be more of a pronounced bell curve shown.