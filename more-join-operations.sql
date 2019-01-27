/* Q1 */
SELECT id, title FROM movie
WHERE yr = 1962

/* Q2 */
SELECT yr FROM movie
WHERE title = 'Citizen Kane'

/* Q3 */
SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

/* Q4 */
SELECT id FROM actor
WHERE name = 'Glenn Close'

/* Q5 */
SELECT id FROM movie
WHERE title = 'Casablanca'

/* Q6 */
SELECT name FROM casting
JOIN actor ON (casting.actorid = actor.id)
JOIN movie ON (casting.movieid = movie.id)
WHERE casting.movieid = 11768

/* Q7 */
SELECT name FROM casting
JOIN actor ON (casting.actorid = actor.id)
JOIN movie ON (casting.movieid = movie.id)
WHERE movie.title = 'Alien'

/* Q8 */
SELECT title FROM casting
JOIN actor ON (casting.actorid = actor.id)
JOIN movie ON (casting.movieid = movie.id)
WHERE name = 'Harrison Ford'

/* Q9 */
SELECT title FROM casting
JOIN actor ON (casting.actorid = actor.id)
JOIN movie ON (casting.movieid = movie.id)
WHERE name = 'Harrison Ford' AND ord > 1

/* Q10 */
SELECT title, name FROM casting
JOIN actor ON (casting.actorid = actor.id)
JOIN movie ON (casting.movieid = movie.id)
WHERE yr = 1962 AND ord = 1

/* Q11 */
SELECT yr, COUNT(title) FROM casting
JOIN actor ON (casting.actorid = actor.id)
JOIN movie ON (casting.movieid = movie.id)
WHERE name = 'John Travolta'
GROUP BY yr
HAVING COUNT(title) > 2

/* Q12 */
SELECT title, name FROM casting
JOIN actor ON (casting.actorid = actor.id)
JOIN movie ON (casting.movieid = movie.id)
WHERE movieid IN (SELECT movieid FROM casting
                    JOIN actor ON casting.actorid = actor.id
                    WHERE name = 'Julie Andrews')
AND ord = 1

/* Q13 */
SELECT name FROM casting
JOIN actor ON (casting.actorid = actor.id)
WHERE ord = 1 
GROUP BY name
HAVING COUNT(ord) >= 30

/* Q14 */
SELECT title, COUNT(actorid) FROM movie
JOIN casting ON (id = movieid)
WHERE yr = 1978
GROUP BY title 
ORDER BY COUNT(actorid) DESC, title

/* Q15 */
SELECT name FROM actor
JOIN casting ON (id = actorid)
WHERE movieid IN (SELECT movieid FROM casting
                    JOIN actor ON casting.actorid = actor.id
                    WHERE name = 'Art Garfunkel')
AND name != 'Art Garfunkel'
