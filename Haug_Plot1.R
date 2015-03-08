## Set my working directory to where the data is saved
setwd("C:/Users/C16Joseph.Haug/Documents/Math378/exploratorydataproj1/")

## This block of code reads in the data from a .csv file and stores it to a data frame
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## This block takes the subset of data that we need from the original data frame
subset1 <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## This block converts the dates
datetime <- paste(as.Date(subset1$Date), subset1$Time)
subset1$Datetime <- as.POSIXct(datetime)

## This creates plot 1
hist(subset1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## This saves my plot to a file names plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
