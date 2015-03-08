## Set my working directory to where the data is saved
setwd("C:/Users/C16Joseph.Haug/Documents/Math378/exploratorydataproj1/")

## This reads the needed data in from a .csv file into a data frame
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Creates the subset of data we need from the full data frame
subset2 <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converts the dates in the same manner as plot 1
datetime <- paste(as.Date(subset2$Date), subset2$Time)
subset2$Datetime <- as.POSIXct(datetime)

## This creates plot 2
plot(subset2$Global_active_power~subset2$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
