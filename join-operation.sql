/* Q1 */
SELECT matchid, player FROM goal 
WHERE teamid = 'GER'

/* Q2 */ 
SELECT id,stadium,team1,team2 FROM game
WHERE id = 1012

/* Q3 */
SELECT player, teamid, stadium, mdate FROM game 
JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

/* Q4 */
SELECT team1, team2, player FROM game 
JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

/* Q5 */
SELECT player, teamid, coach, gtime FROM goal
JOIN eteam ON (goal.teamid = eteam.id)
WHERE gtime <= 10

/* Q6 */
SELECT mdate, teamname FROM game JOIN eteam
ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos'

/* Q7 */
SELECT player FROM goal JOIN game
ON (goal.matchid = game.id)
WHERE stadium = 'National Stadium, Warsaw'

/* Q8 */
SELECT DISTINCT player FROM goal JOIN game
ON (goal.matchid = game.id)
WHERE (team1 = 'GER' OR team2 = 'GER')
AND teamid != 'GER'

/* Q9 */
SELECT teamname, COUNT(gtime) FROM goal JOIN eteam
ON (teamid = id)
GROUP BY teamname

/* Q10 */
SELECT stadium, COUNT(gtime) FROM game JOIN goal
ON id = matchid
GROUP BY stadium

/* Q11 */
SELECT matchid, mdate, COUNT(gtime) FROM game JOIN goal
ON id = matchid
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid, mdate 

/* Q12 */
SELECT matchid, mdate, COUNT(gtime) FROM game JOIN goal
ON id = matchid
WHERE teamid = 'GER'
GROUP BY matchid, mdate

/* Q13 */
SELECT mdate, 
        team1, SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
        team2, SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2
