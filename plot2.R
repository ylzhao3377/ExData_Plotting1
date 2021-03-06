#change the file path to adjust your computer
setwd('~/Documents/coursera')
powerdata<-read.table('household_power_consumption.txt',header=TRUE,sep=";",stringsAsFactors = FALSE)
mydata<-subset(powerdata, Date %in% c('1/2/2007',"2/2/2007"))
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
newtime<-as.POSIXct(strptime(paste(mydata$Date, mydata$Time,sep = ' '),"%Y-%m-%d %H:%M:%S"))
mydata$weekdays<-weekdays(mydata$Date)
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
attach(mydata)
png(filename = "plot2.png",width = 480, height = 480)
plot(newtime, mydata$Global_active_power,xlab='',ylab='Global active power(kilowatt)',type = 'l',cex.lab=0.75,cex.axis=0.75)
dev.off()
