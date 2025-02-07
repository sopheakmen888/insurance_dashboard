import prisma from "@/lib/prisma";

export async function getTotalNotPartner(): Promise<string> {
    const data = await prisma.$queryRaw<
        { total_not_hf_partner: string }[]
    >`SELECT COUNT(*) AS total_not_hf_partner
FROM health_facility
WHERE is_partner_hf= 'false'`;
    if (data.length > 0) return data[0].total_not_hf_partner;
    else return "0";
}