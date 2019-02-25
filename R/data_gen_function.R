#data generation 

#' A Spatial Process Function for Bozeman Bike Commuter Data
#'
#' why am i so bad at this...
#' @param sigma.sq You know what it is
#' @param tau.sq 
#' @param phi 
#' @param beta covariate slope 
#' @keywords Bozeman
#' @export
#' @examples
#' datagen()

datagen <- function(sigma.sq, tau.sq, phi, beta)
{
  set.seed(203933)
  num.pts <- nrow(data)
  sigma.sq <- sigma.sq 
  tau.sq <- tau.sq 
  phi <- phi
  beta = beta
  
  points <- cbind(data$lat, data$lon)
  
  d22 <- as.matrix(dist(points))
  Omega <- sigma.sq * exp(-d22 * phi) 
  #add in a nugget 
  Omega <- Omega + diag(x= tau.sq, nrow = nrow(Omega), ncol = ncol(Omega))
  
  # covariate structure
  x <- rnorm(num.pts, mean = mean(log(data$count + 1), na.rm = TRUE), sd = sd(log(data$count + 1), na.rm = TRUE))
  mu2 <- beta*x + rnorm(num.pts,0,.4)
  #plot(z,x)
  z2 = mnormt::rmnorm(1, mu2, Omega)
  data$z2 <- z2
  data$x <- x
  
  return(data)
}

