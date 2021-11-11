library(dplyr)

zipfile<-"getdata_projectfiles_UCI HAR Dataset.zip"

## check if zip file is in directory
if (!file.exists(zipfile)){
  ## download file from url
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                zipfile,mode= "wb")
}
## check if file exists
if (!file.exists("UCI HAR Dataset")){
  ## unzip files 
  unzip(zipfile)
}

## read test files
x_test<-read.table(file.path(getwd(),'UCI HAR Dataset',"test","X_test.txt"))
y_test<-read.table(file.path(getwd(),'UCI HAR Dataset',"test","y_test.txt"))
subject_test<-read.table(file.path(getwd(),'UCI HAR Dataset',"test","subject_test.txt"))
## read train files
x_train<-read.table(file.path(getwd(),'UCI HAR Dataset',"train","X_train.txt"))
y_train<-read.table(file.path(getwd(),'UCI HAR Dataset',"train","y_train.txt"))
subject_train<-read.table(file.path(getwd(),'UCI HAR Dataset',"train","subject_train.txt"))

## read labels and features
activity_labels<-read.table(file.path(getwd(),'UCI HAR Dataset',"activity_labels.txt"))
features<-read.table(file.path(getwd(),'UCI HAR Dataset',"features.txt"))

## merge data sets
df_test<-cbind(subject_test,y_test,x_test)
df_train<-cbind(subject_train,y_train,x_train)
df<-rbind(df_test,df_train)

## set descriptive variable names
names(df)<-c("subject","activity",features[,2])

## extract mean and sd measurements
df_extract<-df[,c(1,2,grep(pattern = "mean()|std()",x= names(df)))]

## use descriptive activity names and labels
df_extract$activity<-sapply(df_extract$activity, function (i){activity_labels[i,2]})
names(df_extract)<-gsub("-mean()","MEAN",names(df_extract))
names(df_extract)<-gsub("-std()","STD",names(df_extract))
names(df_extract)<-gsub("[-()]","",names(df_extract))


## create tidy data set
tidy_dataset<-as_tibble(df_extract)
tidy_dataset%>% group_by(subject,activity)%>% summarise_all(mean)%>%write.table("tidy_dataset.txt",row.names = FALSE,quote = FALSE)
