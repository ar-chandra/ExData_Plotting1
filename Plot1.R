

# Checking the size to estimate if I have enough memory
benchmark.size <- object.size(read.table("household_power_consumption.txt", nrows = 1000))
num.lines <- as.numeric(gsub("[^0-9]", "", system("wc -l household_power_consumption.txt", intern = T)))
size.estimate <- num.lines / 1000 * benchmark.size
#315124080.48 bytes

dat <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)
dat$Date <- as.Date(strptime(dat$Date, format="%d/%m/%Y"))

# Work with only a subset of datasubset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")

# 1 

png("Plog", width = 480, height = 480)

hist(as.numeric(test.data$Global_active_power), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()


