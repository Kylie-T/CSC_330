mxmm :: [Float] -> Float
mxmm [] = (-1)
mxmm [x] = x
mxmm list = maximum list

main :: IO()
main = do
    print $ mxmm []
    print $ mxmm [2]
    print $ mxmm [1,2,3,4,5]