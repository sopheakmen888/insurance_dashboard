-- 1. Total policy, total propose premium 
SELECT COUNT(id) as total_policy
FROM public.insurance_policy


SELECT SUM(proposed_premium) as total_proposed_premium
FROM quotation

-- //average
SELECT AVG(proposed_premium) as total_proposed_premium
FROM quotation


-- hight total
SELECT MAX(proposed_premium) as total_proposed_premium
FROM quotation


-- hight total
SELECT MAX(proposed_premium) as total_proposed_premium
FROM quotation



-- people have insured
SELECT COUNT(employee_id) as total_sum_insured
FROM insured_coverage


-- 2.Total insured, total sum-insured
select cov.employee_id, emp.full_name, pol_ben.benefit_name, coverage_amount
from insured_coverage cov
join insurance_policy_benefit pol_ben on cov.insurance_policy_id=pol_ben.insurance_policy_id
join employee emp on cov.employee_id = emp.id

select sum(coverage_amount)
from insured_coverage cov
join insurance_policy_benefit pol_ben on cov.insurance_policy_id=pol_ben.insurance_policy_id
join employee emp on cov.employee_id = emp.id


-- 3Total prospect, number of prospect campany 
select count(emp.*) - count(inc.*) AS "Prospect"
from employee emp LEFT JOIN insured_coverage inc on emp.id = inc.employee_id

-- 4 Total HF partner, number of not partner
SELECT  COUNT(*) AS is_partner_hf
FROM health_facility
WHERE is_partner_hf = TRUE;

SELECT  COUNT(*) AS is_partner_hf
FROM health_facility
WHERE is_partner_hf = FALSE;