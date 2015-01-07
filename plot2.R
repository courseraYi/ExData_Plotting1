# Set locale to get "Thu, Fri, Sat", not "四, 五, 六" for weekdays
# 修改本地时间的环境变量，使用英文而非中文
Sys.setlocale("LC_TIME", "en_US.UTF-8")

data.full <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data.need <- subset(data.full, Date=="1/2/2007" | Date=="2/2/2007")
data <- transform(data.need, dt=paste(Date, Time, sep=" "))
data <- transform(data, dt=strptime(dt, format="%d/%m/%Y %H:%M:%S"))

png("plot2.png")
plot(data$dt, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
