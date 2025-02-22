import prisma from "@/lib/prisma";

export async function getTotalPendingPremium(): Promise<string> {
  const data = await prisma.$queryRaw<
    { count: string }[]
  >`SELECT COUNT(*) AS count
FROM quotation
WHERE quotation_status='pending';
`;
  if (data.length > 0) return data[0].count;
  else return "0";
}