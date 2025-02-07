import prisma from "@/lib/prisma";

export async function getTotalPending(): Promise<string> {
    const data = await prisma.$queryRaw<
        { total_quotation_pending: string }[]
    >`SELECT COUNT(*) AS total_quotation_pending
FROM quotation
WHERE quotation_status='pending'`;
    if (data.length > 0) return data[0].total_quotation_pending;
    else return "0";
}