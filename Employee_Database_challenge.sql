--Retrieve the emp_no, first_name, and last_name columns from the Employees table 
SELECT e.emp_no,
	e.first_name,
	e.last_name
FROM employees AS e

--Retrieve the title, from_date, and to_date columns from the Titles table
SELECT ti.title,
	ti.from_date,
	ti.to_date
FROM titles AS ti

--Create a new table using the INTO clause, join both tables on the primary
--Final table to have emp_no, first_name, last_name, title, from_date, to_date
SELECT e.emp_no,
	e.first_name, 
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY ti.emp_no;


--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table
SELECT rt.emp_no,
	rt.first_name, 
	rt.last_name,
	rt.title
FROM retirement_titles AS rt

--Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no DESC;

--Number of employees most recent job title about to retire  
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY count DESC;

