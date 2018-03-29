# Source the read power dataset function
source("read_dataset.R")

# Read power dataset function only for 2 days (1/2/2007 and 2/2/2007)
# More details inside the above sourced "read_dataset.R" file
power_df <- read_dataset()

# Set locale for POSIXlt time to be displayed in English
Sys.setlocale(category = "LC_ALL", locale = "english")

# Save the plot to the PNG file
png(filename='plot3.png', width=480, height=480, units='px')

# Draw the initial Sub_metering_1 plot in black
plot(power_df$Time, 
	power_df$Sub_metering_1,
	type = "l",
	xlab = "",
	ylab = "Energy sub metering",
	col = "black")
  
# Add Sub_metering_2 data in red to the initial plot
lines(power_df$Time, power_df$Sub_metering_2, col = "red")

# Add Sub_metering_3 data in blue to the initial plot
lines(power_df$Time, power_df$Sub_metering_3, col = "blue")
  
# Add a legend at topright corner
legend("topright", 
	legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
	col = c('black', 'red', 'blue'), 
	lty = c(1, 1, 1))

dev.off()
