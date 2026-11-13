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