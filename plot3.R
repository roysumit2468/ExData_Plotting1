data<-read.table("exploratory_analysis//household_power_consumption.txt",
                 sep = ";",header = T,stringsAsFactors = F,na.strings="?")

## na.strings converts missing values coded as "?" in data to na
str(data)
names(data)<-tolower(names(data))
data[,1]<-as.Date(data[,1],format = "%d/%m/%Y")
data<-data[data[,1]>=as.Date("2007-02-01") &  data[,1]<=as.Date("2007-02-02"),]

data$datetime<-paste(data$date,data$time)
a<-strptime(data$datetime,format = "%Y-%m-%d %H:%M:%S")
plot(a,data$sub_metering_1,type="l",xlab = "",ylab = "Energy_sub metering")
points(a,data$sub_metering_2,type="l",col="red")
points(a,data$sub_metering_3,type="l",col="blue")
legend("topright",pch = "_",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),
       )

###png plot save
dev.copy(png,"plot3.png",width=600)
dev.off()