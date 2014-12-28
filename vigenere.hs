-- A simple Vigenère cipher. Takes a password as argument and encrypts
-- stdin using the password.


import Data.Char
import System.Environment
import System.IO

shift _ [] = []
shift (c:cs) (x:xs)
    | x > 0 && x < 24 = (c + x) `mod` 24 : shift cs xs
    | otherwise = x : shift (c:cs) xs

vigenere cipher str = charlist $ shift (cycle (numlist cipher)) (numlist str) where
    sub a b = b - a
    numlist = map ((sub 97) . ord . toLower)
    charlist = map (chr . (+ 97))

printHelp = do
    name <- getProgName
    putStrLn $ "Usage: " ++ name ++ " <keyword>"
    putStrLn ""
    putStrLn "Encrypts stdin using a vigenere cipher with <keyword> as"
    putStrLn "passcode."

main = do
    args <- getArgs
    let cipher = foldr (++) "" args
    str <- getContents
    putStrLn (vigenere cipher str)
