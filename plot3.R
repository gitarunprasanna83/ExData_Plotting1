#Read the dataset
EPC <- read.table('household_power_consumption.txt', sep = ";", header = TRUE)
#EPC size 2075259 obs. of 9 cols
subsetEPC <- subset(EPC, EPC$Date=="1/2/2007" | EPC$Date == "2/2/2007")
#subsetEPC size 2880 obs. of 9 cols
datetime <- strptime(paste(subsetEPC$Date, subsetEPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActPower <- as.numeric(subsetEPC$Global_active_power)
submetering1 <- as.numeric(subsetEPC$Sub_metering_1)
submetering2 <- as.numeric(subsetEPC$Sub_metering_2)
submetering3 <- as.numeric(subsetEPC$Sub_metering_3)
#plot
png("plot3.png", width=480, height=480)
#plot and overlay lines on top of eachother
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
