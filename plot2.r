#### Reading, subsetting, converting data ######

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses="character")

op <- (data[,1]=="1/2/2007" | data[,1]=="2/2/2007")
data <- data[op,]

for (i in 3:9) {
  data[,i]<- as.numeric(data[,i])
}


data$datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


#### Plot 2 #########

png("plot2.png", width=480, height=480)
plot(x=data$datetime, y=data$Global_active_power, type="l",  
     main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


