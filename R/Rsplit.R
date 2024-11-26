#' @title Rsplit
#' @description this functions prints all three parts of RGB picture and returns them as list for futher work; you need imagemagick installed, if you want to print the image, you need ggplot2
#' @param imageFile  path to image to be converted to list of pictures (original picture and one per R G B channel)
#' @examples myList <- Rsplit("path_to_imageFile")
#'
#' @return returns a list of images
#' @export



Rsplit <- function(imageFile) {
  require("magick")
#  require("ggplot2")
  imageObj <- Rloadimage(imageFile)
  imageBitmap <- imageObj[[1]]
  imageBitmapR <- imageBitmap[1,,,drop=F]
  imageChannelR <- image_read(imageBitmapR)

  imageR <- image_merge(
    imageChannelR,
    image_blank(width = image_info(imageObj)$width, height = image_info(imageObj)$height, color = "black"),
    image_blank(width = image_info(imageObj)$width, height = image_info(imageObj)$height, color = "black")
  )

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
