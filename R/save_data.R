#data generation 

#' A Spatial Process Function for Bozeman Bike Commuter Data
#'
#' This function is so ch1LL and makes fake bike count data for our lovely city
#' @param none no covariates here
#' @keywords Bozeman
#' @export
#' @examples
#' save.data()
#' 

save.data <- function()
{
  load(file = 'data/data.Rdata')
  write.csv(data, file = './bozeman_bike_commuter.csv')
}
  
save.data()
