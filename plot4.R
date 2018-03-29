# Source the read power dataset function
source("read_dataset.R")

# Read power dataset function only for 2 days (1/2/2007 and 2/2/2007)
# More details inside the above sourced "read_dataset.R" file
power_df <- read_dataset()

# Set locale for POSIXlt time to be displayed in English
Sys.setlocale(category = "LC_ALL", locale = "english")

# Save the plot to the PNG file
png(filename='plot4.png', width=480, height=480, units='px')
  
# Set 2 rows and 2 columns for the main panel
par(mfrow = c(2,2))
  
# 1st "Global Active Power" plot
plot(power_df$Time, power_df$Global_active_power,
	type = "l",
	xlab = "",
	ylab = "Global Active Power")
  
# 2nd "Voltage" plot
plot(power_df$Time, power_df$Voltage, 
	type = "l",
	xlab = "datetime",
	ylab = "Voltage")
  
# 3rd "Energy sub metering" plot
plot(power_df$Time, power_df$Sub_metering_1, 
	type = "l",
	xlab = "", 
	ylab = "Energy sub metering",
	col = "black")

# Add Sub_metering_2 data in red to the 3rd plot
lines(power_df$Time, power_df$Sub_metering_2, col = "red")

# Add Sub_metering_3 data in blue to the 3rd plot
lines(power_df$Time, power_df$Sub_metering_3, col = "blue")
  
# Add a legend at topright corner with no box
legend("topright", 
	legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
	col = c('black', 'red', 'blue'), 
	lty = 1,
	box.lty = 1, box.lwd = 0, box.col = 'white', inset = .01)
	
# 4th "Global_reactive_power" plot
plot(power_df$Time, power_df$Global_reactive_power, 
	type = "l",
	xlab = "datetime",
	ylab = "Global_reactive_power")

dev.off()
