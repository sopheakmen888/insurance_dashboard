import prisma from "@/lib/prisma";

export async function getTotalAvgPremium() {
    const data = await prisma.$queryRaw<{ average_premium: string | null }[]>`
     SELECT 
     AVG(quotation.proposed_premium) AS average_premium
FROM quotation;
  `;

    if (data.length > 0) {
        return data[0].average_premium ? data[0].average_premium : "0";
    } else {
        return "0";
    }
}