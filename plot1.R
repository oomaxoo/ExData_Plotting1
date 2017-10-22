# clear the memory
rm(list=ls())

# get connection
con <- unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt")

# load data in file
data_raw <- read.table(con, sep = ";", header = TRUE, blank.lines.skip = TRUE, colClasses = "character") 

# filter the data set
data_src <- data_raw[data_raw$Date == "1/2/2007" | data_raw$Date == "2/2/2007", ]

# plot
d1 <- as.numeric(data_src$Global_active_power)
  
png('plot1.png', width = 480, height = 480, unit = "px")
hist(d1, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

