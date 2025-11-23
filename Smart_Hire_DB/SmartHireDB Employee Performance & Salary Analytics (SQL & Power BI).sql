use SmartHireDB1;

CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(200));

CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(150),
  department_id INT,
  role VARCHAR(100),
  location VARCHAR(100),
  gender VARCHAR(20),
  education VARCHAR(50),
  hire_date DATE,
  current_status VARCHAR(50),
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);66677saww33

CREATE TABLE performance (
  record_id INT PRIMARY KEY,
  emp_id INT,
  review_date DATE,performance
  Rating DECIMAL(2,1),
  salary INT,
  bonus_pct DECIMAL(5,3),
  promotion_flag TINYINT,
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

select * from departments;
select * from employees;
select * from performance;

describe employees;
describe performance;
describe departments;

#Data Cleaning 
-- Employees with missing info
SELECT * FROM employees 
WHERE emp_name IS NULL OR department_id IS NULL OR role IS NULL;

-- Performance missing salary or rating
SELECT * FROM performance 
WHERE salary IS NULL OR rating IS NULL;

-- Duplicate employees
SELECT emp_name, COUNT(*) 
FROM employees 
GROUP BY emp_name 
HAVING COUNT(*) > 1;

-- Identify invalid gender values
SELECT DISTINCT gender 
FROM employees
WHERE gender NOT IN ('Male','Female','Other');

-- Check invalid dates (future hire dates)
SELECT *
FROM employees
WHERE hire_date > CURDATE();

-- Salary Ranges
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary, AVG(salary) AS avg_salary
FROM performance;

#Exploratory Data Analysis
-- How many employees per department
SELECT d.department_name, COUNT(e.emp_id) AS num_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY num_employees DESC;

-- Averagw Salary by department 
SELECT d.department_name, ROUND(AVG(p.salary),0) AS avg_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN performance p ON e.emp_id = p.emp_id
GROUP BY d.department_name
ORDER BY avg_salary, d.department_name desc;

-- Average Rating by role 
SELECT role, ROUND(AVG(rating),2) AS avg_rating, COUNT(*) AS total_reviews
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id
GROUP BY role
ORDER BY avg_rating DESC;

-- Salary growth of employees (difference between min & max salary)
SELECT e.emp_name,
       MIN(p.salary) AS start_salary,
       MAX(p.salary) AS current_salary,
       (MAX(p.salary) - MIN(p.salary)) AS salary_growth
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id
GROUP BY e.emp_id, e.emp_name
ORDER BY salary_growth DESC
LIMIT 20;

# Promotion rate
SELECT ROUND(100 * SUM(promotion_flag) / COUNT(*), 2) AS promotion_rate
FROM performance;

-- High performers (rating >= 4.5)
SELECT e.emp_name, e.role, p.rating, p.salary
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id
WHERE p.rating >= 4.5
ORDER BY p.rating DESC, p.salary DESC
LIMIT 20;

-- Low performers (rating < 3.0)
SELECT e.emp_name, e.role, p.rating, p.salary
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id
WHERE p.rating < 3.0
ORDER BY p.rating ASC
LIMIT 20;

-- Gender-based pay comparison
SELECT gender, ROUND(AVG(p.salary),0) AS avg_salary, COUNT(*) AS count_employees
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id
GROUP BY gender;


-- Location-based performance
SELECT location, ROUND(AVG(p.rating),2) AS avg_rating, ROUND(AVG(p.salary),0) AS avg_salary
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id
GROUP BY location
ORDER BY avg_rating DESC;



-- Identify departments with highest attrition (employees who left)
SELECT d.department_name, COUNT(*) AS exits
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.current_status = 'Exited'
GROUP BY d.department_name
ORDER BY exits DESC;

-- Resigned Employees
select *from employees
where current_status = "Resigned";

-- Find roles that need urgent hiring (low staffing)
SELECT role, COUNT(*) AS total_staff
FROM employees
GROUP BY role
ORDER BY total_staff ASC
LIMIT 10;

-- Departments with highest bonus payouts
SELECT d.department_name, 
       ROUND(SUM(p.salary * p.bonus_pct), 0) AS total_bonus
FROM performance p
JOIN employees e ON p.emp_id = e.emp_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_bonus DESC;

-- Employees eligible for promotion (rating > 4 AND no promotion yet)
SELECT e.emp_id, e.emp_name, e.role, p.rating
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id
WHERE p.rating >= 4.0 AND p.promotion_flag = 0
ORDER BY p.rating DESC;

CREATE OR REPLACE VIEW employee_summary AS
SELECT e.emp_id, e.emp_name, e.role, e.location, d.department_name,
       p.rating, p.salary, p.bonus_pct, p.promotion_flag
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN performance p ON e.emp_id = p.emp_id;

select *from employee_summary;





