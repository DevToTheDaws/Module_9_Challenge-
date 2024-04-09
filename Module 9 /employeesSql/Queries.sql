-- QUESTION 1: List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees AS employees
JOIN salaries AS salaries
ON salaries.emp_no = employees.emp_no;

-- QUESTION 2: List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- QUESTION 3: List the manager of each department along with their department number, department name,

SELECT employees.emp_no AS "Employee Number",
	employees.first_name || ' ' || employees.last_name AS "Manager Name",
	departments.dept_name AS "Deparment Name",
	departments.dept_no AS "Department Number"
FROM employees as employees
JOIN dept_manager
ON dept_manager.emp_no = employees.emp_no
	JOIN departments AS departments
	ON departments.dept_no = dept_manager.dept_no;
	
-- QUESTION 4: List the department number for each employee along with that employee’s employee number, last name,
-- first name, and department name.
-- make VIEW called 'employee_department'
CREATE VIEW employee_department AS
SELECT employees.emp_no AS "Employee Number",
	employees.first_name AS "Employee First Name",
	employees.last_name AS "Employee Last Name",
	departments.dept_no AS "Department Number",
	departments.dept_name AS "Department Name"
FROM employees AS employees
JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
	JOIN departments
	ON departments.dept_no = dept_emp.dept_no;

-- Running the query for all employees from View
SELECT * FROM employee_department;

SELECT "Employee Number", COUNT(*) AS "Number of departments working for"
FROM employee_department
GROUP BY "Employee Number"
HAVING COUNT(*) > 1
ORDER BY "Number of departments working for" DESC;

-- QUESTION 5:

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- QUESTION 6: List each employee in the Sales department
SELECT *
FROM employee_department
WHERE "Department Name" = 'Sales';

-- QUESTION 7: Development department has the number 'd005'

SELECT *
FROM employee_department
WHERE "Department Number" = 'd007' OR "Department Number" = 'd005'; 

-- QUESTION 8:

SELECT last_name AS "Surname", COUNT(last_name) AS "Number of Staff with the same Surname"
FROM employees
GROUP BY last_name
ORDER BY "Number of Staff with the same Surname" DESC;