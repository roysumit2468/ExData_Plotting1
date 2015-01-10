data<-read.table("exploratory_analysis//household_power_consumption.txt",
                 sep = ";",header = T,stringsAsFactors = F,na.strings="?")

## na.strings converts missing values coded as "?" in data to na
str(data)
names(data)<-tolower(names(data))
data[,1]<-as.Date(data[,1],format = "%d/%m/%Y")
data<-data[data[,1]>=as.Date("2007-02-01") &  data[,1]<=as.Date("2007-02-02"),]

par(mfrow = c(2,2))

data$datetime<-paste(data$date,data$time)
a<-strptime(data$datetime,format = "%Y-%m-%d %H:%M:%S")
plot(a,data$global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(a,data$voltage,type="l",xlab = "datetime",ylab="voltage")
plot(a,data$sub_metering_1,type="l",xlab = "",ylab = "Energy_sub metering")
points(a,data$sub_metering_2,type="l",col="red")
points(a,data$sub_metering_3,type="l",col="blue")
legend("topright",pch = "_",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),cex=0.5,xjust=0.5,yjust=1,bty="n")

plot(a,data$global_reactive_power,type="l",xlab = "datetime",ylab="Global_reactive_power")

##plot save
dev.copy(png,"plot4.png")
dev.off()