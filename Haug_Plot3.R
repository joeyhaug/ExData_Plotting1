## Set my working directory to where the data is saved
setwd("C:/Users/C16Joseph.Haug/Documents/Math378/exploratorydataproj1/")

## Reads in the data from a .csv file into a data frame
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Creates a new data frame with the subset of the data we need from the full data frame
subset3 <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converts the numbers to dates
datetime <- paste(as.Date(subset3$Date), subset3$Time)
subset3$Datetime <- as.POSIXct(datetime)

## creates plot 3
with(subset3, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
