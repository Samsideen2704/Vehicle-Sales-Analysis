-- Total Vehicles Sold
SELECT count(*) as total_vehicle_sold
FROM vehicle_sales;

-- Average Selling Price
SELECT round(avg(selling_price)) as avg_selling_price
FROM vehicle_sales;

-- AVERAGE MARKET VALUES
SELECT round(avg(market_value)) as avg_market_value
FROM vehicle_sales;

-- Average Price Difference
SELECT round(AVG(selling_price - market_value),2) AS avg_price_difference 
FROM vehicle_sales;

-- percentage_price_difference
SELECT
round((AVG(selling_price) - AVG(market_value)) / AVG(market_value) * 100,2) 
AS percentage_difference
FROM vehicle_sales;



-- What are the key factors that influence the selling price of a vehicle?

SELECT vehicle_year, transmission,   -- (BY YEAR AND TRANSMISSION)
round(AVG(selling_price),2) AS avg_selling_price
FROM vehicle_sales
GROUP BY vehicle_year, transmission
ORDER BY vehicle_year DESC;

SELECT vehicle_condition, transmission,   -- (BY CONDITION AND TRANSMISSION)
round(AVG(selling_price),2) AS avg_selling_price
FROM vehicle_sales
GROUP BY vehicle_condition, transmission
ORDER BY vehicle_condition DESC;

SELECT transmission,   -- (BY MILEAGE AND TRANSMISSION)
(
	CASE 
	WHEN mileage between 1 and 99 THEN '1 - 99'
    WHEN mileage between 100 and 999 THEN '100 - 999'
    WHEN mileage between 1000 and 9999 THEN '1000 - 9999'
    WHEN mileage between 10000 and 49999 THEN '10000 - 49999'
    WHEN mileage between 50000 and 99999 THEN '50000 - 99999'
    ELSE 'OVER 100000'
END) AS mileage_range, 
round(AVG(selling_price),2) AS avg_selling_price
FROM vehicle_sales
WHERE mileage BETWEEN 1 AND 100000
GROUP BY mileage_range, transmission
ORDER BY mileage_range;

SELECT (year(sale_date) - vehicle_year) as Vehicle_Age,   -- (BY VEHICLE AGE AND TRANSMISSION)
transmission,
round(AVG(selling_price),2) AS avg_selling_price,
count(*) AS num_vehicles
from vehicle_sales
GROUP BY Vehicle_Age, transmission
ORDER BY Vehicle_Age;

SELECT colour,    -- (BY THE COLOUR OF THE CAR)
round(AVG(selling_price),2) AS avg_selling_price
from vehicle_sales
GROUP BY colour
ORDER BY avg_selling_price DESC;


-- Which vehicle makes and models are the most popular in sales?
SELECT concat(make, ' ', model) AS vehicle_details,
count(*) as num_vehicles
FROM vehicle_sales
GROUP BY make, model
ORDER BY num_vehicles DESC
LIMIT 10;


-- How does vehicle condition affect its market value and selling prices?
SELECT vehicle_condition,
round(AVG(market_value),2) AS avg_market_value,
round(AVG(selling_price),2) AS avg_selling_price
FROM vehicle_sales
GROUP BY vehicle_condition
ORDER BY vehicle_condition DESC;

SELECT vehicle_condition,
round(AVG(market_value),2) AS avg_market_value,
round(AVG(selling_price),2) AS avg_selling_price
FROM vehicle_sales
GROUP BY vehicle_condition
HAVING avg_selling_price > avg_market_value -- (selling price more than market value)
ORDER BY vehicle_condition DESC;

SELECT vehicle_condition,
round(AVG(market_value),2) AS avg_market_value,
round(AVG(selling_price),2) AS avg_selling_price
FROM vehicle_sales
GROUP BY vehicle_condition
HAVING avg_selling_price < avg_market_value -- (selling price less than market value)
ORDER BY vehicle_condition DESC;

-- Is there a significant price difference between vehicle body types (SUV, Sedan, etc.)?
SELECT body as body_type, 
round(avg(selling_price),2) AS avg_price,
count(*) AS total_sales
FROM vehicle_sales
GROUP BY body
ORDER BY avg_price DESC;

-- Do newer vehicles (recent vehicle year) fetch higher prices compared to older ones?
SELECT vehicle_year,
round(AVG(selling_price),2) AS avg_price
FROM vehicle_sales
GROUP BY vehicle_year
ORDER BY vehicle_year DESC;

-- Which states are vehicles more expensive?
SELECT state,
round(AVG(selling_price),2) AS avg_price
FROM vehicle_sales
GROUP BY state
ORDER BY avg_price DESC;


-- How does mileage (odometer) impact the vehicle's selling price?
SELECT vehicle_year,
	CASE 
	WHEN mileage BETWEEN 1 AND 999 THEN '1 - 999'
    WHEN mileage BETWEEN 1000 AND 9999 THEN '1000 - 9999'
    WHEN mileage BETWEEN 10000 AND 99999 THEN '10000 - 99999'
    WHEN mileage BETWEEN 100000 AND 499999 THEN '100000 - 500000'
    ELSE 'OVER 500000'
END AS mileage_range, 
round(AVG(selling_price),2) AS avg_price,
count(*) AS vehicle_count
FROM vehicle_sales
GROUP BY mileage_range, vehicle_year
ORDER BY vehicle_year DESC;


-- Is there a correlation between the transmission type and vehicle price or popularity?
SELECT transmission,
round(AVG(selling_price),2) AS avg_price,
count(*) AS vehicle_sold
FROM vehicle_sales
GROUP BY transmission
ORDER BY vehicle_sold DESC;


-- Which sellers sold the most number of vehicles?
SELECT seller,
count(*) AS vehicle_sold,
round(AVG(selling_price),2) AS avg_price
FROM vehicle_sales
GROUP BY seller
ORDER BY vehicle_sold DESC
LIMIT 10;

-- Are certain colors (exterior or interior) associated with higher resale values?
SELECT 
colour AS exterior_colour,
interior,
round(AVG(market_value),2) AS avg_mkt_value,
round(AVG(selling_price),2) AS avg_price
FROM vehicle_sales
GROUP BY colour, interior
HAVING avg_price > avg_mkt_value
ORDER BY avg_mkt_value DESC, avg_price DESC;


-- What is the average markup (difference between market value and selling price) across vehicle types?
SELECT 
body AS vehicle_type,
round(AVG(selling_price - market_value),2) AS avg_markup
FROM vehicle_sales
GROUP BY body
ORDER BY avg_markup DESC;

-- Do specific vehicle trims tend to sell for more than others within the same model?
SELECT concat(make, ' ' , model) AS vehicle_details,
vehicle_trim, 
round(AVG(selling_price),2) AS avg_price,
count(*) AS sales_count
FROM vehicle_sales
GROUP BY vehicle_details, vehicle_trim
ORDER BY vehicle_details, avg_price DESC;


-- How consistent are market values compared to actual selling prices?
SELECT
round(AVG(selling_price),2) AS avg_price,
round(AVG(market_value),2) AS avg_mkt_value,
round(AVG(selling_price - market_value),2) AS avg_difference,
round((AVG(selling_price) - AVG(market_value)) / AVG(market_value) * 100,2) AS percentage_difference
FROM vehicle_sales;


-- What trends exist in vehicle sales based on year of manufacture across different states?
SELECT vehicle_year, state,
count(*) AS total_sales,
round(AVG(selling_price),2) AS avg_price,
MIN(selling_price) AS min_price,
MAX(selling_price) AS max_price
FROM vehicle_sales
GROUP BY vehicle_year, state
ORDER BY vehicle_year DESC, state;


-- Are there any anomalies or outliers in pricing that could indicate fraud or data quality issues?
SELECT 
concat(make, ' ', model) AS vehicle_details,
selling_price, market_value,
(selling_price - market_value) AS price_difference,
round((selling_price - market_value) / market_value * 100,2) AS percentage_difference
FROM vehicle_sales
WHERE round((selling_price - market_value) / market_value * 100,2) > 100
OR round((selling_price - market_value) / market_value * 100,2) < -50
OR selling_price <= 0
OR market_value <= 0
ORDER BY percentage_difference DESC;

SELECT 
concat(make, ' ', model) AS vehicle_details,
selling_price, market_value,
(selling_price - market_value) AS price_difference,
round((selling_price - market_value) / market_value * 100,2) AS percentage_difference
FROM vehicle_sales
WHERE selling_price > (market_value * 2)
OR selling_price < (market_value * 0.5)
ORDER BY percentage_difference DESC;

