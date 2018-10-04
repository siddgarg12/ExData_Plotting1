
data <- read.table('./household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE, fill = TRUE)
data <- data[ which(data$Date == "1/2/2007" | data$Date == '2/2/2007'), ]
data[,"Sub_metering_1"] <- as.numeric(data[,"Sub_metering_1"])
data[,"Sub_metering_2"] <- as.numeric(data[,"Sub_metering_2"])
data[,"Sub_metering_3"] <- as.numeric(data[,"Sub_metering_3"])
data[,"Date-Time"] <- paste(data$Date," ",data$Time)
test <- strptime(data$`Date-Time`, format="%d/%m/%Y %H:%M:%S")
data <- cbind(data, "posix" = test)


par(mar=c(2.1,4.1,1.1,2.1))
plot(data$posix, data$Sub_metering_1 ,type = 'l', main = "", xlab = "", ylab = "Energy Sub Metering")
lines(data$posix, data$Sub_metering_2, type = "l", col = "red")
lines(data$posix, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), col=c("black", "red", "blue"), lty = 1:2, cex=0.8)

dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
print("plot3.png created")
dev.off()