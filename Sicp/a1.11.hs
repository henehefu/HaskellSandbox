import Test.HUnit

f n | n < 3 = n
    | True  = f(n - 1) + 2 * f(n - 2) + 3 * f(n - 3)

g n | n < 3 = n
    | True  = g' (2, 1, 0) (n - 3)
    where g' ns 0              = inc ns
          g' ns@(n1, n2, n3) c = g' (inc ns , n1, n2) (c - 1)
          inc (n1, n2, n3)     = n1 + 2 * n2 + 3 * n3

tests = test $ map (\n -> f n ~=? g n) [1..20]

t = runTestTT tests
