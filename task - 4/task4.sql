CREATE DATABASE IF NOT EXISTS HospitalDB;
USE HospitalDB;

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
    phone_number VARCHAR(15),
    FOREIGN KEY (department_id) REFERENCES Department (department_id)
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE,
    contact_number VARCHAR(15),
    address TEXT
);

INSERT INTO Department (department_name, location) VALUES
('Cardiology', 'Block A - 1st Floor'),
('Neurology', 'Block B - 2nd Floor'),
('Orthopedics', 'Block C - Ground Floor'),
('Pediatrics', 'Block D - 3rd Floor');

INSERT INTO Doctor (full_name, specialization, department_id, phone_number) VALUES
('Dr.Santhosh', 'Cardiologist', 1, '9876543210'),
('Dr.Siva', 'Neurologist', 2, '9876543211'),
('Dr.Theepak', 'Orthopedic Surgeon', 3, '9876543212'),
('Dr.Vinoth', 'Pediatrician', 4, '9876543213');

INSERT INTO Patient (full_name, gender, date_of_birth, contact_number, address) VALUES
('Rahul', 'Male', '1990-03-12', '9123456789', 'Chennai, Tamil Nadu'),
('Meera', 'Female', '1985-07-21', '9123456790', 'Coimbatore, Tamil Nadu'),
('Rajesh', 'Male', '2016-05-14', '9123456791', 'Madurai, Tamil Nadu'),
('Divya', 'Female', '2000-11-30', '9123456792', 'Trichy, Tamil Nadu');

ALTER TABLE Doctor ADD COLUMN salary INT;

UPDATE Doctor SET salary = 120000 WHERE doctor_id = 1;
UPDATE Doctor SET salary = 100000 WHERE doctor_id = 2;
UPDATE Doctor SET salary = 95000 WHERE doctor_id = 3;
UPDATE Doctor SET salary = 110000 WHERE doctor_id = 4;

SELECT COUNT(*) AS total_doctors FROM Doctor;

SELECT AVG(salary) AS avg_salary FROM Doctor;

SELECT department_id, SUM(salary) AS total_salary
FROM Doctor
GROUP BY department_id;

SELECT department_id, COUNT(*) AS num_doctors
FROM Doctor
GROUP BY department_id;

SELECT specialization, MAX(salary) AS highest_salary
FROM Doctor
GROUP BY specialization;

SELECT COUNT(DISTINCT specialization) AS total_specializations
FROM Doctor;

SELECT ROUND(AVG(salary), 2) AS avg_salary_rounded
FROM Doctor;









