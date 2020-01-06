use employees;

# Find all the employees with the same hire date as employee 101010 using a subquery. 69 Rows

select concat(first_name, ' ', last_name) AS 'Name' from employees
where hire_date = (
    select hire_date
    from employees
    where emp_no = '101010'
    );

# Find all the titles held by all employees with the first name Aamod.
# 314 total titles, 6 unique titles(add distinct to narrow down to 6)

select distinct title from titles
    where emp_no IN (
        select emp_no from employees
        where first_name = 'Aamod'
        );

# Find all the current department managers that are female.

select first_name, last_name, gender from employees
where emp_no IN (
    select emp_no from dept_manager where to_date > NOW()
    ) AND gender = 'F' ;

# bonus
# Find all the department names that currently have female managers.

select dept_name from departments
where dept_no IN(
    select dept_no from dept_manager
    where emp_no IN (
        select emp_no from employees
        where gender = 'F' and to_date > NOW()
        )
    );

# Find the first and last name of the employee with the highest salary.

select first_name,last_name from employees
where emp_no = (
   select emp_no from salaries
   order by salary DESC limit 1
    );



