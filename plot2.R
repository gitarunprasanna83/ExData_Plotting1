#Read the dataset
EPC <- read.table('household_power_consumption.txt', sep = ";", header = TRUE)
#EPC size 2075259 obs. of 9 cols
subsetEPC <- subset(EPC, EPC$Date=="1/2/2007" | EPC$Date == "2/2/2007")

datetime <- strptime(paste(subsetEPC$Date, subsetEPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetEPC$Global_active_power)
png("plot2.png", width=480, height=480)
#basic plot with type line plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
