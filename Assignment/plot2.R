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


# open the plot device to save you plot

png("plot2.png", height = 480,width = 480,units = "px")


# Start to plot2.png

with(my_df, plot(Datetime, Global_active_power, type = "l",
                 ylab = "Global Active Power (kilowatts)"))

# close your plot device

dev.off()
