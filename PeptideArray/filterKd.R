## Reads csv data with 1-to-1 fit output. Replaces all output parameters
## (starting from 5th column) with NAs if Kd <= KdErr

filter.Kd <- function(data) {
    
    n <- nrow(data)
    output <- data.frame()
    
    for(i in 1:n) {
        if(! is.na(data$Kd[i]) && data$Kd[i] <= data$KdErr[i]) {
            for(j in 5:ncol(data)) {
                data[i, j] <- NA
            }
        }
    }
    
    output <- data
    invisible(output)
}