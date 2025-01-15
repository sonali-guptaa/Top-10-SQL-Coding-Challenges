-- Top 10 SQL coding questions along with a brief description of the problem it aims to solve and their corresponding SQL queries. 

create database main_task5;
use main_task5;

-- Creating a table to perform coding questions on
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    salary DECIMAL(10, 2),
    department_id INT,
    dob DATE
);

-- Insert Sample Data into the employees Table
INSERT INTO employees (employee_id, name, gender, salary, department_id, dob)
VALUES
(1, 'Alice', 'F', 15000, 101, '1985-05-15'),
(2, 'Bob', 'M', 20000, 102, '1975-10-20'),
(3, 'Charlie', 'M', 12000, 101, '1968-02-25'),
(4, 'Diana', 'F', 25000, 103, '1990-08-30'),
(5, 'Eve', 'F', 8000, 101, '1970-11-11'),
(6, 'Joe', 'M', 9500, 102, '1963-07-14'),
(7, 'Mia', 'F', 10500, 104, '1981-12-19'),
(8, 'Milo', 'M', 30000, 103, '1965-06-23'),
(9, 'Martin', 'M', 9000, 102, '1972-03-05'),
(10, 'Monica', 'F', 17000, 104, '1978-04-09');

-- 1. SQL Query to Find the Second Highest Salary of an Employee
-- This query finds the second highest salary in the employee table.
SELECT MAX(salary) AS SecondHighestSalary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- 2. SQL Query to Find Max Salary from Each Department
-- This query retrieves the highest salary for each department in the organization.
SELECT department_id, MAX(salary) AS MaxSalary
FROM employees
GROUP BY department_id;

-- 3. Write SQL Query to Display the Current Date
-- This query returns the current date of the system.
SELECT CURRENT_DATE AS CurrentDate;

-- 4. Write an SQL Query to Check Whether the Date Passed to Query is the Date of the Given Format or Not
-- This query checks if the provided date matches a specific format.
SELECT 
    CASE
        WHEN '2025-01-15' LIKE '____-__-__' THEN 'Valid Date Format'
        ELSE 'Invalid Date Format'
    END AS DateValidation;
    
-- 5. Write an SQL Query to Print the Name of the Distinct Employee Whose DOB is Between 01/01/1960 to 31/12/1975
-- This query retrieves the names of employees born between 1960 and 1975.
SELECT DISTINCT name
FROM employees
WHERE dob BETWEEN '1960-01-01' AND '1975-12-31';

-- 6. Write an SQL Query to Find the Number of Employees According to Gender Whose DOB is Between 01/01/1960 to 31/12/1975
-- This query finds the count of employees based on gender whose date of birth falls between 1960 and 1975.
SELECT gender, COUNT(*) AS EmployeeCount
FROM employees
WHERE dob BETWEEN '1960-01-01' AND '1975-12-31'
GROUP BY gender;

-- 7. Write an SQL Query to Find an Employee Whose Salary is Equal to or Greater Than 10000
-- This query finds employees whose salary is 10000 or more.
SELECT name, salary
FROM employees
WHERE salary >= 10000;

-- 8. Write an SQL Query to Find the Name of an Employee Whose Name Starts with 'M'
-- This query retrieves the names of employees whose names begin with the letter 'M'.
SELECT name
FROM employees
WHERE name LIKE 'M%';

-- 9. Find All Employee Records Containing the Word "Joe", Regardless of Whether it Was Stored as JOE, Joe, or joe
-- This query retrieves employee records where the name contains "Joe" regardless of case sensitivity.
SELECT *
FROM employees
WHERE name LIKE '%joe%' COLLATE utf8mb4_general_ci;


-- 10. Write an SQL Query to Find the Year from a Date
-- This query extracts the year from a date column.
SELECT EXTRACT(YEAR FROM dob) AS YearOfBirth
FROM employees;






