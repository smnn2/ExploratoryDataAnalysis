## first we read the entire data and put it in rawData object
## it may take some moments to read data
rawData <- read.csv("household_power_consumption.txt",sep = ";")

##after that, we extract the desired data (1/2/2007 & 2/2/2007)

data <- subset (rawData, Date == "1/2/2007" | Date == "2/2/2007")

## saving the output to png file. please make the next line comment if you want to see the plot in screen
png("plot2.png",width = 480,height = 480,units = "px")

## mergin date and time in a single objective called 'dateTime'
##by using mutate in dplyr library. (so this lib must be installed)
library(dplyr)
library(lubridate)

data <- mutate(data, dateTime = as.POSIXct(paste(parse_date_time(Date,c('dmy')), Time), format="%Y-%m-%d %H:%M:%S"))

## finally, plotting the Global active power against dateTime

plot(data$dateTime,as.numeric(as.character(data$Global_active_power)),type = "l",xlab= "",ylab = "Global Active Power (kilowatts)")

dev.off() ## close the png file

