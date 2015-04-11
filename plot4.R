Sys.setlocale(category = "LC_ALL", locale = "C")

system.time(
{
fileURL <- "household_power_consumption.txt"
ramka <- read.csv(fileURL, header = TRUE, sep = ";", stringsAsFactors=FALSE)
ramka$Date <- as.Date(ramka$Date, format = "%d/%m/%Y")
ramka1 <- ramka[ramka$Date >= "2007-02-01" & ramka$Date <= "2007-02-02", ]
write.csv(ramka1, "data.csv", row.names=FALSE)
})

fileURL <- "data.csv"
ramka <- read.csv(fileURL, header = TRUE, sep = ",", stringsAsFactors=FALSE)
wDays <- strptime(paste(ramka$Date, ramka$Time), format='%Y-%m-%d %H:%M:%S')

png("plot4.png", width=480, height=480)
attach(ramka)
par(mfrow=c(2,2))
plot(wDays, Global_active_power, type = "l", xlab="", ylab="Global active power")
plot(wDays, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(wDays, ramka$"Sub_metering_1", type="n", xlab="", ylab="Energy sub metering")
lines(wDays, ramka$"Sub_metering_1", type="l", lwd=1.5,
    col=colors[1])
lines(wDays, ramka$"Sub_metering_2", type="l", lwd=1.5,
    col=colors[2])
lines(wDays, ramka$"Sub_metering_3", type="l", lwd=1.5,
    col=colors[3])
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = colors,
cex=0.9, lty=1, box.lwd = 0)

plot(wDays, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
detach(ramka)
dev.off()
