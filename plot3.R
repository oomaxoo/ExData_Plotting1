# clear the memory
rm(list=ls())

# get connection
con <- unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt")

# load data in file
data_raw <- read.table(con, sep = ";", header = TRUE, blank.lines.skip = TRUE, colClasses = "character") 

# filter the data set
data_src <- data_raw[data_raw$Date == "1/2/2007" | data_raw$Date == "2/2/2007", ]

# plot

d1 <- data_src[, c(1, 2, 7, 8, 9)]

png('plot3.png', width = 480, height = 480, unit = "px")
with(d1, plot(strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"), 
                    as.numeric(Sub_metering_1), 
                    type="l", 
                    xlab = "", ylab = "Energy sub metering"))

with(d1, lines(strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"), 
      as.numeric(Sub_metering_2), 
      type="l", col = "red"))

with(d1, lines(strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"), 
      as.numeric(Sub_metering_3), 
      type="l", col = "blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()

