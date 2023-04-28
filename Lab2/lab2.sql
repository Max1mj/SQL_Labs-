
SELECT id,name,population
FROM cities
WHERE population > 1000000;



SELECT name,region,population
FROM cities
WHERE region IN ('W','E')
ORDER BY population DESC;



SELECT name,region,population
FROM cities
WHERE region IN ('S','C','N') AND population > 500000;


SELECT id,name,region,population
FROM cities
WHERE region IN ('E','W','N') AND population > 150000 AND population < 350000
ORDER BY name DESC;


SELECT id,name,region,population
FROM cities
WHERE NOT region IN ('E','W')
ORDER BY population DESC
LIMIT 10 OFFSET 10;



