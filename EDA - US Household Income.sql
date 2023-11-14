#US Household Income Exploratory Data Analysis

SELECT * 
FROM US_Project.us_household_income;


SELECT * 
FROM US_Project.us_household_income_statistics;


SELECT State_Name, 
SUM(ALand), 
SUM(AWater)
FROM US_Project.us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
;

#TOP 10 STATES BY LAND
SELECT State_Name, 
SUM(ALand), 
SUM(AWater)
FROM US_Project.us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10
;



SELECT * 
FROM US_Project.us_household_income u
JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
;

#which income table rows don't appear in statisitics table
SELECT * 
FROM US_Project.us_household_income u
RIGHT JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
WHERE u.id IS NULL
;

SELECT * 
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
;


SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
;


SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 10
;


SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
ORDER BY 3 DESC
LIMIT 20
;


SELECT *
FROM us_household_income
WHERE Type = 'Community'
;


SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
INNER JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 3 DESC
LIMIT 20
;


SELECT * 
FROM US_Project.us_household_income u
JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
;


SELECT u.State_Name, City, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Project.us_household_income u
JOIN US_Project.us_household_income_statistics us
	ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean),1) DESC
;










