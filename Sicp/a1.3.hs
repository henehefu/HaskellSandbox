

f a b c | a >= c && b >= c = a +** b
        | a >= b && c >= b = a +** c
        | otherwise        = b +** c

x +** y = x * x + y * y
