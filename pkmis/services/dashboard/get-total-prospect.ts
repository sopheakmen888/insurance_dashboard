import prisma from "@/lib/prisma";

export async function getTotalProspect(): Promise<string> {
    const data = await prisma.$queryRaw<
        { prospect: string }[]
    >`SELECT COUNT(e.*) - COUNT(i.*) AS prospect
FROM employee e
LEFT JOIN insured_coverage i ON e.id=i.employee_id`;
    if (data.length > 0) return data[0].prospect;
    else return "0";
}