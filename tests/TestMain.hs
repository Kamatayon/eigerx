module Main where 
import Test.HUnit
import Products (priceCheck)

testExampleData = TestCase (assertEqual "Test on data given in the exaple " 2
  $ priceCheck products productPrices productsSold soldPrice)
  where
    products = ["rice", "sugar", "wheat", "cheese"]
    productPrices = [16.89, 56.92, 20.89, 345.99]
    productsSold=["rice", "cheese"]
    soldPrice = [18.99, 400.89]

testNonExiststentNames = TestCase (assertEqual 
  "Test with sold products not present in prices list" 2 
  $ priceCheck products productPrices productsSold soldPrice)
  where
    products = ["rice"]
    productPrices = [13.37]
    productsSold=["apple", "piano"]
    soldPrice=[5, 4.32]

testCorrect = TestCase (assertEqual "Test with all products sold for correct prices" 0 
  $ priceCheck products productPrices productsSold soldPrice)
  where
    products = ["rice", "sugar", "wheat", "cheese"]
    productPrices = [16.89, 56.92, 20.89, 345.99]
    productsSold=["rice", "cheese", "rice", "wheat"]
    soldPrice = [16.89, 345.99, 16.89, 20.89]

tests = TestList [
  TestLabel "testExampleData" testExampleData,
  TestLabel "testNonExiststentNames" testNonExiststentNames,
  TestLabel "testCorrect" testCorrect]

main = runTestTT tests


