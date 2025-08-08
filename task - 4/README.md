# Task 4 – Aggregate Functions and Grouping

This task demonstrates the use of aggregate functions and `GROUP BY` in SQL. It is a part of my SQL Developer Internship.

##  Key Concepts Covered

- Aggregate functions: `SUM()`, `AVG()`, `COUNT()`, `MAX()`, `MIN()`, `ROUND()`
- Grouping data using `GROUP BY`
- Filtering grouped data with `HAVING`
- Distinct values
- Aliasing results

##  Modified Schema

A `salary` column was added to the `Doctor` table to make aggregate queries possible.

##  Sample Queries

```sql
-- Total doctors
SELECT COUNT(*) FROM Doctor;

-- Average salary
SELECT AVG(salary) FROM Doctor;

-- Total salary by department
SELECT department_id, SUM(salary) FROM Doctor GROUP BY department_id;

-- Doctors per department
SELECT department_id, COUNT(*) FROM Doctor GROUP BY department_id;

-- Departments with more than 1 doctor
SELECT department_id FROM Doctor GROUP BY department_id HAVING COUNT(*) > 1;

-- Highest salary by specialization
SELECT specialization, MAX(salary) FROM Doctor GROUP BY specialization;
