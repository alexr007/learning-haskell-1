module Mod (
) where

import Data.List
import Data.Char

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

-- :l Mod.hs
-- :m + Data.List

f1 = map sum $ transpose [[0,3,5,9],[10,0,0,9],[8,5,1,-1]]
f2 = map sum (transpose [[0,3,5,9],[10,0,0,9],[8,5,1,-1]])

search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
    let nlen = length needle
    in  foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

encode :: Int -> String -> String
encode shift msg =
    let ords = map ord msg
        shifted = map (+ shift) ords
    in  map chr shifted

findKey1 :: (Eq k) => k -> [(k,v)] -> v
findKey1 key xs = snd . head . filter (\(k,v) -> key == k) $ xs

findKey2 :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey2 key [] = Nothing
findKey2 key ((k,v):xs) = if key == k
                            then Just v
                            else findKey2 key xs

data Shape = Circle Float Float Float | Rectangle Float Float Float Float

surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

data Car = Car { company :: String, model :: String, year :: Int} deriving (Show)

