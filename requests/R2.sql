CREATE VIEW v_select_all_employee_and_company_by_date_of_birth AS
SELECT e.full_name, e.gender, e.date_of_birth, c.company_name, c.contact_email, c.phone_number,
    CASE
        WHEN AGE(e.date_of_birth) < INTERVAL '18 years' THEN 'Under Age'
        WHEN AGE(e.date_of_birth) > INTERVAL '60 years' THEN 'Over Age'
        ELSE 'Within Age Range'
    END AS age_group
FROM employee e
JOIN company c ON e.company_id = c.id;

c it mean Company table it is short name 
e it mean employee table it is short name
JOIN is like connecting two different lists (tables) that have something in common. For example, you have one list with employee and another list with company, and you want to connect each employee to the company they work for.
