#### This code is for project 1 of the course "Exploratory Data Analysis"
#### Date: Dec 5, 2014


plot4 <- function() {

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
####      Create DateTime Variable, which is needed for plotting
####
epcData$DateTime <- strptime(paste(epcData$Date, epcData$Time), format = "%Y-%m-%d %H:%M:%S")
####
######### Plot 4 #########
#### Open the png device and set params
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(2, 2)) # set the parameters to draw 2 rows, 2 column plots 


with(epcData, {
  #Plot 4.1 : Top left
  #Set the plot with parameters to remove x axis label, assign y axis label and draw no points
  plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "n")
  lines(DateTime, Global_active_power, type = "S") # draw lines
  #Plot 4.2 : Top right
  #Set the plot with parameters to assign x axis & y axis labels and draw no points
  plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
  lines(DateTime, Voltage, type = "S") # draw lines
  #Plot 4.3 : Bottom left
  #Set the plot with parameters to remove x axis label, assign y axis label and draw no points
  plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
  lines(DateTime, Sub_metering_1, type = "S", col="black") # draw Sub_metering_1 line set color to black
  lines(DateTime, Sub_metering_2, type = "S", col="red") # draw Sub_metering_2 line set color to red
  lines(DateTime, Sub_metering_3, type = "S", col="blue") # draw Sub_metering_3 line set color to blue
  #create legend for plot 4.3 with appropriate params
  legend("topright", bty = "n", lty = c(1,1), lwd = c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  #Plot 4.4 : Bottom right
  #Set the plot with parameters to assign x axis label and draw no points
  plot(DateTime, Global_reactive_power ,xlab = "datetime", type = "n")
  lines(DateTime, Global_reactive_power, type = "S") # draw lines
})

#close the device
dev.off()
}

######### call plot4 function #########
plot4()

