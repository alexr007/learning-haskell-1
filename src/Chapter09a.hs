module Chapter09a (
) where

-- represent the operation
data Op = Add | Sub | Mul | Div  deriving (Show)

-- implement the operation
apply :: Op -> Int -> Int -> Int
apply Add x y = x + y
apply Sub x y = x - y
apply Mul x y = x * y
apply Div x y = x `div` y

-- check whether the result is valid
valid :: Op -> Int -> Int -> Bool
valid Add _ _ = True
valid Sub x y = x > y
valid Mul _ _ = True
valid Div x y = x `mod` y == 0

--          value     function application
data Expr = Val Int | App Op Expr Expr deriving (Show)

-- could be an empty list, or a list from 1 element
eval :: Expr -> [Int]
--eval (Val n) = if n>0 then [n] else []
eval (Val n) = [n | n > 0]
eval (App o l r) = [apply o x y | x <- eval l,
                                  y <- eval r,
                                  valid o x y]

-- all possible ways of picking
-- choices [1,2] = [[], [1], [2], [1,2], [2,1]]
choices :: [a] -> [[a]]
choices []     = [[]]
choices [x]    = [[], [x]]
choices (x:xs) = error "TODO"

values :: Expr -> [Int]
values (Val n) = [n]
values (App _ l r) = values l ++ values r

-- is a solution?
solution :: Expr -> [Int] -> Int -> Bool
solution e ns n = elem (values e) (choices ns) && eval e == [n]

-- all possible ways of splitting
split :: [a] -> [([a], [a])]
split xs = map (`splitAt` xs) [1..(length xs - 1)]

exprs :: [Int] -> [Expr]
exprs [] = []
exprs [n] = [Val n]
exprs ns = [e | (ls, rs) <- split ns
              , l        <- exprs ls
              , r        <- exprs rs
              , e        <- combine l r]
              
combine :: Expr -> Expr -> [Expr]
combine l r = [App o l r | o <- [Add, Sub, Mul, Div]]

solutions :: [Int] -> Int -> [Expr]
solutions ns n = [e | ns' <- choices ns, e <- exprs ns', eval e == [n]]

type Result = (Expr, Int)

results :: [Int] -> [Result]
--results ns = [(e, n) | e <- exprs ns, n <- eval e]
results [] = []
results [n] = [(Val n, n) | n > 0]
results ns = 
  [ res | (ls, rs) <- split ns
          , lx     <- results ls
          , ry     <- results rs
          , res    <- combine' lx ry]
          
combine' :: Result -> Result -> [Result]
combine' (l,x) (r,y) = [(App o l r, apply o x y) | o <- [Add, Sub, Mul, Div], valid o x y]
  
solution' :: [Int] -> Int -> [Expr]  
solution' ns n = 
  [ e | ns'   <- choices ns
      , (e,m) <- results ns'
      , m == n
  ]  


