fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "exdata_data_household_power_consumption"
if (!file.exists(file)){
  download.file(fileURL,file,mode="wb")
}
electricpower <- read.table(unzip(file),sep=";",header = TRUE)
sub <- subset(electricpower,electricpower$Date=="1/2/2007"|electricpower$Date=="2/2/2007")
sub$datetime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(sub$datetime,sub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="Global Active Power vs Time")
