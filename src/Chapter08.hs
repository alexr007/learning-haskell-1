module Chapter08 (
) where

drop1 :: Int -> [a] -> [a]
drop1 _ []     = []
drop1 0 xs     = xs
drop1 n (_:xs) = drop1 (n-1) xs

-- 2 * N
init1 :: [a] -> [a]
init1 xs = reverse (drop 1 (reverse xs))

-- guard
init2 :: [a] -> [a]
init2 (x:xs) 
  | null xs   = []
  | otherwise = x:init2 xs

-- pattern match
init3 :: [a] -> [a]
init3 [_]    = [] 
init3 (x:xs) = x:init3 xs

init0 = init

