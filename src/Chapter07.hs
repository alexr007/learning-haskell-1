module Chapter07 (
) where

twice :: (a -> a) -> a -> a
twice f x = f (f x)

f1 = map (+1) [1,3,5,7]

map1 f xs = [f x | x <- xs]

map2 f [] = []
map2 f (x:xs) = f x : map2 f xs

f2 = filter even [1..10]
f3 = filter odd [1..10]

filter1 p xs = [x | x <- xs, p x]

filter2 p [] = []
filter2 p (x:xs)
  | p x       = x : filter2 p xs
  | otherwise =     filter2 p xs

-- foldr LEFT -> RIGHT

foldr0 :: (a -> b -> b) -> b -> [a] -> b
foldr0 f z [] = z
foldr0 f z (x:xs) = f x (foldr0 f z xs)

sum1 :: (Foldable t, Num b) => t b -> b
sum1 = foldr (+) 0

product1 :: (Foldable t, Num b) => t b -> b
product1 = foldr (*) 1

or1 :: Foldable t => t Bool -> Bool
or1 = foldr (||) False

and1 :: Foldable t => t Bool -> Bool
and1 = foldr (&&) True

-- foldl: ((((a ⊕ x1) ⊕ x2) ⊕ x3) ⊕ x4)
-- foldr: (x1 ⊕ (x2 ⊕ (x3 ⊕ (x4 ⊕ z))))

-- foldl (\acc x -> acc ++ [x]) "_" "abc"
-- "_abc"
-- foldl (\acc x -> x : acc) "_" "abc"
--
-- foldr (\x acc -> acc ++ [x]) "_" "abc"
-- "_cba"
-- foldr (\x acc -> x : acc) "_" "abc"
-- "abc_"

length1 :: (Foldable t, Num b) => t a -> b
length1 = foldr (\a acc -> acc + 1) 0 

combine1 xs ys = foldl (\l x -> x:l) ys xs
-- TODO: how to use flip ???

f4 = all even [2,4,6,8]
f5 = elem ' ' "qwe asd"
f6 = takeWhile (/= ' ') "qwe asd"
f7 = dropWhile (== ' ') "    abc"

f8 f p xs = [f x | x <- xs, p x]
f9 f p xs = map f (filter p xs)

