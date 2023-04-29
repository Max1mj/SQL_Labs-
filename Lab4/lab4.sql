SELECT UPPER(name) 
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5;


SELECT name, LENGTH(name) AS length_name
FROM cities
WHERE LENGTH(name) NOT IN (8, 9, 10)
ORDER BY length_name;




SELECT region, 
SUM(population) as total_population
FROM cities
WHERE region IN ('C','S')
GROUP BY region;



SELECT region,population,
AVG(population) AS average_population
FROM cities
WHERE region IN('W')



SELECT region,
COUNT(name) AS totalcountof_name
FROM cities
WHERE region IN('E')

