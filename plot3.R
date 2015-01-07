# Set locale to get "Thu, Fri, Sat", not "四, 五, 六" for weekdays
# 修改本地时间的环境变量，使用英文而非中文
Sys.setlocale("LC_TIME", "en_US.UTF-8")

data.full <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data.need <- subset(data.full, Date=="1/2/2007" | Date=="2/2/2007")
data <- transform(data.need, dt=paste(Date, Time, sep=" "))
data <- transform(data, dt=strptime(dt, format="%d/%m/%Y %H:%M:%S"))

png("plot3.png")
plot(data$dt, data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(data$dt, data$Sub_metering_2, col="red")
lines(data$dt, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()
