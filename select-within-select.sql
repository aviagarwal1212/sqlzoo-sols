/* Q1 */
SELECT name FROM world
WHERE population > (SELECT population FROM world
                    WHERE name='Russia')

/* Q2 */
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp/population > (SELECT gdp/population FROM world
                        WHERE name = 'United Kingdom')

/* Q3 */
SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world 
                    WHERE name IN ('Argentina','Australia'))
ORDER BY name

/* Q4 */
SELECT name, population FROM world
WHERE population > (SELECT population FROM world 
                    WHERE name = 'Canada')
AND population < (SELECT population FROM world 
                    WHERE name = 'Poland')

/* Q5 */
SELECT name, CONCAT( ROUND( population*100/(SELECT population FROM world 
                                            WHERE name = 'Germany')),'%')
FROM world
WHERE continent = 'Europe'

/* Q6 */
SELECT name FROM world
WHERE gdp > ALL(SELECT gdp FROM world 
                WHERE continent = 'Europe' AND gdp > 0)

/* Q7 */
SELECT continent, name, area FROM world x
WHERE area >= ALL(SELECT area FROM world y
                    WHERE y.continent = x.continent AND population > 0)

/* Q8 */
SELECT continent, name FROM world x
WHERE name <= ALL(SELECT name FROM world y
                    WHERE x.continent = y.continent)

/* Q9 */
SELECT name, continent, population FROM world x
WHERE 25000000 >= ALL(SELECT population FROM world y
                        WHERE x.continent = y.continent AND y.population > 0)

/* Q10 */
SELECT name, continent FROM world x
WHERE population > ALL(SELECT 3*population FROM world y
                        WHERE x.continent = y.continent AND x.name != y.name)
                        
