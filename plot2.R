data<-read.table("exploratory_analysis//household_power_consumption.txt",
                 sep = ";",header = T,stringsAsFactors = F,na.strings="?")

## na.strings converts missing values coded as "?" in data to na
str(data)
names(data)<-tolower(names(data))
data[,1]<-as.Date(data[,1],format = "%d/%m/%Y")
data<-data[data[,1]>=as.Date("2007-02-01") &  data[,1]<=as.Date("2007-02-02"),]

data$datetime<-paste(data$date,data$time)
a<-strptime(data$datetime,format = "%Y-%m-%d %H:%M:%S")
plot(a,data$global_active_power,type="l",xlab = "",
     ylab = "Global Active Power(kilowatts)")
####png plot save
dev.copy(png,"plot2.png")
dev.off()