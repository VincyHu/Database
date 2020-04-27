/*178. Rank Scores*/
# Solution 1 - Window Function
SELECT score
      ,dense_rank() OVER(
      ORDER BY score DESC
      RANGE BETWEEN unbounded preceding AND unbounded following
      ) AS `Rank`
FROM Scores
;

# Solution 2 - Set variables
set @curr = 0, @prv = 0;

SELECT score,
      @curr :=  @curr + (@prv <> (@prv := Score)) AS `Rank`
FROM scores
ORDER BY Score desc
;

# Solution 3 - subquery
SELECT s1.score
     , (select count(distinct s2.score) from scores s2 where s2.score >= s1.score) as `rank`
FROM scores s1
ORDER BY s1.score desc
;