module Haskell_Challenges where
import Data.Char (ord)        -- used for Challenge 2c
import Data.List (elemIndex)  -- useful for Challenge 3a
import Data.Maybe (fromJust)  -- useful for Challenge 3a

{- LEVEL 0: intro -}
-- challenge a
sanityCheck :: Int
sanityCheck = 42


{- LEVEL 1: simple -}
-- challenge a
sign :: Int -> Int
sign num
    | num < 0 = (-1)
    | num == 0 = 0
    | otherwise = 1

-- challenge b
powList :: Int -> [Int] -> [Int]
powList exp xs = map (^ exp) xs

-- challenge c
addLists :: [Float] -> [Float] -> [Float]
addLists [] [] = []
addLists list1@(x:xs) list2@(y:ys)
    | (length list1) == (length list2) = (x + y) : (addLists xs ys) 
    | otherwise = []

-- challenge d


{- LEVEL 2: hard -}
-- challenge a


-- challenge b


-- challenge c
breakdownChars :: String -> [[String]]
breakdownChars string@(x:xs) = (x : (ord (string !! 0))) : breakdownChars xs

main = do 
    print $ breakdownChars "hello"

{-
I. Create a function that returns the ASCII value of the letter
closest to 'a' in the given string.
-- -}
-- letterClosestToA :: String -> Int
-- letterClosestToA string =
-- foldl min (ord 'z') $ -- find the letter closest to 'a'
-- filter (\x -> x >= (ord 'a') && x <= (ord 'z')) $ -- get rid of
-- --all characters that are not a lowercase letter
-- map ord string -- convert to list of ascii values

-- challenge d



{- LEVEL 3: nightmare fuel -}
-- challenge a
dbzPwrLvls = [["Bulma",       "5"],
              ["Krillin",  "1000"],
              ["Gohan",   "15000"],
              ["Piccolo", "25000"],
              ["Vegeta",  "75000"],
              ["Goku",   "100000"]]



