import prisma from "@/lib/prisma";

export async function getTotalapproved(): Promise<string> {
  const data = await prisma.$queryRaw<
    { approved: string }[]
  >`select count(*) AS approved from quotation where quotation_status = 'Approved'`;
  if (data.length > 0) return data[0].approved;
  else return "0";
}