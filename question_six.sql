--	6. 
--	Find the player who had the most success stealing bases in 2016, 
--		where __success__ is measured as the percentage of stolen base attempts which are successful. 
--		(A stolen base attempt results either in a stolen base or being caught stealing.) 
--	Consider only players who attempted _at least_ 20 stolen bases.

SELECT 
	p.namefirst,
	p.namelast,
	--sb+cs AS steal_attempts,
	--sb AS stolen_bases,
	--cs AS caught_stealing,
	ROUND (((sb::numeric/(sb::numeric+cs::numeric))*100), 2) AS success_rate
FROM Batting AS b LEFT JOIN people AS p
ON b.playerid = p.playerid
WHERE yearid = '2016'
AND (sb+cs) > 19
ORDER BY success_rate DESC;