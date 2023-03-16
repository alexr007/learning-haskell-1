module Lib (
  someFunc
) where
  
--import Data.Aeson ( encode )

someFunc :: IO ()
someFunc = print 42
--someFunc = print (encode ["Hello", "world"])
