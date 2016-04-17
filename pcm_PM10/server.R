
library(shiny)

shinyServer(function(input, output, session) {
  output$myImage <- renderImage({
  
#  image_file <- paste("www/",input$image.type,".jpeg",sep="")
  image_file <- "C:/RICARDO-AEA/animations_R/pcm_PM10/animated.gif"

  
  return(list(
    src = image_file,
    filetype = "image/gif",

    height = 520,
    width = 696
  ))
  
}, deleteFile = FALSE)
})