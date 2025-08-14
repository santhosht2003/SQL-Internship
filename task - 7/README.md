#  Task 7 – Creating and Using Views (SQL Developer Internship)

##  Objective
Learn how to create, use, and manage SQL views for:
- Data abstraction
- Security
- Query reusability

---

##  Database
Hospital Management System with tables:
- Department
- Doctor
- Patient
- Appointment

---

##  What is a View?
A **view** is a virtual table based on the result of a SQL `SELECT` query.  
It does not store data physically – instead, it displays data from one or more tables.

##  Views Created
1. **view_doctor_details** – Doctor info with department names  
2. **view_patient_appointments** – Patient appointment details  
3. **view_high_salary_doctors** – Doctors earning above average  
4. **view_upcoming_appointments** – All future appointments  

---

## Sample Queries
```sql

CREATE VIEW view_doctor_details AS
SELECT d.doctor_id, d.full_name, d.specialization, dept.department_name, d.salary
FROM Doctor d
JOIN Department dept ON d.department_id = dept.department_id;

SELECT * FROM view_doctor_details;

CREATE VIEW view_patient_appointments AS
SELECT p.patient_id, p.full_name AS patient_name, a.doctor_name, a.appointment_date, a.status
FROM Patient p
JOIN Appointment a ON p.patient_id = a.patient_id;

SELECT * FROM view_patient_appointments;

CREATE VIEW view_high_salary_doctors AS
SELECT full_name, specialization, salary
FROM Doctor
WHERE salary > (SELECT AVG(salary) FROM Doctor);

SELECT * FROM view_high_salary_doctors;

CREATE VIEW view_upcoming_appointments AS
SELECT *
FROM Appointment
WHERE appointment_date >= CURDATE()
ORDER BY appointment_date ASC;

SELECT * FROM view_upcoming_appointments;
