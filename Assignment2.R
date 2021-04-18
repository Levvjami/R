library("readr")
library("readxl")
library("tidyverse")
#import required .csv and .xlsx files
col_names = c("Time", "Temperature", "Percipitation", "Wind Speed", "Wind Angle")
csvFile <- read_csv("./Assignment2Assets/dataexport_csv.csv", skip = 10, col_names = col_names)
xlsFile <- read_excel("./Assignment2Assets/dataexport_xls.xlsx", skip = 10, col_names = col_names)
#merge both files into one
mergedDf <- rbind(xlsFile, csvFile)
mergedDf
#create a new column based on the wind direction
mergedDf$"Wind_Direction" <- cut(mergedDf$"Wind Angle", 8, labels=c("North","East", "East", "South", "South", "West", "West", "North"))
#get a subset dataframe based on the wind direction
subsetDf <- filter(mergedDf, Wind_Direction == "East")
subsetDf <- subsetDf[c(1,4,6)]
#save the subset dataframe as a .csv file 
write.csv(subsetDf, gzfile("./Assignment2Assets/east.csv"))
#create a new dataframe for storing the date and temperature
dateTemp <- mergedDf[c(1,2)]
dateTemp$Time <- as.Date(dateTemp$Time)
#calculate the average temperatures for each day
dateTemp <- aggregate(x = dateTemp, nfrequency=1, FUN = mean, by=list(dateTemp$Time))
dateTemp <- dateTemp[c(2,3)]
#save the dataframe into a .tbs file
write_tsv(dateTemp, file = "./Assignment2Assets/averageTemp.tsv")
