--Create departments table
CREATE TABLE departments (
	dept_no VARCHAR(10),
	dept_name VARCHAR(50),
	PRIMARY KEY(dept_no)
);

--Create Department-Employee table
CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(10),
	PRIMARY KEY(emp_no, dept_no)
);

--Create Department-Manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(10),
	emp_no INTEGER NOT NULL,
	PRIMARY KEY(dept_no, emp_no)
);

--Create Employees table
CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(10),
	birth_date DATE NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	sex CHAR(1),
	hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no)
);

--Create Salaries table
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY(emp_no)
);

--Create Titles table
CREATE TABLE titles (
	title_id VARCHAR(10),
	title VARCHAR(50),
	PRIMARY KEY(title_id)
);

--Add Foreign Keys now that all Tables have been created
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES salaries (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES salaries (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

--Import data to Tables from data folder










