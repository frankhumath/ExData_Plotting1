##This R script puts four plots into one plot

##Import data
household<-read.table(file = "household_power_consumption.txt",header=TRUE,sep = ";")


##Extract target data from 01-02-2007 to 02-02-2007
d<-as.character(household$Date)
data<-subset(household,d=="1/2/2007"|d=="2/2/2007")


##Construct the vector which joins date and time
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


##Format the winddow to display four plots
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))


##Plot "plot2" at (1,1)
global<-data$Global_active_power
global<-as.numeric(as.character(global))

plot(date_time, global, type="l", xlab="", ylab="Global Active Power")


##Plot "plot2", the plot for "Voltage" at (1,2)
voltage<-data$Voltage
voltage<-as.numeric(as.character(voltage))


##Plot "plot2", the plot for "Sub_metering 1","Sub_metering 1" and
##"Sub_metering 3" at (2,1)
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

sub_m1<-data$Sub_metering_1
sub_m1<-as.numeric(as.character(sub_m1))

sub_m2<-data$Sub_metering_2
sub_m2<-as.numeric(as.character(sub_m2))

sub_m3<-data$Sub_metering_3
sub_m3<-as.numeric(as.character(sub_m3))

plot(date_time, sub_m1, type="l", xlab="", ylab="Energy sub metering")

lines(date_time, sub_m2, col="red")

lines(date_time, sub_m3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"), lty=rep(1,3), cex=0.8)



##Plot "plot2", the plot for "Global reactive power" at (2,2)
global_r<-data$Global_reactive_power
global_r<-as.numeric(as.character(global_r))

plot(date_time, global_r, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()