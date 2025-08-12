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

SELECT full_name, salary
FROM Doctor
WHERE salary > (SELECT AVG(salary) FROM Doctor);

SELECT full_name
FROM Patient
WHERE patient_id IN (SELECT patient_id FROM Appointment);

SELECT full_name, date_of_birth
FROM Patient p
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) >
      (SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) FROM Patient);
      
-- List doctors who have scheduled appointments
SELECT DISTINCT d.full_name
FROM Doctor d
WHERE EXISTS (
    SELECT 1 FROM Appointment a
    WHERE a.doctor_name = d.full_name
);

-- Get department and total salary from a derived table
SELECT department_id, total_salary
FROM (
    SELECT department_id, SUM(salary) AS total_salary
    FROM Doctor
    GROUP BY department_id
) AS dept_salary;




