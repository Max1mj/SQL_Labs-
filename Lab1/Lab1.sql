SELECT id,name,population
FROM cities
LIMIT 10 OFFSET 10;



SELECT name
FROM cities
ORDER BY name ASC
LIMIT 30;


SELECT region,name,population
FROM cities
ORDER BY region,population DESC;


SELECT region
FROM cities



SELECT region,name
FROM cities
ORDER BY region DESC,name DESC;

