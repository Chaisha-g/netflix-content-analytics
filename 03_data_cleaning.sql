/*
========================================================
Project: Streaming Content Portfolio Intelligence

File: 03_data_cleaning.sql

Author: Chaisha Gallage

Purpose:
Clean the dataset by identifying and resolving
data quality issues before analysis.

========================================================
*/

USE streaming_content_analysis;

-- ============================================
-- 1. Duplicate Analysis
-- ============================================

SELECT
    *,
    ROW_NUMBER() OVER(
        PARTITION BY
            title,
            type,
            release_year,
            country,
            rating,
            duration
        ORDER BY show_id
    ) AS row_num
FROM netflix_titles_staging;

-- View only duplicate records

SELECT *
FROM
(
    SELECT
        *,
        ROW_NUMBER() OVER(
            PARTITION BY
                title,
                type,
                release_year,
                country,
                rating,
                duration
            ORDER BY show_id
        ) AS row_num
    FROM netflix_titles_staging
) AS numbered_rows
WHERE row_num > 1;

-- ============================================
-- 2. Create Clean Dataset
-- ============================================

CREATE TABLE netflix_titles_clean AS
SELECT *
FROM
(
    SELECT
        *,
        ROW_NUMBER() OVER(
            PARTITION BY
                title,
                type,
                release_year,
                country,
                rating,
                duration
            ORDER BY show_id
        ) AS row_num
    FROM netflix_titles_staging
) AS numbered_rows
WHERE row_num = 1;

USE streaming_content_analysis;

-- ============================================
-- 3. Standardize Text Fields
-- ============================================

SET SQL_SAFE_UPDATES = 0;
UPDATE netflix_titles_clean
SET
    title = NULLIF(TRIM(title), ''),
    director = NULLIF(TRIM(director), ''),
    `cast` = NULLIF(TRIM(`cast`), ''),
    country = NULLIF(TRIM(country), ''),
    date_added = NULLIF(TRIM(date_added), ''),
    rating = NULLIF(TRIM(rating), ''),
    duration = NULLIF(TRIM(duration), '');

SET SQL_SAFE_UPDATES = 1;

SELECT
    SUM(title IS NULL) AS missing_titles,
    SUM(director IS NULL) AS missing_directors,
    SUM(`cast` IS NULL) AS missing_cast,
    SUM(country IS NULL) AS missing_countries,
    SUM(date_added IS NULL) AS missing_date_added,
    SUM(rating IS NULL) AS missing_ratings,
    SUM(duration IS NULL) AS missing_duration
FROM netflix_titles_clean;

-- ============================================
-- 4. Convert date_added to DATE
-- ============================================

SELECT date_added
FROM netflix_titles_clean
LIMIT 10;

UPDATE netflix_titles_clean
SET date_added = STR_TO_DATE(date_added, '%M %d, %Y');

ALTER TABLE netflix_titles_clean
MODIFY COLUMN date_added DATE;


-- ============================================
-- 5. Inspect Categorical Values
-- ============================================

SELECT DISTINCT type
FROM netflix_titles_clean;

SELECT DISTINCT rating
FROM netflix_titles_clean
ORDER BY rating;

SELECT DISTINCT duration
FROM netflix_titles_clean
LIMIT 30;

SELECT
    show_id,
    title,
    rating,
    duration
FROM netflix_titles_clean
WHERE rating LIKE '%min%';

SET SQL_SAFE_UPDATES = 0;

UPDATE netflix_titles_clean
SET
    duration = rating,
    rating = NULL
WHERE rating LIKE '%min%';

SET SQL_SAFE_UPDATES = 1;

SELECT DISTINCT rating
FROM netflix_titles_clean
ORDER BY rating;

SELECT COUNT(*)
FROM (
    SELECT
        ROW_NUMBER() OVER(
            PARTITION BY
                title,
                type,
                release_year,
                country,
                rating,
                duration
            ORDER BY show_id
        ) AS row_num
    FROM netflix_titles_clean
) t
WHERE row_num > 1;

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY
                   title,
                   type,
                   release_year,
                   country,
                   rating,
                   duration
               ORDER BY show_id
           ) AS row_num
    FROM netflix_titles_clean
) t
WHERE row_num > 1;

SELECT *
FROM netflix_titles_clean
WHERE show_id = 's6530';

SET SQL_SAFE_UPDATES = 0;
DELETE FROM netflix_titles_clean
WHERE show_id = 's6530';

SELECT COUNT(*)
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY
                   title,
                   type,
                   release_year,
                   country,
                   rating,
                   duration
               ORDER BY show_id
           ) AS row_num
    FROM netflix_titles_clean
) t
WHERE row_num > 1;