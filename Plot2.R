 

# Checking the size to estimate if I have enough memory
benchmark.size <- object.size(read.table("household_power_consumption.txt", nrows = 1000))
num.lines <- as.numeric(gsub("[^0-9]", "", system("wc -l household_power_consumption.txt", intern = T)))
size.estimate <- num.lines / 1000 * benchmark.size
#315124080.48 bytes

dat <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)
dat$Date <- as.Date(strptime(dat$Date, format="%d/%m/%Y"))

# Work with only a subset of data
test.data <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")


# Join date and time columns and convert to format as datetime
dt.time <- as.POSIXct(paste(test.data$Date, test.data$Time), format="%Y-%m-%d %H:%M:%S")

png("Plot2.png", width = 480, height = 480)

plot(dt.time, test.data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
