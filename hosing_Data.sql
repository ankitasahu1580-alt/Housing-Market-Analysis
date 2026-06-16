Create database Housing_data;
USE Housing_data;
SHOW TABLES;
SELECT 
    *
FROM
    cleaned_housing;
SELECT 
    COUNT(*) AS Total_houses
FROM
    cleaned_housing;
SELECT 
    AVG(price) AS Average_price
FROM
    cleaned_housing;
SELECT 
    MAX(price) AS Highest_price
FROM
    cleaned_housing;
SELECT 
    MIN(price) AS Lowest_price
FROM
    cleaned_housing;
SELECT 
    *
FROM
    cleaned_housing
WHERE
    airconditioning = 'yes';
SELECT 
    *
FROM
    cleaned_housing
WHERE
    bedrooms > 3;
SELECT 
    *
FROM
    cleaned_housing
ORDER BY price DESC;
SELECT 
    *
FROM
    cleaned_housing
ORDER BY price DESC
LIMIT 5;
SELECT 
    bedrooms, AVG(price) AS Average_price
FROM
    cleaned_housing
GROUP BY bedrooms;
SELECT 
    bathrooms, AVG(price) AS Average_price
FROM
    cleaned_housing
GROUP BY bathrooms;
SELECT 
    furnishingstatus, AVG(price) AS Average_price
FROM
    cleaned_housing
GROUP BY furnishingstatus;
SELECT 
    furnishingstatus, COUNT(*) AS Total_houses
FROM
    cleaned_housing
GROUP BY furnishingstatus;
SELECT 
    parking, AVG(price) AS Average_price
FROM
    cleaned_housing
GROUP BY parking;
SELECT 
    *
FROM
    cleaned_housing
WHERE
    airconditioning = 'yes' AND parking >= 2;
SELECT 
    *
FROM
    cleaned_housing
WHERE
    prefarea = 'YES';
SELECT 
    AVG(price) AS Average_price
FROM
    cleaned_housing
WHERE
    prefarea = 'yes';
SELECT 
    price,
    CASE
        WHEN price > 7000000 THEN 'HIGH'
        WHEN price > 4000000 THEN 'MEDIAM'
        ELSE 'LOW'
    END AS price_category
FROM
    cleaned_housing
ORDER BY price ASC;
SELECT 
    CASE
        WHEN price > 7000000 THEN 'HIGH'
        WHEN price > 4000000 THEN 'MEDIAM'
        ELSE 'LOW'
    END AS price_category,
    COUNT(*) AS total_houses
FROM
    cleaned_housing
GROUP BY price_category;
SELECT 
    *
FROM
    cleaned_housing
WHERE
    price > (SELECT 
            AVG(price)
        FROM
            cleaned_housing);
SELECT 
    bedrooms, AVG(price) AS avg_price
FROM
    cleaned_housing
GROUP BY bedrooms
HAVING AVG(price) > 5000000;
SELECT price,
RANK() OVER(ORDER BY price DESC)AS House_rank
FROM cleaned_housing;
SELECT price,
DENSE_RANK() OVER(ORDER BY price DESC) ASdense_rank FROM cleaned_housing;
SELECT price,
SUM(price) OVER(ORDER BY price)AS running_total FROM cleaned_housing;
WITH avg_table AS
(SELECT AVG(price)AS avg_price FROM cleaned_housing)
SELECT * FROM cleaned_housing,avg_table
WHERE cleaned_housing.price> avg_table.avg_price;
SELECT 
    (COUNT(CASE
        WHEN cleaned_housing.airconditioning = 'yes' THEN 1
    END) * 100.0) / COUNT(*) AS ac_percentage
FROM
    cleaned_housing;
SELECT 
    (COUNT(CASE
        WHEN airconditioning = 'YES' THEN 1
    END) * 100.0) / COUNT(*) AS ac_percentage
FROM
    cleaned_housing;
SELECT 
    bedrooms, MAX(price) AS highest_price
FROM
    cleaned_housing
GROUP BY bedrooms;
SELECT 
    furnishingstatus, AVG(area) AS avg_area
FROM
    cleaned_housing
GROUP BY furnishingstatus;
SELECT 
    *
FROM
    cleaned_housing ch1
WHERE
    price > (SELECT 
            AVG(price)
        FROM
            cleaned_housing ch2
        WHERE
            ch1.bedrooms = ch2.bedrooms);