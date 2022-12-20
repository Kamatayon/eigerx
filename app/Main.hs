module Main where

import qualified Data.Map.Strict as Map
main :: IO ()
main = putStrLn "Hello, Haskell!"

-- | returns number of products sold for incorrect price
priceCheck :: [String] -> [Int] -> [String] -> [Int] -> Int
priceCheck products productPrices productsSold soldPrices = length . filter isPriceIncorrect $ zip productsSold soldPrices
  where
    productsMap = Map.fromList $ zip products productPrices
    isPriceIncorrect (productSold, soldPrice)  = case Map.lookup productSold productsMap of
      Just correctPrice -> soldPrice /= correctPrice 
      Nothing -> True -- the task has nothing about the case when you have sold product which has no correct price indicated , but I guess counting every such sale as incorrect is intutive enough
