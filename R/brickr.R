# brickr

# https://twitter.com/WeAreRLadies/status/1248883909892419584


install.packages("brickr", dependencies = TRUE)

library("brickr")


myimage <- jpeg::readJPEG(file.choose())

myimage_tiff <- tiff::readTIFF(file.choose())


mybrick_HE <- myimage%>% 
  brickr::image_to_mosaic(img = .,
                          img_size = 250,
                          brightness = 0.9
                          ) %>% 
  brickr::build_mosaic()




