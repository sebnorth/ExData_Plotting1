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

png("plot2.png", width=480, height=480)
plot(wDays, ramka$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

