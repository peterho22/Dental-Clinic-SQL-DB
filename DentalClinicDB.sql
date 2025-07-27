/* ============================================
   Dental Clinic SQL Database Project
   Made by Peter Ho
   Description:
   - Creates a normalized database for a dental clinic
   - Includes tables for patients, employees, visits, payments, and procedures
   - Inserts sample data for testing
   - Demonstrates basic SELECT queries
   ============================================ */

/* ============================================
   CREATE TABLES SECTION
   ============================================ */

-- Table: Persons
-- Stores personal information for both patients and employees
CREATE TABLE Persons (
    persons_id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    address VARCHAR(255),
    door_number VARCHAR(10),
    street_name VARCHAR(100),
    zip_code VARCHAR(10),
    state VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

-- Table: Employees
-- Stores employee data and links to Persons table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    persons_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (persons_id) REFERENCES Persons(persons_id)
);

-- Table: Dentist
-- Identifies which employees are dentists
CREATE TABLE Dentist (
    dentist_id INT PRIMARY KEY,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Table: Hygienist
-- Identifies which employees are hygienists
CREATE TABLE Hygienist (
    hygienist_id INT PRIMARY KEY,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Table: Patients
-- Stores patients and links to Persons table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    persons_id INT,
    FOREIGN KEY (persons_id) REFERENCES Persons(persons_id)
);

-- Table: Insurance
-- Stores insurance details for insured patients
CREATE TABLE Insurance (
    policy_number INT PRIMARY KEY,
    provider_number INT,
    provider_name VARCHAR(100),
    patient_id INT UNIQUE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Table: SelfPaying
-- Stores card details for patients who pay out-of-pocket
CREATE TABLE SelfPaying (
    patient_id INT PRIMARY KEY,
    card_number BIGINT NOT NULL,
    expiration_date DATE NOT NULL,
    security_number INT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Table: Visits
-- Tracks each dental visit, linking patients to dentist and hygienist
CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    patient_id INT,
    dentist_id INT,
    hygienist_id INT,
    visit_date DATE,
    next_visit_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (dentist_id) REFERENCES Dentist(dentist_id),
    FOREIGN KEY (hygienist_id) REFERENCES Hygienist(hygienist_id)
);

-- Table: DentalRecords
-- Stores dental history, including x-rays and past procedures
CREATE TABLE DentalRecords (
    record_id INT PRIMARY KEY,
    patient_id INT,
    x_rays TEXT,
    past_procedures TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Table: Procedures
-- Stores available dental procedures
CREATE TABLE Procedures (
    procedure_id INT PRIMARY KEY,
    procedure_name VARCHAR(100),
    description TEXT
);

-- Table: ProceduresPerVisit
-- Links procedures to specific visits with associated cost
CREATE TABLE ProceduresPerVisit (
    visit_id INT,
    procedure_id INT,
    cost DECIMAL(10,2),
    PRIMARY KEY (visit_id, procedure_id),
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id),
    FOREIGN KEY (procedure_id) REFERENCES Procedures(procedure_id)
);




/* ============================================
   INSERT SAMPLE DATA SECTION
   ============================================ */

-- Insert sample persons (employees and patients)
INSERT INTO Persons (persons_id, name, date_of_birth, address, door_number, street_name, zip_code, state, email, phone_number)
VALUES
(1, 'John Doe', '1985-06-15', '123 Main St', '123', 'Main St', '90210', 'CA', 'john.doe@example.com', '555-123-4567'),
(2, 'Jane Smith', '1990-03-22', '456 Oak Lane', '456', 'Oak Lane', '10001', 'NY', 'jane.smith@example.com', '555-987-6543'),
(3, 'Mike Johnson', '1978-12-05', '789 Pine Ave', '789', 'Pine Ave', '60614', 'IL', 'mike.j@example.com', '555-222-3333'),
(4, 'Lisa Carter', '2000-07-09', '321 Maple Rd', '321', 'Maple Rd', '73301', 'TX', 'lisa.carter@example.com', '555-444-5555'),
(5, 'Dr. Emily White', '1972-01-30', '654 Cedar St', '654', 'Cedar St', '30303', 'GA', 'emily.white@dentalpro.com', '555-666-7777'),
(6, 'Dr. David Lee', '1980-11-02', '987 Birch St', '987', 'Birch St', '94110', 'CA', 'david.lee@dentalpro.com', '555-888-1111'),
(7, 'Dr. Sarah Kim', '1986-08-17', '222 Aspen Ave', '222', 'Aspen Ave', '75201', 'TX', 'sarah.kim@dentalpro.com', '555-888-2222'),
(8, 'Ava Patel', '1992-04-12', '111 Elm St', '111', 'Elm St', '33101', 'FL', 'ava.patel@dentalpro.com', '555-888-3333'),
(9, 'Chris Nguyen', '1995-09-28', '555 Spruce Blvd', '555', 'Spruce Blvd', '98101', 'WA', 'chris.nguyen@dentalpro.com', '555-888-4444'),
(10, 'Dr. Rachel Moore', '1975-02-13', '77 Magnolia Rd', '77', 'Magnolia Rd', '19103', 'PA', 'rachel.moore@dentalpro.com', '555-999-0001'),
(11, 'Sophia Gonzalez', '1993-05-27', '12 Willow Ln', '12', 'Willow Ln', '44101', 'OH', 'sophia.g@dentalpro.com', '555-999-0002'),
(12, 'Liam Turner', '1991-10-30', '33 Redwood Ct', '33', 'Redwood Ct', '63101', 'MO', 'liam.turner@dentalpro.com', '555-999-0003'),
(13, 'Noah Miller', '2001-01-10', '22 Palm Dr', '22', 'Palm Dr', '33101', 'FL', 'noah.miller@email.com', '555-100-2001'),
(14, 'Olivia Harris', '1998-06-05', '88 Cypress Ave', '88', 'Cypress Ave', '30303', 'GA', 'olivia.harris@email.com', '555-100-2002'),
(15, 'Ethan Wright', '1989-09-17', '19 Dogwood Ln', '19', 'Dogwood Ln', '75201', 'TX', 'ethan.wright@email.com', '555-100-2003'),
(16, 'Emma Scott', '1995-04-22', '123 Lakeview Blvd', '123', 'Lakeview Blvd', '94110', 'CA', 'emma.scott@email.com', '555-100-2004'),
(17, 'William Green', '1983-12-11', '7 Bay St', '7', 'Bay St', '60614', 'IL', 'will.green@email.com', '555-100-2005'),
(18, 'Grace Bennett', '1994-11-03', '45 Sunrise Blvd', '45', 'Sunrise Blvd', '19104', 'PA', 'grace.bennett@email.com', '555-300-4001'),
(19, 'Lucas Reed', '1988-02-21', '78 Riverwalk Dr', '78', 'Riverwalk Dr', '75001', 'TX', 'lucas.reed@email.com', '555-300-4002'),
(20, 'Chloe Rivera', '2002-08-14', '91 Highland St', '91', 'Highland St', '60611', 'IL', 'chloe.rivera@email.com', '555-300-4003'),
(21, 'Isabella Morgan', '1990-07-06', '200 Pearl St', '200', 'Pearl St', '10001', 'NY', 'isabella.morgan@email.com', '555-400-5001'),
(22, 'Daniel Carter', '1982-03-29', '77 Laurel Ln', '77', 'Laurel Ln', '85001', 'AZ', 'daniel.carter@email.com', '555-400-5002');

-- Insert employees
INSERT INTO Employees (employee_id, persons_id, salary)
VALUES
(101, 5, 95000.00),
(102, 3, 87000.00),
(103, 2, 62000.00),
(104, 6, 93000.00),
(105, 7, 91000.00),
(106, 8, 60000.00),
(107, 9, 58000.00),
(108, 10, 94000.00),
(109, 11, 59000.00),
(110, 12, 61000.00);

-- Insert dentists
INSERT INTO Dentist (dentist_id, employee_id)
VALUES
(201, 101),
(202, 102),
(203, 104),
(204, 105),
(205, 108);

-- Insert hygienists
INSERT INTO Hygienist (hygienist_id, employee_id)
VALUES
(301, 103),
(302, 106),
(303, 107),
(304, 109),
(305, 110);

-- Insert patients
INSERT INTO Patients (patient_id, persons_id)
VALUES
(401, 13),
(402, 14),
(403, 15),
(404, 16),
(405, 17),
(406, 18),
(407, 19),
(408, 20),
(409, 21),
(410, 22);

-- Insert insurance records
INSERT INTO Insurance (policy_number, provider_number, provider_name, patient_id)
VALUES
(1001, 55501, 'Delta Dental', 402),
(1002, 55502, 'Aetna', 403),
(1003, 55503, 'MetLife Dental', 405),
(1004, 55504, 'Cigna', 409),
(1005, 55505, 'Guardian Dental', 410);

-- Insert self-paying card info
INSERT INTO SelfPaying (patient_id, card_number, expiration_date, security_number)
VALUES
(401, 4532123412341234, '2026-09-30', 123),
(404, 5500001111222233, '2027-03-31', 456),
(406, 4024007123456789, '2025-12-31', 789),
(407, 6011556448578945, '2028-05-31', 321),
(408, 371449635398431, '2026-08-31', 654);

-- Insert visits
INSERT INTO Visits (visit_id, patient_id, dentist_id, hygienist_id, visit_date, next_visit_date)
VALUES
(501, 401, 201, 301, '2024-11-01', '2025-05-01'),
(502, 402, 202, 302, '2024-11-03', '2025-05-03'),
(503, 403, 203, 303, '2024-11-05', '2025-05-05'),
(504, 404, 204, 304, '2024-11-07', '2025-05-07'),
(505, 405, 205, 305, '2024-11-09', '2025-05-09');

-- Insert dental records
INSERT INTO DentalRecords (record_id, patient_id, x_rays, past_procedures)
VALUES
(601, 401, 'X-Ray: No issues detected.', 'Cleaning (2024-05-01)'),
(602, 402, 'X-Ray: Slight cavity on molar.', 'Filling (2023-12-15), Cleaning (2024-06-10)'),
(603, 403, 'X-Ray: Wisdom teeth impacted.', 'Extraction (2023-08-22), Cleaning (2024-04-05)'),
(604, 404, 'X-Ray: Normal.', 'Cleaning (2024-03-12)'),
(605, 405, 'X-Ray: Minor gum recession.', 'Deep Cleaning (2024-01-30), Scaling (2023-11-18)');

-- Insert procedures
INSERT INTO Procedures (procedure_id, procedure_name, description)
VALUES
(701, 'Teeth Cleaning', 'Standard dental cleaning to remove plaque and tartar.'),
(702, 'Cavity Filling', 'Composite filling of a small cavity.'),
(703, 'Tooth Extraction', 'Removal of impacted or damaged tooth.'),
(704, 'Scaling and Root Planing', 'Deep cleaning below the gumline.'),
(705, 'X-Ray Imaging', 'Dental X-ray scan to detect internal issues.');

-- Link procedures to visits with cost
INSERT INTO ProceduresPerVisit (visit_id, procedure_id, cost)
VALUES
(501, 701, 120.00),
(502, 702, 200.00),
(503, 703, 350.00),
(504, 704, 275.00),
(505, 705, 90.00);



/* ============================================
   TEST QUERIES SECTION
   ============================================ */

-- View all tables for verification
SELECT * FROM Persons;
SELECT * FROM Employees;
SELECT * FROM Dentist;
SELECT * FROM Hygienist;
SELECT * FROM Patients;
SELECT * FROM Insurance;
SELECT * FROM SelfPaying;
SELECT * FROM Visits;
SELECT * FROM DentalRecords;
SELECT * FROM Procedures;
SELECT * FROM ProceduresPerVisit;