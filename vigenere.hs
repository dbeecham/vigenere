import Data.Char

vigenere cipher str = map (chr . (add 97) . ((flip mod) 26)) $ shift (asABList cipher) (asABList str) where
    asABList = map ((sub 97) . ord)
    sub x y = y - x
    add x y = y + x
shift xs ys = zipWith (+) (cycle xs) ys
