#To run this download https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip,
#unzip and place this script in the folder
library(dplyr)
#load data from file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

#format char date to Date format
data$Date <- as.Date(x=data$Date, format("%d/%m/%Y"))

#choose only data where Date is in these two days
myData <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

#create datetime variable from Date and Time columns
dateTime <- as.POSIXct(paste(myData$Date, myData$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot3.png")

#create plot with y Sub_metering_1 to Sub_metering_3
plot(y=myData$Sub_metering_1, x=dateTime, type="n", xlab="", ylab="Emergency sub metering")
lines(y=myData$Sub_metering_1, x=dateTime)
lines(y=myData$Sub_metering_2, x=dateTime, col="red")
lines(y=myData$Sub_metering_3, x=dateTime, col="blue")
#create legend to plot
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      col=c("black", "red", "blue"), lty=c(1,1,1))

dev.off()     

