#Read data
hpc <- read.csv("~/household_power_consumption 2.txt", sep=";", na.strings = c("?",""))
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")  #Fix Date class
hpc$Time <- strptime(paste(hpc$Date,hpc$Time), format = "%Y-%m-%d %H:%M:%S")  #Fix Time
hpcg <- rbind(subset(hpc, Date == "2007-02-01"), subset(hpc, Date == "2007-02-02"))  #Subset by 2 days of interest

#Plot 4
png("plot4.png", bg = "transparent")
par(mfrow = c(2,2), mar = c(4,4,2,1))
with(hpcg, plot(Time,Global_active_power, ylab = "Global Active Power", type = "l", xlab = ""))
with(hpcg, plot(Time,Voltage, type = "l", xlab = "datetime"))
with(hpcg, plot(Time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(hpcg, lines(Time, Sub_metering_1))
with(hpcg, lines(Time, Sub_metering_2, col = "red"))
with(hpcg, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black","red","blue"))
with(hpcg, plot(Time,Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()
