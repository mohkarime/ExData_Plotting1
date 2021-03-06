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

## Plot 4
png(filename = "plot4.png",
    width = 480, 
    height = 480)

## put plots in one page as 2 per row
par(mfrow=c(2,2))

plot(DateTime, Power$Global_active_power, 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     type="l")

plot(DateTime, Power$Voltage, 
     xlab = "datetime", 
     ylab = "Voltage",
     type="l")

plot(DateTime, Power$Sub_metering_1, 
     xlab = "", 
     ylab = "Energy sub metering",
     type="l")

lines(DateTime, Power$Sub_metering_2, 
      xlab = "", 
      ylab = "",
      type="l",
      col = "red")

lines(DateTime, Power$Sub_metering_3, 
      xlab = "", 
      ylab = "",
      type="l",
      col = "blue")

## add legend without border
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=c(1,1,1),
       lwd=c(1,1,1),
       bty = "n")

plot(DateTime, Power$Global_reactive_power, 
     xlab = "datetime", 
     ylab = "Global_reactive_power",
     type="l")

dev.off()