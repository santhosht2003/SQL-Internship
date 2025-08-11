#  Task 5 – SQL Joins (SQL Developer Internship)

This task demonstrates different types of SQL joins to retrieve data from related tables in the **Hospital Management System**.

---

##  Task Objective

To practice:
- Understanding relationships between tables
- Writing join queries to combine data
- Using different types of joins: `INNER`, `LEFT`, `RIGHT`, and `FULL OUTER`

---

##  Database Context

We used two related tables:

### 1. **Patient**
| Column         | Type        | Description |
|----------------|------------|-------------|
| patient_id     | INT (PK)   | Unique patient ID |
| full_name      | VARCHAR    | Patient name |
| gender         | ENUM       | Male/Female/Other |
| date_of_birth  | DATE       | Birth date |
| contact_number | VARCHAR    | Phone number |
| address        | TEXT       | Address |

### 2. **Appointment**
| Column          | Type        | Description |
|-----------------|------------|-------------|
| appointment_id  | INT (PK)   | Unique appointment ID |
| patient_id      | INT (FK)   | Links to `Patient` table |
| doctor_name     | VARCHAR    | Doctor assigned |
| appointment_date| DATE       | Date of appointment |
| status          | ENUM       | Scheduled/Completed/Cancelled |

---

##  Sample Data

### Patient Table
| patient_id | full_name | gender | date_of_birth | contact_number | address     |
|------------|----------|--------|---------------|---------------|-------------|
| 1          | Rahul    | Male   | 1990-03-12    | 9123456789    | Chennai     |
| 2          | Meera    | Female | 1985-07-21    | 9123456790    | Coimbatore  |
| 3          | Rajesh   | Male   | 2016-05-14    | 9123456791    | Madurai     |
| 4          | Divya    | Female | 2000-11-30    | 9123456792    | Trichy      |

### Appointment Table
| appointment_id | patient_id | doctor_name   | appointment_date | status     |
|----------------|-----------|---------------|------------------|------------|
| 1              | 1         | Dr.Santhosh   | 2025-08-15       | Scheduled  |
| 2              | 1         | Dr.Siva       | 2025-08-20       | Completed  |
| 3              | 3         | Dr.Vinoth     | 2025-08-22       | Scheduled  |
| 4              | NULL      | Dr.Unknown    | 2025-08-25       | Cancelled  |

---

##  Join Types and Queries

### sample code 

Returns only matching rows from both tables.
```sql
SELECT p.full_name, a.doctor_name, a.appointment_date
FROM Patient p
INNER JOIN Appointment a ON p.patient_id = a.patient_id;

SELECT p.full_name, a.doctor_name, a.appointment_date
FROM Patient p
LEFT JOIN Appointment a ON p.patient_id = a.patient_id;

SELECT p.full_name, a.doctor_name, a.appointment_date
FROM Patient p
RIGHT JOIN Appointment a ON p.patient_id = a.patient_id;

SELECT p.full_name, a.doctor_name, a.appointment_date
FROM Patient p
LEFT JOIN Appointment a ON p.patient_id = a.patient_id
UNION
SELECT p.full_name, a.doctor_name, a.appointment_date
FROM Patient p
RIGHT JOIN Appointment a ON p.patient_id = a.patient_id;
