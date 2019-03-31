getData <- function() {
  data <- read.csv('household_power_consumption.txt', sep=';')
  data$Date <- as.Date(data$Date, format='%d/%m/%Y')
  data$DateTime <- strptime(paste(data$Date, data$Time), format = '%Y-%m-%d %H:%M:%S')
  datesToKeep <- as.Date(c('2007-02-01', '2007-02-02'))
  data <- data[data$Date %in% datesToKeep,]
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
  data$Voltage <- as.numeric(as.character(data$Voltage))
  data
}
data <- getData()
png("plot4.png")
par(mfcol = c(2,2))
with(data, plot(DateTime, Global_active_power, type='n', ylab="Global Active Power", xlab=""))
with(data, lines(DateTime, Global_active_power))

with(data, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(data, lines(DateTime, Sub_metering_1))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)

with(data, plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="n"))
with(data, lines(DateTime, Voltage))

with(data, plot(DateTime, Global_reactive_power, xlab="datetime", type="n"))
with(data, lines(DateTime, Global_reactive_power))
dev.off()