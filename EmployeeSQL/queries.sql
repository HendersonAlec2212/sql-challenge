CREATE TABLE "departments" (
    "dept_no" VARCHAR(100)   NOT NULL,
    "dept_name" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(100)   NOT NULL,
	"emp_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "emp_data" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title" VARCHAR(100)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "gender" VARCHAR(100)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_emp_data" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(100)   NOT NULL,
    "title" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "emp_data" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "emp_data" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "emp_data" ADD CONSTRAINT "fk_emp_data_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "emp_data" ("emp_no");
-- SQL Order of Execution:
--  FROM | WHERE | GROUP BY | HAVING | SELECT | ORDER BY | LIMIT

-- Q1) List the following details of each employee: employee number, last name, first name, sex, and salary.

--left join the employee_data table with salary, JOIN SYNTAX: SELECT | FROM | (type)JOIN| ON
-- select all data desired in Q1 first, then perform join, keep note of PKs & FKs
-- B/C FROM executes first aliases can be used "before" other functions/clauses

SELECT emp.emp_no
	,emp.last_name
	,emp.first_name
	,emp.gender
	,sal.salary
FROM emp_data as emp
	LEFT JOIN salaries as sal
	ON (emp.emp_no=sal.emp_no);
select * FROM emp_data

-- List first name, last name, and hire date for employees who were hired in 1986.
-- conditional query = WHERE clause in addition to exclusionary parameters
SELECT first_name
		,last_name
		,hire_date
FROM emp_data as emp
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

-- consider info needed from which tables -> follow join syntax -> use joins to include only info about managers e.g. inner join the tables needed to the dept_manager table
-- dept_manager as dm
-- emp_data as emp
-- departments as dept

SELECT dm.dept_no
	,dept.dept_name
	,emp.emp_no
	,emp.last_name
	,emp.first_name
FROM dept_manager as dm
	INNER JOIN emp_data as emp
	ON (dm.emp_no=emp.emp_no)
	INNER JOIN departments as dept
	ON (dept.dept_no=dm.dept_no);


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
-- emp_data as emp
-- dept_emp as de
-- departments as d

SELECT de.emp_no
	,emp.last_name
	,emp.first_name
	,d.dept_name
FROM dept_emp as de
	INNER JOIN emp_data as emp
	ON (de.emp_no=emp.emp_no)
	INNER JOIN departments as d
	ON (de.dept_no=d.dept_no);


-- List first name, last name, and gender for employees whose first name is "Hercules" and last names begin with "B."
-- use wild card in conditonal clause | 'letter%' -> A substitute for zero or more characters 
-- NOTE: letter comes before %
SELECT first_name
	,last_name
	,gender
FROM emp_data
	WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';



-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT	emp.emp_no
	,emp.first_name
	,emp.last_name
	,d.dept_name
FROM emp_data as emp
	INNER JOIN dept_emp as de
	ON (emp.emp_no=de.emp_no)
	INNER JOIN departments as d
	ON (de.dept_no=d.dept_no)
WHERE d.dept_name='Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- https://www.w3schools.com/sql/sql_in.asp
SELECT	emp.emp_no
	,emp.first_name
	,emp.last_name
	,d.dept_name
FROM emp_data as emp
	INNER JOIN dept_emp as de
	ON (emp.emp_no=de.emp_no)
	INNER JOIN departments as d
	ON (de.dept_no=d.dept_no)
WHERE d.dept_name IN ('Sales','Development');
-- Alternatively --
SELECT	emp.emp_no
	,emp.first_name
	,emp.last_name
	,d.dept_name
FROM emp_data as emp
	INNER JOIN dept_emp as de
	ON (emp.emp_no=de.emp_no)
	INNER JOIN departments as d
	ON (de.dept_no=d.dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- follow Group by syntax: 
-- SELECT column_name(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column_name(s)
-- ORDER BY column_name(s);


Select count(last_name)as emp_w_this_name, last_name as Last_Name
FROM emp_data
GROUP BY last_name
ORDER BY last_name DESC;




