dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Plotdata<- as.numeric(subSetData$Global_active_power)

png("plot2.png", height = 480,width = 480)
hist(Plotdata,main = "Gloabl Active Power", col="red" ,xlab = "Global Active Power(killowatts)", ylab = "Frequency")

dev.off()