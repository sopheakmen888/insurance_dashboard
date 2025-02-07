import prisma from "@/lib/prisma";

export async function getTotalSumQuotation() {
  const data = await prisma.$queryRaw<{ total_quotation: string | null }[]>`
     SELECT 
     SUM(quotation.proposed_premium) AS total_quotation
FROM quotation;
  `;

  if (data.length > 0) {
    return data[0].total_quotation ? data[0].total_quotation : "0";
  } else {
    return "0";
  }
}