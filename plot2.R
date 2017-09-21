##This R script read two-day "Global Active Power" data from the source file and plot  
##it againt the date time

##Import data
household<-read.table(file = "household_power_consumption.txt",header=TRUE,sep = ";")

##Extract target data from 01-02-2007 to 02-02-2007
d<-as.character(household$Date)
data<-subset(household,d=="1/2/2007"|d=="2/2/2007")

##Construct the vector which joins date and time
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Construct the vector for the target variable 
global<-data$Global_active_power
global<-as.numeric(as.character(global))

##Plot
png("plot2.png", width=480, height=480)
plot(date_time, global, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()