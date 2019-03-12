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
SELECT stopa.name, routea.company, routea.num
FROM route routea
  JOIN route routeb ON (routea.num=routeb.num AND routea.company=routeb.company)
  JOIN stops stopa ON (routea.stop=stopa.id)
  JOIN stops stopb ON (routeb.stop=stopb.id)
WHERE stopb.name = 'Craiglockhart'


/* Q10 */
SELECT DISTINCT routea.num, routea.company, stopb.name ,  routec.num,  routec.company
FROM route routea 
JOIN route routeb ON (routea.company = routeb.company AND routea.num = routeb.num)
JOIN ( route routec 
        JOIN route routed 
        ON (routec.company = routed.company AND routec.num= routed.num))
JOIN stops stopa ON (routea.stop = stopa.id)
JOIN stops stopb ON (routeb.stop = stopb.id)
JOIN stops stopc ON (routec.stop = stopc.id)
JOIN stops stopd ON (routed.stop = stopd.id)
WHERE  stopa.name = 'Craiglockhart'
        AND stopd.name = 'Lochend'
        AND stopb.name = stopc.name
ORDER BY LENGTH(routea.num), routeb.num, stopb.id, LENGTH(routec.num), routed.num
