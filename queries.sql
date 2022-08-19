CREATE TABLE departments(
    dept_no VARCHAR (30) NOT NULL,
    dept_name VARCHAR (30) NOT NULL,
    PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

---------------------------------------

CREATE TABLE titles(
    title_id VARCHAR (30) NOT NULL,
    title VARCHAR (30) NOT NULL,
    PRIMARY KEY (title_id)
);


SELECT * FROM titles; 


------------------------------------



CREATE TABLE employees(
    emp_no INTEGER,
    title_id VARCHAR(30) NOT NULL,
    birth_date VARCHAR(30) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(30) NOT NULL,
    hire_date VARCHAR(30) NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
    
);

SELECT * FROM employees;

-----------------------------

CREATE TABLE department_manager(
    dept_manager_id INTEGER,
    dept_no VARCHAR(30) NOT NULL,
    emp_no INTEGER,
    PRIMARY KEY (dept_manager_id),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
    
    );
    
    SELECT * FROM department_manager;


--------------

CREATE TABLE dept_employee(
    dept_employee_id INTEGER,
    emp_no INTEGER,
    dept_no VARCHAR(30) NOT NULL,
    PRIMARY KEY (dept_employee_id),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);

SELECT * FROM dept_employee;

-------------

CREATE TABLE salaries(
    salary_id INTEGER,
    emp_no INTEGER,
    salary INTEGER,
    PRIMARY KEY (salary_id),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


SELECT * FROM salaries;

--------------

--Question 1 

SELECT a.emp_no, a.last_name, a.first_name, a.sex, b.salary
FROM employees as a 
JOIN salaries as b 
ON (a.emp_no = b.emp_no);

--Question 2

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986' ;

--Question 3

SELECT a.first_name, 
	a.last_name, 
	a.emp_no,
    z.dept_no,
    c.dept_name
FROM department_manager as z
INNER JOIN departments as c ON
z.dept_no = c.dept_no
INNER JOIN employees as a ON
z.emp_no = a.emp_no;

--Question 4

SELECT c.dept_no,
    a.emp_no,
    a.first_name, 
	a.last_name, 
    c.dept_name
FROM employees as a
INNER JOIN department_manager as z ON
a.emp_no = z.emp_no
INNER JOIN departments as c ON
z.dept_no = c.dept_no;


--Question 5

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


--Question 6
SELECT a.emp_no, a.first_name, a.last_name
FROM employees as a 
INNER JOIN dept_employee as b ON
a.emp_no = b.emp_no
WHERE b.dept_no = 'd007';

--Question 7 

SELECT a.emp_no, a.first_name, a.last_name,c.dept_name
FROM employees as a 
INNER JOIN dept_employee as b ON
a.emp_no = b.emp_no
INNER JOIN departments as c ON
b.dept_no = c.dept_no
WHERE b.dept_no IN ('d007','d005');


--Question 8
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name;
