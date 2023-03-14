module Chapter05 (
) where

-- basic comprehension
f0 :: [Integer]
f0 = [x | x <- [1..3]]

f1 :: [Integer]
f1 = [x^2 | x <- [1..5]]

--   x <- [1..3]  is a generator
-- [(1,'a'),(1,'b'),(2,'a'),(2,'b'),(3,'a'),(3,'b'),(4,'a'),(4,'b'),(5,'a'),(5,'b')]
f2 :: [(Integer, Char)]
f2 = [(x,y) | x <- [1..3], y <- "ab"]

-- dependent generators
f3 :: [(Integer, Integer)]
f3 = [(x,y) | x <- [1..3], y <- [x..3]]

-- concat + flatten
concat1 :: [[a]] -> [a]
concat1 xss = [x | xs <- xss , x <- xs]

-- filters / guards
f4 :: [Integer]
f4 = [x | x <- [1..10], even x]
---------   generator   filter

prime :: Integral a => a -> Bool
prime n = factors n == [1,n]

primes :: Integral a => a -> [a]
primes n = [x | x <- [2..n], prime x]

sieve :: Integral a => [a] -> [a]
sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

allprimes :: [Integer]
allprimes = sieve [2..]

f5 :: [Integer]
f5 = takeWhile (<15000) allprimes

f6 :: [(Integer, Char)]
f6 = zip [1,2,3] "abcd"

-- pairs generator
pairs :: [b] -> [(b, b)]
pairs xs = zip xs (tail xs)

sorted :: Ord a => [a] -> Bool
sorted xs = and [x <= y | (x,y) <- pairs xs ]

withIndexes xs = xs `zip` [1..]

positions :: (Eq a) => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0..], x == x']

f7 = length "abc"

count x xs = length [x' | x' <- xs, x' == x]

f8 = count 's' "Mississippi"

pyths :: Int -> [(Int, Int, Int)]
pyths n = [(a,b,c) | c<-[1..n], a<-[1..c], b<-[1..c],  a^2+b^2==c^2]

factors :: Integral a => a -> [a]
factors n = [x | x <- [1..n], n `mod` x == 0]

factorsTill n = init (factors n)

perfect n = sum (factorsTill n) == n

perfects n = [x | x <- [1..n], perfect x]

sp1 :: [Int] -> [Int] -> Int
sp1 as bs = sum (zipWith (*) as bs)

sp2 :: [Int] -> [Int] -> Int
sp2 as bs = sum [as !! i * bs !! i | i <- [0..n-1]] where n = length as

sp3 :: [Int] -> [Int] -> Int
sp3 as bs = sum [a * b | (a, b) <- zip as bs]
