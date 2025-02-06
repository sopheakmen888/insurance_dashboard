CREATE VIEW Request_for_Employee_Data_by_Age_Group AS
SELECT e.full_name, e.gender, e.date_of_birth, c.company_name, c.contact_email, c.phone_number,
    CASE
        WHEN AGE(e.date_of_birth) < INTERVAL '18 years' THEN 'Under Age'
        WHEN AGE(e.date_of_birth) > INTERVAL '60 years' THEN 'Over Age'
        ELSE 'Within Age Range'
    END AS age_group
FROM employee e
JOIN company c ON e.company_id = c.id;