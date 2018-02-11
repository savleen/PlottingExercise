dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

d<- paste(data$Date,subSetData$Time,sep = " ")

datetime<- strptime(d, "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
sub_meter1<- as.numeric(subSetData$Sub_metering_1)
sub_meter2<- as.numeric(subSetData$Sub_metering_2)
sub_meter3<- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", height = 480,width = 480)
plot(datetime,meter1,type="l",ylab = "Energy Sub Metering", xlab = "")
lines(datetime,meter2,type = "l",col="red")
lines(datetime,meter3,type = "l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


dev.off()