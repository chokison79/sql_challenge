--creating tables--
create table departments(
	dept_no  varchar Primary Key not null,
	dept_name varchar(30)
	);
	

select *
from departments;

create table dept_emp(
	emp_no varchar Primary Key,
	dept_no varchar );
	
select *
from dept_emp;

create table dept_manager(
	emp_no varchar,
	dept_no varchar );

select *
from dept_manager;

create table employees(
	emp_no varchar Primary Key,
	emp_title varchar,
	birth_date varchar,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date varchar);
	
select * 
from employees;

create table salaries (
	emp_no Varchar Primary key,
	salary varchar);
	
select *
from salaries;

create table titles(
	title_id varchar Primary Key,
	title varchar );
	
select *
from titles;

--Question 1-- Join employees with salaries--

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
Inner join salaries ON
employees.emp_no = salaries.emp_no;


--Question 2--

select first_name, Last_name, hire_date
from employees
where hire_date like '%1986';

--Question 3--

SELECT dept_manager.dept_no, dept_manager.emp_no, departments.dept_name, employees.first_name, employees.last_name
FROM employees
INNER JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
Inner join departments on
dept_manager.dept_no= departments.dept_no;

--Question 4-- Join departments and employees

Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from departments
Inner join employees ON
departments.dept_no = employees.emp_no;

--Question 5--
select last_name, first_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%' 

--Question 6--

Select  employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from departments
Inner join employees on
employees.emp_no = departments.dept_no
where dept_name = Sales;

--Question 7 --

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
Inner join departments on
employees.emp_no = departments.dept_no
where dept_name like Sales and Development;

--Question 8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name. --

SELECT COUNT(last_name)
FROM employees;

-- Create an alias
SELECT COUNT (last_name) AS "Lastnames"
FROM employees;

SELECT  COUNT (last_name) AS "Lastnames"
FROM employees
GROUP BY last_name
ORDER BY "lastnames" DESC;


