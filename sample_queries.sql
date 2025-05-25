USE healthcare_db;

-- 1. Top 5 most treated diseases overall
SELECT d.disease_name, COUNT(*) AS total_cases
FROM prescriptions pr
JOIN diseases d ON pr.disease_id = d.disease_id
GROUP BY d.disease_name
ORDER BY total_cases DESC
LIMIT 5;

-- 2. Number of prescriptions issued by each pharmacy
SELECT ph.pharmacy_name, COUNT(*) AS prescription_count
FROM prescriptions pr
JOIN pharmacies ph ON pr.pharmacy_id = ph.pharmacy_id
GROUP BY ph.pharmacy_name
ORDER BY prescription_count DESC;

-- 3. Year-over-year prescription growth
SELECT YEAR(prescription_date) AS year, COUNT(*) AS total_prescriptions
FROM prescriptions
GROUP BY YEAR(prescription_date)
ORDER BY year;

-- 4. Average age of patients per disease
SELECT d.disease_name, ROUND(AVG(p.age), 1) AS avg_patient_age
FROM prescriptions pr
JOIN patients p ON pr.patient_id = p.patient_id
JOIN diseases d ON pr.disease_id = d.disease_id
GROUP BY d.disease_name
ORDER BY avg_patient_age DESC;

-- 5. City with highest number of patients
SELECT c.city_name, COUNT(*) AS patient_count
FROM patients p
JOIN cities c ON p.city_id = c.city_id
GROUP BY c.city_name
ORDER BY patient_count DESC
LIMIT 1;

-- 6. List of patients who have prescriptions for more than 2 different diseases
SELECT p.patient_id, p.full_name, COUNT(DISTINCT pr.disease_id) AS disease_count
FROM prescriptions pr
JOIN patients p ON pr.patient_id = p.patient_id
GROUP BY p.patient_id, p.full_name
HAVING disease_count > 2
ORDER BY disease_count DESC;

-- 7. Patients who received prescriptions from more than 3 different pharmacies
SELECT pr.patient_id, p.full_name, COUNT(DISTINCT pr.pharmacy_id) AS pharmacy_count
FROM prescriptions pr
JOIN patients p ON pr.patient_id = p.patient_id
GROUP BY pr.patient_id, p.full_name
HAVING pharmacy_count > 3
ORDER BY pharmacy_count DESC;

-- 8. Most common drug prescribed for each disease
SELECT d.disease_name, pr.drug_name, COUNT(*) AS count
FROM prescriptions pr
JOIN diseases d ON pr.disease_id = d.disease_id
GROUP BY d.disease_name, pr.drug_name
HAVING COUNT(*) = (
    SELECT MAX(counts) FROM (
        SELECT disease_id, drug_name, COUNT(*) AS counts
        FROM prescriptions
        GROUP BY disease_id, drug_name
    ) AS sub
    WHERE sub.disease_id = d.disease_id
)
ORDER BY d.disease_name;

-- 9. Cities with pharmacies issuing more than 100 prescriptions
SELECT c.city_name, COUNT(pr.prescription_id) AS total_prescriptions
FROM prescriptions pr
JOIN pharmacies ph ON pr.pharmacy_id = ph.pharmacy_id
JOIN cities c ON ph.city_id = c.city_id
GROUP BY c.city_name
HAVING total_prescriptions > 100
ORDER BY total_prescriptions DESC;

-- 10. Prescription frequency per age group
SELECT
  CASE
    WHEN p.age < 18 THEN '0–17'
    WHEN p.age BETWEEN 18 AND 35 THEN '18–35'
    WHEN p.age BETWEEN 36 AND 50 THEN '36–50'
    WHEN p.age BETWEEN 51 AND 65 THEN '51–65'
    ELSE '66+'
  END AS age_group,
  COUNT(pr.prescription_id) AS total_prescriptions
FROM prescriptions pr
JOIN patients p ON pr.patient_id = p.patient_id
GROUP BY age_group
ORDER BY total_prescriptions DESC;

-- 11. Top 3 drugs prescribed in each state
SELECT s.state_name, pr.drug_name, COUNT(*) AS total
FROM prescriptions pr
JOIN pharmacies ph ON pr.pharmacy_id = ph.pharmacy_id
JOIN cities c ON ph.city_id = c.city_id
JOIN states s ON c.state_id = s.state_id
GROUP BY s.state_name, pr.drug_name
ORDER BY s.state_name, total DESC;

-- 12. Patients with no prescriptions in the last year
SELECT p.patient_id, p.full_name
FROM patients p
WHERE p.patient_id NOT IN (
    SELECT DISTINCT patient_id
    FROM prescriptions
    WHERE prescription_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);
