#To run this download https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip,
#unzip and place this script in the folder
library(dplyr)


#load data from file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

#format char date to Date format
data$Date <- as.Date(x=data$Date, format("%d/%m/%Y"))

#choose only data where Date is in these two days
myData <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

png(filename="plot1.png")

#make histogram
hist(x=myData$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
