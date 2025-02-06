INSERT INTO company ( company_name, contact_email, phone_number, address, industry_type, license_number)
VALUES ( '东方科技有限公司 (Dongfang Technology Co., Ltd.)', 'info@dongfangtech.com', '+86 10 1234 5678', '北京市朝阳区科技路10号 (10 Keji Road, Chaoyang District, Beijing)', 'Technology', 'CN12345678');

INSERT INTO quotation ( company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date)
VALUES ( 6, 3, '2025-01-03', 300.00, 10000.00, 'Personal Accident Coverage (Accident, Disability, Death)', 'Pending', NULL);


INSERT INTO employee ( company_id, staff_id, full_name, date_of_birth, gender, phone_number, email, nationality)
VALUES ('6', 'EMP086', '王伟 (Wang Wei)', '1985-03-15', 'Male', '+86 13912345678', ' wang.wei@dongfangtech.com', 'chinese'),
('6', 'EMP087', '李娜 (Li Na)', '1990-07-10', 'Female', '+86 139 2345 6789', 'li.na@dongfangtech.com', 'chinese'),
('6', 'EMP088', '张强 (Zhang Qiang)', '1992-09-30', 'Male', '+86 139 3456 7890', 'zhang.qiang@dongfangtech.com', 'chinese'),
('6', 'EMP089', '刘洋 (Liu Yang)', '1988-11-25', 'Female', '+86 139 4567 8901', 'liu.yang@dongfangtech.com', 'chinese'),
('6', 'EMP090', '陈刚 (Chen Gang)', '1987-05-12', 'Male', '+86 139 5678 9012', 'chen.gang@dongfangtech.com', 'chinese')


SELECT id, company_name, contact_email, phone_number, address, industry_type, license_number
	FROM public.company WHERE id=6;

SELECT id, company_id, insurance_broker_id, date_issued, proposed_premium, sum_insured, coverage_details, quotation_status, acceptance_date
	FROM public.quotation WHERE id=7;

SELECT id, company_id, staff_id, full_name, date_of_birth, gender, phone_number, email, nationality
	FROM public.employee WHERE company_id=6;