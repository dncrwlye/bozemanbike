#data generation 

#' A Spatial Process Function for Bozeman Bike Commuter Data
#'
#' This function is so ch1LL and makes fake bike count data for our lovely city
#' @param sigma.sq You know what it is
#' @param tau.sq jkj
#' @param phi Ykkk
#' @keywords Bozeman
#' @export
#' @examples
#' datagen()


datagen <- function(sigma.sq, tau.sq, phi)
{
  
  load(file = 'data/data.Rdata')
  set.seed(203933)
  num.pts <- nrow(data)
  sigma.sq <- sigma.sq # 3
  tau.sq <- tau.sq #.1
  phi <- phi# 20
  points <- cbind(data$lat, data$lon)
  
  d22 <- as.matrix(dist(points))
  Omega <- sigma.sq * exp(-d22 * phi) 
  #add in a nugget 
  Omega <- Omega + diag(x= tau.sq, nrow = nrow(Omega), ncol = ncol(Omega))
  
  # covariate structure
  x <- rnorm(num.pts, mean = mean(log(data$count + 1), na.rm = TRUE), sd = sd(log(data$count + 1), na.rm = TRUE))
  Beta = 1.4
  mu2 <- Beta*x + rnorm(num.pts,0,.4)
  #plot(z,x)
  z2 = mnormt::rmnorm(1, mu2, Omega)
  data$z2 <- z2
  data$x <- x
  
}

