CREATE DATABASE IF NOT EXISTS Hospital;
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
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
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

SELECT * FROM Department;
SELECT * FROM Doctor;
SELECT * FROM Patient;

UPDATE Doctor
SET phone_number = '9998887776'
WHERE doctor_id = 1;
SELECT * FROM Doctor;


UPDATE Patient
SET address = 'Salem, Tamil Nadu'
WHERE patient_id = 3;
SELECT * FROM Patient;

DELETE FROM Doctor
WHERE department_id = 3;
SELECT * FROM Doctor;

DELETE FROM Patient
WHERE patient_id = 2;
SELECT * FROM Patient;




