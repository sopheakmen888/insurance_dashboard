CREATE VIEW total_quotation_and_average_premium AS
SELECT 
     SUM(quotation.proposed_premium) AS total_quotation,
     AVG(quotation.proposed_premium) AS average_premium
FROM quotation;

CREATE VIEW total_pending_quotation_and_maximum_premium AS
SELECT COUNT(*) AS total_quotation,
       AVG(*) AS average_premium
FROM quotation;
WHERE quotation_status='pending';

