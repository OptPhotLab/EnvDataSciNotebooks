# Example SmartSMEAR API calls:

urlstring<-"https://avaa.tdata.fi/smear-services/smeardata.jsp?variables=Pamb0,UV_B&table=HYY_META
&from=2016-02-11 00:00:00&to=2016-02-11 00:10:00&quality=ANY&averaging=NONE&type=NONE"

urlstring2<-"https://avaa.tdata.fi/smear-services/smeardata.jsp?variables=Pamb0,UV_B&table=HYY_META
&from=2016-02-11 00:11:00&to=2016-02-11 00:20:00&quality=ANY&averaging=NONE&type=NONE"

urlstring
urlstring2

#The most simple way for retrieving data via SmartSMEAR API is using read.csv which returns the data stream as data frame. It works in basic R without additional libraries:

data<-read.csv(urlstring)

data2<-read.csv(urlstring2)

class(data)
data
data2

# Construct times in POSIX time (seconds)

time2<-Sys.time()
format(time2,"%Y-%m-%d %H:%M:%S")

time2<-as.POSIXct("2018-10-29 12:00:00")
format(time2,"%Y-%m-%d %H:%M:%S")

time1<-time2-3600
format(time1,"%Y-%m-%d %H:%M:%S")


# Let's try pasting the dates as parameters to form the API call

time2<-Sys.time()-86400
timestr2<-format(time2,"%Y-%m-%d %H:%M:%S")
time1<-time2-3600
timestr1<-format(time1,"%Y-%m-%d %H:%M:%S")

urlstring<-paste("https://avaa.tdata.fi/smear-services/smeardata.jsp?variables=T168,T672&table=HYY_META&from=",
    timestr1,"&to=",timestr2,
    "&quality=ANY&averaging=30MIN&type=ARITHMETIC",sep="")

urlstring

data<-read.csv(urlstring)

data


#Below simple function for constructing API call from given parameters and downloading data. Named parameters are used so the user can give table and variables separately or use table.variable notation, give parameters in any order and skip irrelevant parameters. The function employs read.csv which ignores any http return codes or error messages. Therefore, additional parsing of returned data frame is needed.

#Different types of error affect the returned data in different ways. Be careful and take note of the column names of the returned data frame!

getSmearData<-function(time1,time2,...,dbtable="",dbvariables=list(),dbtablevariables=list(),
  quality="ANY",averaging="NONE",avgtype="NONE") {

# Simple function for retrieving data from SMEAR database
# No input check, error handling etc.
# time1 and time2 are start and end times as POSIX time.
# Downloaded variables are given as list of table.variable strings (parameter "dbtablevariables").
# or giving table (string "dbtable") and variables (list "dbvariables") separately.
# Results of the query are returned as data frame (also in case of error).

timestr1=as.character(time1,"%Y-%m-%d %H:%M:%S")
timestr2=as.character(time2,"%Y-%m-%d %H:%M:%S")

if(length(dbtablevariables)<1) {
  urlstring<-paste("https://avaa.tdata.fi/smear-services/smeardata.jsp?",
    "variables=",paste(dbvariables,collapse=","),
    "&table=",dbtable,
    "&from=",timestr1,
    "&to=",timestr2,
    "&quality=",quality,"&averaging=",averaging,"&type=",avgtype,sep="")
}
else {
  urlstring<-paste("https://avaa.tdata.fi/smear-services/smeardata.jsp?",
    "tablevariables=",paste(dbtablevariables,collapse=","),
    "&from=",timestr1,
    "&to=",timestr2,
    "&quality=",quality,"&averaging=",averaging,"&type=",avgtype,sep="")
}
    
print(urlstring)
    
return(read.csv(urlstring))
}

# Example data queries:

time2<-as.POSIXct("2018-10-27 12:00:00")
time1<-time2-3600
tablename<-"HYY_META"
variables_list<-c("Pamb0")
tablevariables_list=c("HYY_META.Pamb0")

# data1<-getSmearData(time1,time2,dbtable=tablename,dbvariables=variables_list)
data1<-getSmearData(time1,time2,dbtablevariables=tablevariables_list)

time2<-as.POSIXct("2018-10-27 12:00:00")
time1<-time2-3600
tablename<-"HYY_META"
variables_list<-c("Pamb0","T672")
avg_time="30MIN"
avg_type="Arithmetic"

data2<-getSmearData(time1,time2,dbtable=tablename,dbvariables=variables_list,
    averaging=avg_time,avgtype=avg_type)

data1
data2

#SmartSMEAR API gives http return codes and in most cases also meaningful error messages. Read.csv cannot handle the http codes and also tries to convert the error messages to data frame. Below some examples.

#Some dedicated http libraries, for instance RCurl, can handle error messages better.


# In case of error, API returns meaningful error message
# There are also other ways to check if the API call returned any data.

time2<-Sys.time()-86400
time1<-time2-180

# data<-getSmearData(time1,time2,dbtable="HYY_XXXX",dbvariables=c("Glob"))
data<-getSmearData(time1,time2,dbtable="HYY_META",dbvariables=c("xxxx"))

if(names(data)[1]!="Year" | dim(data)[1]<1) {
  print(data)
}

# Note when using tablevariables parameter:
# If any variable of given table does not exist, no data from that table are returned.

time2<-Sys.time()-86400
time1<-time2-180

data<-getSmearData(time1,time2,dbtablevariables=c("HYY_META.Glob","HYY_META.Glob67","SII1_META.Glob"))
data

# Glob127 does not exist in HYY_META, only data from SII1_META are returned
data<-getSmearData(time1,time2,dbtablevariables=c("HYY_META.Glob","HYY_META.Glob127","SII1_META.Glob"))
data

# Sometimes there are missing rows in the database, align the rows with merge
# Example: Hyytiälä and Siikaneva 1 meteo data in Feb 2016

urlstring<-"https://avaa.tdata.fi/smear-services/smeardata.jsp?variables=Pamb0,T168&table=HYY_META
&from=2016-02-26 23:58:00&to=2016-02-27 00:03:00&quality=ANY&averaging=NONE&type=NONE"

urlstring2<-"https://avaa.tdata.fi/smear-services/smeardata.jsp?variables=P,T_a&table=SII1_META
&from=2016-02-26 23:58:00&to=2016-02-27 00:03:00&quality=ANY&averaging=NONE&type=NONE"

data<-read.csv(urlstring)
data

data2<-read.csv(urlstring2)
data2

merge(data,data2,all=TRUE)

# Convert datetime columns to more convenient data type
data$datetim<-with(data,ISOdatetime(Year,Month,Day,Hour,Minute,Second))

data$datetim

data$datetim+86400
