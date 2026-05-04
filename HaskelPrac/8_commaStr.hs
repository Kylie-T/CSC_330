commaDeli :: String -> String
commaDeli string =
    init $      -- strip trailing comma
    foldl (++) "" $     -- combine into a single string (join)
    map (++ ",") $      -- append comma to each string
    map (:[]) string    -- convert to list of strings with one char

main = do
    print $ commaDeli "hello"