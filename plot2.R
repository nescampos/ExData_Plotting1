datos <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors=FALSE)
filtradosPorFecha <- datos[datos$Date %in% c("1/2/2007","2/2/2007"),]
str(filtradosPorFecha)

globalactivepower <- as.numeric(filtradosPorFecha$Global_active_power)
datetime <- strptime(paste(filtradosPorFecha$Date, filtradosPorFecha$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png")
plot(datetime,globalactivepower,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()