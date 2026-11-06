-- Exercise 1: Employees and Department Budgets
-- Goal: Display each employee's name, department, salary, and the budget of the corresponding department.
SELECT 
    e.name AS employee_name,
    e.department,
    e.salary,
    d.budget AS department_budget
FROM employees e
JOIN departments d ON e.department = d.name;


-- Exercise 2: Employees and Their Managers
-- Goal: Display each employee's name and their manager's name using a self-join.
SELECT 
    e.name AS employee_name,
    m.name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;


-- Exercise 3: Employee Count by Department
-- Goal: Find the number of employees in each department, sorted from highest to lowest.
SELECT 
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC;


-- Exercise 4: Average Salary by Department
-- Goal: Calculate the average salary for each department rounded to two decimal places, sorted descending.
SELECT 
    department,
    ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC;


-- Exercise 5: Salary Summary by Department
-- Goal: Produce a salary summary (min, max, total salary, and employee count) for each department.
SELECT 
    department,
    COUNT(*) AS employee_count,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department;


-- Exercise 6: Departments with More Than Two Employees
-- Goal: Identify departments with more than two employees using HAVING, sorted descending.
SELECT 
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 2
ORDER BY employee_count DESC;


-- Exercise 7: Department Budget and Salary Comparison
-- Goal: Compare each department's budget with its total employee salary and calculate the difference.
SELECT 
    d.name AS department_name,
    d.budget,
    SUM(e.salary) AS total_salary,
    (d.budget - SUM(e.salary)) AS budget_difference
FROM departments d
JOIN employees e ON d.name = e.department
GROUP BY d.name, d.budget;

