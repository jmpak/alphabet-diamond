module Main where

import System.Environment
import Data.Char
import Data.Text (center, pack, unpack)

diamondLine :: Char -> String
diamondLine 'A' = "A"
diamondLine char = [char] ++ spaces ++ [char]
                    where 
                      spaces = replicate ((index - 1) * 2 - 1) ' '
                      index = length ['A' .. char]

diamond :: Char -> [String]
diamond maxChar = lines ++ [controlLine] ++ (reverse lines)
                         where
                           lines = map (packLine . diamondLine) letters
                           controlLine = diamondLine maxChar
                           packLine = unpack . (center (length controlLine) ' ') . pack
                           letters = init ['A' .. maxChar]

main :: IO ()
main = do
  args <- getArgs
  let maxChar = toUpper $ head $ head args
  if (length args) /= 1 || ((length $ head args) /= 1) || maxChar `notElem` ['A'..'Z']
     then putStrLn "INVALID INPUT"
     else putStrLn $ unlines $ diamond maxChar
