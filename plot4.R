# Exploratory Data Analysis Assignment Plot 4
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

# Construct plot
par(mfrow=c(2,2))
#First-upper left
plot(dt2$DateTime, dt2$Global_active_power, type="l",ylab="Global Active Power", xlab="")
# Second-upper right
plot(dt2$DateTime, dt2$Voltage, type="l", ylab="Voltage", xlab="datetime")
# Third-lower left
plot(dt2$DateTime, dt2$Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")
points(dt2$DateTime, dt2$Sub_metering_2, col="red", type="l")
points(dt2$DateTime, dt2$Sub_metering_3, col="blue", type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), bty="n", lwd=2)
#Fourth-lower right
plot(dt2$DateTime, dt2$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")

# Save as png file
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()