data<-read.table("exploratory_analysis//household_power_consumption.txt",
                 sep = ";",header = T,stringsAsFactors = F,na.strings="?")

## na.strings converts missing values coded as "?" in data to na
str(data)
names(data)<-tolower(names(data))
data[,1]<-as.Date(data[,1],format = "%d/%m/%Y")
data<-data[data[,1]>=as.Date("2007-02-01") &  data[,1]<=as.Date("2007-02-02"),]
nrow(data) ##2880

## missing values coded as "?" in data

with(data,hist(global_active_power,xlab = "Global Active Power(kilowatts)",ylab = "frequency",
               main="Global Active Power",col="red"))


######copy plot to png file
dev.copy(png,"plot1.png")
dev.off()