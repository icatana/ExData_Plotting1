
# Source the read power dataset function
source("read_dataset.R")

# Read power dataset function only for 2 days (1/2/2007 and 2/2/2007)
# More details inside the above sourced "read_dataset.R" file
power_df <- read_dataset()

# Draw the plot
hist(power_df$Global_active_power, 
	main = "Global Active Power", 
	xlab = "Global Active Power (kilowatts)", 
	ylab = "Frequency",
	col = "red")

# Copy the above plot to the PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
