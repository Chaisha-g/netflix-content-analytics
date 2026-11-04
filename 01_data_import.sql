/*
========================================================
Project: Streaming Content Portfolio Intelligence

File: 01_data_import.sql

Author: Chaisha Gallage

Purpose:
Create the project database and prepare the raw and
staging tables.

========================================================
*/

CREATE DATABASE streaming_content_analysis;

USE streaming_content_analysis;

DROP TABLE IF EXISTS netflix_titles_staging;

CREATE TABLE netflix_titles_staging
LIKE netflix_titles_raw;

INSERT INTO netflix_titles_staging
SELECT *
FROM netflix_titles_raw;