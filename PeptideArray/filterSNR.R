## Reads csv data with fit output. Replaces all output parameters
## (starting from 5th column) with NAs if AssocSNR <= threshold value

filter.SNR <- function(data, threshold) {
    
    n <- nrow(data)
    output <- data.frame()
    
    for(i in 1:n) {
        if(! is.na(data$AssocSNR[i]) && data$AssocSNR[i] < threshold) {
            for(j in 5:ncol(data)) {
                data[i, j] <- NA
            }
        }
    }
    
    output <- data
    invisible(output)
}