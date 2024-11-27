#' apply_filter
#' @description
#' This function applies a filter of choice, either a grayscale filter, or cutoff filter that color everything above cut off pink. Cutoff defaults to 127 if not specified.
#' @examples
#' Usage of this function
#'   apply_filter("samples/Test image-1.jpg","grayscale")
#'   apply_filter("samples/Test image-1.jpg","cutoff") #defaults to cutoff 127
#'   apply_filter("samples/Test image-1.jpg","cutoff",20)
#'
#' @export


apply_filter <- function(image_file, filter_func, cutoff = 127) {

  # Read the image file and extract the bitmap
  image_bitmap <- image_read(image_file)[[1]]
  image_numvec <- as.numeric(image_bitmap)

  # Get the width and height of the image
  width <- dim(image_bitmap)[2]
  height <- dim(image_bitmap)[3]

  # Create a new array to store the modified pixels
  return_bitmap <- array(0, dim = c(height, width, 3))

  # Loop through each pixel in the image
  for (w in 1:width) {
    for (h in 1:height) {
      # Get the RGB values for the current pixel
      r <- image_numvec[h, w, 1]
      g <- image_numvec[h, w, 2]
      b <- image_numvec[h, w, 3]
      gray_value <- (r * 0.299 + g * 0.587 + b * 0.114)
      # Apply the filter function to the RGB values
      if (filter_func == "grayscale") {
        # Convert to grayscale and set all channels to the grayscale value
        return_bitmap[h, w, ] <- rep(gray_value, 3)
      }
      else if (filter_func == "cutoff") {

        # Apply cutoff based on grayscale value
       if (gray_value > cutoff/255) {

              return_bitmap[h, w, ] <- c(0, 0, 0)  # Below cutoff, black (RGB = 0, 0, 0)
        } else {

          return_bitmap[h, w, ] <- c(255, 0, 255)  # Above cutoff, magenta (RGB = 255, 0, 255)
        }
      }
      else {
        stop("Error: specify filter")
      }
    }
  }

  # Convert the modified bitmap back to an image
  return_image <- image_read(return_bitmap)
  return(return_image)
}


