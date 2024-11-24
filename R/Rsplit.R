#' @description this functions prints all three parts of RGB picture and returns them as list for futher work
#' @param imageFile
#' @examples myList <- Rsplit("path_to_imageFile")
#'
#' you need imagemagick installed, if you want to print the image, you need ggplot2


Rsplit <- function(imageFile) {
  require("magick")
#  require("ggplot2")
  imageObj <- Rloadimage(imageFile)
  imageBitmap <- imageObj[[1]]
  imageBitmapR <- imageBitmap[1,,,drop=F]
  imageR <- image_read(imageBitmapR)
  imageBitmapG <- imageBitmap[2,,,drop=F]
  imageG <- image_read(imageBitmapG)
  imageBitmapB <- imageBitmap[3,,,drop=F]
  imageB <- image_read(imageBitmapB)

  return(list(RGB=imageObj,R=imageR,G=imageG,B=imageB))

#  print(imageObj)
#  print(imageR)
#  print(imageG)
#  print(imageB)
#  combined_image<-image_append(c(imageObj, imageR, imageG, imageB))
#  print(combined_image)
  }
