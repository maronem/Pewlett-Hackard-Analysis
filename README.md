# Pewlett-Hackard-Analysis

## Overview

The purpose of this analysis was to use SQL queries on an employee dataset from Pewlett Hackard to determine the number of retiring employees 
per job title and to identify employees who are eligible to participate in a mentorship program. This analysis was performed by creating an ERD
diagram to identify primary and foreign keys between tables to identify relationships. New tables were created using PostgreSQL pgAdmin4 by using 
the identified data relationships to pull data respective to our analysis.

## Analysis

* Senior staff is the largest group of employees eligible to participate in a mentorship program, 
while Technique leaders are the smallest group.
* There are 72,458 employees born in the date range January 1, 1952 and December 31, 1955 about to retire.
* Senior Engineers are the largest group of employees about to retire (25,916), while managers is the smallest (2).
* Of employees born in the date range January 1, 1952 and December 31, 1955, the largest group is Engineers (36,559)
while managers is the smallest (6).

Below are the queries written to determine these outcomes:
```
-- count number of retirees by title
SELECT COUNT(ut.title), ut.title
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY count DESC;
```

```
-- count employees by title born in time frame
SELECT COUNT(rt.title), rt.title
FROM retirement_titles AS rt
GROUP BY rt.title
ORDER BY count DESC;
```

```
-- total number of employees about to retire
SELECT COUNT(ut.title)
FROM unique_titles AS ut;
```

## Summary

One additional query that could be asked that may provide more insight is to determine which departments the employee titles
belong to from the query identifying the job titles of employees about to retire. This would add a layer of specificity to 
understand which departments are losing the most employees, such as the departments the 25,916 senior engineers about to retire
from. To accomplish this, the unique_titles table could be joined with  the dept_emp table on the emp_no column, and then further
joined to the departments table on dept_no. Doing this the summary table could be counted grouped by dept_no and ordered by count.

A second query could be which job title of soon to retire employees has the highest salary. This can be accomplished by joining the salary table 
to the retirement_titles table on emp_no and then forming a second unique_titles table including the salary column. Finally, grouping the table by 
title and then ordering the table by salary would produce the desired table for this query.
