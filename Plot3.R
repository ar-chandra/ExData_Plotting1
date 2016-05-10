
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

png("Plot3.png", width = 480, height = 480)

with(test.data, plot(dt.time, Sub_metering_1, xlab = "", 
                     ylab = "Enerygy sub metering", type = "l"))
lines(dt.time, test.data$Sub_metering_2, col = "red")
lines(dt.time, test.data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()








