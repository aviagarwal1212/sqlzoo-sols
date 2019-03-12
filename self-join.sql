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
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'London Road'

/* Q7 */
SELECT a.company, a.num FROM route a, route b
WHERE a.company = b.company
AND a.num = b.num
AND (a.stop = 115 AND b.stop = 137)

/* Q8 */
SELECT DISTINCT a.company, a.num
FROM route x
JOIN route y ON (x.num = y.num AND x.company= y.company)
JOIN stops stopa ON (x.stop=stopa.id)
JOIN stops stopb ON (y.stop=stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'

/* Q9 */
SELECT stopa.name, a.company, a.num
FROM route a
  JOIN route b ON (a.num=b.num AND a.company=b.company)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopb.name = 'Craiglockhart'


/* Q10 */
SELECT DISTINCT a.num, a.company, stopb.name ,  c.num,  c.company
FROM route a 
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN ( route c 
        JOIN route d 
        ON (c.company = d.company AND c.num= d.num))
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
JOIN stops stopc ON (c.stop = stopc.id)
JOIN stops stopd ON (d.stop = stopd.id)
WHERE  stopa.name = 'Craiglockhart'
        AND stopd.name = 'Sighthill'
        AND stopb.name = stopc.name
ORDER BY LENGTH(a.num), b.num, stopb.id, LENGTH(c.num), d.num
