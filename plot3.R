## first we read the entire data and put it in rawData object
## it may take some moments to read data
rawData <- read.csv("household_power_consumption.txt",sep = ";")

##after that, we extract the desired data (1/2/2007 & 2/2/2007)

data <- subset (rawData, Date == "1/2/2007" | Date == "2/2/2007")

## saving the output to png file. please make the next line comment if you want to see the plot in screen
png("plot3.png",width = 480,height = 480,units = "px")

## mergin date and time in a single objective called 'dateTime'
##by using mutate in dplyr library. (so this lib must be installed)
library(dplyr)
library(lubridate)

data <- mutate(data, dateTime = as.POSIXct(paste(parse_date_time(Date,c('dmy')), Time), format="%Y-%m-%d %H:%M:%S"))


## finaly plotting the lines and legend

plot(data$dateTime,as.numeric(as.character(data$Sub_metering_1)),type = "l",xlab= "",ylab = "Energy sub metering")
lines(data$dateTime,as.numeric(as.character(data$Sub_metering_2)),col = "red")
lines(data$dateTime,as.numeric(as.character(data$Sub_metering_3)),col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = c(1,1,1),lty = c(1,1,1),col = c("black","red","blue"))


dev.off() ## close the png file
