module Chapter04 (
) where

abs :: Int -> Int
abs x = if x < 0 then -x else x

abs2 :: (Ord a, Num a) => a -> a
abs2 n | n >= 0    = n
       | otherwise = -n

-- way1 - if-else
signum1 :: (Ord a, Num a, Num b) => a -> b
signum1 x = if x < 0 then -1 else
             if x > 0 then 1 else 0

-- way2 - guard
signum2 :: (Ord a, Num a, Num b) => a -> b
signum2 x | x < 0     = -1
          | x > 0     = 1
          | otherwise = 0

-- way3 - pattern match
not1 :: Bool -> Bool
not1 True = False
not1 False = True

(&&&) :: Bool -> Bool -> Bool
True &&& True = True
_    &&& _    = False

(&&&&) :: Bool -> Bool -> Bool
True  &&&& b = b
False &&&& _ = False

land :: Bool -> Bool -> Bool
a `land` b = if a == True && b == True then True else False  

foldl11 :: Integer
foldl11 = foldl (\x y -> x + y) 0 [1,2,3,4]

add1 :: Integer -> Integer -> Integer
add1 = \x -> (\y -> x + y)

odds1 :: (Num b, Enum b) => b -> [b]
odds1 n = map f [0..n-1]
  where
    f x = x * 2 + 1

odds2 :: (Num b, Enum b) => b -> [b]
odds2 n = map (\x -> x * 2 + 1) [0..n-1]

-- conventional if
safetail1 :: [a] -> [a]
safetail1 xs = if length xs == 0 then xs else tail xs

-- conventional if
safetail2 :: [a] -> [a]
safetail2 xs = if null xs then xs else tail xs
 
-- guards
safetail3 :: [a] -> [a]
safetail3 xs 
  | null xs   = xs 
  | otherwise = tail xs
  
-- pattern matching
safetail4 :: [a] -> [a]
safetail4 [] = []
safetail4 (_:xs) = xs

(|||) :: Bool -> Bool -> Bool
False ||| False = False
_     ||| _     = True

(||||) :: Bool -> Bool -> Bool
True  |||| _ = True
False |||| b = b
