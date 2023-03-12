module Chapter01 (
  f1,
  qsort
) where

-- https://www.youtube.com/watch?v=rIprO6zoujM&list=PLF1Z-APd9zK7usPMx3LGMZEHrECUGodd3&index=3
-- just range definition
-- just function application
f1 :: Integer
f1 = sum [1..10]
-- 1930s: Alonzo Church developed the Lambda calculus
-- Alonzo Church was the supervisor of Alan Turing
-- 1950s: Lisp by McCarthy
-- 1970s: ML by Robin Milner
-- 1980s: Miranda by David Turner
-- 1987: Haskell
-- 1990: Monad, Phil Wadler
-- 2010: Haskell Platform
--f :: Ord a => [a] -> [a]
-- [] === List
-- quicksort

listSyntax :: [a]
listSyntax = []
  where
      l1 = [1, 2, 3]
      l2 = 1 : 2 : []
      l3 = l1 ++ l2
      (head : tail) = l3

-- signature
qsort :: Ord a => [a] -> [a]
-- implementation
qsort[] = []
qsort(x:xs) = qsort ys ++ [x] ++ qsort zs
  where
    ys = [a | a <- xs, a <= x]
    zs = [b | b <- xs, b > x]
