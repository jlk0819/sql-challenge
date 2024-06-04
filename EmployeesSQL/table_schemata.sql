DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Dept_emp;
DROP TABLE IF EXISTS Dept_manager;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Titles;

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(255)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(255)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_manager" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "Dept_emp" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "emp_no" INT   NOT NULL
);

--ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
--REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

--ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no" FOREIGN KEY("dept_no")
-- "Departments" ("dept_no");

--ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
--REFERENCES "Employees" ("emp_no");

-- TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
--REFERENCES "Departments" ("dept_no");

--ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
-- "Employees" ("emp_no");



--1 - List the employee number, last name, first name, sex, and salary of each employee.

select  e.emp_no, e.last_name, e.first_name, e.sex, s.salary from "Salaries" s
left join "Employees" e on
s.emp_no  = e.emp_no 
;

--2 -List the first name, last name, and hire date for the employees who were hired in 1986

select e.first_name , e.last_name, e.hire_date from "Employees" e 
--where year(e.hire_date) = 1986;
where e.hire_date between '1986-01-01' and '1986-12-31';


 --3- List the manager of each department along with their department number, department name, employee number, last name, and first name 

select  dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name from "Dept_manager" dm
left join "Employees" e on 
dm.emp_no = e.emp_no 
left join "Departments" d on
dm.dept_no = d.dept_no
;

--4 - List the department number for each employee along with that employee’s employee number, last name, first name, and department name

select  dm.dept_no, dm.emp_no, e.last_name, e.first_name, d.dept_name from "Dept_manager" dm
left join "Employees" e on 
dm.emp_no = e.emp_no 
left join "Departments" d on
dm.dept_no = d.dept_no
;

--5 - List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select  e.first_name, e.last_name, e.sex 
from "Employees" e
where e.first_name = 'Hercules' and e.last_name  like '%B%'

;

--6 - List each employee in the Sales department, including their employee number, last name, and first name.

select  e.emp_no, e.last_name, e.first_name from "Departments" d
left join "Dept_manager" dm on 
dm.dept_no = d.dept_no 
left join "Employees" e on
dm.emp_no  = e.emp_no
where d.dept_name = 'Sales'
;

--7 - List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select  e.emp_no, e.last_name, e.first_name, d.dept_name from "Departments" d
left join "Dept_manager" dm on 
dm.dept_no = d.dept_no 
left join "Employees" e on
dm.emp_no  = e.emp_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
;

--8 - List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select e.last_name, count(*)
 From   "Employees" e 
 Group By e.last_name
 ORDER BY "last_name"  DESC
 ;

