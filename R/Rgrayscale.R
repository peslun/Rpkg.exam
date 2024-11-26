#' @title Rgrayscale
#' @description this function should use Rloadimage to load image and display its grayscale
#' @param imageFile path to image to be converted to grayscale
#' @examples grayscaleImage <- Rgrayscale("path_to_imageFile")
#'
#' @return returns a grayscale image
#' @export


Rgrayscale <- function(imageFile) {
  imageObj <- Rloadimage(imageFile)
  imageGrayscale <- image_convert(imageObj, colorspace = 'GRAY')
#  print(imageGrayscale)
  return(imageGrayscale)
  }
