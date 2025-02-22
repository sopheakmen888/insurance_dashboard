import prisma from "@/lib/prisma";

export async function getTotalProspect(): Promise<string> {
  const data = await prisma.$queryRaw<
    { count: string }[]
  >`SELECT COUNT(e.*) - COUNT(i.*) AS count
FROM employee e
LEFT JOIN insured_coverage i ON e.id = i.employee_id`;
  if (data.length > 0) return data[0].count;
  else return "0";
}
