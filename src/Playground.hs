module Playground (
  entryPoint
) where

import Chapter01
import Chapter02

entryPoint :: IO ()
entryPoint = do
  print d
  print sorted
  print (double 7) -- 14
  print $ quadruple 7 -- 28
  putStrLn "Done."
  where
    d = double 10.5
    sorted = qsort [5,1,9,2,5,3]
