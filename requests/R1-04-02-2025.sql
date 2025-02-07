ALTER TABLE employee
ADD nationality varchar(255);

INSERT INTO public.employee(
	id, company_id, staff_id, full_name, date_of_birth, gender, phone_number, email, nationality)
	VALUES (84, 4, 'EMP084', 'Lorn Sreymoch', '2005-05-22', 'Female', '+885 46 366 468', 'lorn.sreymoch@cambodiaindustry.com', 'Cambodia');