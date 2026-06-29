Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94D2C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 10:42:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we9RO-0004Eh-Sm; Mon, 29 Jun 2026 06:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1we9RN-0004EH-A2
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 06:42:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1we9RL-0003n2-OI
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 06:42:13 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65TATBsK2647661
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 10:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=zvM0Ja3Y1GzYh/xMuKQb7hl4fqjXmwMVadP
 uiO72iTM=; b=UzkbhM1KYyuizx4kqoEt2XJJJ2ByAQMu+Q2GCw3R/Uu5h/HGtXO
 q2qAvpLBpeNRIUmfPYwKQCpRe8fMWRR6CM/e1ZZzN3+Ooql6nK/tq3u4y51WWfEt
 n+esdUEKAC/zZzLLmRDkBlHiVIucH21xxg2DzBvZpjg52p7WgbcdqdmE2xV13+Nd
 rYz9TBFNhNEzzA9WpIKQECogUB2qeDKyuel063uRqF3o0poKwCktUOa0MIM9AWNR
 gonhTPpzOPRZmuKDsBIMRtksCsBgQ9HuUklj6rBMq34CY5Ju4SGgrAiTKmM3QJhc
 BUZM/EXuO1T4Xa73/1rOSQ2tPkZ/kB4lw5Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgvkm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 10:42:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30c0a27ad86so7552270eec.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782729728; x=1783334528; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zvM0Ja3Y1GzYh/xMuKQb7hl4fqjXmwMVadPuiO72iTM=;
 b=jgyzXsZSDN60jJYTCmiE97qGIX4qmETf1sipkhUwUfA9GjMhlBQMBUbU4zRVj0Fnde
 uczKG35uT4UIY4YoYwEpeAcWWTZd1P0CGXLGFbkdIVLTecTaBTQaGMWtgkiVpRaTlMvy
 0Uf7ae0U4CMEkPIXPmT6f4pDW+79FbsHgM/PpI2faWSJAHmBZ1IHXysApuyGmtLgPliY
 Y+1greT28yVIm5I7hmhCsIjODmavetqq9RXebvanQ/pbnaxx5lMG/MkPLarYQLW/Zj5W
 METQjtwMADgyMm+ypay9tcjUs5j2B7aG5AQuCj4/4uAmLM8KP/ljwVW2ymVk9ixsuzUb
 7Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782729728; x=1783334528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zvM0Ja3Y1GzYh/xMuKQb7hl4fqjXmwMVadPuiO72iTM=;
 b=Cw+zb0panfuCCaqN0ulqydlte4yipVJ8IA8GrrqRHHUUaMXNwZcs85rcgPhBm63siQ
 yL4DS4Wzx8LvZ0D0bsNliR77OuuKjMAB/j8qhXbHCwkCgxASAivE+6Byct4q8AKVofvl
 +GvHf962DRzofVm/E2fNuDezD05L9X+93dshd/sIBW3+d8yyEjE6qWJPpRQAKh0YPkX+
 UdJd1zQ5Vh6h1t77TE4f4lE2QaGrmQDz3rWEhjNeCQF550FAjuRjItbqzuWb1gOMSVPw
 IM5L/ZeGvvSorc5y9riyY14BxGrMsUyVrUwdVpTsOLnK8Er6nELQ1DBA6gPLzy574qqu
 yE8A==
X-Gm-Message-State: AOJu0YxwZhv1fHMyQQ/vkOR0YNc3BPFFdGmggEnwnp+YpnU03XolggVZ
 KhjI6imsL523PMl5DOrRJ+nhNjNRXu3wl5S6Gj0WoEn/zZNr4f2qdJ0zBT7nB+/4/5u1Ucp7Qb1
 2oH0adCkdGqM5VZeh7dYjJbxWJQE5Nc63lJudYCUBkrISB4Nb3TWXx/ggOA==
X-Gm-Gg: AfdE7ckupTxLwka9JRnD0xtU+vIvtI0Og+KZws+g93lgnuKy++YxnjdV1DxL2PPpqyq
 J5ySQQEqCuY+DZ6NNCedbcAMDNL4qIE9Ox1Kl2IuJYSx8UAdmlnwnZPv48Jb9QoDohhHtB6imzF
 mAB5E0E1R6nk+QDxJ92O2vzlS3PQISA7/wEXJP3zXNJbjdwkT8v21kcRdQrOb7QVln+XN9Cd+Bx
 qwUAhFNZcrgo6OoPXUJvobBOVgbjtwNbsIdJxQTQMihZdrJ/IzE78nW7q8aFprkLvUK/V5LlJYb
 g0E4IUNyvWGDb4+BqQboWNbogjWDzmJ99cbija/e+gS9hYL5wuK4eVG2V+MsRJFmQKsed4gMXDk
 BRj5MP/1UtY9tjUnA/2QH1SxAZk6h3b7GAkJHFm/UoKGj/g==
X-Received: by 2002:a05:7300:cb87:b0:30b:f888:7821 with SMTP id
 5a478bee46e88-30c850a2bd2mr16917718eec.28.1782729727558; 
 Mon, 29 Jun 2026 03:42:07 -0700 (PDT)
X-Received: by 2002:a05:7300:cb87:b0:30b:f888:7821 with SMTP id
 5a478bee46e88-30c850a2bd2mr16917689eec.28.1782729727029; 
 Mon, 29 Jun 2026 03:42:07 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7c4ca240sm47727025eec.4.2026.06.29.03.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 03:42:06 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/riscv-iommu: fault when !PTE_U and no priv access
Date: Mon, 29 Jun 2026 07:42:00 -0300
Message-ID: <20260629104201.349850-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xvwkUtSARu99N900_6MyQYTZiTRen9vR
X-Proofpoint-ORIG-GUID: xvwkUtSARu99N900_6MyQYTZiTRen9vR
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a424c00 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=z1aqH4CQ4Ijy_SfQUPkA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX30kFZl607ZQh
 08t2UeMFjaaSB6Kzqm4qsLndI4rEno5zSRrCV+KA+pjMUFQFZUk+/+tGSuVXh3k4saVVGbgbh7x
 hB7Iph2Wj+pBg623R3LQNbnsIn5QK4I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX+hqWJ59lUcaG
 rr4k6LbSby4EsPKwemNKB5pcfbV9aa98UPmWQWxW3/y8FlByy1wRNiECn5qaEBXoyKKcY4ertXI
 88lT+n0nFOjEPJ41Bfac5a9Ae8TY43sd3fH+DcjgLCow6+5uAw+AWgXw6QD93ytilCwOa+IbP1E
 l5CNwVvsVghzcK4R7JNh/uhIPZFCeYqucoEl21S5jcbELIxUR7og7mAmHpon91Z1wWfea0OKNy8
 VsiegDvPZGQy3GMfRXd4NMHg0vwTwr43bxbpugbm7e46Bz7JrLpRHu9R436s1pU6H+SoFZ/kubj
 R9k/rzznX1XRWeMQZN5+gBArLqE2h095OUDQzRPCZDcmA/Mkkv9B6vfNAy2RgMSpGGKs6+vTnyy
 EUhUoYaL3PU0HG6XT2K/F0nK60m36gLRPaa6cxyaNDwYnYtahqaY3H3vbMYEQjLew5ZTtclrfVV
 Gp5zB5z1v5kq7dGNhng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290086
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

All IOMMU accesses are assumed to be user mode unless told otherwise,
i.e. we have a process_id.  In case we have a non-user mode leaf PTE
(PTE_U isn't set) and we are running in user mode, we need to throw a
fault.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3553
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index c2c470b5df..2bea770fbc 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -297,6 +297,7 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
         G_STAGE = 1,
     } pass;
     MemTxResult ret;
+    bool pv = !!ctx->process_id;
 
     satp = get_field(ctx->satp, RISCV_IOMMU_ATP_MODE_FIELD);
     gatp = get_field(ctx->gatp, RISCV_IOMMU_ATP_MODE_FIELD);
@@ -468,6 +469,15 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
 
         if (!(pte & PTE_V)) {
             break;                /* Invalid PTE */
+        } else if (!(pte & PTE_U) && !pv) {
+            /*
+             * All accesses are assumed to be User mode unless
+             * process_id is valid (pv).  In case we have a
+             * non-user mode PTE and !pv we need to fault.
+             */
+            return (iotlb->perm & IOMMU_WO)
+                    ? RISCV_IOMMU_FQ_CAUSE_WR_FAULT
+                      : RISCV_IOMMU_FQ_CAUSE_RD_FAULT;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             base = PPN_PHYS(ppn); /* Inner PTE, continue walking */
         } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
-- 
2.43.0


