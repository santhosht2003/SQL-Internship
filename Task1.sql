CREATE DATABASE IF NOT EXISTS HospitalDB;
USE HospitalDB;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) UNIQUE NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    department_id INT,
    phone_number VARCHAR(15),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    date_of_birth DATE,
    contact_number VARCHAR(15),
    address TEXT
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Departments (department_name, location) VALUES
('Cardiology', 'Block A - 1st Floor'),
('Neurology', 'Block B - 2nd Floor'),
('Orthopedics', 'Block C - Ground Floor'),
('Pediatrics', 'Block D - 3rd Floor');

INSERT INTO Doctors (full_name, specialization, department_id, phone_number) VALUES
('Dr.Santhosh', 'Cardiologist', 1, '9876543210'),
('Dr.Siva', 'Neurologist', 2, '9876543211'),
('Dr.Theepak', 'Orthopedic Surgeon', 3, '9876543212'),
('Dr.Vinoth', 'Pediatrician', 4, '9876543213');

INSERT INTO Patients (full_name, gender, date_of_birth, contact_number, address) VALUES
('Rahul', 'Male', '1990-03-12', '9123456789', 'Chennai, Tamil Nadu'),
('Meera', 'Female', '1985-07-21', '9123456790', 'Coimbatore, Tamil Nadu'),
('Rajesh', 'Male', '2016-05-14', '9123456791', 'Madurai, Tamil Nadu'),
('Divya', 'Female', '2000-11-30', '9123456792', 'Trichy, Tamil Nadu');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, reason) VALUES
(1, 1, '2025-08-10', '10:30:00', 'Chest pain and shortness of breath'),
(2, 2, '2025-08-11', '14:00:00', 'Recurring headaches and dizziness'),
(3, 4, '2025-08-12', '09:00:00', 'Routine child check-up'),
(4, 3, '2025-08-13', '11:45:00', 'Knee pain after injury');

SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Departments;
SELECT * FROM Appointments;
SELECT doctor_id, COUNT(*) AS total_appointments
FROM Appointments
GROUP BY doctor_id;



