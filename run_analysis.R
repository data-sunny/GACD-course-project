


## 1. Merge data sets : training and test

  # load packages
    library(dplyr)
    
  # read data
    x_train <- read.table("train/X_train.txt")
    actnos_train <- read.table("train/y_train.txt"); names(actnos_train)[1] <- "activity"
    subnos_train <- read.table("train/subject_train.txt"); names(subnos_train)[1] <- "subject"
    
    x_test <- read.table("test/X_test.txt")
    actnos_test <- read.table("test/y_test.txt"); names(actnos_test)[1] <- "activity"
    subnos_test <- read.table("test/subject_test.txt"); names(subnos_test)[1] <- "subject"
    
    # Prepare for new names - vector for merged, data col names & replacing activity nos with names
    data_col_12_names <- c("subject", "activity"); data_col_last_name <- c("status")
    measurement_names <- read.table("features.txt"); msmt_names <- as.character(measurement_names[,2])
    merged_data_names <- c(data_col_12_names, msmt_names, data_col_last_name)
    activity_names <- read.table("activity_labels.txt"); act_names <- as.character(activity_names[,2])
    
    
  # bind data
    # column bind : subject to activity, then to test data, then add train/test identifier column at end
      subactnos_train <- bind_cols(subnos_train, actnos_train)
      subactnosdata_train <- bind_cols(subactnos_train, x_train)
      binded_data_train <- mutate(subactnosdata_train, status = "train")
    
      subactnos_test <- bind_cols(subnos_test, actnos_test)
      subactnosdata_test <- bind_cols(subactnos_test, x_test)
      binded_data_test <- mutate(subactnosdata_test, status = "test")
      
    # merge and rename training and test data set
      merged_data <- rbind(binded_data_train, binded_data_test)
      colnames(merged_data) <- merged_data_names
    
##############################################################################################################

## 2. Extract measurements : mean and sd for each measurement
    # based on review of "features_info.txt" file the measurement names were identifed
    # using "merged_data[, grepl("mean", colnames(merged_data))] the col names were looked at
    # using "head(names(merged_data), 10) the column locations were identified

    trunc_data <- merged_data[,c(1:8,43:48, 564)]
    # sort data under views - status, subject, activity
    sort_data <- arrange(trunc_data, status, subject, activity)
    
## 3. Rename : activity numbers by descriptive names
    sort_data$activity[sort_data$activity == "1"] <- act_names[1]
    sort_data$activity[sort_data$activity == "2"] <- act_names[2]
    sort_data$activity[sort_data$activity == "3"] <- act_names[3]
    sort_data$activity[sort_data$activity == "4"] <- act_names[4]
    sort_data$activity[sort_data$activity == "5"] <- act_names[5]
    sort_data$activity[sort_data$activity == "6"] <- act_names[6]

## 4. Label the data set with descriptive variable names
    colnames(sort_data)[3] <- "BodyAcc.Mean.X"
    colnames(sort_data)[4] <- "BodyAcc.Mean.Y"
    colnames(sort_data)[5] <- "BodyAcc.Mean.Z"
    colnames(sort_data)[6] <- "BodyAcc.Std.X"
    colnames(sort_data)[7] <- "BodyAcc.Std.Y"
    colnames(sort_data)[8] <- "BodyAcc.Std.Z"
    
    colnames(sort_data)[9] <- "GravityAcc.Mean.X"
    colnames(sort_data)[10] <- "GravityAcc.Mean.Y"
    colnames(sort_data)[11] <- "GravityAcc.Mean.Z"
    colnames(sort_data)[12] <- "GravityAcc.Std.X"
    colnames(sort_data)[13] <- "GravityAcc.Std.Y"
    colnames(sort_data)[14] <- "GravityAcc.Std.Z"

## 5. Create a tide data set with average of each variable for each activity and each subject
    summary_data <- sort_data %>%
      group_by(subject, activity) %>%
        mutate(
          BodyAcc.Mean.X = mean(BodyAcc.Mean.X), BodyAcc.Mean.Y = mean(BodyAcc.Mean.Y),
          BodyAcc.Mean.Z = mean(BodyAcc.Mean.Z), BodyAcc.Std.X = mean(BodyAcc.Std.X),
          BodyAcc.Std.Y = mean(BodyAcc.Std.Y), BodyAcc.Std.Z = mean(BodyAcc.Std.Z),
          GravityAcc.Mean.X = mean(GravityAcc.Mean.X), GravityAcc.Mean.Y = mean(GravityAcc.Mean.Y),
          GravityAcc.Mean.Z = mean(GravityAcc.Mean.Z), GravityAcc.Std.X = mean(GravityAcc.Std.X),
          GravityAcc.Std.Y = mean(GravityAcc.Std.Y), GravityAcc.Std.Z = mean(GravityAcc.Std.Z)
          )%>%
          unique()%>%
            group_by(subject)%>%
              arrange(subject)
    
    write.table(summary_data[,1:14], file = "tidy_data_set_Sunny.txt", row.names=FALSE)