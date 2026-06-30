Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCBDC43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 01:10:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weMz3-0007VA-HA; Mon, 29 Jun 2026 21:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1weMz3-0007Uv-0J
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 21:09:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1weMz1-0002Kh-A7
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 21:09:52 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65U18Ims419956
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 01:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=rRbDSRBdO4dHXyxvi03GdoEAf0VRXCOtTMP
 12G4xOLM=; b=gmajT45NaK0ZHAs0cDhcclQlIH3Kc+NKycXqaZqZu8aNmq7+CRu
 9VUNsOFhdAf5ps/Wcwcrmy1Q3ADBsFpwLfBkBQsP/rftD2EItWZU64kDGex/DWJ2
 V+iZ4Hq7vkwOLCNhrK48tCEHZ2rdB81d4uuK50lDQ/EoW4RwyKt4YcYHZkQRpquU
 DaIIS4SpsUlxmiorWzE0cpkuvyX8hecyWwWyCF8hjoRgjFunJ4s76uW1xTcoGSQk
 1eJmSr0YQnHNf7iLzAlPorG9JiNanW4HNcRdUrlRfRVj7rlbN9R2KlaIhiAb9t9B
 x10rmVJQz/yEgX0ue5GBTYIMvwo2eqf7HrQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfg03r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 01:09:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8dd6a429cb6so47869546d6.2
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 18:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782781786; x=1783386586; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rRbDSRBdO4dHXyxvi03GdoEAf0VRXCOtTMP12G4xOLM=;
 b=TG82NbZxz5VRKMkC44+xQVsJVSwIY2HKlbzbC+xnrTT1iovbXJEfzKUGgRfMTo5Uyf
 LzvJC42jNxSPFL24zXlS4F1HPiTB65aYwSozLU96ZlkcVKEjMcx/Jvt+aj4/bA89zv2A
 QnFdKR8+fUNUp9fVsTlmm/TH/2R+U3XtrBZ4ulKc9oZpc0UrphP5wtLfzP1JypY7nZaI
 UzHIVjVY8zKAq35ROFiRLkvmjzo5/Iv7u4QTdGmcsCJQRAs7x1W/lvqCUGXIxMWhbcTr
 416nKathQRYsqMwPWJ/TdxOQQ++Y61SKB8NwjyEmYhikSTHbFObSP9G3XtQGKh990eXJ
 +ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782781786; x=1783386586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rRbDSRBdO4dHXyxvi03GdoEAf0VRXCOtTMP12G4xOLM=;
 b=nDF1Ya9aQuBsxXM60e4dNseSBIpGBof2Rwn15whMVmosN7HCZndsL1f/CfZScVQwQa
 B4YH2pIahUPVcybuy0d45OKEn7zimqadgShv9se+fiph5+7dM+ZFbHx3GzmcZT9WylDc
 naKjBjAEf1yLdQf6ksWBF9uoDcArb+YTXQQaGFfE81CQ9QNGdBktS/Ce2WhfeHVbFk6q
 vZPI5j4HhlwsOQ8V7YZqQzvBbCDUigOgjS+/jibdQBvbf1ZL3ixo7lhUwzKPuAtZllr3
 S93CO1kns1/OQDUuiyldh6qEBIR0HTzMBuHQY2tVa15hNY0JPSfbq8eeS6Ghe6+7LxwN
 4Obw==
X-Gm-Message-State: AOJu0YwjQsNmVEHY9r9OD7UTct1PvZNbaOj/VWPdFt/V2Vt2amSJIaJi
 8PqxyGiTyGew1UZH281LyJzKI3BQ0lJhh5eNdDdI4jgAr9MnVsU9xKUJOhwWkCm8INU4TpYbW3D
 WmpAdjUDHLJs4NqmYhnlGREAyHHswlLZC+vWqOnY6cjUnNGhyYsWIEcITKQ==
X-Gm-Gg: AfdE7clk3jSRxI05Hr1rAxU+z9j0g0v/mcVcWgkFX7EcspZ7Lrxq9dEM74JtgZVfsvA
 6VbN1smaBauBKz2OCadtwj6gD7gu3kClzInw9lqHkNp0o2xppT8bvW4S/AVVeZBRqyKXX1ybeOy
 rPfy+Jo+ML6mUognR1sMK8bI8XxKTC73K6C0G8a3m9HIZVsxSW/9eb6kmd16m/MqgDw6qdgWJ0r
 Ic6GiJW2y6CBRG7hLhgi0Q3bJCKrVAo/O2BdTQswVeSwqq7b6c/ukv0+P6i57O0UPLWCWx2AW72
 OscAykqkatGhent6lh/bj4eR78TQa93VxS1fvAO8d+GXbaB3WutpPcFaVxWVa27HZpVoWKUeWEK
 4GJCHWg+XlQFUDKYdDvjGlwC3ZQKj9xusD8X+BomSrLaNkw==
X-Received: by 2002:a05:6214:248a:b0:8e6:23ab:a055 with SMTP id
 6a1803df08f44-8f1bd21e19bmr29000636d6.33.1782781786097; 
 Mon, 29 Jun 2026 18:09:46 -0700 (PDT)
X-Received: by 2002:a05:6214:248a:b0:8e6:23ab:a055 with SMTP id
 6a1803df08f44-8f1bd21e19bmr29000256d6.33.1782781785414; 
 Mon, 29 Jun 2026 18:09:45 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8f1a27e79f5sm10984056d6.1.2026.06.29.18.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 18:09:44 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/riscv-iommu.c: fix read fault being recorded as write
Date: Mon, 29 Jun 2026 22:09:38 -0300
Message-ID: <20260630010938.1331641-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ht03xs3ymk1Wt_XOw-gySGjxEjS3oelx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAwNyBTYWx0ZWRfX4Hb4P8y7/dbE
 e2HpcmzZQ6w4NjXuVprJOTaWPay/N50SzQCec2M20orJ3BOak4V8PGQxDSctdvi9FUC6FsSX2lJ
 OzQIv4RKuAKMfuHblz97sS+EtHj2IXI9PRoXNd0OvAFqmGeihZLH8/SaJvsBPkG18Lq/Tb6xc7n
 GyJOqbVLog+orDMkfKV9H+Qj4wZzrT8sUdzslA5wGOVA7ZckcXrznFCOW3JMthtCWfFBQrqp2PP
 //YM4o/d21GDfPLLT3keepmCooAoILX3OnWOVJMAt2QfW5jsKfXGfmcK7taWeo4v6z32S0nADv3
 3OIpiY/iRthGYCT/rrGLdE1F8X67w52gmNTCQN9vVM2VTWn0YYx8iunPnfTc7iaDa4Gixav0lJV
 I18r4O4lcnONPgiRtKFjaiPyf6SOc/Y4ciEZNutVBhftXB5YEbA9lOt+fpyRLhuv4yTVX+ooYIS
 EqcfmU/HkZ6FQ8ukOJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAwNyBTYWx0ZWRfX3nayN47XSO20
 zfj1yu7XrpzfnxCK7UEz4L/jNse0lTrRP3xBfx9jOWnyvoAiCp65QJ+QPOEdESjsMR0O09rBA4r
 ZRYiWsFYKX4gu/roIGIpIgYBaE6RtQE=
X-Proofpoint-GUID: ht03xs3ymk1Wt_XOw-gySGjxEjS3oelx
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43175b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=2kUl_4CQJ_2POlUL4sAA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300007
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Under certain circunstances, like the one described in [1], a read
operation that faults will be logged as a write fault instead if it
happens after the translation phase in riscv_iommu_spa_fetch().

The first problem is that we're overwriting iotlb->perm with PTE flags,
so an IOMMU_RO access flag can be overwritten by whatever flags
the PTE has.  This will cause the wrong fault type to be thrown at
the end of the function in case a fault happens.

To solve the iotlb->perm overwrite we'll bit_and the original
iotlb->perm access flags with the PTE access flags, preserving the
original access type.  So a IOMMU_RO access in a R+W PTE will result in
a IOMMU_RO perm.

Second, the resulting fault is received by riscv_iommu_translate(), which
will then report the fault.  To do that we require a transaction type
(ttype).  We're prioritizing checking "perm & IOMMU_RW" to set a
UADDR_WR ttype, and then checking "perm & IOMMU_RO" to set UADDR_RD
ttype.  The issue with that is IOMMU_RO=1 and IOMMU_RW=3, thus checking
"perm & IOMMU_RW" for a write then "perm & IOMMU_RO" for a read will
cause the read fault to always be diagnosed as write.

Make the iotlb->perm matches more strict: "perm & IOMMU_RW" must be
exactly IOMMU_RW, ensuring that 'perm' has both flags.  Then we can
check perm & IOMMU_WO and perm & IOMMU_RO without worrying about
overlapping with the RW flag.

[1] https://gitlab.com/qemu-project/qemu/-/work_items/3577

Fixes: 69a9ae4836 ("hw/riscv/riscv-iommu: add ATS support")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3577
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index c9687e01a8..e1ff5eb864 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -282,6 +282,7 @@ static hwaddr riscv_iommu_napot_page_mask(hwaddr ppn, hwaddr addr, hwaddr *out)
 static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
     IOMMUTLBEntry *iotlb)
 {
+    IOMMUAccessFlags pte_perm;
     dma_addr_t addr, base;
     uint64_t satp, gatp, pte;
     bool en_s, en_g;
@@ -509,8 +510,16 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
             }
             /* Translation phase completed (GPA or SPA) */
             iotlb->translated_addr = base;
-            iotlb->perm = (pte & PTE_W) ? ((pte & PTE_R) ? IOMMU_RW : IOMMU_WO)
-                                                         : IOMMU_RO;
+
+            /*
+             * Do a bit_and between the PTE bits and the original
+             * request flags to determine the exact permission we
+             * need, i.e. if the original request is RO and the
+             * PTE has RW flags the actual perm is RO.
+             */
+            pte_perm = (pte & PTE_W) ? ((pte & PTE_R) ? IOMMU_RW : IOMMU_WO)
+                                     : IOMMU_RO;
+            iotlb->perm &= pte_perm;
 
             /* Check MSI GPA address match */
             if (pass == S_STAGE && (iotlb->perm & IOMMU_WO) &&
@@ -1704,7 +1713,8 @@ done:
     if (fault) {
         unsigned ttype = RISCV_IOMMU_FQ_TTYPE_PCIE_ATS_REQ;
 
-        if (iotlb->perm & IOMMU_RW) {
+        if ((iotlb->perm & IOMMU_RW) == IOMMU_RW
+            || iotlb->perm & IOMMU_WO) {
             ttype = RISCV_IOMMU_FQ_TTYPE_UADDR_WR;
         } else if (iotlb->perm & IOMMU_RO) {
             ttype = RISCV_IOMMU_FQ_TTYPE_UADDR_RD;
-- 
2.43.0


