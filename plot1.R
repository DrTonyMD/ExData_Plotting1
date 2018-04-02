# Exploratory Data Analysis Assignment - Plot 1
library(dplyr)
dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
dt <- mutate(dt,DateTime=paste(Date,Time))

dt$Date <- as.character(dt$Date)
dt$Time <- as.character(dt$Time)
dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))
dt$Global_reactive_power <- as.numeric(as.character(dt$Global_reactive_power))
dt$Voltage <- as.numeric(as.character(dt$Voltage))
dt$Global_intensity<- as.numeric(as.character(dt$Global_intensity))
dt$Sub_metering_1<- as.numeric(as.character(dt$Sub_metering_1))
dt$Sub_metering_2<- as.numeric(as.character(dt$Sub_metering_2))
dt$Sub_metering_3<- as.numeric(as.character(dt$Sub_metering_3))
dt$DateTime <- as.character(dt$DateTime)

# Change DateTime to POSIX format
dt$DateTime <- as.POSIXct(dt$DateTime, format="%d/%m/%Y %H:%M:%S")

# Change Time to Date
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")

# Subset for dates 2/1/2007-2/2/2007
dt2 <- subset(dt,dt$Date == "2007-02-01" | dt$Date == "2007-02-02")

#Draw plot 1:
hist(dt2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Save as png file
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
