-- 1. Total Policy, premium 
SELECT sum(insurance_policy_premium.premium_amount)
FROM public.insured_coverage
JOIN insurance_policy_premium ON insured_coverage.insurance_policy_id = insurance_policy_premium.id