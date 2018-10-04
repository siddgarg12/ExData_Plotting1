data <- read.table('./household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE, fill = TRUE)
data <- data[ which(data$Date == "1/2/2007" | data$Date == '2/2/2007'), ]

data[,"Global_active_power"] <- as.numeric(data[,"Global_active_power"])
data[,"Date"] <- as.Date(data[,"Date"], format = "%d/%m/%Y")
data <- cbind(data,"dow" = strftime(data$Date, format = "%a"))

hist(data[["Global_active_power"]], main = "Global Active Power", xlab = "Global Active Power (kilowatts", ylab = "Frequency", col = "red")
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
print("plot1.png created")
dev.off()


