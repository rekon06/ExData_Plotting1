file="./data/household_power_consumption.txt"
data=read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data=data[data$Date %in% c("1/2/2007","2/2/2007") ,]
date=strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power=as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()