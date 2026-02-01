# Write your MySQL query statement below
WITH CTE AS(
SELECT machine_id,process_id,MAX(CASE
                                     WHEN activity_type='start' THEN timestamp END)'start_stamp',
                             MAX(CASE
                                    WHEN activity_type='end' THEN timestamp END) AS 'end_stamp'
FROM Activity
GROUP BY machine_id,process_id
)
SELECT machine_id, ROUND(AVG(end_stamp-start_stamp),3) AS processing_time 
FROM CTE
GROUP BY machine_id;

