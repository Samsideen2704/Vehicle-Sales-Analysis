# Vehicle Sales Analysis
## Understanding Customer Preferences and Vehicle Pricing 


### Project Overview

The aim of this project is to analyze vehicle sales data from December 2014 till December 2015 to identify customer preferences and pricing patterns. The insights gained will help optimize inventory, pricing strategies, and targeted marketing efforts.

### Project Objectives

* Identify trends in vehicle sales based on attributes like mileage, price, transmission type, and brand.
* Segment vehicles by customer demand and pricing patterns.
* Provide actionable marketing and pricing recommendations for improved sales performance.
* Compare sale price to market value to identify underpricing or overpricing trends.

### Data Sources/Overview

* Source: Open data source from Maven Analytics website
(https://www.kaggle.com/datasets/syedanwarafridi/vehicle-sales-data/data).
* Table Name: Vehicle Sales.
* Key Fields:
vehicle year, vehicle make, model, vehicle trim, transmission, mileage, seller name, sale date, market value, sale price.

### Tools and Software Used
* MS Excel and power query for data cleaning
* MySQL for cleaning and exploratory data analysis
* PowerBi for Visualisation.

### Data Cleaning and Preparation
- Removed duplicates, handled missing data in selling price and market value.
- Created new fields: Price Segment, Mileage Band, and Price Comparison Segment.
- Converted sale date into usable time features for trend analysis.


### Exploratory Data Analysis
I explore the vehicle sales data to answer key business questions such as:

- What are the key factors that influence the selling price of a vehicle?

- Which vehicle makes and models are the most popular in sales?

- How does vehicle condition affect its market and selling prices?

- Is there a significant price difference between vehicle body types (SUV, Sedan, etc.)?

- Do newer vehicles (recent vehicle year) fetch higher prices compared to older ones?

- Which states have the highest average selling prices?

- How does mileage (odometer) impact the vehicle's selling price?

- Is there a correlation between the transmission type and vehicle price or popularity?


#### Selling Price and Market value Comparison Segment Details
- Underpriced: Selling Price is more than 10% below Market Value
- Fair Price: Within ±10% of Market Value
- Overpriced: Selling Price is more than 10% above Market Value


#### Selling Price Segment Details
- Luxury: Selling Price is over 50,000
- Premium: Selling price between 25,000 and 50,000
- Mid-Range: Selling price between 10,000 and 25,000
- Budget: Selling price is less than 10,000


### Key Insights / Findings

- There is a negative correlation between mileage and Selling Price; there is a drop in selling price as the mileage increases.
  
- Pricing Segmentation shows that 64.1% of vehicle sales fall into the “Fair Price” range and 15.7% of vehicle sales are overpriced.
  
- Nissan Altima, Toyota Camry and Ford F-150 dominate vehicle sales. While Ford, Chevrolet and Nissan are the most purchased vehicle brands.
  
- Majority of buyers prefer automatic transmission as it accounts for about 97% of vehicle sold.
  
- Data shows that some sellers price vehicles 10–20% above the market value as there is huge market value gap.
  
- The most preferred body types for the consumers are the Sedan which accounts for about 45% of vehicle sold and the SUV (26%).
  
- The highrst amount of vehicles are sold in the state of Florida while Alaska sold the least number of vehicles within this period.
  
- Data shows that vehicle transmission influence its pricing as automatic vehicles are more expensive than manual vehicles.

### Marketing Recommendations
- Set Fair Prices Based on Mileage: Since cars with higher mileage tend to sell for less, sellers should set their prices accordingly. This will help them sell faster and attract more buyers.

- Help Vehicle Sellers Avoid Overpricing: Many sellers are asking too much for their cars (sometimes 10–20% more than the market value). It would help by showing the car dealerships what similar vehicles are selling for so they can price more fairly and make quicker sales.

- Stock More Popular Brands and Models: Cars like the Nissan Altima, Toyota Camry, and Ford F-150 are very popular. It makes sense to have more of these in stock, along with brands like Ford, Toyota, Chevrolet, and Nissan, because they sell well.

- Focus on Automatic Cars: Almost all buyers prefer cars with automatic transmission. So, it's smart to focus more on selling automatic cars and fewer manuals, unless there's a special market for them.

- Pay Attention to Where Cars Sell the Most: Florida has the highest number of sales, so it’s a good idea to put more marketing and delivery resources there. For places like Alaska, where fewer cars are sold, it may not be worth investing too much.

- Promote Underpriced vehicles: Highlight underpriced vehicles in seasonal promotions to attract price-conscious and budget friendly buyers.










