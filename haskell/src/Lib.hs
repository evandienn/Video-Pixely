module Lib
    ( convertToRGB8
    , loadPrintTurnBlackAndSave
    , printOriginalRGBValues
    , turnToBlack
    , printNewRGBValues
    ) where

import Codec.Picture
    ( convertRGB8,
      readImage,
      savePngImage,
      generateImage,
      DynamicImage(ImageRGB8),
      Image(imageWidth, imageHeight),
      Pixel(pixelAt),
      PixelRGB8(..) )
import Data.Word (Word8)

-- Function to convert any DynamicImage to RGB8
convertToRGB8 :: DynamicImage -> Image PixelRGB8
convertToRGB8 dynImg = convertRGB8 dynImg

-- Function to load an image, print original RGB values, turn all RGB values to black, print new values, and save the new image
loadPrintTurnBlackAndSave :: FilePath -> FilePath -> IO ()
loadPrintTurnBlackAndSave inputPath outputPath = do
    img <- readImage inputPath
    case img of
        Left err -> putStrLn $ "Error loading image: " ++ err
        Right dynImg -> do
            -- Convert to RGB8 (ensure the image is in RGB format)
            let rgbImg = convertToRGB8 dynImg

            putStrLn "Original RGB values:"
            printOriginalRGBValues rgbImg -- Pass the converted image for printing

            -- Turn the image black
            let blackImg = turnToBlack rgbImg

            putStrLn "New RGB values (should be black):"
            printNewRGBValues blackImg

            -- Save the blackened image as an RGB image
            savePngImage outputPath (ImageRGB8 blackImg)

            putStrLn $ "New image saved as " ++ outputPath

-- Prints out the original RGB values of the input image (which is always converted to RGB8)
printOriginalRGBValues :: Image PixelRGB8 -> IO ()
printOriginalRGBValues img = mapM_ print pixels
  where
    pixels = [[let PixelRGB8 r g b = pixelAt img x y in (r, g, b) | x <- [0..imageWidth img - 1]] | y <- [0..imageHeight img - 1]]

-- Changes the RGB values of all pixels to black (0, 0, 0)
turnToBlack :: Image PixelRGB8 -> Image PixelRGB8
turnToBlack img = generateImage (\_ _ -> PixelRGB8 0 0 0) (imageWidth img) (imageHeight img)

-- Print the altered (black) RGB values of the pixels
printNewRGBValues :: Image PixelRGB8 -> IO ()
printNewRGBValues img = mapM_ print pixels
  where
    pixels = [[let PixelRGB8 r g b = pixelAt img x y in (r, g, b) | x <- [0..imageWidth img - 1]] | y <- [0..imageHeight img - 1]]
