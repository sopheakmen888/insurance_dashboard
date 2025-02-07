select * from company

INSERT INTO company (id, company_name, contact_email, phone_number, address, industry_type, license_number)
VALUES ('6', 'Dongfang Technology Co., Ltd.', 'info@dongfangtech.com', '+86 10 1234 5678', '10 Keji Road, Chaoyang District, Beijing', 'Technology', 'CN12345678');

select * from quotation
select * from insurance_broker

INSERT INTO quotation (id, company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date)
VALUES (7, 6, 3, '2025-01-03', '300.00', '1000000', 'Personal Accident Coverage', 'Pending', NULL);

select * from employee

INSERT INTO employee (id, company_id, staff_id, full_name, date_of_birth, gender, phone_number, email, nationality)
VALUES (84, 6, 'EMP084', '王伟 (Wang Wei)', '1985-03-15', 'Male', '+86 139 1234 5678', 'wang.wei@dongfangtech.com', 'Chinese');
(85, 6, 'EMP085', ' 李娜 (Li Na)', '1990-07-10', 'Female', '+86 139 2345 6789', 'li.na@dongfangtech.com', 'Chinese');
(86, 6, 'EMP086', '张强 (Zhang Qiang)', '1992-09-30', 'Male', '+86 139 3456 7890', ' zhang.qiang@dongfangtech.com', 'Chinese');
(87, 6, 'EMP087', '刘洋 (Liu Yang)', '1988-11-25', 'Female', '+86 139 4567 8901', 'liu.yang@dongfangtech.com', 'Chinese');
(88, 6, 'EMP088', '陈刚 (Chen Gang)', '1987-05-12', 'Male', '+86 139 5678 9012', 'chen.gang@dongfangtech.com', 'Chinese');