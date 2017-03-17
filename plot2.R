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
plot(datetime, select_dates$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

## Create PNG
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()