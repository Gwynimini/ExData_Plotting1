## Reading dataset
data <- read.table("household_power_consumption.txt", sep = ";",header = TRUE)

## Set date column to date class
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset dataset
data_subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

## Set Global_active_power column to numeric class
data_subset$Global_active_power <- as.numeric(as.character(data_subset$Global_active_power))

## Build line plot
plot(data_subset$DateTime, data_subset$Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab = "")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()