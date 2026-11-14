-- Problem 1: Different body styles sold
SELECT DISTINCT `Body style`
FROM car_sales_report;
-- Problem 2: Regions where dealers operate
SELECT DISTINCT Dealer_Region
FROM car_sales_report;
-- Problem 3: Cars sold in the Aurora region
SELECT DISTINCT Car_id,
    Company,
    Model,
    `Price ($)`,
    Dealer_Region
FROM car_sales_report
WHERE Dealer_Region = "Aurora";
-- Problem 4: Cars sold above $60,000, most expensive first
SELECT car_id,
    company,
    model,
    `Price ($)`
FROM car_sales_report
WHERE `Price ($)` > 60000
ORDER BY `Price ($)` DESC;
-- Problem 5: Toyota sales, sorted by model A to Z
SELECT `Customer Name`,
    Model,
    company,
    color
FROM car_sales_report
WHERE company = "toyota"
ORDER BY Model ASC;
-- Problem 6: Red cars with the price renamed Sale_Price
SELECT company,
    model,
    `price ($)` AS Sale_Price
FROM car_sales_report
WHERE color = 'red';
-- Problem 7: Automatic SUVs priced under $30,000
SELECT `price ($)`,
    Transmission,
    `Body Style`
FROM car_sales_report
WHERE Transmission = 'Auto'
    AND `price ($)` < 30000
    AND `Body Style` = 'SUV';
-- Problem 8: Ford cars that are Red or Black
SELECT color,
    company
FROM car_sales_report
WHERE company = 'ford'
    AND (
        color = 'red'
        OR color = 'black'
    );
-- Problem 9: Sales in Austin, Pasco or Scottsdale
SELECT Car_id,
    Dealer_Region,
    `Price ($)`
FROM car_sales_report
WHERE Dealer_Region IN('Austin', 'Pasco', 'Scottsdale');
-- Problem 10: Cars priced $30,000 to $40,000, cheapest first
SELECT `Price ($)`
FROM car_sales_report
WHERE `Price ($)` BETWEEN 30000 AND 40000
ORDER BY `Price ($)` ASC;
-- Problem 11: Marketing
SELECT `Body Style`,
    Color
FROM car_sales_report
WHERE `Body Style` <> 'Hatchback'
    AND Color <> 'Pale White';
-- Problem 12: CEO report
SELECT Company,
    Model,
    `Price ($)`
FROM car_sales_report
ORDER BY `Price ($)` DESC
LIMIT 10;
-- Problem 13: Women's campaign
SELECT Car_id,
    Company,
    Model,
    `Price ($)`
FROM car_sales_report
WHERE Gender = 'Female'
ORDER BY `Price ($)` ASC
LIMIT 5;
-- Problem 14: Luxury targeting
SELECT `Customer Name`,
    `Annual Income`,
    `Price ($)`
FROM car_sales_report
WHERE `Annual Income` BETWEEN 500000 AND 1000000
    AND `Price ($)` > 40000;
-- Problem 15: Pricing audit
SELECT MIN(`Price ($)`) AS Lowest_Price,
    MAX(`Price ($)`) AS Highest_Price
FROM car_sales_report;
-- Problem 16: Wealth research
SELECT MAX(`Annual Income`) AS Top_Income
FROM car_sales_report
WHERE Gender = 'Female';
-- Problem 17: Brand performance
SELECT Company,
    COUNT(Car_id) AS Total_Sold
FROM car_sales_report
GROUP BY Company
ORDER BY Total_Sold DESC;
-- Problem 18: Regional report
SELECT Dealer_Region,
    COUNT(Car_id) AS Total_Sold,
    MAX(`Price ($)`) AS Highest_Price
FROM car_sales_report
GROUP BY Dealer_Region;
-- Problem 19: Color trends
SELECT Color,
    COUNT(Car_id) AS Total_Sold
FROM car_sales_report
WHERE `Body Style` = 'SUV'
GROUP BY Color;
-- Problem 20: Final challenge
SELECT `Body Style`,
    COUNT(Car_id) AS Total_Sold
FROM car_sales_report
WHERE Transmission = 'Auto'
    AND Gender = 'Female'
GROUP BY `Body Style`
ORDER BY Total_Sold DESC
LIMIT 3;
-- MORE GROUP BY PROBLEMS TO PRACTICE
--Problem 1: Brand revenue. Total money earned per company, highest first.
SELECT Company,
    SUM(`Price ($)`) AS Total_Revenue
FROM car_sales_report
GROUP BY Company
ORDER BY Total_Revenue DESC;
--Problem 2: Body style pricing. Average price per body style, most expensive first.
SELECT `Body Style`,
    AVG(`Price ($)`) AS Avg_Price
FROM car_sales_report
GROUP BY `Body Style`
ORDER BY Avg_Price DESC;
--Problem 3: Transmission split. Number of cars sold per transmission type. Tip: COUNT(Car_id) is the safer habit.
SELECT Transmission,
    COUNT(`Price ($)`) AS Total_Cars
FROM car_sales_report
GROUP BY Transmission;
--Problem 4: Gender income. Average annual income per gender.
SELECT Gender,
    AVG(`Annual Income`) AS Avg_Income
FROM car_sales_report
GROUP BY Gender;
--Problem 5: Region leaderboard. Total sales per region, top 5 only.
SELECT Dealer_Region,
    SUM(`Price ($)`) AS Region_Revenue
FROM car_sales_report
GROUP BY Dealer_Region
ORDER BY Region_Revenue DESC
LIMIT 5;
Problem 6: Price range per brand.Lowest
and highest price per company,
A to Z.
SELECT Company,
    MAX(`Price ($)`) AS Highest_Price,
    MIN(`Price ($)`) AS Lowest_Price
FROM car_sales_report
GROUP BY Company
ORDER BY Company ASC;
--Problem 7: Premium color trends. Cars above $30,000, number sold per color, most popular first.
SELECT Color,
    COUNT(`Price ($)`) AS Total_Sold
FROM car_sales_report
WHERE `Price ($)` > 30000
GROUP BY Color
ORDER BY Total_Sold DESC;
--Problem 8: Brand and body style mix. Number sold per company and body style, sorted by company A to Z.
SELECT Company,
    `Body Style`,
    COUNT(Car_id) AS Total_Sold
FROM car_sales_report
GROUP BY Company,
    `Body Style`
ORDER BY Company ASC;
--Problem 9: Black and Red analysis. Average price per company among Black or Red cars, highest first.
SELECT Company,
    AVG(`Price ($)`) AS Avg_Price
FROM car_sales_report
WHERE Color IN ('Black', 'Red')
GROUP BY Company
ORDER BY Avg_Price DESC;
--Problem 10: Final challenge. Manual cars bought by male customers, number sold and total revenue per body style, top 3 by revenue.
SELECT `Body Style`,
    COUNT(Car_id) AS Total_Sold,
    SUM(`Price ($)`) AS Total_Revenue
FROM car_sales_report
WHERE Gender = 'Male'
    AND Transmission = 'Manual'
GROUP BY `Body Style`
ORDER BY Total_Revenue DESC
LIMIT 3;
Rules you learned: "how many" means COUNT,
"total" means SUM,
and "average" means AVG.The clause order is
SELECT,
    FROM,
    WHERE,
    GROUP BY,
    ORDER BY,
    LIMIT."Top N" needs
ORDER BY first,
    then
LIMIT.Every column in
SELECT that isn 't inside an aggregate function must also be in GROUP BY. To match several values, use IN (' A ', ' B ') instead of column = ' A ' OR ' B '.