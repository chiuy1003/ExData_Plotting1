
## Read in data for 1/2/2007 - 2/2/2007
powerData = read.table("household_power_consumption.txt", skip=66637, sep=";", na.strings=c("?"), nrows=69517-66637)

## Set the column labels
names(powerData) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Generate the timestamps
powerDataTimestamp = strptime(paste(powerData$Date,powerData$Time), format="%d/%m/%Y %H:%M:%S")

## Create PNG file
png("plot4.png")

## Set # of plots
par(mfrow = c(2, 2))

# Plot 4
plot(powerDataTimestamp, powerData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(powerDataTimestamp, powerData$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(powerDataTimestamp, powerData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(powerDataTimestamp, powerData$Sub_metering_2, col="red")
lines(powerDataTimestamp, powerData$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
plot(powerDataTimestamp, powerData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Close the file
dev.off()