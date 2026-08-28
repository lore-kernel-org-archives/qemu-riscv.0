Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5163C61DCB
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 20:40:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x03Mv-0007dl-Ia; Fri, 28 Aug 2026 16:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03Mt-0007YL-HV
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:40:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x03Mr-0006Yk-MW
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 16:40:07 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SJdaZI126055
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=1s0P5B2MvNt
 k9EcRSkCNojw71UYquf0FvtqslxyUh4o=; b=IABFpI4Gs85wc19J50jzxfZYAiD
 CeLgELqtWaiIwVOms2vXH6HFtoafjttxkMB3Aw7LDlEA+xF7UrZGSP5iU2O566+5
 Ct+M6b/MD4CzVMH2NZaPa4ZbPDE+AWrDi7OJmNdCEme1ij2tdZUwDp+nKzrwW0XQ
 3c3blHFLc5ldotGA/TmWzyEN2tm5mZuVHXeMAusGLX2BogdQzlD4rlXM7Xm9kqeC
 KSe3ij6YMxuZfb86eAaxPRaAaENt0PUHDjExbxujMvi46Y2gCifHtnfeUzPiQcGk
 yK3UEebsM7bFwIpAxwKh+Qh8D2TZmtiOVKHOrLZWpnF2yFY5lV6AqW9cMzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbgpc05a8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 20:39:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93771aa0379so348823385a.1
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 13:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787949594; x=1788554394; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1s0P5B2MvNtk9EcRSkCNojw71UYquf0FvtqslxyUh4o=;
 b=NzFY+nxXrzJtIL9H0QNW6pMeBgcEhP4cFXxb+JufKA5BZQFHj7lkwFtU3U7EvlH7pt
 tBaEyDdGWor5qlOVugeF+DuzAUwHgJyM08gKir3aUgOePGzAs8MdnT7buJObSu/EHVe3
 tSbfvauKf/ZiCakKZ1pRFKJdq6Osr9WGmhPhNdExVtlXkGvdpIyq8SJnQsqO3D+A5bDi
 7cAum4or2bvJfKTwu20yGt6yieHoMZPfeOmLFYu36Hsx0dOJDZGx3LqQH8sYLbMGhiKW
 uOeE0tvTZmhqlXC6tvOWEA3I8Ih+/e81V4q+0qpX95CgzCkKppknV33EKJwLp6lDlcDf
 kCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787949594; x=1788554394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1s0P5B2MvNtk9EcRSkCNojw71UYquf0FvtqslxyUh4o=;
 b=pmsVXq81f9efA0mlHhst8DpzHIygm9LoawcKJ344DwZPZVhLJY8yX0IbgyKr4aFKAj
 +WmoZ/ZPOpA76WjOiOwAqAhS5us20Nfao2d7henmOTk7Y3Wt1MoitdVpiPuA/8I3eNpm
 A+92+Zm8iaqDvh0qBqpadU8JjCf1L6yWKmSGqNJTF18uSMM1DagQnzOOTAtgfapmfVVL
 HwvJOPAPh7F3IswaZoKq9GqFJnYtw0ZI52vIl1b38sfC/ks3llkfo2cPHypJvmpojoyG
 JH3mqXk+B3tQZxK1YR5cgLS9I5pcmOpJR9FXwAKJ4+8JCoZ4OaC3a4UsHerI60x5BBcR
 3Kkw==
X-Gm-Message-State: AFuF++mbvclrPnr3zNdWUs9nD53Tr5ecu5WQHUP54+GwwjZwLpj5rilA
 aldss0WRdAdPNPQZpnRjmO/wQagfwKm0hVw4GqT3fHfZ6AXXR577ApfjRBLmBoExUuwKEzstslK
 Gt6rV3U5Bueu418P25YEj1YV0hokgaPxJR5dY3CW5R9LjyuAY707ihPSvkQ==
X-Gm-Gg: AR+sD11jcTv/tkQYfAT7ZRR2vys7BrmWbb09KfJoiZMrmPAVy02h1ZFuxVlnO9SUtIQ
 HZp+aHKeFiYbTZheLN/FzhZkHUy6ZQlZs79KYatRXeey2Rti9QwvHc+qTIVJVYfPHvcY3r+UmeO
 BFFk6TI8243fVrYw9utx04Lh7qRPSYWIdrD+QAUPKwNeF9IoXlo5h1EI0Jhm68FyifaQhzqNvI4
 66oYXy/WOHJbNgH/la2fKlYechFNpLKoUXgeviDT11tXjgCpJsCIScwfKssDybG/ggBrq84c5Hx
 RCGOYsdu7yx6nqNeVb//HgJZs7J3y1NFbA5jJ/EeS8WAUXhYQFF99Ar4+Ku7aDeR0rmKjkcbpE7
 Xgprz/rg6ayc9FshidJuMfyR+fB4M1h378Cd3NA==
X-Received: by 2002:a05:620a:4555:b0:92e:4927:2002 with SMTP id
 af79cd13be357-9391392b9ffmr1174150285a.39.1787949594071; 
 Fri, 28 Aug 2026 13:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4555:b0:92e:4927:2002 with SMTP id
 af79cd13be357-9391392b9ffmr1174100585a.39.1787949588872; 
 Fri, 28 Aug 2026 13:39:48 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939173f2758sm218063985a.37.2026.08.28.13.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 13:39:48 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-stable@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 08/15] hw/riscv/virt.c: fix aclint soc/mtimer nodename
Date: Fri, 28 Aug 2026 17:39:10 -0300
Message-ID: <20260828203918.350131-9-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
References: <20260828203918.350131-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8NVZxoQUlx6B8NHADF25TguIMpTty8rC
X-Proofpoint-GUID: 8NVZxoQUlx6B8NHADF25TguIMpTty8rC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX273mfGtDrNFm
 ZBSAAy5J15bDRunc4XxAnnE9JLWfQh3x0IkujeBR7oeqnLHZ2mKrPjQU5YBZEHqfmCCdgQ459vf
 LSGxtu+eP0iD1UoH0/IdHW8FDGx2pEM=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a91f21a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=69wJf7TsAAAA:8 a=FRSEYCzRAAAA:8 a=EUspDBNiAAAA:8 a=kzI3X2J7bCQCYuGL4vkA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Fg1AiH1G6rFz08G2ETeA:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE3OSBTYWx0ZWRfX3YvDXBsQkY/n
 j0B4k/41kKb60pN+IkxR3zxb3eECNyUcF6GgeCNKxJv5Hr+Xtv8PIVAdC+5Kp+nNwcbSBvKrpEY
 VTFyieaFTAwWW417I7jm8CWRG1vxLnyLbRpCSrTuJE9To65EgJ4t7OMwwrpIj+vBZiMgdRSKvBz
 KdCBuLAjkolFXyc6OudLDy9c3q0QRQEPqfPzwZAWs3SeZvLj7tNAClCWb6d9nI2ewGDECHcSVKP
 xcDPatrQkpqwlks0opohrXQRTIw0m202ksjI3ifUFrbUJ9AEhBos3Da/GIXyG9VXUmLVdH33nI4
 pDCsLpBaQapgtJRcBZymoExS6z8UzpED9UfEmpldB67b/day+qW5V42K0lDsIRGVwdS5SLU69Jb
 TRxXWQ1sZGyNtjAuF9sATn+0v4gKeqnVSOWXvXCl8+TIqzo7R8ruN+FNFuAsp6eMyDW+CX4L+nB
 9qI+k7oUH5WCZ8chxqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280179
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Running 'dtc' to generate a readable fdt for the virt machine produce
warnings:

 $ dtc -I dtb -O dts virt.dtb > virt.dts
<stdout>: Warning (simple_bus_reg): /soc/mtimer@2000000: simple-bus unit address format error, expected "2007ff8"
<stdout>: Warning (simple_bus_reg): /soc/mtimer@2008000: simple-bus unit address format error, expected "200fff8"

This happens because the 'reg' field does not match the address in the
nodename.  The right fix, pointed out by Chao in [1], is to make the
nodename match the reg value:

"In the current QEMU implement, `addr` is the MTIMECMP base address,
while the MTIME register is located at addr + RISCV_ACLINT_DEFAULT_MTIME."

In other words, the 'reg' value is correct but the nodename isn't.

We'll make the fix now, allowing the next patch to move the fixed version
of aclint FDT to fdt-common.

[1] https://lore.kernel.org/qemu-devel/apHH1upnh8udUUT-@ChaodeMacBook-Pro.local/

Cc: qemu-stable@nongnu.org
Suggested-by: Chao Liu <chao.liu@processmission.com>
Fixes: 954886ea6d ("hw/riscv: virt: Add optional ACLINT support to virt machine")
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a6ec9def16..83a4b7710d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -234,7 +234,8 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
                (s->memmap[VIRT_CLINT].size * socket);
         size = s->memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE;
     }
-    name = g_strdup_printf("/soc/mtimer@%lx", addr);
+    name = g_strdup_printf("/soc/mtimer@%"HWADDR_PRIx,
+                           addr + RISCV_ACLINT_DEFAULT_MTIME);
     qemu_fdt_add_subnode(ms->fdt, name);
     qemu_fdt_setprop_string(ms->fdt, name, "compatible",
         "riscv,aclint-mtimer");
-- 
2.43.0


