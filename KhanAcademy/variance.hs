import Control.Applicative ((<*>))

length' = fromIntegral . length

mean xs = sum xs / length' xs

-- Sample Variance
variance = mean . lenVariance

-- Unbiased Variance
variance' xs = sum (lenVariance xs) / (length' xs - 1)

lenVariance xs = map (square . distance) xs
    where mu       = mean xs
          distance = ((-)mu)
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

ms  xs = [m, s ] <*> [xs]
ms' xs = [m, s'] <*> [xs]
