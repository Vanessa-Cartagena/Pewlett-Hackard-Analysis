SELECT e.emp_no, e.first_name, e.last_name,
	t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title,
to_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles

-- The number of employees by their most recent job title who are about to retire.
SELECT COUNT(title) "count", title
-- INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY count DESC;
