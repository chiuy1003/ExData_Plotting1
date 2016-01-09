
## Read in data for 1/2/2007 - 2/2/2007
powerData = read.table("household_power_consumption.txt", skip=66637, sep=";", na.strings=c("?"), nrows=69517-66637)

## Set the column labels
names(powerData) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Create PNG file
png("plot1.png")

## Generate histogram
hist(powerData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

## Close the file
dev.off()