CREATE VIEW total_policy_and_premium AS
SELECT 
     COUNT(insurance_policy.policy_name) AS total_policy,
     SUM(quotation.proposed_premium) AS total_premium
FROM insurance_policy
INNER JOIN quotation ON insurance_policy.quotation_id=quotation_id;

CREATE VIEW total_insured_and_sum_total AS
SELECT
     COUNT(insured_coverage.insurance_policy_id) AS total_insured,
     sum(insurance_policy_benefit.coverage_amount) AS total_sum_insured
FROM insured_coverage
INNER JOIN insurance_policy_benefit ON insured_coverage.insurance_policy_id=insurance_policy_benefit.id;

CREATE VIEW total_prospect_and_total_prospect_company AS
SELECT COUNT(e.*) - COUNT(i.*) AS prospect 
FROM employee e
LEFT JOIN insured_coverage i ON e.id=i.employee_id;


SELECT COUNT(*) AS total_hf_partner
FROM health_facility
WHERE is_partner_hf= 'true';

SELECT COUNT(*) AS total_hf_not_partner
FROM health_facility
WHERE is_partner_hf= 'false';

