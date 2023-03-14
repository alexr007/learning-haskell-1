module Chapter06 (
  merge
) where

f1 :: Int -> Int
f1 n = product [1..n]

f2 :: Int -> Int
f2 n = if n == 0
         then 1
         else n * f2 (n - 1)

f4 = \n -> if (==) n 0 then 1 else (*) n (f4 ((-) n 1))

f5 n = if (==) n 0 then 1 else (*) n (f4 ((-) n 1))

fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1)

product1 [] = 1
product1 (x:xs) = x * product1 xs

product2 :: (Foldable t, Num b) => t b -> b
product2 xs = foldr (*) 1 xs

product3 :: (Foldable t, Num b) => t b -> b
product3 = foldr (*) 1

-- tail recursive, but how to check in Haskell
trLength xs = trLength' xs 0
  where
    trLength' []     acc = acc
    trLength' (_:xs) acc = trLength' xs (acc+1)

reverse1 [] = []
reverse1 (x:xs) = reverse1 xs ++ [x]

zip1 []     _      = []
zip1 _      []     = []
zip1 (x:xs) (y:ys) = (x,y) : zip1 xs ys

qsort[]     = []
qsort[x]    = [x]
qsort(x:xs) = qsort smaller ++ [x] ++ qsort bigger
  where
    smaller = [a | a <- xs, a <= x]
    bigger  = [b | b <- xs, b > x]

and1 :: [Bool] -> Bool
and1 [] = True
and1 (x:xs) = x && and1 xs

and2 :: [Bool] -> Bool
and2 [] = True
and2 (False:xs) = False
and2 (_:xs) = and2 xs

concat1 :: [[a]] -> [a]
concat1 [] = []
concat1 (xs:xss) = xs ++ concat1 xss

concat2 :: [[a]] -> [a]
concat2 xs = foldr (++) [] xs

replicate1 :: Int -> a -> [a]
replicate1 0 _ = []
replicate1 n a = a : replicate1 (n-1) a

(!!!) :: [a] -> Int -> a
(!!!) [] _ = error "empty or not found!"
(!!!) (x:_ ) 0 = x
(!!!) (_:xs) n = (!!!) xs (n - 1)

-- insertion sort
insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert n (x:xs) = if n < x
                    then n : x : xs
                    else x : insert n xs

isort :: [Int] -> [Int]
isort [] = []
isort (x:xs) = insert x (isort xs)

-- contains
elem1 :: Eq a => a -> [a] -> Bool
elem1 x [] = False
elem1 x (x':xs) = if (x == x') then True else elem1 x xs

elem2 :: Eq a => a -> [a] -> Bool
elem2 x [] = False
elem2 x (x':xs) = (x == x') || elem2 x xs

merge :: Ord a => [a] -> [a] -> [a]
merge [] x = x
merge x [] = x
merge (x:xs) (y:ys) = if x <= y
                        then x : merge xs (y:ys)
                        else y : merge (x:xs) ys

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort a) (msort b)
  where (a, b) = splitAt (length xs `div` 2) xs
