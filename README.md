## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data

While loading the data, following considerations were taken:

* Verified that the dataset is 2,075,259 rows and 9 columns. 

* Filtered the data for the dates 2007-02-01 and 2007-02-02, 
as we will need data for these two days only.

* Converted the Date variable to Date class using `as.Date()` function.

* Created DateTime variable needed for plotting using paste() and strptime() functions.

## List of Files:

<ol>
<li><b>README.md</b>describing the assigment, data, variables used and the code.</li>
<li><b>plot1.R</b></li>
<li><b>plot2.R</b></li>
<li><b>plot3.R</b></li>
<li><b>plot4.R</b></li>
<li><b>plot1.png</b></li>
<li><b>plot2.png</b></li>
<li><b>plot3.png</b></li>
<li><b>plot4.png</b></li>

## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007 and construct four plots 
listed below using the base plotting system.

Each plot is a : 
<p>*PNG file with a width of 480 pixels and a height of 480 pixels.</p>
<p>*The plot files are `plot1.png`, `plot2.png`, `plot3.png`,`plot4.png`.</p>

Source Code
<p>*There are four R code files `plot1.R`, `plot2.R`, `plot3.R`,`plot4.R`.</p>
<p>*Each code file has code to download, read and clean data so that the plot
  can be fully reproduced; and the code to create the PNG file.</p>

The four constructed plots are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

