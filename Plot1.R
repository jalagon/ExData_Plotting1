#Read data
hpc <- read.csv("~/household_power_consumption 2.txt", sep=";", na.strings = c("?",""))
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")  #Fix Date class
hpc$Time <- strptime(paste(hpc$Date,hpc$Time), format = "%Y-%m-%d %H:%M:%S")  #Fix Time
hpcg <- rbind(subset(hpc, Date == "2007-02-01"), subset(hpc, Date == "2007-02-02"))  #Subset by 2 days of interest

#Plot 1
png("plot1.png", bg = "transparent")
with(hpcg, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red"))
dev.off()
