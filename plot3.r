#### Reading, subsetting, converting data ######

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, 
                   colClasses="character")

op <- (data[,1]=="1/2/2007" | data[,1]=="2/2/2007")
data <- data[op,]

for (i in 3:9) {
  data[,i]<- as.numeric(data[,i])
}


data$datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


#### Plot 3 #######

png("plot3.png", width=480, height=480)
plot(x=data$datetime, y=data$Sub_metering_1, type="l",  
     main="", xlab="", ylab="Energy sub metering")
lines(x=data$datetime, y=data$Sub_metering_2, type="l", col="red")
lines(x=data$datetime, y=data$Sub_metering_3, type="l", col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))
dev.off()


