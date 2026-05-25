import Data.Char (ord)

letCloToA :: String -> Int
letCloToA string = 
    foldl min (ord 'z') $       -- find the letter closest to 'a'
    filter (\x -> x >= (ord 'a') && x <= (ord 'z')) $   -- get rid of all characters that are not a lowercase letter
    map ord string              -- convert to list of ascii values

main = do
    print $ letCloToA "hello"