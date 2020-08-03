url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(url,destfile='./Data/dd.csv',method='curl')
list.files("./Data")
cameraData = read.table('./Data/dd.csv',sep=',',header=TRUE)
head(cameraData)
sum(cameraData$VAL==24,na.rm=TRUE)
cameraData$FES

URL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(URL,destfile='./Data/dd2.xlsx',method='curl')
install.packages("xlsx")
library("xlsx")
col = 7:15
row = 18:23
list.files("./Data")
dat = read.xlsx("./Data/dd2.xlsx",sheetIndex=1,colIndex=col,rowIndex=row)
dat
sum(dat$Zip*dat$Ext,na.rm=T)

URL3 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
install.packages("XML",repos = "http://www.omegahat.net/R")
library('XML')
doc = xmlTreeParse(sub("s", "", URL3),useInternal=TRUE)
rootNode = xmlRoot(doc)
zip = xpathApply(rootNode,'//zipcode',xmlValue)
sum(zip==21231)

URL4 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(URL4,destfile='./Data/dd4.csv',method='curl')
install.packages('data.table')
library("data.table")
DT = fread('./Data/dd4.csv')
DT
system.time(mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(rowMeans(DT)[DT$SEX==1],rowMeans(DT)[DT$SEX==2])
system.time(DT[,mean(pwgtp15),by=SEX])
