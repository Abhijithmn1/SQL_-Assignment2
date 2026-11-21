CREATE DATABASE employee;
USE employee;

CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(100)
);

select * from departments;

CREATE TABLE location(
	location_id INT,
    location VARCHAR(30)
);

select * from location;

CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10, 2)
);

select * from employees;

-- Table Alteration (ALTER)

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

ALTER TABLE employees
MODIFY COLUMN designation VARCHAR(300);

ALTER TABLE employees 
DROP COLUMN age;

ALTER TABLE employees 
RENAME COLUMN hire_date TO date_of_joining;


select * from employees;

-- Table Renaming (RENAME)

RENAME TABLE departments TO Departments_Info;
RENAME TABLE location TO Locations;

TRUNCATE TABLE employees;

DROP TABLE employees;
DROP DATABASE employee;

DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

select * from location;
select * from departments;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

select * from employees;

-- Assignment 2

SELECT DISTINCT salary
FROM employees;

SELECT 
    age AS Employee_Age, 
    salary AS Employee_Salary 
FROM employees;

SELECT * FROM employees 
	WHERE salary > 50000 
	AND hire_date < '2016-01-01';
    
SELECT * FROM employees 	
    WHERE designation IS NULL;
	UPDATE employees 
		SET designation = 'Data Scientist' 
		WHERE designation IS NULL;
        
SELECT * FROM employees 
ORDER BY department_id ASC, salary DESC;

SELECT * FROM employees 
WHERE YEAR(hire_date) = 2018 
LIMIT 5;

SELECT SUM(e.salary) AS Total_Finance_Salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

SELECT MIN(age) AS Minimum_Age 
FROM employees;

SELECT l.location, MAX(e.salary) AS Max_Salary
FROM employees e
JOIN location l ON e.location_id = l.location_id
GROUP BY l.location;

SELECT designation, AVG(salary) AS Average_Salary
FROM employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

SELECT d.department_name, COUNT(e.employee_id) AS Employee_Count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) < 3;

SELECT l.location, AVG(e.age) AS Average_Female_Age
FROM employees e
JOIN location l ON e.location_id = l.location_id
WHERE e.gender = 'F'
GROUP BY l.location
HAVING AVG(e.age) < 30;


SELECT 
    e.employee_name, 
    e.designation, 
    d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;


SELECT 
    d.department_name, 
    COUNT(e.employee_id) AS Total_Employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;


SELECT 
    l.location, 
    e.employee_name
FROM employees e
RIGHT JOIN location l ON e.location_id = l.location_id;

