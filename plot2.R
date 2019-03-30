getData <- function() {
  data <- read.csv('household_power_consumption.txt', sep=';')
  data$Date <- as.Date(data$Date, format='%d/%m/%Y')
  data$DateTime <- strptime(paste(data$Date, data$Time), format = '%Y-%m-%d %H:%M:%S')
  datesToKeep <- as.Date(c('2007-02-01', '2007-02-02'))
  data <- data[data$Date %in% datesToKeep,]
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  data
}
data <- getData()
png(filename = 'plot2.png')
with(data, plot(DateTime, Global_active_power, type='n', ylab="Global Active Power (kilowatts)"))
with(data, lines(DateTime, Global_active_power))
dev.off()
