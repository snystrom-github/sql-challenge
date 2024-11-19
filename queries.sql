--List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY salaries.salary ASC;


--List the first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date ASC;


--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT departments.dept_name, departments.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments on dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
ORDER BY departments.dept_name;


--List the department number for each employee along with that employee's employee number, last name, first name, and department name
SELECT departments.dept_name, departments.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name 
FROM dept_emp 
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
ORDER BY departments.dept_name;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'
ORDER BY employees.last_name ASC;


--List each employee in the Sales department, including their employee number, last name, and first name
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales'
ORDER BY departments.dept_name;


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name 
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY departments.dept_name;


--List the frequency counts, in decending order, of all the employee last names (that is, how many employees sahre each last name)
SELECT employees.last_name, COUNT(*) AS frequency
FROM employees
GROUP BY employees.last_name
ORDER BY frequency DESC;

