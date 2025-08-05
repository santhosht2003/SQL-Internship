#  Hospital Management System

This task is part of my SQL Developer Internship. It includes the creation and management of a simple hospital database using MySQL. The task demonstrates SQL skills such as creating tables, inserting data, updating records, and deleting data.

---

##  Project Overview

The database models basic operations in a hospital:
- Managing doctors and departments
- Storing patient details
- Performing basic CRUD operations

---

##  Tables

1. **Department**
2. **Doctor**
3. **Patient**

---

##  Relationships

- Each **Doctor** belongs to a **Department** via a foreign key.
- Each **Patient** is stored independently, and appointment functionality can be added later.

---

##  Schema Structure

### Department
| Column          | Type         | Constraints        |
|-----------------|--------------|--------------------|
| department_id   | INT          | PRIMARY KEY, AUTO_INCREMENT |
| department_name | VARCHAR(100) | UNIQUE, NOT NULL   |
| location        | VARCHAR(100) |                    |

### Doctor
| Column        | Type         | Constraints        |
|---------------|--------------|--------------------|
| doctor_id     | INT          | PRIMARY KEY, AUTO_INCREMENT |
| full_name     | VARCHAR(100) | NOT NULL           |
| specialization| VARCHAR(100) |                    |
| department_id | INT          | FOREIGN KEY        |
| phone_number  | VARCHAR(15)  |                    |

### Patient
| Column         | Type            | Constraints        |
|----------------|-----------------|--------------------|
| patient_id     | INT             | PRIMARY KEY, AUTO_INCREMENT |
| full_name      | VARCHAR(100)    | NOT NULL           |
| gender         | ENUM            | ('Male', 'Female', 'Other') |
| date_of_birth  | DATE            |                    |
| contact_number | VARCHAR(15)     |                    |
| address        | TEXT            |                    |

---

##  SQL Operations

### ✔ Create Database & Tables
```sql
CREATE DATABASE IF NOT EXISTS Hospital;
USE HospitalDB;
-- Tables: Department, Doctor, Patient

UPDATE Doctor
SET phone_number = '9998887776'
WHERE doctor_id = 1;

UPDATE Patient
SET address = 'Salem, Tamil Nadu'
WHERE patient_id = 3;

DELETE FROM Doctor
WHERE department_id = 3;

DELETE FROM Patient
WHERE patient_id = 2;

