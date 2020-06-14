file="./data/household_power_consumption.txt"
data=read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data=data[data$Date %in% c("1/2/2007","2/2/2007") ,]
date=strptime(paste(data$Date,data$Time,sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(data$Global_active_power)
sub_metering_1 <- as.numeric(data$Sub_metering_1)
sub_metering_2 <- as.numeric(data$Sub_metering_2)
sub_metering_3 <- as.numeric(data$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(date, sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(date, sub_metering_2, type="l", col="red")
lines(date, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()