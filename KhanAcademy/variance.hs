
length' = fromIntegral . length

mean   xs = sum xs / length' xs

-- Sample Variance
variance  xs = mean $ lenVariance xs

-- Unbiased Variance
variance' xs = sum (lenVariance xs) / (length' xs - 1)

lenVariance xs = map (square . distance) xs
    where m        = mean xs
          distance = ((-)m)
          square   = (**2)

round10 x = (round' (x * 10)) / 10
    where round' = fromIntegral . round

standardDeviation  = sqrt . variance
standardDeviation' = sqrt . variance'

m  = round10 . mean
v  = round10 . variance
v' = round10 . variance'
s  = round10 . standardDeviation
s' = round10 . standardDeviation'

ms xs  = map (\f -> f xs) [m, s]
ms' xs = map (\f -> f xs) [m, s']
