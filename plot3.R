## Download and unzip the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "electric power consumption.zip", method = "curl")
unzip("electric power consumption.zip")

## Read data
epc <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";", stringsAsFactors = FALSE)

## Change date and time variables to date/time classes
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")
##epc$Time <- strptime(epc$Time, format = "%H:%M:%S")

## filter for dates between 2007-02-01 and 2007-02-02
select_dates <- filter(epc, Date == "2007-02-01" | Date == "2007-02-02")

## Get date/time object
datetime <- strptime(paste(select_dates$Date, select_dates$Time), "%Y-%m-%d %H:%M:%S")

## Create plot
plot(datetime, select_dates$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(datetime, select_dates$Sub_metering_2, col = "red", type = "l")
lines(datetime, select_dates$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"), y.intersp = 0.5, cex = 0.8)

## Create PNG
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()