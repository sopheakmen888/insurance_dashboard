SELECT OrderID, Quantity,
CASE WHEN Quantity > 30 THEN 'The quantity is greater than 30'
WHEN Quantity = 30 THEN 'The quantity is 30'
ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

-- em=employee table
-- c=company table
-- INTERVAL is use for store duration or time is a type in pgAdmain

SELECT em.full_name, em.gender, em.date_of_birth, c.company_name, c.contact_email, c.phone_number,
    CASE
        WHEN AGE(em.date_of_birth) < INTERVAL '18 years' THEN 'Under Age'
        WHEN AGE(em.date_of_birth) > INTERVAL '60 years' THEN 'Over Age'
        ELSE 'Within Age Range'
    END AS age_group
FROM employee em
JOIN company c ON em.company_id = c.id;