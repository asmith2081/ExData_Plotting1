## Download and unzip the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "electric power consumption.zip", method = "curl")
unzip("electric power consumption.zip")

## Read data
epc <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";", stringsAsFactors = FALSE)

## Change date and time variables to date/time classes
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")
epc$Time <- strptime(epc$Time, format = "%H:%M:%S")

## filter for dates between 2007-02-01 and 2007-02-02
select_dates <- filter(epc, Date == "2007-02-01" | Date == "2007-02-02")

## Create histogram
hist(select_dates$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

## Create PNG
dev.copy(png, file = "plot1.png")
dev.off()