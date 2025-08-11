CREATE DATABASE IF NOT EXISTS Hospital;
USE Hospital;

-- Existing Table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE,
    contact_number VARCHAR(15),
    address TEXT
);

-- New Table
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_name VARCHAR(100),
    appointment_date DATE,
    status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

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

