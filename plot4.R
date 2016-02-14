datos <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors=FALSE)
filtradosPorFecha <- datos[datos$Date %in% c("1/2/2007","2/2/2007"),]
str(filtradosPorFecha)

globalactivepower <- as.numeric(filtradosPorFecha$Global_active_power)
submetering1 <- as.numeric(filtradosPorFecha$Sub_metering_1)
submetering2 <- as.numeric(filtradosPorFecha$Sub_metering_2)
submetering3 <- as.numeric(filtradosPorFecha$Sub_metering_3)
voltage <- as.numeric(filtradosPorFecha$Voltage)
globalreactivepower <- as.numeric(filtradosPorFecha$Global_reactive_power)
datetime <- strptime(paste(filtradosPorFecha$Date, filtradosPorFecha$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfcol=c(2,2))


plot(datetime,globalactivepower,type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(datetime,submetering1,xlab="",ylab="Energy sub metering",type="l")
lines(datetime,submetering2,type="l",col="red")
lines(datetime,submetering3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime,voltage,type="l",xlab="datetime",ylab="Voltage")

plot(datetime,globalreactivepower,type="l",ylab="Global_reactive_power")

dev.off()