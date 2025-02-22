import prisma from "@/lib/prisma";

export async function getTotalPolicy(): Promise<string> {
  const data = await prisma.$queryRaw<
    { count: string }[]
  >`SELECT  COUNT(insurance_policy.policy_name) FROM insurance_policy`;
  if (data.length > 0) return data[0].count;
  else return "0";
}
