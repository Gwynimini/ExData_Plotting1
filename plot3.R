## Reading dataset
data <- read.table("household_power_consumption.txt", sep = ";",header = TRUE)

## Set date column to date class
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset dataset
data_subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

## Set Sub metering columns to numeric classes
data_subset$Sub_metering_1 <- as.numeric(as.character(data_subset$Sub_metering_1))
data_subset$Sub_metering_2 <- as.numeric(as.character(data_subset$Sub_metering_2))
data_subset$Sub_metering_3 <- as.numeric(as.character(data_subset$Sub_metering_3))

## Build line plot
plot(data_subset$DateTime, data_subset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab = "")
lines(data_subset$DateTime, data_subset$Sub_metering_2,col="red")
lines(data_subset$DateTime, data_subset$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()