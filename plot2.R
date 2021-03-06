classes=c(rep("character",2),rep("double",7))
alldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=classes,strip.white=TRUE,na.strings=c("?",""),nrows=69518,blank.lines.skip=TRUE,)
data<-subset(alldata,alldata[,"Date"]=="1/2/2007"|alldata[,"Date"]=="2/2/2007")
NewDate<-as.Date(data$Date)
data<-cbind(data,NewDate)
days<-weekdays(data$NewDate)
len<-length(days)
windows()
days<-c("Thur","Fri","Sat")
plot(data$Global_active_power,type="l",ylab="Global active power (kilowatts)",xaxt="n",xlab="")
axis(1,at=c(0,len/2,len),labels=c("Thur","Fri","Sat"))
dev.copy(device=png,"plot2.png",width=480,height=480,units="px")
dev.off()
