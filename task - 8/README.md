#  Task 8 – Stored Procedures & Functions (SQL Developer Internship)

##  Objective
In this task, we learn how to modularize SQL logic using:
- **Stored Procedures** – reusable SQL code blocks with IN/OUT parameters
- **Functions** – reusable SQL code that always returns a single value
- Conditional logic (`IF`, `CASE`)
- Parameter handling in MySQL

---

##  Database Used
We are using the **Hospital Management System** database from previous tasks.

### Tables:
1. **Department**
2. **Doctor**
3. **Patient**
4. **Appointment**

---

##  Stored Procedures

###  Get Doctors by Department
**Purpose:** Retrieve doctors belonging to a specific department.
```sql
DELIMITER $$

CREATE PROCEDURE GetDoctorsByDepartment(IN dept_name VARCHAR(100))
BEGIN
    SELECT d.full_name, d.specialization, dept.department_name, d.salary
    FROM Doctor d
    JOIN Department dept ON d.department_id = dept.department_id
    WHERE dept.department_name = dept_name;
END $$

DELIMITER ;

CALL GetDoctorsByDepartment('Cardiology');

DELIMITER $$

CREATE PROCEDURE GetTotalPatients(OUT total_count INT)
BEGIN
    SELECT COUNT(*) INTO total_count FROM Patient;
END $$

DELIMITER ;

CALL GetTotalPatients(@count);
SELECT @count AS TotalPatients;



DELIMITER $$

CREATE FUNCTION GetPatientAge(p_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())
    INTO age
    FROM Patient
    WHERE patient_id = p_id;
    RETURN age;
END $$

DELIMITER ;

SELECT full_name, GetPatientAge(patient_id) AS age FROM Patient;

DROP FUNCTION IF EXISTS IsHighEarningDoctor;

DELIMITER $$

CREATE FUNCTION IsHighEarningDoctor(d_id INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(10);
    DECLARE avg_salary DECIMAL(10,2);
    DECLARE doc_salary DECIMAL(10,2);

    -- Get the average salary of all doctors
    SELECT AVG(salary) INTO avg_salary FROM Doctor;

    -- Get the salary of the given doctor
    SELECT salary INTO doc_salary FROM Doctor WHERE doctor_id = d_id;

    -- Compare salary with average
    IF doc_salary > avg_salary THEN
        SET result = 'YES';
    ELSE
        SET result = 'NO';
    END IF;

    RETURN result;
END $$

DELIMITER ;

SELECT full_name, IsHighEarningDoctor(doctor_id) AS HighEarner
FROM Doctor;