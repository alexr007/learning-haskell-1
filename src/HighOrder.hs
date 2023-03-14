module HighOrder (
) where

-- :t max
-- max :: Ord a => a -> a -> a

-- :t max 4
-- max 4 :: (Ord a, Num a) => a -> a

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

f1 = applyTwice (+3) 10
--16
--          f: (a, b) => c   as     bs
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (a:as) (b:bs) = f a b : zipWith' f as bs

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

f2 = map (+1) [1,2,3]
-- [2,3,4]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x       = x : filter' p xs
    | otherwise = filter' p xs

f3 = filter odd [1,2,3,4,5]
-- [1,3,5]

f4 =    [x+3 | x <- [1,2,3]]
f5 = map (+3)       [1,2,3]

f6 = let notNull x = not (null x) 
     in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort (filter (<=x) xs)
        biggerSorted = quicksort (filter (>x) xs)
    in  smallerSorted ++ [x] ++ biggerSorted

--combine predicates

isLower :: Char -> Bool
isLower a = a `elem` ['a'..'z']

isUpper :: Char -> Bool
isUpper a = a `elem` ['A'..'Z']

isLetter :: Char -> Bool
isLetter a = isLower a || isUpper a

largestDivisible :: (Integral a) => a
--                                just decrement till minus infinity
largestDivisible = head (filter p [100000,99999..])
--        p: x => Bool
    where p x = x `mod` 3829 == 0

--sum of all odds < 10k
f7 = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))

--numLongChains :: Int
--numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))

f8 = map ( \x -> x + 1 ) [1,2,3]
f9 = map (+1) [1,2,3]
--[2,3,4]

flip1 :: (a -> b -> c) -> b -> a -> c
flip1 f y x = f x y

f10 = takeWhile (/=' ') "elephants know how to party"

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filter1 :: (a -> Bool) -> [a] -> [a]
filter1 p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

