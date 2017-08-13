#### Reading, subsetting, converting data ######

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                   colClasses="character")

op <- (data[,1]=="1/2/2007" | data[,1]=="2/2/2007")
data <- data[op,]

for (i in 3:9) {
  data[,i]<- as.numeric(data[,i])
}


data$datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


#### Plot 4 #######

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#(1,1)
plot(x=data$datetime, y=data$Global_active_power, type="l",  
     main="", xlab="", ylab="Global Active Power (kilowatts)")

#(1,2)
plot(x=data$datetime, y=data$Voltage, type="l",  
     main="", xlab="datetime", ylab="Voltage")

#(2,1)
plot(x=data$datetime, y=data$Sub_metering_1, type="l",  
     main="", xlab="", ylab="Energy sub metering")
lines(x=data$datetime, y=data$Sub_metering_2, type="l", col="red")
lines(x=data$datetime, y=data$Sub_metering_3, type="l", col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"), box.lty=0)

#(2,2)
plot(x=data$datetime, y=data$Global_reactive_power, type="l",  
     main="", xlab="datetime", ylab="Global_reactive_power")

dev.off()


