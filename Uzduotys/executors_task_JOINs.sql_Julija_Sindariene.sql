-- 1. Add a new column named "FirstName" to the "executors" table and populate it with data.

ALTER TABLE executors ADD COLUMN FirstName VARCHAR(40);
UPDATE executors SET FirstName = 'Jonas'   WHERE executor_id = 1;
UPDATE executors SET FirstName = 'Petras'  WHERE executor_id = 2; 
UPDATE executors SET FirstName = 'Gabija'  WHERE executor_id = 3; 
UPDATE executors SET FirstName = 'Ona'     WHERE executor_id = 4; 
UPDATE executors SET FirstName = 'Antanas' WHERE executor_id = 5; 


-- 2. Retrieve the executors' last names, qualifications, and the roles they hold in projects.
SELECT e.last_name, e.qualification, pe.role
FROM executors e
JOIN project_executions pe
ON e.executor_id = pe.executor_id
ORDER BY e.executor_id;

-- 3. Retrieve the executors' first names and last names along with the name of the project they work on.
SELECT e.FirstName, e.last_name, p.project_name
FROM executors e
JOIN projects p
ON e.executor_id = p.project_id
ORDER BY p.project_name;
 
-- 4. Retrieve the first and last names of executors working on the 'Financial Accounting' project along with the project name.
SELECT e.FirstName, e.last_name
FROM executors e
JOIN projects p
ON e.executor_id = p.project_id
WHERE p.project_name = 'Financial Accounting'
ORDER BY p.project_name;

-- 5. Retrieve all executors from the 'Student Accounting' project who have a qualification of 'Computer Scientist'.
SELECT e.FirstName, e.last_name, e.qualification
FROM executors e
JOIN projects p
ON e.executor_id = p.project_id
WHERE p.project_name = 'Student Accounting'
AND e.qualification = 'Computer Scientist'
ORDER BY e.last_name;

-- 6. Retrieve all female executors with the role of 'Manager' and display their first names, last names, and the project name.
--    (Assumes that gender identification is inferred from naming conventions.)
SELECT e.FirstName, e.last_name, pe.role
FROM executors e
JOIN project_executions pe
ON e.executor_id = pe.executor_id
WHERE pe.role = 'Manager'
AND e.FirstName IN ('Ona', 'Gabija')
ORDER BY e.last_name;

-- 7. Retrieve project names, importance, and the total hours dedicated to each project.
SELECT p.project_name, p.importance, SUM(pe.hours) AS total_hours
FROM project_executions pe
JOIN projects p
ON pe.project_id = p.project_id
GROUP BY p.project_name, p.importance
ORDER BY total_hours DESC;

-- 8. Retrieve project names along with the count of employees working on each project.
SELECT p.project_name, COUNT(pe.executor_id) AS employee_count
FROM project_executions pe
JOIN projects p
ON pe.project_id = p.project_id
GROUP BY p.project_name
ORDER BY employee_count DESC;

-- 9. Limit the results from query #8 to include only projects with no more than 3 employees.
SELECT p.project_name, COUNT(pe.executor_id) AS employee_count
FROM project_executions pe
JOIN projects p
ON pe.project_id = p.project_id
GROUP BY p.project_name
HAVING COUNT(pe.executor_id) <= 3
ORDER BY employee_count DESC;

-- 10. Retrieve executors' first and last names along with the names of the projects they work on, excluding those who hold a 'Manager' role.
SELECT e.FirstName, e.last_name, p.project_name
FROM project_executions pe
JOIN executors e
ON pe.executor_id = e.executor_id
JOIN projects p
ON pe.project_id = p.project_id
WHERE pe.role <> 'Manager'
ORDER BY e.last_name;

-- 11. Create a new record in the "executors" table with:
--     executor_id: 6, FirstName: 'Pranas', last_name: 'Logis', qualification: NULL, category: NULL, and education: NULL.
INSERT INTO executors ( executor_id, Firstname, last_name, qualification, category, education )
VALUES ( 6, 'Pranas', 'Logis', NULL, NULL, NULL);

-- 12. Retrieve executors' first names and last names along with project names, including those executors who are not associated with any project.
SELECT e.FirstName, e.last_name, p.project_name
FROM executors e
LEFT JOIN project_executions pe
ON e.executor_id = pe.executor_id
LEFT JOIN projects p
ON pe.project_id = p.project_id
ORDER BY e.last_name;

-- 13. Retrieve executors' first names, last names, and project names for those with roles 'Programmer' or 'Analyst', who have logged at least 250 hours,
--     and where the project's duration is at least 10 weeks.
SELECT e.FirstName, e.last_name, p.project_name
FROM project_executions pe
JOIN executors e
ON pe.executor_id = e.executor_id
JOIN projects p
ON pe.project_id = p.project_id
WHERE pe.role IN ('Programmer', 'Analyst')
AND pe.hours >= 250
AND p.duration >= 10
ORDER BY e.last_name;
