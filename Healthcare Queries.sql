create database healthcare;
use healthcare;
Select count(*) from main_file2;
desc main_file2;
select * from main_file2 where Year = 2019;
select distinct type_hosp from main_file2 ;
-- -----------------------------------------------------------------------------------------
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
drop table main_file2 ;


CREATE TABLE main_file2 (
    FAC_NAME TEXT,
    YEARs INT,
    Quarters TEXT,
    COUNTY_NAME TEXT,
    TYPE_HOSP TEXT,
    CITY TEXT,
    LIC_BEDS INT,
    AVL_BEDS INT,
    STF_BEDS INT,
    DIS_TOT INT,
    DAY_TOT INT,
    VIS_TOT INT,
    GRIP_TOT INT,
    GROP_TOT INT,
    BAD_DEBT INT,
    CAP_TOT INT,
    NET_TOT INT,
    DIS_PIPS INT,
    DAY_PIPS INT,
    EXP_PIPS INT,
    EXP_POPS INT
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
-- ---------------------------------------------------------------------------------------------------    
-- C:\ProgramData\MySQL\MySQL Server 8.0\Uploads
-- "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Main_file_1.csv"
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Main_file_1.csv" into table main_file2
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
-------------------------------------------------------------------------------------------------------
create database healthcare;
Use Healthcare;
select count(*) from main_file2; -- 6146
-------------------------------------------------------------------------------------------------------
-- 1.Total Discharge 
select round(Avg(DIS_TOT)) as Total_Discharge from main_file2 ; -- 2106 
-------------------------------------------------------------------------------------------------------
-- 2.Patient Days
select Round(avg(Day_tot)) as Patient_Days from main_file2; -- 12546
-------------------------------------------------------------------------------------------------------
-- 3.Patient Stays 
select CONCAT(Round(sum(day_tot)/sum(dis_tot)),' Days') as Patient_Stays from main_file2; -- 6 Days 
-------------------------------------------------------------------------------------------------------
-- 4.Net Patient Revenue
select CONCAT('$ ',Round(avg(NET_TOT) / 1000000, 2),' M') as Revenue from main_file2 ; -- $ 70.71 M 
--------------------------------------------------------------------------------------------------------
-- 5.total Hospital | Total InPatient
select count(distinct(FAC_NAME))  from main_file2; -- 622
select count(distinct(GRIP_TOT)) from main_file2; -- 5697
--------------------------------------------------------------------------------------------------------
-- 6.Revenu Trend  
select 
distinct YEARs,
CONCAT('$ ',Round(Sum(CAP_TOT) / 1000000),' M') as Revenue
from main_file2 
group by YEARs;
---------------------------------------------------------------------------------------------------------
-- 7.Type of Hospital 
SELECT TYPE_HOSP as Hospital_Type, 
CONCAT('$ ',Round(sum(CAP_TOT) / 1000000),' M') as Revenue
FROM main_file2
GROUP BY TYPE_HOSP
order by TYPE_HOSP;
-------------------------------------------------------------------------------------------------------
-- 8.city wise no.of hosp / Revenue
select 
distinct CITY as City,
count(FAC_NAME) as Hospital_Count,
CONCAT('$ ',Round(Sum(CAP_TOT) / 1000000),' M') as Revenue
from main_file2
group by CITY;
-----------------------------------------------------------------------------------------------------------
-- QTD
select 
distinct Quarters,avg(CAP_TOT)
from main_file2
group by Quarters ;
-- YTD
select
distinct YEARs,avg(CAP_TOT)
from main_file2
group by YEARs;
-- 9.QTD|YTD Revenue
select
distinct YEARs,Quarters,
CONCAT('$ ',Round(sum(CAP_TOT) / 1000000),' M') as Revenue
from main_file2
where YEARs = 2017
group by YEARs,Quarters;
---------------------------------------------------------------------------------------------------------------
-- 10 Types of Beds
select YEARs,Sum(AVL_BEDS) as Available_Beds,sum(LIC_BEDS) as Licensed_Beds,sum(STF_BEDS) as Staffed_Beds
from main_file2 
where YEARs = 2019;
------------------------------------------------------------------------------------------------

