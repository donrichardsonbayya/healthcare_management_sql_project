USE healthcare_db;

-- 1. Get all pharmacies that stock a specific drug
DELIMITER $$
CREATE PROCEDURE get_pharmacies_by_drug(IN drug_name_input VARCHAR(100))
BEGIN
    SELECT DISTINCT p.pharmacy_id, p.pharmacy_name, p.address
    FROM pharmacies p
    JOIN prescriptions pr ON p.pharmacy_id = pr.pharmacy_id
    WHERE pr.drug_name = drug_name_input;
END$$
DELIMITER ;

-- 2. Count patients treated for each disease in a specific year
DELIMITER $$
CREATE PROCEDURE count_patients_by_disease_year(IN year_input YEAR)
BEGIN
    SELECT d.disease_name, COUNT(DISTINCT pr.patient_id) AS total_patients
    FROM prescriptions pr
    JOIN diseases d ON pr.disease_id = d.disease_id
    WHERE YEAR(pr.prescription_date) = year_input
    GROUP BY d.disease_name
    ORDER BY total_patients DESC;
END$$
DELIMITER ;

-- 3. Get all prescriptions for a given patient
DELIMITER $$
CREATE PROCEDURE get_patient_prescriptions(IN patient_id_input INT)
BEGIN
    SELECT pr.*, d.disease_name, ph.pharmacy_name
    FROM prescriptions pr
    JOIN diseases d ON pr.disease_id = d.disease_id
    JOIN pharmacies ph ON pr.pharmacy_id = ph.pharmacy_id
    WHERE pr.patient_id = patient_id_input;
END$$
DELIMITER ;

-- 4. Get the most prescribed drugs in the last year
DELIMITER $$
CREATE PROCEDURE top_prescribed_drugs_last_year()
BEGIN
    SELECT drug_name, COUNT(*) AS total_prescriptions
    FROM prescriptions
    WHERE prescription_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    GROUP BY drug_name
    ORDER BY total_prescriptions DESC
    LIMIT 10;
END$$
DELIMITER ;

-- 5. Get patient count by city
DELIMITER $$
CREATE PROCEDURE patient_distribution_by_city()
BEGIN
    SELECT c.city_name, COUNT(p.patient_id) AS patient_count
    FROM patients p
    JOIN cities c ON p.city_id = c.city_id
    GROUP BY c.city_name
    ORDER BY patient_count DESC;
END$$
DELIMITER ;
