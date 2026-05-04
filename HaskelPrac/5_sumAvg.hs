    
totalAvrg :: [Float] -> Float
totalAvrg list = total $ filter (\ x -> x > (avrg list)) list
    where 
        avrg list = (total list) / (fromIntegral(length list))

        total [] = (-1)
        total [x] = x
        total (x:xs) = x + (total xs)

main :: IO()
main = do
    print $ totalAvrg []
    print $ totalAvrg [2]
    print $ totalAvrg [1,2,3,4,5]