-- 5.1
CREATE VIEW total_policy_and_total_premium AS
SELECT 
    COUNT(insurance_policy.policy_name) AS total_policy,
    SUM(quotation.proposed_premium) AS total_premium
FROM insurance_policy
INNER JOIN quotation ON insurance_policy.quotation_id = quotation.id

-- 5.2
CREATE VIEW total_insured_and_total_sum_insured AS
SELECT 
COUNT( insured_coverage.insurance_policy_id) AS total_insured,
SUM( insurance_policy_benefit.coverage_amount) AS total_sum_insured
FROM insured_coverage 
JOIN insurance_policy_benefit ON insured_coverage.insurance_policy_id = insurance_policy_benifit.id

-- 5.3

SELECT COUNT(e.*) - COUNT(i.*) AS "prospect"
FROM employee e
LEFT JOIN insured_coverage i ON e.id = i.employee_id

SELECT
    count(*)
FROM
    company c
    JOIN insurance_policy i ON i.company_id = c.id
    JOIN quotation q ON q.id = i.quotation_id
WHERE
    q.quotation_status = 'Accepted';

-- 5.4



