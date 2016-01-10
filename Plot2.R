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
png("plot2.png", width = 480, height = 480, units = "px")
plot(x$Time, x$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(x$Time, x$Global_active_power)
dev.off()

