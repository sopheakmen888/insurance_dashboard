import prisma from "@/lib/prisma";

export async function getTotalAveragePremium(): Promise<string> {
  const data = await prisma.$queryRaw<
    { count: string }[]
  >`SELECT 
     AVG(quotation.proposed_premium) AS count
FROM quotation;
`;
  if (data.length > 0) return data[0].count;
  else return "0";
}