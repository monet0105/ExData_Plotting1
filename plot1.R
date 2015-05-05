plot1 <- function(filename) {

    myData <- read.table(filename, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")

    myData$Time <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
    myData$Date <- as.Date(myData$Date, "%d/%m/%Y")

    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    myData <- subset(myData, Date %in% dates)
    
    png("plot1.png", width=480, height=480)

    hist(myData$Global_active_power,
        main="Global Active Power",
        xlab="Global Active Power (kilowatts)",
        ylab="Frequency",
        col="red"
        )

    dev.off()
}
