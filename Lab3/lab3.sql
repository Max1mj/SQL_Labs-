SELECT id,name
FROM cities
WHERE name LIKE'%ськ';


SELECT id,name
FROM cities
WHERE name LIKE'%донец%';


SELECT id,Concat(name,'(',region,')') AS НАЗВА_МІСТА(РЕГІОН),population
FROM cities
WHERE population > 100000
ORDER BY name ASC;



SELECT id,name,population,Concat((population/40000000*100),'%') AS ПРОЦЕНТ_НАСЕЛЕННЯ
FROM cities 
ORDER BY population DESC;


SELECT id,name,population,Concat((population/40000000*100),'%') AS ПРОЦЕНТ_НАСЕЛЕННЯ
FROM cities 
WHERE population > 100000
ORDER BY  ПРОЦЕНТ_НАСЕЛЕННЯ DESC;

