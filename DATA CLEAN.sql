-- CREATE DATABASE
CREATE DATABASE vehicle_sales_data;

-- CREATE VEHICLE SALES TABLE
CREATE TABLE vehicle_sales (
	vehicle_year INT,
	make VARCHAR (100),
	model VARCHAR (100),
	vehicle_trim VARCHAR (100),
	body VARCHAR (100),
	transmission VARCHAR (100),
	vin VARCHAR (100),
	state VARCHAR (100),
	vehicle_condition VARCHAR (100),
	odometer INT,
	colour VARCHAR (100),
	interior VARCHAR (100),
	seller VARCHAR (100),
	market_value INT,
	selling_price INT,
	sale_date VARCHAR (100),
	sale_time VARCHAR (100)
);


-- LOAD FILES IN THE TABLE
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/vehicle_sales.csv'
INTO TABLE vehicle_sales
FIELDS TERMINATED BY ','
IGNORE 1 LINES;


-- CONVERT THE SALE DATE COLUMN INTO A DATE FORMAT
UPDATE vehicle_sales
SET sale_date = date_format(str_to_date(sale_date, '%d/%m/%Y'),'%Y-%m-%d');

ALTER TABLE vehicle_sales
MODIFY COLUMN sale_date DATE;

ALTER TABLE vehicle_sales
CHANGE COLUMN odometer mileage varchar(100);


UPDATE vehicle_sales 
SET vehicle_condition = 
    CASE 
        WHEN vehicle_condition = 1 THEN 10
        WHEN vehicle_condition = 2 THEN 20
        WHEN vehicle_condition = 3 THEN 30
        WHEN vehicle_condition = 4 THEN 40
        WHEN vehicle_condition = 5 THEN 50
        ELSE vehicle_condition
    END;


