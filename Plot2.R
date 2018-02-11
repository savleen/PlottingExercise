dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

d<- paste(subSetData$Date,subSetData$Time,sep = " ")

datetime<- strptime(d, "%d/%m/%Y %H:%M:%S")
gloabpower<- as.numeric(subSetData$Global_active_power)
png("plot2.png", height = 480,width = 480)
plot(datetime,gloabpower,ylab = "Global Active Power(killowatts)", xlab = "", type="l")
dev.off()