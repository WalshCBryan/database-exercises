-- # what are the names of the 10 most recently hired females in the company? the first 10? (no group by needed)
select first_name,last_name from employees order by hire_date DESC limit 10;
-- # what are the top three most common job titles?
select title from titles group by title order by count(*) DESC limit 3;
-- # what is the most common 'from date' for job titles? for staff only?
select from_date from titles where title = 'staff' limit 1;
-- # what is the highest employee number for an engineer?
select emp_no from titles where title = 'engineer' ORDER BY emp_no DESC limit 1
-- # what is the most common birthday?
SELECT count(*),birth_date from employees order by count(*) DESC limit 1;

-- # what is the most common female birthday? male?
SELECT count(*),birth_date from employees where gender = 'F' group by birth_date order by count(*) DESC limit 1;
SELECT count(*),birth_date from employees where gender = 'M' group by birth_date order by count(*) DESC limit 1;

-- # what is the most common hire date for female and male employees?
select count(*),hire_date from employees where gender = 'F' group by hire_date order by count(*) DESC limit 1;
select count(*),hire_date from employees where gender = 'M' group by hire_date order by count(*) DESC limit 1;

-- # what is the longest last name of someone born on March 8, 1952?

# not working correctly
select last_name from employees where birth_date = '1952-03-08' group by last_name order by max(length(last_name)) desc limit 1;

-- # what is the lowest employee number for the first senior engineers in the company?
select min(emp_no),min(from_date) from titles where title = 'senior engineer' group by from_date,emp_no order by from_date,emp_no limit 2;
