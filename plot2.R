## created by RCE 20140712 23:09 (-6 GMT) for the Coursera course Exploratory Data Analysis
## first project.

## first we load the data form the text file downloaded from the link provided.
## hpc stands for Household power consumption
hpcdata <- read.csv("household_power_consumption.txt", sep=";")

## making some conversions and adding datetime variable
hpcdata[,3]<-as.numeric(as.character(hpcdata[,3]))
hpcdata$datetime<-strptime(paste(hpcdata[,1],hpcdata[,2]),format="%d/%m/%Y %H:%M:%S")
hpcdata[,1]<-as.Date(hpcdata[,1],format="%d/%m/%Y") ##converting to date, it takes some time to process

## filtering the dates to plot
hpcdata<-subset(hpcdata,Date>=as.Date("2007-02-01"))
hpcdata<-subset(hpcdata,Date<=as.Date("2007-02-02"))

##try to reproduce the second graphic (line xy grpahic)
with(hpcdata,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
## copying the plot to png file with dev.print()
dev.print(png,file="plot2.png",width=480,height=480)
## closing the png device
dev.off()