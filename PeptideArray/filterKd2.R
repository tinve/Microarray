## Reads csv data with 2-Site fit output. Replaces all output parameters
## (starting from 5th column) with NAs if either Kd1 <= Kd1Err or
## Kd2 <= Kd2Err.

filter.Kd2 <- function(data) {
    
    n <- nrow(data)
    output <- data.frame()
    
    for(i in 1:n) {
        if(! is.na(data$Kd1[i]) && (data$Kd1[i] <= data$Kd1Err[i]
                                 || data$Kd2[i] <= data$Kd2Err[i])) {
            for(j in 5:ncol(data)) {
                data[i, j] <- NA
            }
        }
    }
    
    output <- data
    invisible(output)
}