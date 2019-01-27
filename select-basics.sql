/* Q1 */
SELECT population FROM world 
WHERE name = 'Germany'

/* Q2 */
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark')

/* Q3 */
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000

