-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp_no, last_name, first_name, sex, (
SELECT salary
FROM salaries S
WHERE S.emp_no = E.emp_no)
FROM employees E;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

-- 3. List the manager of each department along with their department number,
-- department name, employee number, last name, and first name.
SELECT DM.dept_no, DM.emp_no, D.dept_name, E.emp_no, E.last_name, E.first_name
FROM dept_manager DM
inner join departments D ON D.dept_no = DM.dept_no
inner join employees E ON E.emp_no = DM.emp_no

-- 4. List the department number for each employee along with that employee’s
-- employee number, last name, first name, and department name.
SELECT DE.dept_no, DE.emp_no, E.last_name, E.first_name, D.dept_name
FROM dept_emp DE
INNER JOIN employees E ON DE.emp_no = E.emp_no
INNER JOIN departments D ON DE.dept_no = D.dept_no

-- 5. List first name, last name, and sex of each employee whose first name
-- is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
OR last_name LIKE 'b%'

-- 6. List each employee in the Sales department, including their employee number,
-- last name, and first name.
SELECT DE.emp_no, E.last_name, E.first_name
FROM dept_emp DE
INNER JOIN employees E ON DE.emp_no = E.emp_no
INNER JOIN departments D ON D.dept_no = DE.dept_no
WHERE D.dept_name = 'Sales'

-- 7. List each employee in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT DE.emp_no, E.last_name, E.first_name, D.dept_name
FROM dept_emp DE
INNER JOIN employees E ON DE.emp_no = E.emp_no
INNER JOIN departments D ON D.dept_no = DE.dept_no
WHERE D.dept_name = 'Sales'
OR D.dept_name = 'Development'

-- 8. List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name).

SELECT DISTINCT(last_name) , COUNT(last_name) as Count
FROM employees
GROUP BY last_name
ORDER BY Count DESC
