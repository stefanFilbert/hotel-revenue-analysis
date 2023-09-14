USE hoteldb

with hotels as(
SELECT * FROM hotel_2018
UNION
SELECT * FROM hotel_2019
UNION
SELECT * FROM hotel_2020)

--SELECT DISTINCT market_segment FROM hotels

--SELECT * FROM hotels

SELECT * FROM hotels
LEFT JOIN market_segement 
ON hotels.market_segment = market_segement.market_segment
LEFT JOIN meal_cost
ON hotels.meal = meal_cost.meal

SELECT 
arrival_date_year,
hotel,
ROUND(SUM((stays_in_week_nights+stays_in_weekend_nights)*adr),2) AS revenue
FROM hotels
GROUP BY arrival_date_year, hotel
ORDER BY revenue DESC

--SELECT 
--arrival_date_month,
--SUM((stays_in_week_nights+stays_in_weekend_nights)*adr) AS revenue
--FROM hotel
--WHERE arrival_date_year = 2019
--GROUP BY arrival_date_month
--ORDER BY revenue DESC

