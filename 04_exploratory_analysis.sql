/*
========================================================
Project: Streaming Content Portfolio Intelligence

File: 04_exploratory_analysis.sql

Author: Chaisha Gallage

Purpose:
Explore the cleaned dataset and identify important
patterns in Netflix's content portfolio.

========================================================
*/

USE streaming_content_analysis;

-- ============================================
-- 1. Movies vs TV Shows
-- ============================================

SELECT
    type,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
GROUP BY type
ORDER BY total_titles DESC;

-- ============================================
-- 2. Titles Released by Year
-- ============================================

SELECT
    release_year,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
GROUP BY release_year
ORDER BY release_year;

-- ============================================
-- 3. Titles Added to Netflix by Year
-- ============================================

SELECT
    YEAR(date_added) AS year_added,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
WHERE date_added IS NOT NULL
GROUP BY YEAR(date_added)
ORDER BY year_added;

-- ============================================
-- 4. Top 10 Countries
-- ============================================

SELECT
    country,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

-- ============================================
-- 5. Content Ratings
-- ============================================

SELECT
    rating,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total_titles DESC;

-- ============================================
-- 6. Top 10 Directors
-- ============================================

SELECT
    director,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

-- ============================================
-- 7. Movie Duration Distribution
-- ============================================

SELECT
    duration,
    COUNT(*) AS total_movies
FROM netflix_titles_clean
WHERE type = 'Movie'
GROUP BY duration
ORDER BY total_movies DESC
LIMIT 20;

-- ============================================
-- 8. TV Show Seasons Distribution
-- ============================================

SELECT
    duration,
    COUNT(*) AS total_shows
FROM netflix_titles_clean
WHERE type = 'TV Show'
GROUP BY duration
ORDER BY total_shows DESC;

-- ============================================
-- 9. Genre Combinations
-- ============================================

SELECT
    listed_in,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 20;

-- ============================================
-- 10. Titles Added by Month
-- ============================================

SELECT
    MONTHNAME(date_added) AS month_added,
    COUNT(*) AS total_titles
FROM netflix_titles_clean
WHERE date_added IS NOT NULL
GROUP BY MONTH(date_added), MONTHNAME(date_added)
ORDER BY MONTH(date_added);