#  Task 6 – Subqueries and Nested Queries (SQL Developer Internship)

This task demonstrates different types of **subqueries** in SQL using the Hospital Management System database.

---

##  Task Objective
To understand and implement:
- Scalar subqueries
- Subqueries with `IN`
- Correlated subqueries
- Subqueries with `EXISTS`
- Derived tables (subqueries in `FROM` clause)

---

##  Database Schema

We used the **Hospital** database with the following tables:

### 1. Department
| Column           | Type       | Description |
|------------------|------------|-------------|
| department_id    | INT (PK)   | Unique ID for department |
| department_name  | VARCHAR    | Department name |
| location         | VARCHAR    | Department location |

### 2. Doctor
| Column         | Type       | Description |
|----------------|------------|-------------|
| doctor_id      | INT (PK)   | Unique doctor ID |
| full_name      | VARCHAR    | Doctor's name |
| specialization | VARCHAR    | Doctor's specialization |
| department_id  | INT (FK)   | Linked to Department |
| salary         | INT        | Doctor's salary |
| phone_number   | VARCHAR    | Contact number |

### 3. Patient
| Column         | Type       | Description |
|----------------|------------|-------------|
| patient_id     | INT (PK)   | Unique patient ID |
| full_name      | VARCHAR    | Patient's name |
| gender         | ENUM       | Male/Female/Other |
| date_of_birth  | DATE       | Birth date |
| contact_number | VARCHAR    | Contact number |
| address        | TEXT       | Address |

### 4. Appointment
| Column           | Type       | Description |
|------------------|------------|-------------|
| appointment_id   | INT (PK)   | Unique appointment ID |
| patient_id       | INT (FK)   | Linked to Patient |
| doctor_name      | VARCHAR    | Doctor's name |
| appointment_date | DATE       | Date of appointment |
| status           | ENUM       | Scheduled/Completed/Cancelled |

---

##  Sample Data

### Doctor Table (with salary for subqueries)
| doctor_id | full_name   | specialization       | department_id | salary  |
|-----------|-------------|----------------------|---------------|---------|
| 1         | Dr.Santhosh | Cardiologist          | 1             | 120000  |
| 2         | Dr.Siva     | Neurologist           | 2             | 100000  |
| 3         | Dr.Theepak  | Orthopedic Surgeon    | 3             | 95000   |
| 4         | Dr.Vinoth   | Pediatrician          | 4             | 110000  |

---

##  Sample Queries

# 1.Scalar Subquery
Get doctors earning more than the average salary.

SELECT full_name, salary
FROM Doctor
WHERE salary > (SELECT AVG(salary) FROM Doctor);

# 2️.Subquery with IN
Find patients who have appointments.

SELECT full_name
FROM Patient
WHERE patient_id IN (SELECT patient_id FROM Appointment);

# 3.Correlated Subquery
Find patients older than the average patient age.

SELECT full_name, date_of_birth
FROM Patient p
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) >
      (SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) FROM Patient);

# 4️.EXISTS
List doctors who have scheduled appointments.

SELECT DISTINCT d.full_name
FROM Doctor d
WHERE EXISTS (
    SELECT 1 FROM Appointment a
    WHERE a.doctor_name = d.full_name
);

# 5.Derived Table
Get total salary by department using a subquery in FROM clause.

SELECT department_id, total_salary
FROM (
    SELECT department_id, SUM(salary) AS total_salary
    FROM Doctor
    GROUP BY department_id
) AS dept_salary;




