CREATE DATABASE projects;

USE projects;

drop table hr;

SELECT *
FROM hr;

DESCRIBE hr;

-- Data Cleaning --

SELECT birthdate from hr;

UPDATE hr
SET birthdate = CASE 
	WHEN birthdate LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr
SET hire_date = CASE 
	WHEN hire_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

SELECT *
FROM hr;

SELECT DISTINCT termdate
FROM hr;


UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate LIKE '____-__-__ __:__:__ UTC'
  AND termdate IS NOT NULL;
  
UPDATE hr
SET termdate = NULL
WHERE termdate = '0000-00-00';


ALTER TABLE hr
MODIFY COLUMN termdate DATE;

SELECT termdate FROM hr;

ALTER TABLE hr
MODIFY COLUMN emp_id VARCHAR(20) NULL;

DESCRIBE hr;

SELECT *
FROM hr;

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT 
	MIN(age) AS youngest,
    MAX(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age < 18;

SELECT birthdate, age
FROM hr;




