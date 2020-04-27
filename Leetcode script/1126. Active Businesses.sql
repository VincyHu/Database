/*1126. Active Businesses*/

WITH sub As
(SELECT e1.business_id 
      , e1.event_type
 FROM events e1
 WHERE e1.occurences > (SELECT AVG(occurences)
                        FROM events e2
                        WHERE e2.event_type = e1.event_type
                        GROUP BY e2.event_type))
SELECT business_id
FROM sub
GROUP BY business_id
HAVING COUNT(event_type)>1
;