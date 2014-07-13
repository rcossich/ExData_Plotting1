## created by RCE 20140713 10:37 (-6 GMT) for the Coursera course Exploratory Data Analysis
## first project.

## first we load the data form the text file downloaded from the link provided.
## hpc stands for Household power consumption
hpcdata <- read.csv("household_power_consumption.txt", sep=";")

## making some conversions and adding datetime variable
hpcdata[,3]<-as.numeric(as.character(hpcdata[,3]))
hpcdata[,7]<-as.numeric(as.character(hpcdata[,7]))
hpcdata[,8]<-as.numeric(as.character(hpcdata[,8]))
hpcdata[,9]<-as.numeric(as.character(hpcdata[,9]))
hpcdata$datetime<-strptime(paste(hpcdata[,1],hpcdata[,2]),format="%d/%m/%Y %H:%M:%S")
hpcdata[,1]<-as.Date(hpcdata[,1],format="%d/%m/%Y") ##converting to date, it takes some time to process

## filtering just the dates asked to plot
hpcdata<-subset(hpcdata,Date>=as.Date("2007-02-01"))
hpcdata<-subset(hpcdata,Date<=as.Date("2007-02-02"))

##try to reproduce the third graphic (line xy graphic)
quartz(width=6,height=6,bg="white") ##i am using my mac, this will not run on other platform.
with(hpcdata,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"),mar=c(5.1,4,4,1.5))
with(hpcdata,lines(datetime,Sub_metering_2,type="l",col="red"))
with(hpcdata,lines(datetime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,xjust=0,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6)
## copying the plot to png file with dev.print()
dev.print(png,file="plot3.png",width=480,height=480)
## closing the png device
dev.off()