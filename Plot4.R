dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

volt<- as.numeric(subSetData$Voltage)
gloabpower<- as.numeric(subSetData$Global_active_power)
globalreactpower<- as.numeric(subSetData$Global_reactive_power)
sub_meter1<- as.numeric(subSetData$Sub_metering_1)
sub_meter2<- as.numeric(subSetData$Sub_metering_2)
sub_meter3<- as.numeric(subSetData$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime,gloabpower, type="l", xlab = "" , ylab = "GlobalActive Power", cex=0.2)
plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_meter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_meter2, type="l", col="red")
lines(datetime, sub_meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, globalreactpower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()