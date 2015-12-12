#plot 4


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



#print to png plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
with(data_clean,{
        
        plot(Time, Global_active_power, xlab="", ylab="Global Active Power", type="l", col="black")
        plot(Time, Voltage, ylab="Voltage", xlab="datetime", type="l", col="black") 
        
        plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
        with(data_clean, points(Time, Sub_metering_1, type="l", col="black"))
        with(data_clean, points(Time, Sub_metering_2, type="l", col="red"))
        with(data_clean, points(Time, Sub_metering_3, type="l", col="blue"))
        legend("topright", bty="n", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        
        
        plot(Time, Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l", col="black") 
        
        
})

dev.off()