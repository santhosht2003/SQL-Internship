#  Hospital Management System – SQL Database 

This task is part of my SQL Developer Internship. It demonstrates how to design a relational database using MySQL Workbench for a Hospital Management System with 4 core entities.

---

##  Project Overview

This database simulates the workflow of a hospital by managing:

- Patient registration
- Doctor assignments
- Departmental structure
- Appointment scheduling

---

##  Tables Created

1. **Patients**
2. **Doctors**
3. **Departments**
4. **Appointments**

---

##  Relationships

- Each **Doctor** belongs to a **Department**.
- Each **Patient** can have multiple **Appointments**.
- Each **Appointment** is associated with both a **Patient** and a **Doctor**.

---

##  Tools Used

- MySQL Workbench
- GitHub

---

##  SQL Features Used

- `CREATE TABLE` with `PRIMARY KEY`, `AUTO_INCREMENT`
- `FOREIGN KEY` relationships
- `ENUM` datatype for gender
- `SELECT` queries and `JOIN`s
- Basic aggregation (example provided in queries)

---

##  ER Diagram
<img width="1536" height="1024" alt="er_diagram" src="https://github.com/user-attachments/assets/884791e9-20a7-4c53-9fdb-7d4cf403c9b3" />

---

##  Sample Queries

```sql
SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Departments;
SELECT * FROM Appointments;

SELECT doctor_id, COUNT(*) AS total_appointments
FROM Appointments
GROUP BY doctor_id;

