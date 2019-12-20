use employees;

SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS full_name, departments.dept_name
FROM employees
         JOIN dept_emp
              ON dept_emp.emp_no = employees.emp_no
         JOIN departments
              ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date = '9999-01-01' AND employees.emp_no = 10001;

#  dept name -> dept manager
Select departments.dept_name as 'Department Name', concat(first_name, ' ', last_name) AS 'Department Manager'
FROM employees
    Join dept_manager
        on employees.emp_no = dept_manager.emp_no
    join departments
        on dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date = '9999-01-01'
order by  dept_name ASC;


# Find the name of all departments currently managed by women.

Select dept_name as 'Department Name', concat(first_name, ' ', last_name) AS 'Department Manager'
FROM employees
         Join dept_manager
              on employees.emp_no = dept_manager.emp_no
         join departments
              on dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date = '9999-01-01' AND gender = 'F'
order by  dept_name ASC;


# Find the current titles of employees currently working in the Customer Service department.
# title/count

Select title as 'Title', count(*) AS 'Count'
FROM titles
    join dept_emp
        on titles.emp_no = dept_emp.emp_no
    join departments
        on dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Customer Service' AND dept_emp.to_date = '9999-01-01' AND titles.to_date = '9999-01-01'
group by title;


# Find the current salary of all current managers.
# # dept name/name/salary

select dept_name, concat(first_name,' ',last_name) AS 'Name', salary
from employees
    join salaries
        on employees.emp_no = salaries.emp_no
    join dept_manager
        on employees.emp_no = dept_manager.emp_no
    join departments
        on dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
group by dept_name;


# 5. Find the current salary of all current managers.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS 'Manager', s.salary
FROM salaries AS s
         JOIN dept_manager AS m
              ON m.emp_no = s.emp_no
         JOIN employees AS e
              ON e.emp_no = m.emp_no
         JOIN departments AS d
              ON d.dept_no = m.dept_no
WHERE m.to_date > NOW() AND s.to_date > NOW()
ORDER BY d.dept_name;


# Find the names of all current employees, their department name, and their current manager's name.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', CONCAT(managers.first_name, ' ', managers.last_name) AS 'Manager Name'
FROM employees AS e
         JOIN dept_emp AS de
              ON de.emp_no = e.emp_no
         JOIN departments AS d
              ON d.dept_no = de.dept_no
         JOIN dept_manager AS m
              ON m.dept_no = d.dept_no
         JOIN employees AS managers
              ON m.emp_no = managers.emp_no
WHERE de.to_date > NOW() AND m.to_date > NOW();