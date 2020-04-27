/*585. Investments in 2016*/
SELECT SUM(TIV_2016) as TIV_2016
FROM (
SELECT PID, TIV_2015,TIV_2016, LAT, LON
FROM insurance i1
WHERE EXISTS (SELECT PID,TIV_2015
              FROM insurance i2
              WHERE i1.PID != i2.PID
              AND i1.TIV_2015 = i2.TIV_2015)
AND NOT EXISTS (SELECT LAT,LON 
                FROM insurance i3
                WHERE i3.LAT = i1.LAT AND i3.LON= i1.LON
                AND i3.PID != i1.PID) ) AS temp
;