-- CROWNFIELD EYE HOSPITAL DATABASE
-- FILE: 03_database_testing.sql
-- PURPOSE: Test record counts, UPDATE and DELETE operations.

USE crownfield_eye_hospital;

-- Display the number of records in all 12 tables.

SELECT 'patient' AS table_name, COUNT(*) AS total_records FROM patient
UNION ALL
SELECT 'specialty', COUNT(*) FROM specialty
UNION ALL
SELECT 'clinician', COUNT(*) FROM clinician
UNION ALL
SELECT 'clinic', COUNT(*) FROM clinic
UNION ALL
SELECT 'appointment', COUNT(*) FROM appointment
UNION ALL
SELECT 'diagnosis', COUNT(*) FROM diagnosis
UNION ALL
SELECT 'appointment_diagnosis', COUNT(*) FROM appointment_diagnosis
UNION ALL
SELECT 'prescription', COUNT(*) FROM prescription
UNION ALL
SELECT 'medicine', COUNT(*) FROM medicine
UNION ALL
SELECT 'prescription_item', COUNT(*) FROM prescription_item
UNION ALL
SELECT 'follow_up', COUNT(*) FROM follow_up
UNION ALL
SELECT 'appointment_audit', COUNT(*) FROM appointment_audit;


-- Test UPDATE using a transaction.

START TRANSACTION;

UPDATE follow_up
SET status = 'Completed'
WHERE follow_up_id = 1;

SELECT *
FROM follow_up
WHERE follow_up_id = 1;

ROLLBACK;

-- Test DELETE using a transaction.

START TRANSACTION;

DELETE FROM appointment_diagnosis
WHERE appointment_id = 10
AND diagnosis_id = 7;

SELECT *
FROM appointment_diagnosis
WHERE appointment_id = 10;

ROLLBACK;

-- Verify that the deleted record was restored.

SELECT *
FROM appointment_diagnosis
WHERE appointment_id = 10
AND diagnosis_id = 7;
