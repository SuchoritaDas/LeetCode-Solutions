# Write your MySQL query statement below
SELECT p.project_id,ROUND(AVG(e.experience_years),2) AS average_years
FROM Project p JOIN Employee e
ON p.employee_id=e.employee_id
WHERE experience_years IS NOT NULL
GROUP BY p.project_id
ORDER BY p.project_id;