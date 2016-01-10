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
png("plot3.png", width = 480, height = 480, units = "px")
plot(x$Time, x$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n" )
lines(x$Time, x$Sub_metering_1)
lines(x$Time, x$Sub_metering_2, col="red")
lines(x$Time, x$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1, 1, 1),col=c("black","red","blue"))
dev.off()