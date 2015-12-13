## Reading dataset
data <- read.table("household_power_consumption.txt", sep = ";",header = TRUE)

## Set date column to date class
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset dataset
data_subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

## Set columns to numeric classes
data_subset$Global_active_power <- as.numeric(as.character(data_subset$Global_active_power))
data_subset$Sub_metering_1 <- as.numeric(as.character(data_subset$Sub_metering_1))
data_subset$Sub_metering_2 <- as.numeric(as.character(data_subset$Sub_metering_2))
data_subset$Sub_metering_3 <- as.numeric(as.character(data_subset$Sub_metering_3))
data_subset$Voltage <- as.numeric(as.character(data_subset$Voltage))
data_subset$Global_reactive_power <- as.numeric(as.character(data_subset$Global_reactive_power))


## Set screen size
par(mfrow=c(2,2))

## Build plots

# Plot 1
plot(data_subset$DateTime, data_subset$Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab = "")

# Plot 2
plot(data_subset$DateTime, data_subset$Voltage, type="l", ylab="Voltage", xlab = "datetime")

# Plot 3
plot(data_subset$DateTime, data_subset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab = "")
lines(data_subset$DateTime, data_subset$Sub_metering_2,col="red")
lines(data_subset$DateTime, data_subset$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.4)

# Plot 4
plot(data_subset$DateTime, data_subset$Global_reactive_power, type="l", ylab="global_reactive_power", xlab = "datetime")

## Store in PNG file device
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
