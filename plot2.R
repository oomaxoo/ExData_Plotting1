# clear the memory
rm(list=ls())

# get connection
con <- unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt")

# load data in file
data_raw <- read.table(con, sep = ";", header = TRUE, blank.lines.skip = TRUE, colClasses = "character") 

# filter the data set
data_src <- data_raw[data_raw$Date == "1/2/2007" | data_raw$Date == "2/2/2007", ]

# plot
png('plot2.png', width = 480, height = 480, unit = "px")
with(data_src, plot(strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"), 
                    as.numeric(Global_active_power), 
                    type="l", 
                    xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()