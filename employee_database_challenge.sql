-----------------------------------------------------------------------
-- Create a Retirement Titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	t.titles,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no
;
------------------------------------------------------------------------
SELECT * FROM retirement_titles
;
------------------------------------------------------------------------
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
titles
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC
;
--------------------------------------------------------------------------
-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT(emp_no) as retiring_count,
	titles
INTO retiring_titles	
FROM unique_titles
GROUP BY titles
ORDER BY retiring_count DESC
;
---------------------------------------------------------------------------
-- Create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.
SELECT 
	DISTINCT ON (emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.titles
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, t.to_date DESC