pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used

    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)

    master.df <- data.frame()

    for(file in list.files(directory, pattern = ".csv")[id]){

    	file.path <- paste(directory, file, sep="/")

    	temp <- read.csv(file.path, header=TRUE)
    	temp <- temp[pollutant]
    	master.df <- rbind(master.df, temp)

    }
    master.df <- master.df[complete.cases(master.df), ]
    round(mean(master.df), 3)


} ## end pollutantmean