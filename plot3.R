fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "exdata_data_household_power_consumption"
if (!file.exists(file)){
  download.file(fileURL,file,mode="wb")
}
sub <- subset(electricpower,electricpower$Date=="1/2/2007"|electricpower$Date=="2/2/2007")
sub$datetime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(sub$datetime,sub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,as.numeric(sub$Sub_metering_2),col="red")
lines(datetime,as.numeric(sub$Sub_metering_3),col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")