### data types

```haskell
data Ordering = LT | EQ | GT
```

```haskell
data Bool = False | True
```

```haskell
```

### type-classes

```haskell
class  (Eq a) => Ord a  where
    compare              :: a -> a -> Ordering
    (<), (<=), (>), (>=) :: a -> a -> Bool
    max, min             :: a -> a -> a
```

```haskell
class  Eq a  where
    (==), (/=)           :: a -> a -> Bool
```

```haskell
```
