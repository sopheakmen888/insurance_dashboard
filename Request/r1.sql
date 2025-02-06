ALTER TABLE employee ADD nationality varchar(255);
ALTER TABLE employee ADD age varchar(255);

INSERT INTO employee ( company_id, staff_id, full_name, date_of_birth, gender, phone_number, email, nationality)
VALUES ('4', 'EMP085', 'lai', '03,02,2006', 'Female', '0974503698', 'laiheang@gmail.com', 'khmer');

UPDATE employee SET nationality="khmer" WHERE id BETWEEN 1 AND 80;
