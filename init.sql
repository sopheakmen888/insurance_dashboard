-- Create a new database
CREATE DATABASE pkmis_db;

-- Connect to the new database
\c pkmis_db;

-- Enable the pgcrypto extension for password hashing
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Create a new user with a password
CREATE USER admin1 WITH ENCRYPTED PASSWORD 'admin1111';

-- Grant privileges to the user
GRANT ALL PRIVILEGES ON DATABASE pkmis_db TO admin1;

-- Create the users table with a hashed password
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample users with hashed passwords
INSERT INTO users (name, email, password) VALUES 
('sopheak', 'sopheak@demo.com', crypt('pass123', gen_salt('bf',10))),
('sophea', 'sophea@demo.com', crypt('pass123', gen_salt('bf',10)));

CREATE TABLE company (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    contact_email VARCHAR(255),
    phone_number VARCHAR(20),
    address TEXT,
    industry_type VARCHAR(255),
    license_number VARCHAR(100)
);

CREATE TABLE insurance_broker (
    id SERIAL PRIMARY KEY,
    broker_name VARCHAR(255) NOT NULL,
    contact_email VARCHAR(255),
    phone_number VARCHAR(20),
    address TEXT,
    license_number VARCHAR(100)
);

CREATE TABLE quotation (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES company(id) ON DELETE CASCADE,
    insurance_broker_id INT REFERENCES insurance_broker(id) ON DELETE SET NULL,
    date_issued DATE NOT NULL,
    proposed_premium DECIMAL(10,2),
    sum_insured DECIMAL(10,2),
    coverage_details TEXT,
    quotation_status VARCHAR(50),
    acceptance_date DATE
);

CREATE TABLE insurance_policy (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES company(id) ON DELETE CASCADE,
    quotation_id INT REFERENCES quotation(id) ON DELETE SET NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    package_name VARCHAR(255),
    policy_name VARCHAR(255),
    policy_type VARCHAR(100),
    is_terminated BOOLEAN DEFAULT FALSE,
    terminated_date DATE
);

CREATE TABLE insurance_policy_premium (
    id SERIAL PRIMARY KEY,
    insurance_policy_id INT REFERENCES insurance_policy(id) ON DELETE CASCADE,
    premium_type VARCHAR(100),
    premium_amount DECIMAL(10,2)
);

CREATE TABLE insurance_policy_benefit (
    id SERIAL PRIMARY KEY,
    insurance_policy_id INT REFERENCES insurance_policy(id) ON DELETE CASCADE,
    benefit_name VARCHAR(255),
    coverage_amount DECIMAL(10,2)
);

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES company(id) ON DELETE CASCADE,
    staff_id VARCHAR(50) UNIQUE NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    phone_number VARCHAR(20),
    email VARCHAR(255)
);




CREATE TABLE insured_coverage (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employee(id) ON DELETE CASCADE,
    insurance_policy_id INT REFERENCES insurance_policy(id) ON DELETE CASCADE,
    date_of_birth DATE,
    member_card_number VARCHAR(100) UNIQUE,
    coverage_start_date DATE NOT NULL,
    coverage_end_date DATE NOT NULL,
    status VARCHAR(50)
);

CREATE TABLE health_facility (
    id SERIAL PRIMARY KEY,
    health_facility_name VARCHAR(255) NOT NULL,
    is_partner_hf BOOLEAN DEFAULT FALSE,
    phone_number VARCHAR(20),
    location TEXT,
    email VARCHAR(255)
);

CREATE TABLE claim (
    id SERIAL PRIMARY KEY,
    insured_coverage_id INT REFERENCES insured_coverage(id) ON DELETE CASCADE,
    health_facility_id INT REFERENCES health_facility(id) ON DELETE SET NULL,
    date_of_service DATE NOT NULL,
    total_billed_amount DECIMAL(10,2),
    claimed_amount DECIMAL(10,2),
    claim_status VARCHAR(50),
    rejection_reason TEXT,
    approval_date DATE
);

CREATE TABLE claim_document (
    id SERIAL PRIMARY KEY,
    claim_id INT REFERENCES claim(id) ON DELETE CASCADE,
    document_type VARCHAR(255),
    submission_date DATE NOT NULL,
    file_path TEXT
);

-- Company 1
INSERT INTO company (id, company_name, contact_email, phone_number, address, industry_type, license_number)
VALUES (1, 'Cambodia Tech Innovations', 'contact@cambodiatech.com', '+855 23 123 456', 'Phnom Penh, Cambodia', 'Technology', 'CTI-001');

-- Company 2
INSERT INTO company (id, company_name, contact_email, phone_number, address, industry_type, license_number)
VALUES (2, 'Cambodia Retail Group', 'info@cambodiaretail.com', '+855 12 234 567', 'Siem Reap, Cambodia', 'Retail', 'CRG-002');

-- Company 3
INSERT INTO company (id, company_name, contact_email, phone_number, address, industry_type, license_number)
VALUES (3, 'Angkor Logistics', 'support@angkorlogistics.com', '+855 96 345 678', 'Battambang, Cambodia', 'Logistics', 'AL-003');

-- Company 4
INSERT INTO company (id, company_name, contact_email, phone_number, address, industry_type, license_number)
VALUES (4, 'Phnom Penh Healthcare', 'contact@pphealthcare.com', '+855 23 987 654', 'Phnom Penh, Cambodia', 'Healthcare', 'PPH-004');

-- Company 5
INSERT INTO company (id, company_name, contact_email, phone_number, address, industry_type, license_number)
VALUES (5, 'Cambodia Manufacturing Ltd.', 'sales@cambodiamanufacturing.com', '+855 92 876 543', 'Kampong Cham, Cambodia', 'Manufacturing', 'CML-005');

-- Broker 1
INSERT INTO insurance_broker (id, broker_name, contact_email, phone_number, address, license_number)
VALUES (1, 'Phnom Penh Insurance Brokers', 'contact@ppbrokers.com', '+855 23 456 789', 'Phnom Penh, Cambodia', 'PPB-001');

-- Broker 2
INSERT INTO insurance_broker (id, broker_name, contact_email, phone_number, address, license_number)
VALUES (2, 'Siem Reap Insurance Experts', 'info@siemreapbrokers.com', '+855 12 567 890', 'Siem Reap, Cambodia', 'SRE-002');

-- Broker 3
INSERT INTO insurance_broker (id, broker_name, contact_email, phone_number, address, license_number)
VALUES (3, 'Angkor Insurance Solutions', 'support@angkorbrokers.com', '+855 96 678 123', 'Siem Reap, Cambodia', 'AIS-003');

-- Broker 1 (1 quotation)
INSERT INTO quotation (id, company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date)
VALUES (1, 1, 1, '2025-01-15', 1500.00, 50000.00, 'Basic Coverage for Tech Assets', 'Pending', NULL);

-- Broker 2 (2 quotations)
-- Quotation 1
INSERT INTO quotation (id, company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date)
VALUES (2, 2, 2, '2025-01-18', 2500.00, 75000.00, 'Retail Property and Liability Insurance', 'Pending', NULL);

-- Quotation 2
INSERT INTO quotation (id, company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date)
VALUES (3, 2, 2, '2025-01-20', 2000.00, 60000.00, 'Inventory Insurance for Retail Business', 'Pending', NULL);

-- Broker 3 (3 quotations)
-- Quotation 1
INSERT INTO quotation (id, company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date)
VALUES (4, 3, 3, '2025-01-22', 3000.00, 100000.00, 'Logistics and Fleet Insurance', 'Pending', NULL);

-- Quotation 2
INSERT INTO quotation (id, company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date)
VALUES (5, 3, 3, '2025-01-25', 4000.00, 120000.00, 'Comprehensive Coverage for Logistics Operations', 'Pending', NULL);

-- Quotation 3
INSERT INTO quotation (id, company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date)
VALUES (6, 3, 3, '2025-01-28', 3500.00, 110000.00, 'Health and Safety Insurance for Warehouse Employees', 'Pending', NULL);


-- Insurance Policy for Quotation ID 1
INSERT INTO insurance_policy (id, company_id, quotation_id, start_date, end_date, package_name, policy_name, policy_type)
VALUES (1, 1, 1, '2025-03-01', '2026-03-01', 'Tech Asset Protection', 'Basic Health Coverage', 'Health');

-- Insurance Policy Premium for Quotation ID 1
INSERT INTO insurance_policy_premium (id, insurance_policy_id, premium_type, premium_amount)
VALUES (1, 1, 'Annual Premium', 15.00);

-- Insurance Policy Benefits for Quotation ID 1
INSERT INTO insurance_policy_benefit (id, insurance_policy_id, benefit_name, coverage_amount)
VALUES
    (1, 1, 'Medical Treatment', 3000.00),
    (2, 1, 'Emergency Assistance', 150.00);


-- Insurance Policy for Quotation ID 2 (1st Policy)
INSERT INTO insurance_policy (id, company_id, quotation_id, start_date, end_date, package_name, policy_name, policy_type)
VALUES (2, 2, 2, '2025-02-15', '2026-02-15', 'Retail Store Protection', 'Employee Health Coverage', 'Health');

-- Insurance Policy Premium for Quotation ID 2 (1st Policy)
INSERT INTO insurance_policy_premium (id, insurance_policy_id, premium_type, premium_amount)
VALUES (2, 2, 'Annual Premium', 20.00);

-- Insurance Policy Benefits for Quotation ID 2 (1st Policy)
INSERT INTO insurance_policy_benefit (id, insurance_policy_id, benefit_name, coverage_amount)
VALUES
    (3, 2, 'Medical Expenses', 2500.00),
    (4, 2, 'Hospitalization', 2000.00);

-- Insurance Policy for Quotation ID 2 (2nd Policy)
INSERT INTO insurance_policy (id, company_id, quotation_id, start_date, end_date, package_name, policy_name, policy_type)
VALUES (3, 2, 2, '2025-02-15', '2026-02-15', 'Retail Store Protection', 'Employee Health Coverage', 'Health');

-- Insurance Policy Premium for Quotation ID 2 (2nd Policy)
INSERT INTO insurance_policy_premium (id, insurance_policy_id, premium_type, premium_amount)
VALUES (3, 3, 'Annual Premium', 18.00);

-- Insurance Policy Benefits for Quotation ID 2 (2nd Policy)
INSERT INTO insurance_policy_benefit (id, insurance_policy_id, benefit_name, coverage_amount)
VALUES
    (5, 3, 'Medical Expenses', 3000.00),
    (6, 3, 'Emergency Assistance', 150.00),
    (7, 3, 'Dental Coverage', 500.00);


-- Insurance Policy for Quotation ID 4
UPDATE quotation
SET quotation_status = 'Accepted', acceptance_date = '2024-12-12'
WHERE id = 4;

-- Insurance Policy for Quotation ID 4
INSERT INTO insurance_policy (id, company_id, quotation_id, start_date, end_date, package_name, policy_name, policy_type)
VALUES (4, 3, 4, '2025-01-01', '2026-01-01', 'Logistics Health Protection', 'Employee Health Insurance', 'Health');

-- Insurance Policy Premium for Quotation ID 4
INSERT INTO insurance_policy_premium (id, insurance_policy_id, premium_type, premium_amount)
VALUES (4, 4, 'Annual Premium', 2500.00);

-- Insurance Policy Benefits for Quotation ID 4
INSERT INTO insurance_policy_benefit (id, insurance_policy_id, benefit_name, coverage_amount)
VALUES
    (8, 4, 'Medical Treatment', 40000.00),
    (9, 4, 'Emergency Assistance', 20000.00);

INSERT INTO employee (id, company_id, staff_id, full_name, date_of_birth, gender, phone_number, email)
VALUES
    (1, 1, 'EMP001', 'Sokha Chan', '1990-05-12', 'Male', '+855 12 345 678', 'sokha.chan@cambodiatech.com'),
    (2, 1, 'EMP002', 'Dara Meas', '1988-09-23', 'Male', '+855 96 987 654', 'dara.meas@cambodiatech.com'),
    (3, 1, 'EMP003', 'Sreyneang Heng', '1992-07-15', 'Female', '+855 11 567 890', 'sreyneang.heng@cambodiatech.com'),
    (4, 1, 'EMP004', 'Piseth Kim', '1995-02-28', 'Male', '+855 10 678 901', 'piseth.kim@cambodiatech.com'),
    (5, 1, 'EMP005', 'Sopheap Chhim', '1993-11-04', 'Female', '+855 92 432 109', 'sopheap.chhim@cambodiatech.com'),
    (6, 1, 'EMP006', 'Visal Roeun', '1991-06-18', 'Male', '+855 77 234 567', 'visal.roeun@cambodiatech.com'),
    (7, 1, 'EMP007', 'Rathana Kong', '1989-12-30', 'Female', '+855 98 345 678', 'rathana.kong@cambodiatech.com'),
    (8, 1, 'EMP008', 'Sokunthea Ly', '1996-03-25', 'Female', '+855 85 876 543', 'sokunthea.ly@cambodiatech.com'),
    (9, 1, 'EMP009', 'Borey Ou', '1994-08-10', 'Male', '+855 15 654 321', 'borey.ou@cambodiatech.com'),
    (10, 1, 'EMP010', 'Monyreak Prak', '1997-04-22', 'Male', '+855 70 789 012', 'monyreak.prak@cambodiatech.com');


INSERT INTO employee (id, company_id, staff_id, full_name, date_of_birth, gender, phone_number, email)
VALUES
(11, 2, 'EMP011', 'Sovann Reach', '1990-05-12', 'Male', '+855 92 123 011', 'sovann.reach@cambodiaretail.com'),
(12, 2, 'EMP012', 'Davin Ngin', '1988-11-23', 'Female', '+855 92 123 012', 'davin.ngin@cambodiaretail.com'),
(13, 2, 'EMP013', 'Piseth Men', '1995-07-08', 'Male', '+855 92 123 013', 'piseth.men@cambodiaretail.com'),
(14, 2, 'EMP014', 'Sokleap Keo', '1992-04-15', 'Female', '+855 92 123 014', 'sokleap.keo@cambodiaretail.com'),
(15, 2, 'EMP015', 'Makara Seng', '1997-09-30', 'Male', '+855 92 123 015', 'makara.seng@cambodiaretail.com'),
(16, 2, 'EMP016', 'Sreymom Khin', '1985-06-21', 'Female', '+855 92 123 016', 'sreymom.khin@cambodiaretail.com'),
(17, 2, 'EMP017', 'Chhunly Taing', '1993-02-18', 'Male', '+855 92 123 017', 'chhunly.taing@cambodiaretail.com'),
(18, 2, 'EMP018', 'Socheata Phan', '1991-12-10', 'Female', '+855 92 123 018', 'socheata.phan@cambodiaretail.com'),
(19, 2, 'EMP019', 'Vibol Nou', '1996-08-22', 'Male', '+855 92 123 019', 'vibol.nou@cambodiaretail.com'),
(20, 2, 'EMP020', 'Chansokha Chea', '1989-03-07', 'Female', '+855 92 123 020', 'chansokha.chea@cambodiaretail.com'),
(21, 2, 'EMP021', 'Sokun Vong', '1994-11-05', 'Male', '+855 92 123 021', 'sokun.vong@cambodiaretail.com'),
(22, 2, 'EMP022', 'Sokha Peou', '1998-07-19', 'Female', '+855 92 123 022', 'sokha.peou@cambodiaretail.com'),
(23, 2, 'EMP023', 'Visoth Roeun', '1990-09-25', 'Male', '+855 92 123 023', 'visoth.roeun@cambodiaretail.com'),
(24, 2, 'EMP024', 'Rachana Im', '1987-01-31', 'Female', '+855 92 123 024', 'rachana.im@cambodiaretail.com'),
(25, 2, 'EMP025', 'Chhun Nhim', '1993-06-28', 'Male', '+855 92 123 025', 'chhun.nhim@cambodiaretail.com'),
(26, 2, 'EMP026', 'Sreyroth Chhun', '1995-10-14', 'Female', '+855 92 123 026', 'sreyroth.chhun@cambodiaretail.com'),
(27, 2, 'EMP027', 'Rith Nget', '1988-04-17', 'Male', '+855 92 123 027', 'rith.nget@cambodiaretail.com'),
(28, 2, 'EMP028', 'Chenda Ly', '1997-08-29', 'Female', '+855 92 123 028', 'chenda.ly@cambodiaretail.com'),
(29, 2, 'EMP029', 'Sarin Pou', '1992-12-03', 'Male', '+855 92 123 029', 'sarin.pou@cambodiaretail.com'),
(30, 2, 'EMP030', 'Vichheka Say', '1989-07-20', 'Female', '+855 92 123 030', 'vichheka.say@cambodiaretail.com'),
(31, 2, 'EMP031', 'Bunna Mao', '1996-05-11', 'Male', '+855 92 123 031', 'bunna.mao@cambodiaretail.com'),
(32, 2, 'EMP032', 'Sokun Pan', '1994-03-15', 'Female', '+855 92 123 032', 'sokun.pan@cambodiaretail.com'),
(33, 2, 'EMP033', 'Vutha Nem', '1986-10-02', 'Male', '+855 92 123 033', 'vutha.nem@cambodiaretail.com');

INSERT INTO employee (id, company_id, staff_id, full_name, date_of_birth, gender, phone_number, email)
VALUES
(34, 3, 'EMP034', 'Sovann Reach', '1990-05-12', 'Male', '+855 93 123 034', 'sovann.reach@cambodiaindustry.com'),
(35, 3, 'EMP035', 'Davin Ngin', '1988-11-23', 'Female', '+855 93 123 035', 'davin.ngin@cambodiaindustry.com'),
(36, 3, 'EMP036', 'Piseth Men', '1995-07-08', 'Male', '+855 93 123 036', 'piseth.men@cambodiaindustry.com'),
(37, 3, 'EMP037', 'Sokleap Keo', '1992-04-15', 'Female', '+855 93 123 037', 'sokleap.keo@cambodiaindustry.com'),
(38, 3, 'EMP038', 'Makara Seng', '1997-09-30', 'Male', '+855 93 123 038', 'makara.seng@cambodiaindustry.com'),
(39, 3, 'EMP039', 'Sreymom Khin', '1985-06-21', 'Female', '+855 93 123 039', 'sreymom.khin@cambodiaindustry.com'),
(40, 3, 'EMP040', 'Chhunly Taing', '1993-02-18', 'Male', '+855 93 123 040', 'chhunly.taing@cambodiaindustry.com'),
(41, 3, 'EMP041', 'Socheata Phan', '1991-12-10', 'Female', '+855 93 123 041', 'socheata.phan@cambodiaindustry.com'),
(42, 3, 'EMP042', 'Vibol Nou', '1996-08-22', 'Male', '+855 93 123 042', 'vibol.nou@cambodiaindustry.com'),
(43, 3, 'EMP043', 'Chansokha Chea', '1989-03-07', 'Female', '+855 93 123 043', 'chansokha.chea@cambodiaindustry.com'),
(44, 3, 'EMP044', 'Sokun Vong', '1994-11-05', 'Male', '+855 93 123 044', 'sokun.vong@cambodiaindustry.com'),
(45, 3, 'EMP045', 'Sokha Peou', '1998-07-19', 'Female', '+855 93 123 045', 'sokha.peou@cambodiaindustry.com'),
(46, 3, 'EMP046', 'Visoth Roeun', '1990-09-25', 'Male', '+855 93 123 046', 'visoth.roeun@cambodiaindustry.com'),
(47, 3, 'EMP047', 'Rachana Im', '1987-01-31', 'Female', '+855 93 123 047', 'rachana.im@cambodiaindustry.com'),
(48, 3, 'EMP048', 'Chhun Nhim', '1993-06-28', 'Male', '+855 93 123 048', 'chhun.nhim@cambodiaindustry.com'),
(49, 3, 'EMP049', 'Sreyroth Chhun', '2008-10-14', 'Female', '+855 93 123 049', 'sreyroth.chhun@cambodiaindustry.com'), -- Under 18
(50, 3, 'EMP050', 'Rith Nget', '2009-08-29', 'Male', '+855 93 123 050', 'rith.nget@cambodiaindustry.com'), -- Under 18
(51, 3, 'EMP051', 'Chenda Ly', '2010-05-03', 'Female', '+855 93 123 051', 'chenda.ly@cambodiaindustry.com'), -- Under 18
(52, 3, 'EMP052', 'Sarin Pou', '1992-12-03', 'Male', '+855 93 123 052', 'sarin.pou@cambodiaindustry.com');

INSERT INTO employee (id, company_id, staff_id, full_name, date_of_birth, gender, phone_number, email)
VALUES
(53, 3, 'EMP053', 'Reach Sovann', '1990-05-12', 'Male', '+855 94 123 053', 'reach.sovann@cambodiaindustry.com'),
(54, 3, 'EMP054', 'Ngin Davin', '1988-11-23', 'Female', '+855 94 123 054', 'ngin.davin@cambodiaindustry.com'),
(55, 3, 'EMP055', 'Men Piseth', '1995-07-08', 'Male', '+855 94 123 055', 'men.piseth@cambodiaindustry.com'),
(56, 3, 'EMP056', 'Keo Sokleap', '1992-04-15', 'Female', '+855 94 123 056', 'keo.sokleap@cambodiaindustry.com'),
(57, 3, 'EMP057', 'Seng Makara', '1997-09-30', 'Male', '+855 94 123 057', 'seng.makara@cambodiaindustry.com'),
(58, 3, 'EMP058', 'Khin Sreymom', '1985-06-21', 'Female', '+855 94 123 058', 'khin.sreymom@cambodiaindustry.com'),
(59, 3, 'EMP059', 'Taing Chhunly', '1993-02-18', 'Male', '+855 94 123 059', 'taing.chhunly@cambodiaindustry.com'),
(60, 3, 'EMP060', 'Phan Socheata', '1991-12-10', 'Female', '+855 94 123 060', 'phan.socheata@cambodiaindustry.com'),
(61, 3, 'EMP061', 'Nou Vibol', '1996-08-22', 'Male', '+855 94 123 061', 'nou.vibol@cambodiaindustry.com'),
(62, 3, 'EMP062', 'Chea Chansokha', '1989-03-07', 'Female', '+855 94 123 062', 'chea.chansokha@cambodiaindustry.com'),
(63, 3, 'EMP063', 'Vong Sokun', '1960-11-05', 'Male', '+855 94 123 063', 'vong.sokun@cambodiaindustry.com'), -- Over 60
(64, 3, 'EMP064', 'Peou Sokha', '1959-07-19', 'Female', '+855 94 123 064', 'peou.sokha@cambodiaindustry.com'), -- Over 60
(65, 3, 'EMP065', 'Roeun Visoth', '1990-09-25', 'Male', '+855 94 123 065', 'roeun.visoth@cambodiaindustry.com'),
(66, 3, 'EMP066', 'Im Rachana', '1987-01-31', 'Female', '+855 94 123 066', 'im.rachana@cambodiaindustry.com'),
(67, 3, 'EMP067', 'Nhim Chhun', '1993-06-28', 'Male', '+855 94 123 067', 'nhim.chhun@cambodiaindustry.com'),
(68, 3, 'EMP068', 'Chhun Sreyroth', '1995-10-14', 'Female', '+855 94 123 068', 'chhun.sreyroth@cambodiaindustry.com');


INSERT INTO employee (id, company_id, staff_id, full_name, date_of_birth, gender, phone_number, email)
VALUES
(69, 4, 'EMP069', 'Alexander Schmidt', '1985-03-22', 'Male', '+33 6 12 34 56 79', 'alexander.schmidt@europebusiness.com'),
(70, 4, 'EMP070', 'Isabelle Dupont', '1990-07-15', 'Female', '+33 6 12 34 56 80', 'isabelle.dupont@europebusiness.com'),
(71, 4, 'EMP071', 'Luca Moretti', '1992-09-10', 'Male', '+33 6 12 34 56 81', 'luca.moretti@europebusiness.com'),
(72, 4, 'EMP072', 'Sophie Müller', '1988-12-05', 'Female', '+33 6 12 34 56 82', 'sophie.muller@europebusiness.com'),
(73, 4, 'EMP073', 'Henrik Johansson', '1995-06-30', 'Male', '+33 6 12 34 56 83', 'henrik.johansson@europebusiness.com'),
(74, 4, 'EMP074', 'Emma Fischer', '1993-08-21', 'Female', '+33 6 12 34 56 84', 'emma.fischer@europebusiness.com'),
(75, 4, 'EMP075', 'Tomáš Novák', '1980-04-12', 'Male', '+33 6 12 34 56 85', 'tomas.novak@europebusiness.com'),
(76, 4, 'EMP076', 'Elena Petrova', '1991-11-28', 'Female', '+33 6 12 34 56 86', 'elena.petrova@europebusiness.com'),
(77, 4, 'EMP077', 'Frederik Andersen', '1978-02-17', 'Male', '+33 6 12 34 56 87', 'frederik.andersen@europebusiness.com'),
(78, 4, 'EMP078', 'Maria Rossi', '1996-05-08', 'Female', '+33 6 12 34 56 88', 'maria.rossi@europebusiness.com'),
(79, 4, 'EMP079', 'Jean-Paul Laurent', '1962-10-02', 'Male', '+33 6 12 34 56 89', 'jeanpaul.laurent@europebusiness.com'), -- Over 60
(80, 4, 'EMP080', 'Beatrice Fontaine', '1958-01-19', 'Female', '+33 6 12 34 56 90', 'beatrice.fontaine@europebusiness.com'), -- Over 60
(81, 4, 'EMP081', 'Oliver Becker', '1989-07-23', 'Male', '+33 6 12 34 56 91', 'oliver.becker@europebusiness.com'),
(82, 4, 'EMP082', 'Clara Lefevre', '1997-09-29', 'Female', '+33 6 12 34 56 92', 'clara.lefevre@europebusiness.com'),
(83, 4, 'EMP083', 'Noah Dubois', '2009-11-14', 'Male', '+33 6 12 34 56 93', 'noah.dubois@europebusiness.com'); -- Under 18

INSERT INTO insured_coverage (employee_id, insurance_policy_id, date_of_birth, member_card_number, coverage_start_date, coverage_end_date, status)
VALUES
(34, 3, '1992-08-15', 'MCD10034', '2025-03-01', '2026-03-01', 'Active'),
(35, 3, '1993-04-10', 'MCD10035', '2025-03-01', '2026-03-01', 'Active'),
(36, 3, '1988-11-25', 'MCD10036', '2025-03-01', '2026-03-01', 'Active'),
(37, 3, '1990-09-15', 'MCD10037', '2025-03-01', '2026-03-01', 'Active'),
(38, 3, '1995-05-30', 'MCD10038', '2025-03-01', '2026-03-01', 'Active'),
(39, 3, '1987-12-05', 'MCD10039', '2025-03-01', '2026-03-01', 'Active'),
(40, 3, '1991-01-20', 'MCD10040', '2025-03-01', '2026-03-01', 'Active'),
(41, 3, '1989-02-14', 'MCD10041', '2025-03-01', '2026-03-01', 'Active'),
(42, 3, '1994-07-18', 'MCD10042', '2025-03-01', '2026-03-01', 'Active'),
(43, 3, '1992-06-28', 'MCD10043', '2025-03-01', '2026-03-01', 'Active'),
(44, 3, '1986-03-04', 'MCD10044', '2025-03-01', '2026-03-01', 'Active'),
(45, 3, '1990-08-10', 'MCD10045', '2025-03-01', '2026-03-01', 'Active'),
(46, 3, '1993-12-25', 'MCD10046', '2025-03-01', '2026-03-01', 'Active'),
(47, 3, '1991-03-22', 'MCD10047', '2025-03-01', '2026-03-01', 'Active'),
(48, 3, '1992-05-03', 'MCD10048', '2025-03-01', '2026-03-01', 'Active'),
(49, 3, '1994-10-17', 'MCD10049', '2025-03-01', '2026-03-01', 'Active'),
(50, 3, '1989-01-12', 'MCD10050', '2025-03-01', '2026-03-01', 'Active'),
(51, 3, '1995-03-09', 'MCD10051', '2025-03-01', '2026-03-01', 'Active'),
(52, 3, '1990-11-05', 'MCD10052', '2025-03-01', '2026-03-01', 'Active'),
(53, 3, '1993-06-21', 'MCD10053', '2025-03-01', '2026-03-01', 'Active'),
(54, 3, '1991-02-01', 'MCD10054', '2025-03-01', '2026-03-01', 'Active'),
(55, 3, '1988-09-25', 'MCD10055', '2025-03-01', '2026-03-01', 'Active'),
(56, 3, '1994-04-13', 'MCD10056', '2025-03-01', '2026-03-01', 'Active'),
(57, 3, '1987-08-17', 'MCD10057', '2025-03-01', '2026-03-01', 'Active'),
(58, 3, '1990-06-30', 'MCD10058', '2025-03-01', '2026-03-01', 'Active'),
(59, 3, '1993-08-22', 'MCD10059', '2025-03-01', '2026-03-01', 'Active'),
(60, 3, '1989-12-11', 'MCD10060', '2025-03-01', '2026-03-01', 'Active'),
(61, 3, '1991-10-04', 'MCD10061', '2025-03-01', '2026-03-01', 'Active'),
(62, 3, '1986-01-28', 'MCD10062', '2025-03-01', '2026-03-01', 'Active'),
(63, 3, '1994-02-19', 'MCD10063', '2025-03-01', '2026-03-01', 'Active'),
(64, 3, '1995-11-03', 'MCD10064', '2025-03-01', '2026-03-01', 'Active'),
(65, 3, '1992-10-09', 'MCD10065', '2025-03-01', '2026-03-01', 'Active'),
(66, 3, '1994-06-04', 'MCD10066', '2025-03-01', '2026-03-01', 'Active'),
(67, 3, '1991-04-23', 'MCD10067', '2025-03-01', '2026-03-01', 'Active'),
(68, 3, '1992-07-14', 'MCD10068', '2025-03-01', '2026-03-01', 'Active');
