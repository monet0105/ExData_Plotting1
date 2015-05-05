plot3 <- function(filename) {

    # 读取数据
    myData <- read.table(filename, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")

    # 将date和time由字符串变量转化为日期变量
    myData$Time <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
    myData$Date <- as.Date(myData$Date, "%d/%m/%Y")

    # 使用2007-02-01到2007-02-02的数据
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    myData <- subset(myData, Date %in% dates)
    
    #做图
    png("plot3.png", width=480, height=480)
    
    plot(myData$Time, myData$Sub_metering_1, type="l", col="black",  xlab="", ylab="Energy sub metering")
    lines(myData$Time, myData$Sub_metering_2, col="red")
    lines(myData$Time, myData$Sub_metering_3, col="blue")
    legend("topright",
        col=c("black", "red", "blue"),
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=1
        )

    # Close device
    dev.off()
}