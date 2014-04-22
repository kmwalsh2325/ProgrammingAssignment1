complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used

    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases

    master.df <- data.frame()
    i <- 1

    for(file in list.files(directory, pattern = ".csv")[id]){

      file.path <- paste(directory, file, sep="/")

      temp <- read.csv(file.path, header=TRUE)
      temp <- temp[complete.cases(temp),]
      nobs <- nrow(temp)

      new.df <- data.frame("id" = id[i], "nobs" = nobs)
      master.df <- rbind(master.df, new.df)
      i<-i++1

    }
    
    master.df


} ## end complete