
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

# plotting the histogram
hist(data[, 3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# copying the histogram to a png file
dev.copy(png, file = "plot1.png")     
dev.off()  
