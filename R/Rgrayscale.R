#' @description this function should use Rloadimage to load image and display its grayscale
#' @param imageFile
#' @examples grayscaleImage <- Rgrayscale("path_to_imageFile")
#'
#'


Rgrayscale <- function(imageFile) {
  imageObj <- Rloadimage(imageFile)
  imageGrayscale <- image_convert(imageObj, colorspace = 'GRAY')
#  print(imageGrayscale)
  return(imageGrayscale)
  }
