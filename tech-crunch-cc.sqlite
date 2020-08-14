--SELECT * FROM startups;

SELECT COUNT(*) FROM startups;

SELECT SUM(valuation) FROM startups
WHERE valuation IS NOT NULL;

SELECT name, MAX(raised) FROM startups
WHERE stage = 'Seed';

SELECT name, MIN(founded) FROM startups;

SELECT category AS 'Category', ROUND(AVG(valuation),2) AS 'Average Valuation'FROM startups
GROUP BY 1
ORDER BY 2 DESC;

SELECT category, COUNT(*) FROM startups
GROUP BY category
HAVING COUNT(*) > 3;

SELECT location AS 'Location',
ROUND(AVG(employees),0)  AS 'Average size'
FROM startups
GROUP BY location
ORDER BY 2 DESC;

SELECT location AS 'Location',
ROUND(AVG(employees),0)  AS 'Average size > 500'
FROM startups
GROUP BY location
HAVING ROUND(AVG(employees),0) > 500
ORDER BY 2 DESC;
