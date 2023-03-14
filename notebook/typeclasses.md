### data types

```haskell
data Ordering = LT | EQ | GT
```

```haskell
data Bool = False | True
```

```haskell
Bool, Int, Char, String, Float, Double
:: [Bool], :: [Int]
(1, True, "ab") :: (Int, Bool, String)
```

### type-classes

```haskell
class  (Eq a) => Ord a  where
    compare              :: a -> a -> Ordering
    (<), (<=), (>), (>=) :: a -> a -> Bool
    max, min             :: a -> a -> a
```

equality
```haskell
class  Eq a  where
    (==), (/=)           :: a -> a -> Bool
```

numeric
```haskell
class  Num a  where
    (+), (-), (*)       :: a -> a -> a
    negate              :: a -> a
    abs                 :: a -> a
    signum              :: a -> a
    fromInteger         :: Integer -> a
```

ordering
```haskell
class  Ord a  where
    ...
```
