#Read the dataset
EPC <- read.table('household_power_consumption.txt', sep = ";", header = TRUE)
#EPC size 2075259 obs. of 9 cols
subsetEPC <- subset(EPC, EPC$Date=="1/2/2007" | EPC$Date == "2/2/2007")
#subsetEPC size 2880 obs. of 9 cols

#check the type of dataset for knowledge
str(subsetEPC)
#set image frame and save
png("plot1.png", width=480, height=480)
#call hist from plot function
hist(as.numeric(as.character(subsetEPC$Global_active_power)),col="red",main = "Global Active Power",xlab="Global Active Power (Kilowatts)")
dev.off()
