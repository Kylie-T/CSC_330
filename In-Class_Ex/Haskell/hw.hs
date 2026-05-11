myFunc [] num = num
myFunc lst@(x:xs) num
    | mod x 2 == 0 = myFunc xs $ x + num
    | otherwise = myFunc xs num
main :: IO()
main = do
    print $ myFunc [5, 3, 8, 0] 0
    print $ myFunc [10, 20, 30, 40] 2
    print $ myFunc [7, 3, 9, 5] 1