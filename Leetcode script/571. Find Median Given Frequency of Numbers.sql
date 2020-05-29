### 571. Find Median Given Frequency of Numbers (hard) ###
#  If a number is a median, it's frequency must be greater or equal than 
# the diff of total frequency of numbers greater or less than itself.

SELECT AVG(number)
FROM (
SELECT number, frequency, 
	    abs((SELECT ifnull(sum(frequency),0)
           FROM numbers 
           WHERE numbers.number < n.number ) - (SELECT ifnull(sum(frequency),0)
          FROM numbers
		  WHERE numbers.number > n.number)) as freq_diff
FROM numbers n ) sub
WHERE freq_diff <= frequency
;
