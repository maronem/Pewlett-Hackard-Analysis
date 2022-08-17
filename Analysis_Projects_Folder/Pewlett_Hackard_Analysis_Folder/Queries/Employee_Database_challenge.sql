-- Deliverable 1: Create a table that holds all the titles of employees
-- who were born between January 1, 1952 and December 31, 1955
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- View Table
SELECT * FROM retirement_titles;
-- Exported as CSV


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
    rt.first_name,
    rt.last_name,
    rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- View Table unique_titles
SELECT * FROM unique_titles
-- Exported as CSV


-- Retrieve the number of employees by their most 
-- recent job title who are about to retire

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY title
ORDER BY count DESC;

-- View table retiring_titles
SELECT * FROM retiring_titles;
-- Exported as CSV


-- Deliverable 2: Create a mentorship-eligibility table that holds the current 
-- employees who were born between January 1, 1965 and December 31, 1965.

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibility
FROM employees AS e
LEFT JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON(de.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

-- View table mentorship_eligibility
SELECT * FROM mentorship_eligibility
-- Export as CSV
