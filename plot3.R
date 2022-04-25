
# reading the data set into R
data <- read.table("household_power_consumption.txt", skip = 1, sep = ";", na.strings = "?")

# renaming the variables
names(data) <- c("Date", 
                 "Time", 
                 "Global_active_power", 
                 "Global_reactive_power",
                 "Voltage",
                 "Global_intensity",
                 "Sub_metering_1",
                 "Sub_metering_2",
                 "Sub_metering_3")

# subsetting the part of the data set used for the plot
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# formatting the time vector
date_converted <- as.Date(data[, 1], format = "%d/%m/%Y")
time_converted <- strptime(data[, 2], format = "%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, data[, 2]))

# making the plot
plot(time_axis, data[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, data[, 8], col = "red")
lines(time_axis, data[, 9], col = "blue")

# adding the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# copying the plot to a png file
dev.copy(png, file = "plot3.png")     
dev.off() 

