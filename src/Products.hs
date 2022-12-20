module Products where

import qualified Data.Map as Map

-- | Returns number of products sold for incorrect price
priceCheck :: [String] -> [Double] -> [String] -> [Double] -> Int
priceCheck products productPrices productsSold soldPrices = length . filter isPriceIncorrect $ zip productsSold soldPrices
  where
    productsMap = Map.fromList $ zip products productPrices
    isPriceIncorrect (productSold, soldPrice)  = case Map.lookup productSold productsMap of
      Just correctPrice -> soldPrice /= correctPrice 
      Nothing -> True -- the task has nothing about the case when you have sold product which has no correct price indicated, but I guess counting every such sale as incorrect is intutive enough
