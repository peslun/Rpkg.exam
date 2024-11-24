#' @description this should be internal function to load the image to use with other functions
#' @param imageFile
#' @examples myBitmap <- Rloadimage("path_to_imageFile")
#'
#' you need imagemagick installed, if you want to print the image, you need ggplot2


Rloadimage <- function(imageFile) {
  require("magick")
  imageObj <- image_read(imageFile)
#  print(imagObj)
  return(imageObj)
}
