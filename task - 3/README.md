#  Task 3 – SELECT Queries (SQL Developer Internship)

This task focuses on retrieving data from relational tables using the `SELECT` statement in SQL. I used MySQL Workbench to execute a variety of queries including filtering, sorting, pattern matching, and limiting results from the **Hospital Management System** database.

---

##  Task Objective

Learn how to:
- Extract meaningful data from one or more tables using `SELECT`
- Apply various filtering conditions
- Sort results using `ORDER BY`
- Limit rows using `LIMIT`
- Use pattern matching with `LIKE`
- Use range filters with `BETWEEN`
- Understand DISTINCT values

---

##  Database Overview

Tables used for querying:
1. **Department** – Stores department names and locations.
2. **Doctor** – Contains doctors' information and their department references.
3. **Patient** – Stores patient demographic details.

These tables were created and populated in **Task 1** and **Task 2**.

---

##  SQL Features Practiced

| Feature          | Description                                                   |
|------------------|---------------------------------------------------------------|
| `SELECT`         | Retrieves data from specified columns or entire table         |
| `WHERE`          | Filters rows based on specific conditions                     |
| `AND / OR`       | Combines multiple filtering conditions                        |
| `LIKE`           | Pattern matching using wildcards `%` and `_`                  |
| `BETWEEN`        | Filters values within a specific range                        |
| `ORDER BY`       | Sorts results in ascending or descending order                |
| `LIMIT`          | Restricts the number of rows returned                         |
| `DISTINCT`       | Returns only unique (non-duplicate) values                    |

---

##  Sample Queries

```sql
-- 1. Select all patient records
SELECT * FROM Patient;

-- 2. Select names and gender of all female patients
SELECT full_name, gender FROM Patient
WHERE gender = 'Female';

-- 3. Get patients born between 1990 and 2000
SELECT * FROM Patient
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

-- 4. Find doctors with 'Surgeon' in their specialization
SELECT * FROM Doctor
WHERE specialization LIKE '%Surgeon%';

-- 5. Get all departments in alphabetical order
SELECT * FROM Department
ORDER BY department_name ASC;

-- 6. Show the first 2 patients in the table
SELECT * FROM Patient
LIMIT 2;

-- 7. Display unique gender values in Patient table
SELECT DISTINCT gender FROM Patient;



