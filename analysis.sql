SELECT 
    *
FROM
    e_comerse_dataset;

ALTER TABLE e_comerse_dataset
RENAME COLUMN п»їclicks to clicks;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY clicks, similar_products_purchased, avg_rating, gender, median_purchasing_price, product_rating, product_brand, customer_review, product_price, holiday, season, terrain, probability_to_be_recommended) AS row_num
FROM e_comerse_dataset
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM e_comerse_dataset
WHERE product_price IS NULL
   OR product_rating IS NULL;
  
SELECT 
    *
FROM
    e_comerse_dataset
WHERE
    product_price <= 0 OR product_rating > 5
        OR product_rating < 0
 
SELECT 
    MIN(probability_to_be_recommended),
    MAX(probability_to_be_recommended)
FROM
    e_comerse_dataset

-- Revenue by Season
SELECT season,
       SUM(product_price * similar_products_purchased) AS revenue
FROM e_comerse_dataset
GROUP BY season;

ALTER TABLE e_comerse_dataset
ADD COLUMN price_bracket TEXT;

UPDATE e_comerse_dataset
SET price_bracket =
CASE 
    WHEN product_price < 1000 THEN 'Low'
    WHEN product_price < 5000 THEN 'Medium'
    ELSE 'High'
END;

-- Conversion by Price
SELECT price_bracket,
       AVG(similar_products_purchased * 1.0 / NULLIF(clicks, 0)) AS conversion
FROM e_comerse_dataset
GROUP BY price_bracket;

-- Top Brands
SELECT product_brand,
       SUM(product_price * similar_products_purchased) AS revenue
FROM e_comerse_dataset
GROUP BY product_brand
ORDER BY revenue DESC
LIMIT 10;

-- Probability of Recommendation
SELECT price_bracket, 
		AVG(probability_to_be_recommended) AS probability_to_be_recommended
FROM e_comerse_dataset
GROUP BY price_bracket;

-- Products Purchased by Season
SELECT season, 
		SUM(similar_products_purchased) AS similar_products_purchased
FROM e_comerse_dataset
GROUP BY season;

-- Avg Median Price by Gender
SELECT 
    gender, SUM(median_purchasing_price) AS avg_median_price
FROM
    e_comerse_dataset
GROUP BY gender;

-- Customer Behavior
SELECT 
    gender, AVG(similar_products_purchased) AS avg_purchases
FROM
    e_comerse_dataset
GROUP BY gender;

-- Conversion by Season+Terrain
SELECT season, terrain,
       AVG(similar_products_purchased * 1.0 / NULLIF(clicks,0)) AS conversion
FROM e_comerse_dataset
GROUP BY season, terrain
ORDER BY conversion DESC;

-- Seasonal demand by terrain
SELECT season, terrain,
       SUM(similar_products_purchased) AS total_purchases
FROM e_comerse_dataset
GROUP BY season, terrain;