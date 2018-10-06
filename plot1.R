setwd("C:/Users/Siddharth/Documents/Careers/Siddharth/DataScienceSpecialization/Exploratory Data Analysis/Week 1")

## Read only the rows that we need for the exercise
pcd <- read.table("household_power_consumption.txt",sep = ";", header = FALSE, skip = 66636, nrows = 4320)

library(dplyr)

##Rename the columns with more meaningful labels
pcd <- pcd %>% rename("Date" = "V1", "Time" = "V2", "Global Active Power (kilowatts)" = "V3", "Global Reactive Power (kilowatts)" = "V4", "Voltage" = "V5", "Global Intensity" = "V6", "Sub metering 1" = "V7", "Sub metering 2" = "V8", "Sub metering 3" = "V9")

library(lubridate)
Dates <- dmy(pcd$Date)
Times <- hms(pcd$Time)

##Generates plot 1 
png("plot1.png")

hist(pcd$`Global Active Power (kilowatts)`, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()