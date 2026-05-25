thirdLast :: [Float] -> Float
thirdLast [] = (-1)
thirdLast nums@(x:xs)
    | (length nums) < 3 = (-1)
    | otherwise = (nums !! ((length nums) - 3))

main :: IO()
main = do
    print $ thirdLast []
    print $ thirdLast [2]
    print $ thirdLast [1,2]
    print $ thirdLast [1,2,3]
    print $ thirdLast [1,2,3,4,5]
    print $ thirdLast [1,2,3,4,5,32,6,9,8,5]