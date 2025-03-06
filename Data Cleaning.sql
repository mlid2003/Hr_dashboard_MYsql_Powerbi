CREATE DATABASE human_resource;



SELECT * FROM hr;

ALTER TABLE hr

CHANGE COLUMN ï»¿id emp_id VARCHAR(15) NOT NULL;

DESCRIBE hr;

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%d-%m-%Y'), '%Y-%m-%d')
	ELSE NULL
END;


ALTER TABLE hr  
MODIFY birthdate DATE NOT NULL;

UPDATE hr
SET hire_date = CASE
    WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%d-%m-%Y'), '%Y-%m-%d')
	ELSE NULL
END;

ALTER TABLE hr  
MODIFY hire_date DATE NOT NULL;


UPDATE hr
SET termdate = CASE
	WHEN termdate IS NOT NULL AND termdate!= '' THEN DATE(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
    WHEN termdate IS NULL THEN DATE('0000-00-00')
    ELSE NULL
END;

SELECT termdate FROM hr;

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

ALTER TABLE hr
ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR,birthdate, CURDATE());

SELECT COUNT(age) FROM hr
WHERE age<18;

