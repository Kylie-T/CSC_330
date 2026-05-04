import System.IO

-- sign function
sign :: Int -> Int
sign num = if num < 0
            then (-1)
            else if num > 0
                then 1
                else 0

sign2 :: Int -> Int
sign2 num 
   | num < 0 = (-1)
   | num > 0 = 1
   | otherwise = 0

fact :: Int -> Int
fact num = if num < 0
            then (-1)
            else if num == 0
                then 1
                else num * (fact $ num - 1)
fact2 :: Int -> Int
fact2 num 
   | num < 0 = (-1)
   | num == 0 = 1 
   | otherwise = num * (fact $ num - 1)

fact3 :: Int -> Int
fact3 0 = 1
fact3 (-1) = -1
fact3 num = num * (fact $ num - 1)

main :: IO ()
main = do
    print $ fact (-5)
    print $ fact 0
    print $ fact 5
    putStrLn ""
    print $ fact2 (-5)
    print $ fact2 0
    print $ fact2 5
    putStrLn ""
    print $ fact3 (-1)
    print $ fact3 0
    print $ fact3 5

-- main :: IO ()
-- main = do
--     putStr "Enter a number: "
--     hFlush stdout
--     userNumber <- getLine -- (strict evaluation) arrow to pause to getLine
--     let number = (read userNumber :: Int) -- converts into int
--     let num2 = number * 2 -- can't reassign
--     putStrLn $ "You entered (*2): " ++ (show num2) -- show converts to string