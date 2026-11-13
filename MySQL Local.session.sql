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