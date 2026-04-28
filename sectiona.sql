CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    patient_phone VARCHAR(15)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(10),
    doctor_specialization VARCHAR(10)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    diagnosis VARCHAR(100),
    treatment VARCHAR(10),
    
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
CREATE TABLE Medicines (
    medicine_id INT PRIMARY KEY,
    medicine_name VARCHAR(10),
    medicine_price INT
);

CREATE TABLE  Prescriptions (
    prescription_id INT PRIMARY KEY,
    appointment_id INT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE Prescription_Details (
    prescription_id INT,
    medicine_id INT,
    PRIMARY KEY (prescription_id, medicine_id),
    FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);

CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    appointment_id INT,
    bill_amount INT,
    payment_status VARCHAR(20),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

