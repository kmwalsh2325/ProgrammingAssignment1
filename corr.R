corr <- function(directory, threshold = 0) {
     ## 'directory' is a character vector of length 1 indicating
     ## the location of the CSV files

     ## 'threshold' is a numeric vector of length 1 indicating the
     ## number of completely observed observations (on all
     ## variables) required to compute the correlation between
     ## nitrate and sulfate; the default is 0

     ## Return a numeric vector of correlations    

    master.v <- as.numeric(c())

    for(file in list.files(directory, pattern = ".csv")){

      file.path <- paste(directory, file, sep="/")

      temp <- read.csv(file.path, header=TRUE)
      temp <- temp[complete.cases(temp),]
      nobs <- nrow(temp)

      if(nobs > threshold){

        correlation <- round(cor(temp$sulfate, temp$nitrate), 5) #removing round works for question 8
        master.v <- append(master.v, correlation)

      }
      else {}

    }

    master.v


} ## end corr