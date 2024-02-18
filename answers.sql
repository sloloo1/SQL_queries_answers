-- 1
SELECT e_name
FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);

-- 2
WITH RECURSIVE ManagerChain (employee_id, level) AS (
  SELECT id, 0 AS level
  FROM Employee
  WHERE chief_id IS NULL
  UNION ALL
  SELECT e.id, c.level + 1
  FROM Employee e
  INNER JOIN ManagerChain c ON e.chief_id = c.employee_id
)
SELECT MAX(level) AS max_depth
FROM ManagerChain;

-- 3
SELECT d.d_name AS department_name, SUM(e.salary) AS total_salary
FROM Employee e
INNER JOIN Department d ON e.department_id = d.id
GROUP BY d.id, d.d_name
ORDER BY total_salary DESC
LIMIT 1;

-- 4
SELECT *
FROM Employee
WHERE e_name LIKE 'Р%н';