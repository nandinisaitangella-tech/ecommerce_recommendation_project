 CREATE TABLE IF NOT EXISTS products (
    id INT,
    title TEXT,
    price DOUBLE PRECISION,
    description TEXT,
    category TEXT
);


COPY products (id, title, price, description, category)
FROM 'C:/Users/Nandini/OneDrive/ecommerce_recommendation_project/data/products.csv'
DELIMITER ','
CSV HEADER;


SELECT COUNT(*) FROM products;

SELECT * FROM products LIMIT 5;

DROP TABLE IF EXISTS customer_behavior_raw;

CREATE TABLE customer_behavior_raw (
    row_data TEXT
);


COPY customer_behavior_raw
FROM 'C:/Users/Nandini/OneDrive/ecommerce_recommendation_project/data/e_commerce_shopper_behaviour_and_lifestyle.csv'
(FORMAT text);


SELECT COUNT(*) FROM customer_behavior_raw;

SELECT LEFT(row_data, 200)
FROM customer_behavior_raw
LIMIT 1;


DROP TABLE IF EXISTS customer_behavior_clean;

CREATE TABLE customer_behavior_clean (
    user_id INT,
    age INT,
    gender TEXT,
    country TEXT,
    urban_rural TEXT,
    income_level INT,
    employment_status TEXT,
    education_level TEXT,
    relationship_status TEXT,
    has_children INT,
    household_size INT,
    occupation TEXT,
    ethnicity TEXT,
    language_preference TEXT,
    device_type TEXT,
    weekly_purchases INT,
    monthly_spend DOUBLE PRECISION,
    average_order_value DOUBLE PRECISION,
    preferred_payment_method TEXT,
    product_category_preference TEXT
);


INSERT INTO customer_behavior_clean
SELECT
    split_part(row_data, ',', 1)::INT,
    split_part(row_data, ',', 2)::INT,
    split_part(row_data, ',', 3),
    split_part(row_data, ',', 4),
    split_part(row_data, ',', 5),
    split_part(row_data, ',', 6)::INT,
    split_part(row_data, ',', 7),
    split_part(row_data, ',', 8),
    split_part(row_data, ',', 9),
    split_part(row_data, ',', 10)::INT,
    split_part(row_data, ',', 11)::INT,
    split_part(row_data, ',', 12),
    split_part(row_data, ',', 13),
    split_part(row_data, ',', 14),
    split_part(row_data, ',', 15),
    split_part(row_data, ',', 16)::INT,
    split_part(row_data, ',', 17)::DOUBLE PRECISION,
    split_part(row_data, ',', 18)::DOUBLE PRECISION,
    split_part(row_data, ',', 19),
    split_part(row_data, ',', 20)
FROM customer_behavior_raw
WHERE row_data NOT LIKE 'user_id%';


SELECT COUNT(*) FROM customer_behavior_clean;
SELECT * FROM customer_behavior_clean LIMIT 5;


 -- Gender distribution
SELECT gender, COUNT(*)
FROM customer_behavior_clean
GROUP BY gender;

-- Country distribution
SELECT country, COUNT(*)
FROM customer_behavior_clean
GROUP BY country
ORDER BY COUNT(*) DESC;

-- Average monthly spend
SELECT AVG(monthly_spend) FROM customer_behavior_clean;