/*1132. Reportd Posts II */
SELECT ROUND(sum(rate)/COUNT(action_date),2) AS average_daily_percent
FROM (
    SELECT a.action_date
         , IFNULL(COUNT(distinct r.post_id)/COUNT(distinct a.post_id),0) AS rate
    FROM actions a LEFT JOIN removals r
        ON a.post_id = r.post_id
    WHERE a.action= "report" AND a.extra = "spam"
    GROUP BY a.action_date ) temp
;