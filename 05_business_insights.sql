/*
========================================================
Project: Streaming Content Portfolio Intelligence

File: 05_business_insights.sql

Author: Chaisha Gallage

Purpose:
Generate business insights from Netflix's
content portfolio to support strategic decisions.

========================================================
*/

USE streaming_content_analysis;

-- 1. What percentage of the catalog is Movies vs TV Shows?
SELECT
    type,
    COUNT(*) AS total_titles,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM netflix_titles_clean),
        2
    ) AS percentage
FROM netflix_titles_clean
GROUP BY type;

-- 2. Which countries contribute the most content?
SELECT
    country,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 15;

-- 3. Which release years dominate the catalog?
SELECT
    release_year,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
GROUP BY release_year
ORDER BY total_titles DESC
LIMIT 15;

-- 4.Which ratings are most common?
SELECT
    rating,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total_titles DESC;

-- 5. How much content was added each year?
SELECT
    YEAR(date_added) AS year_added,
    COUNT(*) AS titles_added
FROM netflix_titles_clean
WHERE date_added IS NOT NULL
GROUP BY YEAR(date_added)
ORDER BY year_added;

-- 6. Which genres appear most often?
SELECT
    listed_in,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 20;