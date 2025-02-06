INSERT INTO company (id,company_name, contact_email, phone_number, address, industry_type, license_number) 
VALUES 
(6,'东方科技有限公司', 'info@dongfangtech.com', '+86 10 1234 5678', '10 Keji Road, Chaoyang District, Beijing', 'Technology', 'CN12345678');


INSERT INTO quotation (company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date)
VALUES (6, 3, '2025-01-03', 300.00, 10000.00, 'Personal Accident Coverage', 'Pending', NULL);


INSERT INTO employee (company_id, staff_id, full_name, date_of_birth, gender, phone_number, email, nationality) 
VALUES 
    (6, 'CNY29', 'Wang Wei', '1985-03-15', 'Male', '+86 139 1234 5678', 'wang.wei@dongfangtech.com', 'china'),
    (6, 'CNY28', 'Li Na', '1990-07-10', 'Female', '+86 139 2345 6789', 'li.na@dongfangtech.com', 'china'),
    (6, 'CNY30', 'Zhang Qiang', '1988-11-25', 'Male', '+86 139 3456 7890', 'zhang.qiang@dongfangtech.com', 'china'),
    (6, 'CNY31', 'Liu Yang', '1988-11-25', 'Female', '+86 139 4567 8901', 'liu.yang@dongfangtech.com', 'china'),
    (6, 'CNY01', 'Chen Gang', '1987-05-12', 'Male', '+86 139 5678 9012', 'chen.gang@dongfangtech.com', 'china');


