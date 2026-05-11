import System.IO

-- main :: IO ()
-- main = do
--     putStrLn "hello world"

--  :l pureFunc.hs -> load file
--  main
--  :t main -> return type


main :: IO ()
main = do
    putStr "Enter a number: "
    hFlush stdout
    userNumber <- getLine -- (strict evaluation) arrow to pause to getLine
    let number = (read userNumber :: Int) -- converts into int
    let num2 = number * 2 -- can't reassign
    putStrLn $ "You entered (*2): " ++ (show num2) -- show converts to string