#
# Exploratory data analysis assignment: Course Project 1
# Reads the dataset about electric power consumption from the UC Irvine Machine Learning Repository
#

# Load libraries
library("curl")
library("dplyr")

# Read power dataset function only for 2 days (1/2/2007 and 2/2/2007)
read_dataset <- function() {

	# If the Getting and Cleaning Data archive does not exist, download and extract it 
	file_name <- "household_power_consumption.txt"
	zip_file <- "archive.zip"
	if (!file.exists(file_name)) {
		download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = zip_file)
		unzip(zip_file)
	}

	# Retrieve the column names
	col_names <- read.table(file_name, header = TRUE, nrows = 2,  sep = ";", na.strings = c("?")) %>% names
	
	# Load only the 2 days content into a data frame
	# It skips until it finds the line depicted in grep("1/2/2007",) and reads the lines after that
	# Calculate nb of rows to read for 2 days: 2d x 24h x 60m = 2880 (number of minutes in 2 days)
	power_df <- read.table(
			file_name, 
			skip = grep("1/2/2007", readLines("household_power_consumption.txt")) - 1, 
			nrows = 2880, 
			sep = ";", 
			na.strings = c("?"))	
	names(power_df) <- col_names
	
	# Convert the Date and Time columns from Factor to Date/Time classes
	# Concatenate date and time because we have 2 different days 
	daytime <- paste(power_df$Date, power_df$Time);
	power_df$Date <- as.Date(power_df$Date, "%d/%m/%Y")
	power_df$Time <- strptime(daytime, "%d/%m/%Y %H:%M:%S")
	
	return (power_df)
}
