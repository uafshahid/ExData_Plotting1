classes=c(rep("character",2),rep("double",7))
alldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=classes,strip.white=TRUE,na.strings=c("?",""),nrows=69518,blank.lines.skip=TRUE,)
data<-subset(alldata,alldata[,"Date"]=="1/2/2007"|alldata[,"Date"]=="2/2/2007")
NewDate<-as.Date(data$Date)
data<-cbind(data,NewDate)
days<-weekdays(data$NewDate)
len<-length(days)
windows()
days<-c("Thur","Fri","Sat")
par(mfrow=c(2,2))

plot(data$Global_active_power,type="l",ylab="Global active power",xaxt="n",xlab="")
axis(1,at=c(0,len/2,len),labels=c("Thur","Fri","Sat"))

plot(data$Voltage,type="l",ylab="Voltage",xaxt="n",xlab="datetime")
axis(1,at=c(0,len/2,len),labels=c("Thur","Fri","Sat"))

plot(data$Sub_metering_1,type="n",ylab="Energy sub metering",xaxt="n",xlab="")
axis(1,at=c(0,len/2,len),labels=c("Thur","Fri","Sat"))
points(data$Sub_metering_1,col="black",type="l")
points(data$Sub_metering_2,col="red",type="l")
points(data$Sub_metering_3,col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,xpd=1,bty="n")

plot(data$Global_reactive_power,type="l",ylab="Global_reactive_power",xaxt="n",xlab="datetime")
axis(1,at=c(0,len/2,len),labels=c("Thur","Fri","Sat"))

dev.copy(device=png,"F:/E/Courses/DataScienceSpecialization/ExploratoryDataAnalysis/data/ExData_Plotting1/plot4.png",width=480,height=480,units="px",pointsize = 9)
dev.off()
