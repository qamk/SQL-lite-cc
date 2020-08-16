--Getting used to the table
/*SELECT * FROM stream
LIMIT 20;

SELECT * FROM chat
LIMIT 20;
*/

--Games and channels in stream
--SELECT DISTINCT game FROM stream;
--SELECT DISTINCT channel FROM stream;

--Most popular games in stream
/*
SELECT game,
COUNT(*) AS '# of viewers' 
FROM stream
GROUP BY game;
*/

--# Viewers for LoL by country
/*
SELECT country, COUNT(*) FROM stream
WHERE game = "League of Legends"
GROUP BY country
ORDER BY 2 DESC;
*/

--# Users by player
/*
SELECT player, 
COUNT(*) AS '# of users'
FROM stream
GROUP BY player
ORDER BY 2 DESC;
*/

--Genre of each game
/*
SELECT game,
CASE 
  WHEN (game = 'League of Legends') 
      OR (game = 'Dota 2') 
      OR (game = 'Heroes of the Strom')
  THEN 'MOBA'
  WHEN game = 'Counter-Strike: Global Offensive'
  THEN 'FPS'
  WHEN 
  (game = 'DayZ') OR (game LIKE '% Survival Evolved')
  THEN 'Survival'
  ELSE 'Other'
 END AS 'genre'
FROM stream
GROUP BY game
ORDER BY 1;
*/

-- Number of viewers by the hour
SELECT strftime('%H',time) AS 'Hour',
COUNT(*) AS '# viewers'
FROM stream 
WHERE country='GB'
GROUP BY 1
LIMIT 20;

SELECT s.game, 
COUNT(s.device_id) AS '# stream and chat'
FROM stream AS 's'
JOIN chat AS 'c'
ON s.device_id = c.device_id
GROUP BY 1
ORDER BY 2 DESC;


