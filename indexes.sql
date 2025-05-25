USE healthcare_db;

-- Index on patients.city_id for city-based filtering
CREATE INDEX idx_patients_city_id ON patients(city_id);

-- Index on prescriptions.patient_id for faster joins
CREATE INDEX idx_prescriptions_patient_id ON prescriptions(patient_id);

-- Index on prescriptions.pharmacy_id
CREATE INDEX idx_prescriptions_pharmacy_id ON prescriptions(pharmacy_id);

-- Index on prescriptions.disease_id
CREATE INDEX idx_prescriptions_disease_id ON prescriptions(disease_id);

-- Index on prescriptions.prescription_date for date filtering
CREATE INDEX idx_prescription_date ON prescriptions(prescription_date);

-- Index on pharmacies.city_id for location-based pharmacy lookup
CREATE INDEX idx_pharmacies_city_id ON pharmacies(city_id);

-- Index on cities.state_id to speed up hierarchical lookups
CREATE INDEX idx_cities_state_id ON cities(state_id);
