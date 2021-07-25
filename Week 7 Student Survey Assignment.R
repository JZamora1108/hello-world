# Assignment: ASSIGNMENT 7.2 (Student Survey)
# Name: ZAMORA, JESSE
# Date: 07/24/2021

setwd("c:/Users/14029/R Studio Projects/dsc520-master")

library(readr)

student_survey <- read_csv("data/student-survey.csv")

## Using the covariance function on the student survey data to view all information in or "everything"
cov(student_survey, use = "everything")

## Correlation depicting time spent reading vs time spent wathcing tv
cor(student_survey$TimeReading, student_survey$TimeTV)

## Correlation between happiness of the same variables
cor(student_survey$TimeReading, student_survey$Happiness)

## Correlation between reading and gender
cor(student_survey$TimeReading, student_survey$Gender)

## Correlation on happiness of the same variables
cor(student_survey$TimeTV, student_survey$Happiness)

## Same test with confidence interval set at 99%
cor.test(student_survey$TimeReading, student_survey$TimeTV, conf.level = 0.99)

## confident level for time reading and happiness correlation
cor.test(student_survey$TimeReading, student_survey$Happiness, conf.level = 0.99)

## Correlation for time reading and gender
cor.test(student_survey$TimeReading, student_survey$Gender, conf.level = 0.99)

## Correlation between time spent watching tv and happiness
cor.test(student_survey$TimeTV, student_survey$Happiness, conf.level = 0.99)

## Correlation time spent watching tv and gender
cor.test(student_survey$TimeTV, student_survey$Gender, conf.level = 0.99)

## calculating the correlation coefficient and the coefficient of determination, describe what you conclude about the results
cor.test(student_survey$TimeReading, student_survey$Happiness)

## Correlation demonstrating an inverted relationship
TimeREAD_Happiness <- cor(student_survey$TimeReading, student_survey$Happiness)
TimeREAD_Happiness_determination <- TimeREAD_Happiness ^ 2
TimeREAD_Happiness_determination

## Correltation to see relation between time watching tv and time reading
cor.test(student_survey$TimeTV, student_survey$TimeReading)

## Correlation demonstrating an inverted relationship
TimeTVandTimeReading <- cor(student_survey$TimeTV, student_survey$TimeReading)
TVREAD <- TimeTVandTimeReading ^ 2
TVREAD


library(ppcor)

## Using the variables time reading, time watching tv and happiness
## Demonstrates the negative correlation with time reading and time watching tv has an inverted relationship
## Adding happiness as the control there is an increase in the negative relationship 
pcor.test(student_survey$TimeReading, student_survey$TimeTV, student_survey$Happiness)