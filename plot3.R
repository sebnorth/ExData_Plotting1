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

png("plot3.png", width=480, height=480)
colors <- c("Black", "Red", "Blue")
plot(wDays, ramka$"Sub_metering_1", type="l", xlab="", ylab="Energy sub metering")
lines(wDays, ramka$"Sub_metering_1", type="l", lwd=1.5,
    col=colors[1])
lines(wDays, ramka$"Sub_metering_2", type="l", lwd=1.5,
    col=colors[2])
lines(wDays, ramka$"Sub_metering_3", type="l", lwd=1.5,
    col=colors[3])
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = colors,
cex=1, lty=1)
dev.off()
