##This R script read two-day data from the source file and plot the histogram of 
##global active power

##Import data
household<-read.table(file = "household_power_consumption.txt",header=TRUE,sep = ";")

##Extract target data from 01-02-2007 to 02-02-2007
d<-as.character(household$Date)
data<-subset(household,d=="1/2/2007"|d=="2/2/2007")

##Construct the vector for the target variable 
global<-data$Global_active_power
global<-as.numeric(as.character(global))

##Plot
png("plot1.png", width=480, height=480)
hist(global,col="red",ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()
