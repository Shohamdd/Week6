SELECT first_name as "First Name", last_name as "Last Name" from employees
 SELECT distinct department_id , first_name from employees order by first_name desc
SELECT first_name, last_name, salary, (salary*0.15) as PF from employees
select * from employees

SELECT employee_id,first_name, last_name, salary from employees order by salary
SELECT sum(salary) from employees
SElect max(salary), min(salary) from employees
SELECT count(employee_id) from employees
SELECT upper(first_name) from employees
SELECT left(first_name, 3) from employees
SELECT concat(first_name ,' ', last_name) as "full name" from employees

SELECT first_name, last_name, concat(first_name ,' ', last_name) as full_name, (char_length(first_name)+char_length(last_name)) as "Char length" from employees

 SELECT first_name,first_name  ~ '^[0-9\.]+$' from employees

select * from employees order by employee_id limit 10


.2

SELECT first_name, last_name , salary from employees where salary between 10000 and 15000

select * from employees

SELECT first_name, last_name , salary from employees where extract(year from hire_date )=1987

SELECT first_name, last_name from employees where first_name ilike '%c%' and first_name ilike '%e%'


select last_name ,job_title, salary from employees
join jobs on employees.job_id = jobs.job_id
where salary not in(4500,10000,15000)
	and	job_title not in ('Programmer','Shipping Clerk')



select last_name from employees where char_length(last_name)>6

select last_name from employees where last_name ilike '__e%'


select distinct job_title, count (employees) from employees
join jobs on jobs.job_id= employees.job_id
group by job_title


SELECT * from employees where last_name in ('Jones','Blake','Scott','King','Ford')
