/* 1149. Article Views II */
SELECT distinct viewer_id as id
FROM views
GROUP BY view_date, viewer_id
HAVING count(distinct article_id)>1
ORDER BY viewer_id
; 