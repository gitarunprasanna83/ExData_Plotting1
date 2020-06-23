#Read the dataset
EPC <- read.table('household_power_consumption.txt', sep = ";", header = TRUE)
#EPC size 2075259 obs. of 9 cols
subsetEPC <- subset(EPC, EPC$Date=="1/2/2007" | EPC$Date == "2/2/2007")
#subsetEPC size 2880 obs. of 9 cols
datetime <- strptime(paste(subsetEPC$Date, subsetEPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetEPC$Global_active_power)
globalReactivePower <- as.numeric(subsetEPC$Global_reactive_power)
voltage <- as.numeric(subsetEPC$Voltage)
subMetering1 <- as.numeric(subsetEPC$Sub_metering_1)
subMetering2 <- as.numeric(subsetEPC$Sub_metering_2)
subMetering3 <- as.numeric(subsetEPC$Sub_metering_3)

#make 2x2 column subset plots
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()