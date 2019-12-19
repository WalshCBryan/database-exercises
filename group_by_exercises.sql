# In your script, use DISTINCT to find the unique titles in the titles table.
select distinct title from titles;

-- # Find all employees whose last name starts and ends with 'E'
# Update the query to find just the unique last names that start and end with 'E'
SELECT distinct last_name FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' ORDER BY last_name;

# Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.
SELECT distinct first_name,last_name FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' ORDER BY last_name;

# find the unique last names with a 'q' but not 'qu'.
SELECT distinct last_name FROM employees WHERE (last_name LIKE '%q%' AND last_name NOT LIKE '%qu%');

# Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
SELECT count(*),last_name FROM employees WHERE (last_name LIKE '%q%' AND last_name NOT LIKE '%qu%') GROUP BY last_name ORDER BY count(*);

# Update your query for 'Irena', 'Vidya', or 'Maya'. Use count(*) and GROUP BY to find the number of employees for each gender with those names. Your results should be:
#     441 M
#     268 F
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows
SELECT count(*),gender FROM employees WHERE first_name IN ('Irena','Vidya', 'Maya') GROUP BY gender ORDER BY count(*) DESC;