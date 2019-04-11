fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "exdata_data_household_power_consumption"
if (!file.exists(file)){
  download.file(fileURL,file,mode="wb")
}
electricpower <- read.table(unzip(file),sep=";",header = TRUE)
sub <- subset(electricpower,electricpower$Date=="1/2/2007"|electricpower$Date=="2/2/2007")
png("plot1.png", width=480, height=480)
hist(as.numeric(sub$Global_active_power),col="red",main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)")
