ALTER TABLE employee
ADD nationality varchar(255);
-- request 1 
INSERT INTO employee (id, company_id, staff_id, full_name, date_of_birth, gender, phone_number, email, nationality)
VALUES
(84, 3, 'KSK123', 'Kimhay', '2005-03-02', 'Male', '+855 81 887 998', 'Kimhay.ly@institute.pse.ngo', 'cambodia');
;


