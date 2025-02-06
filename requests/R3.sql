--  Insert data company
INSERT INTO company (id, company_name, contact_email, phone_number, address, industry_type, license_number)
VALUES (6, '东方科技有限公司 (Dongfang Technology Co., Ltd.)', ' info@dongfangtech.com', '+86 10 1234 5678', ' 北京市朝阳区科技路10号 (10 Keji Road, Chaoyang District, Beijing) ', ' Technology', 'CN12345678');

-- Insert quotation data
INSERT INTO quotation (id, company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date)
VALUES (7, 3, 3, '2025-01-03', 300.00, 10,000.00, 'Personal Accident Coverage (Accident, Disability, Death) ', 'Pending', NULL);

--  Insert employee data
INSERT INTO employee (id, company_id, staff_id, full_name, date_of_birth, gender, phone_number, email)
VALUES
    (85, 5, 'EMP085', '王伟 (Wang Wei)', '1985-03-15', 'Male', '+86 139 1234 5678', 'wang.wei@dongfangtech.com'),
    (86, 6, 'EMP086', '李娜 (Li Na)', '1990-07-10', 'Female', '+86 139 2345 6789', 'li.na@dongfangtech.com'),
    (87, 7, 'EMP087', '张强 (Zhang Qiang)', '1992-09-30', 'Male', '+86 139 3456 7890', 'zhang.qiang@dongfangtech.com'),
    (88, 8, 'EMP088', ' 刘洋 (Liu Yang)', '1988-11-25', 'Female', '+86 139 4567 8901', 'liu.yang@dongfangtech.com'),
    (89, 9, 'EMP089', ' 陈刚 (Chen Gang))', '1987-05-12', 'Male', ' +86 139 5678 9012', ' chen.gang@dongfangtech.com'),