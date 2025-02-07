import prisma from "@/lib/prisma";

export async function getTotalMaxQuotation() {
    const data = await prisma.$queryRaw<{ max_premium: string | null }[]>`
     SELECT 
       MAX(proposed_premium) AS max_premium
FROM quotation
  `;

    if (data.length > 0) {
        return data[0].max_premium ? data[0].max_premium : "0";
    } else {
        return "0";
    }
}