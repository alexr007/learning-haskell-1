module Main where

import qualified Playground (entryPoint)

main :: IO ()
main = do
  putStrLn "---------------"
  Playground.entryPoint
  putStrLn "---------------"
