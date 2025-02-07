import prisma from "@/lib/prisma";

export async function getTotalSumInsured() {
  const data = await prisma.$queryRaw<{ sum_insured: string | null }[]>`
     select sum(insurance_policy_benefit.coverage_amount) as sum_insured
     from insured_coverage
     join insurance_policy_benefit on insured_coverage.insurance_policy_id=insurance_policy_benefit.id;
  `;

  if (data.length > 0) {
    return data[0].sum_insured ? data[0].sum_insured : "0";
  } else {
    return "0";
  }
}
