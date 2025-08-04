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

##  Repository Contents

| File Name            | Description                              |
|---------------------|------------------------------------------|
| `hospital_schema.sql` | SQL script with schema + sample data     |
| `ER_diagram.png`     | Visual diagram of the database structure |
| `README.md`          | Project overview and documentation       |

---

##  Sample Queries

```sql
SELECT * FROM Patients;

SELECT 
    a.appointment_id,
    p.full_name AS patient_name,
    d.full_name AS doctor_name,
    a.appointment_date,
    a.reason
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

##  ER Diagram
<img width="1536" height="1024" alt="er_diagram" src="https://github.com/user-attachments/assets/884791e9-20a7-4c53-9fdb-7d4cf403c9b3" />

