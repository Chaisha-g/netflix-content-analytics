/*
========================================================
Project: Streaming Content Portfolio Intelligence

File: 02_data_profiling.sql

Purpose:
Inspect the dataset and identify data quality issues
before cleaning.

========================================================
*/

USE streaming_content_analysis;


-- 1. DATASET OVERVIEW


SELECT COUNT(*) AS raw_rows
FROM netflix_titles_raw;

SELECT COUNT(*) AS staging_rows
FROM netflix_titles_staging;

DESCRIBE netflix_titles_staging;

SELECT *
FROM netflix_titles_staging
LIMIT 10;