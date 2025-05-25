-- Create Database
CREATE DATABASE IF NOT EXISTS healthcare_db;
USE healthcare_db;

-- Table: States
CREATE TABLE states (
    state_id INT PRIMARY KEY,
    state_name VARCHAR(100) NOT NULL
);

-- Table: Cities
CREATE TABLE cities (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    state_id INT,
    FOREIGN KEY (state_id) REFERENCES states(state_id)
);

-- Table: Diseases
CREATE TABLE diseases (
    disease_id INT PRIMARY KEY,
    disease_name VARCHAR(100) NOT NULL
);

-- Table: Patients
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    age INT CHECK (age BETWEEN 0 AND 120),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

-- Table: Pharmacies
CREATE TABLE pharmacies (
    pharmacy_id INT PRIMARY KEY,
    pharmacy_name VARCHAR(100) NOT NULL,
    address TEXT,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

-- Table: Prescriptions
CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    pharmacy_id INT,
    disease_id INT,
    drug_name VARCHAR(100),
    dosage VARCHAR(100),
    prescription_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies(pharmacy_id),
    FOREIGN KEY (disease_id) REFERENCES diseases(disease_id)
);