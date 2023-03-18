module Chapter09 (
) where

-- new types in term of already existing types (aliases)
type Pos = (Int, Int)

origin :: Pos
origin = (3,5)

right :: Int -> Pos -> Pos
right dx (x,y) = (x+dx, y)

type Pair a = (a, a)

mult :: Pair Int -> Int
mult (m,n) = m * n

make :: a -> Pair a
make x = (x,x)

-- completely new types
data Bool1 = True | False
data Color = Red | Yellow | Green

data Answer = Yes | No | Unknown

answers :: [Answer]
answers = [Yes, No, Unknown]

flip :: Answer -> Answer
flip Yes = No
flip No = Yes
flip Unknown = Unknown

--                          type constructor is actually just a function
data Shape = Circle Float | Rectangle Float Float

rectangle :: Float -> Float -> Shape
rectangle w h = Rectangle w h  

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rectangle w h) = w * h

safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv x y = Just (x `div` y)

safehead :: [a] -> Maybe a
safehead [] = Nothing
safehead xs = Just (head xs)

-- typelevel defined sequence
data Nat = Zero | Succ Nat deriving (Show)

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n
  
int2nat :: Int -> Nat
int2nat 0 = Zero   
int2nat n = Succ (int2nat (n-1))  

add1 :: Nat -> Nat -> Nat
add1 m n = int2nat(nat2int m + nat2int n)

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)  

mul :: Nat -> Nat -> Nat
mul Zero _           = Zero
mul _    Zero        = Zero
mul x    (Succ Zero) = x
mul x    (Succ y)    = add x (mul x y)    

--          name      name            name
data Expr = Val Int | Add Expr Expr | Mul Expr Expr
--                                        Expr -> Expr -> Expr
  
size :: Expr -> Int
size (Val _) = 1
size (Add x y) = size x + size y
size (Mul x y) = size x + size y

eval :: Expr -> Int
eval (Val x) = x
eval (Add x y) = eval x + eval y
eval (Mul x y) = eval x * eval y

data Tree a = Leaf a | Node (Tree a) (Tree a)

-- TODO
folde :: (Int -> Int) -> (Int -> Int -> Int) -> (Int -> Int -> Int) -> Expr -> Int
folde f0 f1 f2 e = error "to implement"  

eval1 :: Expr -> Int
eval1 e = folde id (+) (*) e


