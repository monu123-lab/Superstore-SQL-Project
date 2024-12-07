create database Superstore;
use Superstore; 

-- 1. Projection: Retrieve the City, State, and Quantity for all entries in the dataset.
SELECT 
    City, State, Quantity
FROM
    samplesuperstore;
    
   -- 2. Selection : Show Segment, Sub-Category, and Profit for records where the profit is below 20.
   
SELECT 
    Segment, Category, profit
FROM
    samplesuperstore
WHERE
    profit < 20;
    
    --  3. Distinct Values for Multiple Columns: Display unique combinations of Category and Region.
    
    SELECT DISTINCT
    Category, Region
FROM
    samplesuperstore;
    
  --  4. Aggregation with SUM and GROUP BY: Display the total Sales and Profit for each State.
  
  SELECT 
    SUM(Sales) AS Total_Sales, SUM(profit) AS Profit, state
FROM
    samplesuperstore
GROUP BY state;

-- 5. Range Filtering with BETWEEN: List the Sub-Category and Discount for records with discounts between 0.05 and 0.20.

SELECT 
    `Sub-Category`, discount
FROM
    samplesuperstore
WHERE
    discount BETWEEN 0.05 AND 0.20;
    
-- 6.  Sorting with ORDER BY and Filtering: Show City, Sales, and Profit, sorting Profit in descending order where Sales are over 200.

SELECT 
    city, sales, profit
FROM
    samplesuperstore
WHERE
    sales > 2000
ORDER BY profit DESC;

-- 7.Filtering Groups with HAVING: Show the total Profit and Quantity for each State where total Profit exceeds 5000.

SELECT 
    SUM(profit) AS Total_Profit,
    SUM(quantity) AS Total_Quantity,
    state
FROM
    samplesuperstore
GROUP BY state
HAVING SUM(profit) > 5000;

-- 8. Pattern Matching with LIKE for Partial Strings: Display all columns where the City name contains "ville"

SELECT DISTINCT
    City
FROM
    samplesuperstore
WHERE
    city LIKE '%ville%';
    
--    9.Combining OR and AND Operators: Show Region, Category, and Quantity where the Quantity is either 3 or 7,
       -- and Profit is greater than 50.
       
       SELECT 
    Region, Category, Quantity
FROM
    samplesuperstore
WHERE
   quantity = 3 OR  quantity = 7 AND profit > 50;
   
-- 10. Subquery with Comparison: Retrieve the Segment and Sales for records where Sales are greater than the average Sales
      --  in the West region.
      
      SELECT 
    Segment, Sales
FROM
    samplesuperstore
WHERE
    sales > (SELECT 
            AVG(sales)
        FROM
            samplesuperstore
        WHERE
            region = 'west');
            
-- 11.  IN Operator : Display Segment and Profit for entries where the State is either "Texas" or "California."

SELECT 
    Segment, Profit
FROM
    samplesuperstore
WHERE
    State IN ('Texas' , 'California');

-- 12.  Nested Aggregation with Subquery: Show City and Sales where Sales are greater than the average sales of all cities.


SELECT 
    City, Sales
FROM
    samplesuperstore
WHERE
    Sales > (SELECT 
            AVG(Sales)
        FROM
            samplesuperstore);

-- 13. Display the top 3 cities with the highest total Profit in each Region.

SELECT 
    City, SUM(profit) AS Total_Profit, Region
FROM
    samplesuperstore
GROUP BY City , Region
ORDER BY Region , Total_Profit DESC
LIMIT 3;

-- 14. Display states where the average Sales is higher than the overall average sales across all states.

SELECT 
    State, ROUND(AVG(Sales), 2) AS Average_Sales
FROM
    SampleSuperstore
GROUP BY State
HAVING AVG(Sales) > (SELECT 
        AVG(Sales)
    FROM
        SampleSuperstore);
        
-- 15  Display the top 5 states by profit within each region, but only for those with at least 5000 in total sales.

SELECT 
    Region,
    State,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM
    SampleSuperstore
GROUP BY Region , State
HAVING Total_Sales >= 5000
ORDER BY Region , Total_Profit DESC
LIMIT 5;



