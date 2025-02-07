//1
SELECT COUNT(id) as total_policy
FROM insurance_policy

SELECT * FROM quotation

SELECT SUM (proposed_premium) as total_money
FROM quotation

SELECT AVG (proposed_premium) as total_premium_money
FROM quotation

//2
SELECT * FROM insured_coverage

SELECT COUNT (employee_id) as total_insured_coverage
FROM insured_coverage

SELECT * FROM insurance_policy_benefit

select cov.employee_id, emp.full_name, pol_ben.benefit_name, coverage_amount
from insured_coverage cov
join insurance_policy_benefit pol_ben on cov.insurance_policy_id=pol_ben.insurance_policy_id
join employee emp on cov.employee_id = emp.id

SELECT SUM (coverage_amount) as total_coverage_amount
FROM insured_coverage cov
join insurance_policy_benefit pol_ben on cov.insurance_policy_id=pol_ben.insurance_policy_id
join employee emp on cov.employee_id = emp.id

//3
SELECT count(emp.*) - count(ins.*) AS prospect
FROM employee emp LEFT JOIN insured_coverage ins ON emp.id = ins.employee_id

//4
SELECT COUNT(*) AS is_partner_hf
FROM health_facility
WHERE is_partner_hf ='true'; 

SELECT COUNT(*) AS is_not_partner_hf
FROM health_facility
WHERE is_partner_hf ='false';