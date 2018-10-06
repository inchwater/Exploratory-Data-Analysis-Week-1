setwd("C:/Users/Siddharth/Documents/Careers/Siddharth/DataScienceSpecialization/Exploratory Data Analysis/Week 1")

## Read only the rows that we need for the exercise
pcd <- read.table("household_power_consumption.txt",sep = ";", header = FALSE, skip = 66636, nrows = 4320)

library(dplyr)

##Rename the columns with more meaningful labels
pcd <- pcd %>% rename("Date" = "V1", "Time" = "V2", "Global Active Power (kilowatts)" = "V3", "Global Reactive Power (kilowatts)" = "V4", "Voltage" = "V5", "Global Intensity" = "V6", "Sub metering 1" = "V7", "Sub metering 2" = "V8", "Sub metering 3" = "V9")

library(lubridate)
Dates <- dmy(pcd$Date)
Times <- hms(pcd$Time)

datetime <- paste(pcd$Date, pcd$Time)
pcd$datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%Y")


##Generates plot 3 
png("plot3.png")

##Set the margins for the plot
par(mar=c(2, 4.1, 4.1, 2.1))

##Plot the first graph with energy sub metering 1
plot(pcd$datetime, pcd$`Sub metering 1`, main = "", type = "l", ylab = "Energy sub metering", xlab = "")

##Add the second y-axis plot for energy sub metering 2
par(new=T)
plot(pcd$datetime, pcd$`Sub metering 2`, main = "", type = "l", xlab = "", col = "red", ylab = NA)

##Add the third y-axis plot for energy sub metering 3
par(new=T)
plot(pcd$datetime, pcd$`Sub metering 3`, main = "", type = "l", xlab = "", col = "blue", ylab = NA)

## Add the legend on the top right corner of the plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"), xpd = TRUE, xjust = 1, yjust = 1)

dev.off()