/* Q1 */
SELECT COUNT(id) FROM stops

/* Q2 */
SELECT id FROM stops
WHERE name = 'Craiglockhart'

/* Q3 */
SELECT id, name from stops
JOIN route ON id = stop
WHERE num = 4

/* Q4 */
SELECT company, num, COUNT(*) FROM route 
WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

/* Q5 */
SELECT a.company, a.num, a.stop, b.stop FROM route a 
JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

/* Q6 */
SELECT a.company, a.num, stopa.name, stopb.name 
FROM route a 
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

/* Q7 */
SELECT a.company, a.num FROM route a, route b
WHERE a.company = b.company
AND a.num = b.num
AND (a.stop = 115 AND b.stop = 137)