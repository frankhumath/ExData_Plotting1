##This R script reads two-day data from the source file and plots the 
##data of "Sub_metering_1","Sub_metering_2" and "Sub_metering_3" into
##the same plot

##Import data
household<-read.table(file = "household_power_consumption.txt",header=TRUE,sep = ";")

##Extract target data from 01-02-2007 to 02-02-2007
d<-as.character(household$Date)
data<-subset(household,d=="1/2/2007"|d=="2/2/2007")

##Construct the vector which joins date and time
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##Construct the vector for the target variable 
sub_m1<-data$Sub_metering_1
sub_m1<-as.numeric(as.character(sub_m1))

sub_m2<-data$Sub_metering_2
sub_m2<-as.numeric(as.character(sub_m2))

sub_m3<-data$Sub_metering_3
sub_m3<-as.numeric(as.character(sub_m3))

##Plot
png("plot3.png", width=480, height=480)

plot(date_time, sub_m1, type="l", xlab="", ylab="Energy sub metering")

lines(date_time, sub_m2, col="red")

lines(date_time, sub_m3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"), lty=rep(1,3), cex=0.8)

dev.off()