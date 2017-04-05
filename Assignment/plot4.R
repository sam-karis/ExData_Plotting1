# Read the data for 1/2/2007 and 2/2/2007 into R using data.table package

# Load the data.table package

library(data.table)



my_df = fread("household_power_consumption.txt", na.strings = "?",
             data.table = FALSE)

my_df <- subset(my_df, my_df$Date == "1/2/2007" | my_df$Date == "2/2/2007")


# Create a new variable(Datetime) that consist of date and time

# then convert the column datetime to the date format


my_df$Datetime <- paste(my_df$Date, my_df$Time)


my_df$Datetime <- strptime(my_df$Datetime, "%d/%m/%Y %H:%M:%S")





png("plot4.png", height = 480,width = 480,units = "px")

par(mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))



# plot 1 for the global active power

with(my_df, plot(Datetime, Global_active_power, type = "l", ylab = "Global active power"))



# plot 2 for voltage

with(my_df, plot(Datetime, Voltage, type = "l", ylab = "Voltage"))



# plot 3 for Energy sub Metering

with(my_df, plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering"))

with(my_df, points(Datetime, Sub_metering_2, type = "l", col="red"))

with(my_df, points(Datetime, Sub_metering_3, type = "l", col="blue"))

# Add a legend to describe the plot

legend("topright", col = c("black", "red","blue"), lwd = c(1,1,1),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))



# plot 4 for Global_reactive_power

with(my_df, plot(Datetime, Global_reactive_power, type = "l"))


# close the plot device

dev.off()
