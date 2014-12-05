#### This code is for project 1 of the course "Exploratory Data Analysis"
#### Date: Dec 3, 2014


plot1 <- function() {
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
######### Plot 1 #########
####

png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

par(mar = c(6, 6, 5, 4))

hist(epcData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
}

######### call plot1 function #########
plot1()
