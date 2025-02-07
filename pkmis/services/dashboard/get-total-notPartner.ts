import prisma from "@/lib/prisma";

export async function getTotalNotPartner(): Promise<string> {
  const data = await prisma.$queryRaw<
    { count: string }[]
  >`SELECT COUNT(*) AS count
FROM health_facility
WHERE is_partner_hf = 'false'`;
  if (data.length > 0) return data[0].count;
  else return "0";
}