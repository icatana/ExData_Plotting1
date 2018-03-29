# Source the read power dataset function
source("read_dataset.R")

# Read power dataset function only for 2 days (1/2/2007 and 2/2/2007)
# More details inside the above sourced "read_dataset.R" file
power_df <- read_dataset()

# Set locale for POSIXlt time to be displayed in English
Sys.setlocale(category = "LC_ALL", locale = "english")

# Draw the plot
plot(power_df$Time, 
	power_df$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)")

# Copy the above plot to the PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
