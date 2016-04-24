library(dplyr)
library(tidyr)
library(lubridate)

#setwd()   ##set your working dir
plotdat<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
plot3<-tbl_df(plotdat)
plot3<-filter(plotdf,dmy(Date) >= ymd(20070201) & dmy(Date)<=ymd(20070202))
plot3<-mutate(plot3,DateTime=paste(Date,Time))
plot3$DateTime<-strptime(plot3$DateTime,"%d/%m/%Y %H:%M:%S")


png('plot2.png')
plot(plot3$DateTime,plot3$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="DateTime")
dev.off()

