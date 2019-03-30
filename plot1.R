getData <- function() {
  data <- read.csv('household_power_consumption.txt', sep=';')
  data$Date <- as.Date(data$Date, format='%d/%m/%Y')
  datesToKeep <- as.Date(c('2007-02-01', '2007-02-02'))
  data <- data[data$Date %in% datesToKeep,]
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  data
}
data <- getData()
png(filename = 'plot1.png')
hist(data$Global_active_power, col='red', xlab="Global Active Power (kilowatts)", ylab="Frequency", breaks = 12, main="Global Active Power")
dev.off()