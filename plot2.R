
data <- read.table('./household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE, fill = TRUE)
data <- data[ which(data$Date == "1/2/2007" | data$Date == '2/2/2007'), ]
data[,"Global_active_power"] <- as.numeric(data[,"Global_active_power"])
data[,"Date-Time"] <- paste(data$Date," ",data$Time)
test <- strptime(data$`Date-Time`, format="%d/%m/%Y %H:%M:%S")
data <- cbind(data, "posix" = test)


par(mar=c(2.1,4.1,1.1,2.1))
plot(data$posix, data$Global_active_power,type = 'l', main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
print("plot2.png created")
dev.off()