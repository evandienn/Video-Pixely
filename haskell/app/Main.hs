module Main where

import Lib  -- Import functions from the Lib module

main :: IO ()
main = do
    putStrLn "Enter the input file path:"
    inputPath <- getLine
    let outputPath = "output_images/output.png"
    loadPrintTurnBlackAndSave inputPath outputPath