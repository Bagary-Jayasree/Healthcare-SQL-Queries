# Healthcare-SQL-Queries
Healthcare Database SQL Script
This repository contains a SQL script for setting up and exploring a healthcare database. The script includes commands to create the database, configure settings, and perform initial data analysis on healthcare-related data.
Script Overview
The SQL script (Healthcare Queries.sql) includes the following key sections:

1. Create the Healthcare Database
   `create database healthcare`;
   `use healthcare`;
   Purpose: Sets up a new database called healthcare and makes it the active database for all subsequent commands.
2.Count Total Records
   `Select count(*) from main_file2`;
   Purpose: Counts the total number of rows in the main_file2 table to get an overview of the dataset size.
3. Describe Table Structure
   `desc main_file2`;
   Purpose: Displays the structure of main_file2, including columns and data types, to understand the table's contents.
4. Filter Data by Year
   `select * from main_file2 where Year = 2019`;
   Purpose: Filters records to retrieve data specifically for the year 2019, which may be useful for analyzing healthcare trends for that period.
5. List Unique Hospital Types
   `select distinct type_hosp from main_file2`;
   Purpose: Lists unique hospital types in main_file2, allowing for categorization and analysis by facility type.
6. Database Configuration Settings
   `SET character_set_client = utf8mb4`;
   `SET time_zone = '+00:00'`;
   `SET foreign_key_checks = 0`;
    Purpose: Configures settings like character encoding and timezone to ensure compatibility and correct data handling.
7. Table Cleanup
   `drop table if exists main_file2`;
   Purpose: Drops the main_file2 table if it exists, allowing for a clean setup if the table needs to be recreated or data needs to be reloaded.

**How to Use**
Run the script in a MySQL-compatible database environment.
Ensure the necessary permissions to create databases and tables.
Follow each section to set up the database, review the data structure, and perform initial data exploration.
**Notes**
Dependencies: MySQL or a compatible SQL database engine.
Purpose: This script is designed for educational and analysis purposes, providing a foundation for healthcare data exploration.
