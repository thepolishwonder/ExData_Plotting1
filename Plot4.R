# Maciolek's work for Prog Assignment #1

# Read in the data, skip the NAs
varNames <- read.table("./household_power_consumption.txt", sep=";", nrows=1, header = T )
varNames<-names(varNames)
x<-na.omit(read.table("./household_power_consumption.txt", sep=";", skip=1, na.strings = "?", col.names=varNames))

#convert the dates to Date format for use
x$Date <- as.Date( as.character(x$Date), "%d/%m/%Y")
x$Time <- strptime(paste(x$Date, x$Time), "%Y-%m-%d %H:%M:%S")
x <- subset(x, Date >= "2007-02-01" & Date <= "2007-02-02"  )

# Make the histogram as a PNG
png("plot4.png", width = 480, height = 480, units = "px")

# Set up the quadrants
par(mfrow=c(2,2))

#Plot1
plot(x$Time, x$Global_active_power, xlab="",type="n",ylab="Global Active Power")
lines(x$Time, x$Global_active_power)

#plot2
plot(x$Time, x$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(x$Time, x$Voltage)

#plot2
plot(x$Time, x$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
lines(x$Time, x$Sub_metering_1)
lines(x$Time, x$Sub_metering_2, col="red")
lines(x$Time, x$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1, 1, 1),col=c("black","red","blue"), bty="n")

#plot
plot(x$Time, x$Global_reactive_power, type="n", xlab="datetime")
lines(x$Time, x$Global_reactive_power)

dev.off()