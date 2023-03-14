module Chapter02 (
  double,
  quadruple,
  factorial,
  average
) where

double :: Num a => a -> a
double x = x + x

quadruple :: Num a => a -> a
quadruple x = double (double x)

factorial :: (Num a, Enum a) => a -> a
factorial n = product [1..n]

average :: Foldable t => t Int -> Int
average ns = sum ns `div` length ns

nn :: Int
nn = a `div` length xs
  where
    a = 10
    xs = [1,2,3]

-- last element from the list
last1 :: [a] -> a
last1 [x] = x
last1 (_:xs) = last1 xs

last2 :: [a] -> a
last2 xs = xs !! (length xs - 1)

last3 :: [a] -> a
last3 xs = head (reverse xs)

-- without last
init1 :: [a] -> [a]
init1 [x, _] = [x]
init1 (x : xs) = x : init1 xs

init2 :: [a] -> [a]
init2 xs = reverse (drop 1 (reverse xs))

init3 :: [a] -> [a]
init3 xs = take (length xs - 1 ) xs

init4 :: [a] -> [a]
init4 xs = reverse (tail (reverse xs))
