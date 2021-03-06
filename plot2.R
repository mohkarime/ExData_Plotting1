## Read the data only between the dates 2007-02-1 and 2007-02-02 and add the column names
Power <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2881)

colnames(Power) <- c("Date",
                     "Time",
                     "Global_active_power",
                     "Global_reactive_power",
                     "Voltage","Global_intensity",
                     "Sub_metering_1",
                     "Sub_metering_2",
                     "Sub_metering_3")

## Convert to Date/Time classes from Character 
DateTime <- strptime(paste(Power$Date, Power$Time), format = "%d/%m/%Y %H:%M:%S")

## Plot 2
png(filename = "plot2.png",
    width = 480, 
    height = 480)

plot(DateTime, Power$Global_active_power, 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     type="l")

dev.off()