import prisma from "@/lib/prisma";

export async function getTotalMaximium(): Promise<string> {
  const data = await prisma.$queryRaw<
    { count: string }[]
  >`SELECT 
       MAX(proposed_premium) AS count
FROM quotation`;
  if (data.length > 0) return data[0].count;
  else return "0";
}
