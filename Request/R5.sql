SELECT COUNT(*)
FROM insurance_policy;

SELECT SUM(proposed_premium)
FROM quotation;

SELECT COUNT(*)
FROM insurance_policy;


SELECT
    COUNT(i.policy_name) AS total_policy,
    SUM(q.proposed_premium) AS total_propose_premium
FROM
    quotation q
    JOIN insurance_policy i ON i.quotation_id = q.id;


SELECT
    COUNT(i.insurance_policy_id) AS total_insured,
    SUM(c.coverage_amount) AS total_policy
  
FROM insured_coverage i 
JOIN insurance_policy c ON i.insurance_policy_id = i.id;
JOIN insurance_policy_benefit ON i.insurance_policy_id=id


SELECT
COUNT(DISTINCT e.id) AS total_prospect,
COUNT(DISTINCT c.id) AS total_prospect_company
FROM employee e
JOIN company c ON e.company_id = c.id; 


