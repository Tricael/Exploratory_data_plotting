library(dplyr)
library(tidyr)
library(lubridate)
library(ggplot2)
setwd("C:\\Users\\Piyo\\Documents\\R\\Exploratory Data\\ExData_Plotting1")
plotdat<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
plot3<-tbl_df(plotdat)
plot3<-filter(plotdf,dmy(Date) >= ymd(20070201) & dmy(Date)<=ymd(20070202))
plot3<-mutate(plot3,DateTime=paste(Date,Time))
plot3$DateTime<-strptime(plot3$DateTime,"%d/%m/%Y %H:%M:%S")


hist(plot3$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")

plot(plot3$DateTime,plot3$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="DateTime")

yrange<-range(c(plot3$Sub_metering_1,plot3$Sub_metering_2,plot3$Sub_metering_3))
plot(plot3$DateTime,plot3$Sub_metering_1,ylim=yrange,type="l",ylab="Energy Sub Metering",xlab="",col="black")
par(new=T)
plot(plot3$DateTime,plot3$Sub_metering_2,ylim=yrange,type="l",ylab="",xlab="",col="red")
par(new=T)
plot(plot3$DateTime,plot3$Sub_metering_3,ylim=yrange,type="l",ylab="",xlab="",col="blue")
par(new=F)
legend("topright",c("Sub metering 1","Sub metering 2","Sub metering 3"),lty=c(1,1),lwd=c(1,1),col=c("black","red","blue"),cex=0.5)



par(mfrow=c(2,2))
hist(plot3$Global_active_power,col="red",main="Global Active Power")

plot(plot3$DateTime,plot3$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="DateTime")

yrange<-range(c(plot3$Sub_metering_1,plot3$Sub_metering_2,plot3$Sub_metering_3))
plot(plot3$DateTime,plot3$Sub_metering_1,ylim=yrange,type="l",ylab="Energy Sub Metering",xlab="",col="black")
par(new=T)
plot(plot3$DateTime,plot3$Sub_metering_2,ylim=yrange,type="l",ylab="",xlab="",col="red")
par(new=T)
plot(plot3$DateTime,plot3$Sub_metering_3,ylim=yrange,type="l",ylab="",xlab="",col="blue")
legend("topright",c("Sub metering 1","Sub metering 2","Sub metering 3"),lty=c(1,1),lwd=c(1,1),col=c("black","red","blue"))
par(new=F)

plot(plot3$DateTime,plot3$Global_reactive_power,type="l",ylab="Global Reactive Power",xlab="DateTime")

