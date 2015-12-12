# plot1 code

#read data from txt file
data_raw <- read.table("./household_power_consumption.txt", header=TRUE,  sep=";", stringsAsFactors=FALSE)

#convert string in data value
data_raw$Date <-  as.Date(data_raw$Date, "%d/%m/%Y")

#extract only the interesting data
data_clean <- data_raw[data_raw$Date == "2007-02-01" | data_raw$Date == "2007-02-02",]

#convert string in time
data_clean$Time <-strptime(paste(data_clean$Date, data_clean$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

#convert string in number
data_clean$Global_active_power <-  as.numeric(data_clean$Global_active_power)
data_clean$Global_reactive_power <-  as.numeric(data_clean$Global_reactive_power)
data_clean$Voltage <-  as.numeric(data_clean$Voltage)
data_clean$Global_intensity <-  as.numeric(data_clean$Global_intensity)
data_clean$Sub_metering_1 <-  as.numeric(data_clean$Sub_metering_1)
data_clean$Sub_metering_2 <-  as.numeric(data_clean$Sub_metering_2)
data_clean$Sub_metering_3 <-  as.numeric(data_clean$Sub_metering_3)

#print to png the histogram (plot 1)
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data_clean$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()























