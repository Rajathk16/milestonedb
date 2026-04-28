CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    dob DATE
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    appointment_datetime DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Consultations (
    consultation_id INT PRIMARY KEY,
    appointment_id INT,
    notes TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE Consultation_Doctors (
    consultation_id INT,
    doctor_id INT,
    role VARCHAR(50),
    PRIMARY KEY (consultation_id, doctor_id),
    FOREIGN KEY (consultation_id) REFERENCES Consultations(consultation_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Diagnoses (
    diagnosis_id INT PRIMARY KEY,
    consultation_id INT,
    diagnosis_text VARCHAR(255),
    FOREIGN KEY (consultation_id) REFERENCES Consultations(consultation_id)
);

CREATE TABLE Medicines (
    medicine_id INT PRIMARY KEY,
    medicine_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY,
    consultation_id INT,
    FOREIGN KEY (consultation_id) REFERENCES Consultations(consultation_id)
);

CREATE TABLE Prescription_Details (
    prescription_id INT,
    medicine_id INT,
    dosage VARCHAR(50),
    duration VARCHAR(50),
    PRIMARY KEY (prescription_id, medicine_id),
    FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);

CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    consultation_id INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (consultation_id) REFERENCES Consultations(consultation_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    bill_id INT,
    amount_paid DECIMAL(10,2),
    payment_date DATE,
    payment_mode VARCHAR(50),
    FOREIGN KEY (bill_id) REFERENCES Billing(bill_id)
);

INSERT INTO Patients VALUES
(1, 'Rajath', '9876543210', 'rajath@gmail.com', '2003-05-10'),
(2, 'Rahul', '9123456780', 'rahul@gmail.com', '2000-08-15');

INSERT INTO Departments VALUES
(1, 'Cardiology'),
(2, 'Neurology');

INSERT INTO Doctors VALUES
(1, 'Dr. Sharma', 'Cardiologist', 1),
(2, 'Dr. Mehta', 'Neurologist', 2);

INSERT INTO Appointments VALUES
(1, 1, '2026-04-28 10:00:00', 'Completed'),
(2, 2, '2026-04-28 11:00:00', 'Completed');

INSERT INTO Consultations VALUES
(1, 1, 'Patient has chest pain'),
(2, 2, 'Patient has headache');

INSERT INTO Consultation_Doctors VALUES
(1, 1, 'Primary'),
(1, 2, 'Assistant'),
(2, 2, 'Primary');

INSERT INTO Diagnoses VALUES
(1, 1, 'Mild Heart Issue'),
(2, 1, 'High BP'),
(3, 2, 'Migraine');

INSERT INTO Medicines VALUES
(1, 'Aspirin', 10.00),
(2, 'Paracetamol', 5.00),
(3, 'BP Tablet', 20.00);

INSERT INTO Prescriptions VALUES
(1, 1),
(2, 2);

INSERT INTO Prescription_Details VALUES
(1, 1, '1 tablet', '5 days'),
(1, 3, '1 tablet', '10 days'),
(2, 2, '2 tablets', '3 days');

INSERT INTO Billing VALUES
(1, 1, 500.00),
(2, 2, 300.00);

INSERT INTO Payments VALUES
(1, 1, 500.00, '2026-04-28', 'UPI'),
(2, 2, 150.00, '2026-04-28', 'Cash');