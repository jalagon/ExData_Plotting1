#Read data
hpc <- read.csv("~/household_power_consumption 2.txt", sep=";", na.strings = c("?",""))
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")  #Fix Date class
hpc$Time <- strptime(paste(hpc$Date,hpc$Time), format = "%Y-%m-%d %H:%M:%S")  #Fix Time
hpcg <- rbind(subset(hpc, Date == "2007-02-01"), subset(hpc, Date == "2007-02-02"))  #Subset by 2 days of interest

#Plot 2
png("plot2.png", bg = "transparent")
with(hpcg, plot(Time,Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab = ""))
dev.off()
