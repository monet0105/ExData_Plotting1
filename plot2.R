plot2 <- function(filename) {

    # 读取数据
    myData <- read.table(filename, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")

    # 将date和time由字符串变量转化为日期变量
    myData$Time <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
    myData$Date <- as.Date(myData$Date, "%d/%m/%Y")

    # 使用2007-02-01到2007-02-02的数据
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    myData <- subset(myData, Date %in% dates)
    
    #做图
    png("plot2.png", width=480, height=480)
    
    plot(myData$Time, myData$Global_active_power,
        type="l",
        xlab="",
        ylab="Global Active Power (kilowatts)"
        )

    dev.off()
}
