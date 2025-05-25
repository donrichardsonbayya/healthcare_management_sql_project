USE healthcare_db;

-- 1. Create audit table to log city additions
CREATE TABLE IF NOT EXISTS city_audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    city_name VARCHAR(100),
    state_id INT,
    action_time DATETIME
);

-- Trigger: After insert on cities
DELIMITER $$
CREATE TRIGGER after_city_insert
AFTER INSERT ON cities
FOR EACH ROW
BEGIN
    INSERT INTO city_audit_log(city_id, city_name, state_id, action_time)
    VALUES (NEW.city_id, NEW.city_name, NEW.state_id, NOW());
END$$
DELIMITER ;

-- 2. Create inventory update tracker (simulate inventory as stock_updates)
CREATE TABLE IF NOT EXISTS pharmacy_stock_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    pharmacy_id INT,
    updated_time DATETIME,
    update_note TEXT
);

-- Trigger: AFTER update simulation on pharmacy table
-- (Note: This is placeholder logic since stock/inventory table doesn't exist)
DELIMITER $$
CREATE TRIGGER after_pharmacy_update
AFTER UPDATE ON pharmacies
FOR EACH ROW
BEGIN
    INSERT INTO pharmacy_stock_log(pharmacy_id, updated_time, update_note)
    VALUES (NEW.pharmacy_id, NOW(), CONCAT('Updated pharmacy record for ', NEW.pharmacy_name));
END$$
DELIMITER ;
