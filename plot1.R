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
png("plot1.png", width=480, height=480)
hist(ramka$"Global_active_power", col = "red", xlab = "Global Active Power (kilowatts)", 
main = "Global Active Power")
dev.off()

