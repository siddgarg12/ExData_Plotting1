
data <- read.table('./household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE, fill = TRUE)
data <- data[ which(data$Date == "1/2/2007" | data$Date == '2/2/2007'), ]
data[,"Global_active_power"] <- as.numeric(data[,"Global_active_power"])
data[,"Global_reactive_power"] <- as.numeric(data[,"Global_reactive_power"])
data[,"Voltage"] <- as.numeric(data[,"Voltage"])
data[,"Sub_metering_1"] <- as.numeric(data[,"Sub_metering_1"])
data[,"Sub_metering_2"] <- as.numeric(data[,"Sub_metering_2"])
data[,"Sub_metering_3"] <- as.numeric(data[,"Sub_metering_3"])
data[,"Date-Time"] <- paste(data$Date," ",data$Time)
test <- strptime(data$`Date-Time`, format="%d/%m/%Y %H:%M:%S")
data <- cbind(data, "posix" = test)


#par(mar=c(2.1,4.1,1.1,2.1))
par(mfrow = c(2,2), mar=c(2.1,4.1,1.1,2.1), cex.lab = 0.8)

#1,1 plot
plot(data$posix, data$Global_active_power,type = 'l', main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

#1,2 plot
plot(data$posix, data$Voltage,type = 'l', main = "", xlab = "datatime", ylab = "Voltage")

#2,1 plot
plot(data$posix, data$Sub_metering_1 ,type = 'l', main = "", xlab = "", ylab = "Energy Sub Metering")
lines(data$posix, data$Sub_metering_2, type = "l", col = "red")
lines(data$posix, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), col=c("black", "red", "blue"), lty = 1:2, cex=0.8)

#2,2 plot
plot(data$posix, data$Global_reactive_power,type = 'l', main = "", xlab = "", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
print("plot4.png created")
dev.off()