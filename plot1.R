classes=c(rep("character",2),rep("double",7))
alldata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=classes,strip.white=TRUE,na.strings=c("?",""),nrows=69518)
data<-subset(alldata,alldata[,"Date"]=="1/2/2007"|alldata[,"Date"]=="2/2/2007")
windows()
GAP<-data[,"Global_active_power"]
hist(GAP,col="red",xlab="Global active power (kilowatts)", main = paste("Global Active Power"))
dev.copy(device=png,"F:/E/Courses/DataScienceSpecialization/ExploratoryDataAnalysis/data/ExData_Plotting1/plot1.png")
dev.off()

