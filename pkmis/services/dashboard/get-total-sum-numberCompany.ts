import prisma from "@/lib/prisma";

export async function getTotalSumNumberOfCompany() {
  const data = await prisma.$queryRaw<{ count: string | null }[]>`
    SELECT
    count(*) AS count
FROM
    company c
    JOIN insurance_policy i ON i.company_id = c.id 
    JOIN quotation q ON q.id = i.quotation_id 
WHERE
    q.quotation_status != 'Accepted';

  `;

  if (data.length > 0) {
    return data[0].count ? data[0].count: "0";
  } else {
    return "0";
  }
}
