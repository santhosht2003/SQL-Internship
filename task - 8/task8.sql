DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) UNIQUE NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    department_id INT,
    salary INT,
    phone_number VARCHAR(15),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE,
    contact_number VARCHAR(15),
    address TEXT
);

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_name VARCHAR(100),
    appointment_date DATE,
    status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

INSERT INTO Department (department_name, location) VALUES
('Cardiology', 'Block A - 1st Floor'),
('Neurology', 'Block B - 2nd Floor'),
('Orthopedics', 'Block C - Ground Floor'),
('Pediatrics', 'Block D - 3rd Floor');

INSERT INTO Doctor (full_name, specialization, department_id, salary, phone_number) VALUES
('Dr.Santhosh', 'Cardiologist', 1, 120000, '9876543210'),
('Dr.Siva', 'Neurologist', 2, 100000, '9876543211'),
('Dr.Theepak', 'Orthopedic Surgeon', 3, 95000, '9876543212'),
('Dr.Vinoth', 'Pediatrician', 4, 110000, '9876543213');

INSERT INTO Patient (full_name, gender, date_of_birth, contact_number, address) VALUES
('Rahul', 'Male', '1990-03-12', '9123456789', 'Chennai'),
('Meera', 'Female', '1985-07-21', '9123456790', 'Coimbatore'),
('Rajesh', 'Male', '2016-05-14', '9123456791', 'Madurai'),
('Divya', 'Female', '2000-11-30', '9123456792', 'Trichy');

INSERT INTO Appointment (patient_id, doctor_name, appointment_date, status) VALUES
(1, 'Dr.Santhosh', '2025-08-15', 'Scheduled'),
(1, 'Dr.Siva', '2025-08-20', 'Completed'),
(3, 'Dr.Vinoth', '2025-08-22', 'Scheduled'),
(NULL, 'Dr.Unknown', '2025-08-25', 'Cancelled');

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




