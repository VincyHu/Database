/*1107. New Users Daily Count*/
SELECT first_login_date AS login_date
      ,COUNT(distinct user_id) AS user_count
FROM
  (SELECT user_id,MIN(activity_date) as first_login_date
  FROM traffic t1
  WHERE activity= "login"
  GROUP BY user_id) summ
WHERE summ.first_login_date BETWEEN DATE_SUB("2019-06-30", INTERVAL 90 DAY) AND "2019-06-30"
GROUP BY login_date
ORDER BY login_date
;