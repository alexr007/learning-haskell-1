module Chapter03 (
) where

--  expression :: type
len :: Foldable t => [t a] -> Int
len [a] = length a

-- overloaded if contain type constraints
second :: [a] -> a
second xs = head (tail xs)

swap1 :: b -> a -> (a, b)
swap1 a b = (b,a)

swap2 :: (b, a) -> (a, b)
swap2 (a,b) = (b,a)

