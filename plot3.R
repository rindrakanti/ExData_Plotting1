#### This code is for project 1 of the course "Exploratory Data Analysis"
#### Date: Dec 5, 2014


plot3 <- function() {

######### Download the file if it does not exist in the current directory #########
if (!file.exists("household_power_consumption.zip")) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  file <- "household_power_consumption.zip"
  download.file(url, file)
  ######### Unzip the file #########
  unzip(file,exdir=".")
}

# Read data; Set column classes : first two as characters; last 7 as numeric;
# missing values are coded as "?"; 
epcData <- read.table("household_power_consumption.txt",sep = ";", colClasses = c(rep("character", 2), rep("numeric",7)), header = TRUE, as.is = TRUE, na.strings="?") 
# Check size : 2075259 rows X 9 columns; 142.7 Mb
#format(object.size(epcData), units="MB")
#
# Clean Data : convert Date column class to Date type
epcData$Date <- as.Date(epcData$Date,format = "%d/%m/%Y")
####
# Filter the data : We will only be using data from the dates 2007-02-01 and 2007-02-02
####
epcData <- epcData[epcData$Date == '2007-02-01' | epcData$Date == '2007-02-02',] #Rows 2880
####
####      Create DateTime Variable which is needed for plotting
####
epcData$DateTime <- strptime(paste(epcData$Date, epcData$Time), format = "%Y-%m-%d %H:%M:%S")
####
######### Plot 3 #########
####
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
#Set the margin
par(mar = c(6, 6, 5, 4))
#just create the plot, set the labels for x and y axes
plot(epcData$DateTime, epcData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
#draw the lines
lines(epcData$DateTime, epcData$Sub_metering_1, type = "S", col="black") # draw Sub_metering_1 line set color to black
lines(epcData$DateTime, epcData$Sub_metering_2, type = "S", col="red") # draw Sub_metering_2 line set color to red
lines(epcData$DateTime, epcData$Sub_metering_3, type = "S", col="blue") # draw Sub_metering_3 line set color to blue
#draw the legend
legend("topright", lty = c(1,1), lwd = c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#close the device
dev.off()
}

######### call plot3 function #########
plot3()


