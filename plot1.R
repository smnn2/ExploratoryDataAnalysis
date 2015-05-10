## first we read the entire data and put it in rawData object
## it may take some moments to read data
rawData <- read.csv("household_power_consumption.txt",sep = ";")

##after that, we extract the desired data (1/2/2007 & 2/2/2007)

data <- subset (rawData, Date == "1/2/2007" | Date == "2/2/2007")

## saving the output to png file. please make the next line comment if you want to see the plot in screen
png("plot1.png",width = 480,height = 480,units = "px")

## now extracting the Global active power from the data
## since the data is now in "factor" format, we first convert it in numeric format
GAP <- as.numeric(as.character(data$Global_active_power))


## finally, plotting the histogram
hist(GAP, xlab = "Global Active Power (kilowatts)",main = "Global Active Power", col = "red")

dev.off() ## close the png file
