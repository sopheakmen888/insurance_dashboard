import prisma from "@/lib/prisma";

export async function getTotalSumPremium() {
  const data = await prisma.$queryRaw<{ total_premium: string | null }[]>`
    SELECT  SUM(quotation.proposed_premium) AS total_premium
FROM insurance_policy
INNER JOIN quotation ON insurance_policy.quotation_id = quotation.id

  `;

  if (data.length > 0) {
    return data[0].total_premium ? data[0].total_premium : "0";
  } else {
    return "0";
  }
}