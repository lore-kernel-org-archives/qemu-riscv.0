Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C642C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:40:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weuFB-0005PN-8q; Wed, 01 Jul 2026 08:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1weuFA-0005Oy-4k
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:40:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1weuF8-0004LC-CB
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:40:43 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 661A8WgS744292
 for <qemu-riscv@nongnu.org>; Wed, 1 Jul 2026 12:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=xmSzVdEa1UXvtLbIOTxa13z7dKjtsC/eWWx
 TMv2p4tg=; b=D4JD3km6Dvt/hiVd1DZnBHFD3YI8Yeg7OToYSL3oyYjoYxdedSp
 s/xQ+20nRBV63uMAU/dl98mfrNZFJLZoXvouuCyIlaooyHoypqxOcc9z0HbZE43S
 SDG2qXuJ2EAnIgXPHAbAdMHcR3br75uYVeT7VznerUO88K5ZImvqZWmGyG4WoInj
 sazEb4EMsdKPcHqtH8Dr4Bw42nN2LDZCnQu0x+xsOFFieMin9Fb3DDPkUiA8hOvS
 7NrFhr6uGIeDlaVd2zbwXy60pbHX72xGTA1De/vjjAVwNvHCaKKSeHSY/3EhbYn3
 7QWBAcMuisz0N0H/AnCp5aJEui0HE/+Vh6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0thgn8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 12:40:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8eec6acbe21so13818416d6.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782909640; x=1783514440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xmSzVdEa1UXvtLbIOTxa13z7dKjtsC/eWWxTMv2p4tg=;
 b=FkEuF2RWJD2HooyPzKnpcSZrbDYkrdwekkmpUaWGA3OYXSWSjr8iHqurfSIe2/6Am/
 sjEJCRjqR82pIDU1P+pR8Z788t0RfGxL5Xb0FDopHegy7fZUQO0zaZsC9tfh0qApl/Nl
 2ffMx2LvF8lLy8pU8/k6u3xFnWDbhjaTzN5bLSwV5qStQ0oOItD8mMfgUv6Q5U5ZGydl
 8D0Zh2y0VkSQJ/8D/H6ZSdjP0baLVsO2J01YJ5jeCOkfq2v+WGhfInhUby3N1gJ+htb0
 BiGHte1jFwdrGM7J5nle7mngHhStAHVVHwP3Sgk8SSrLPwT112RqSRayk/GeDpVSuK5k
 /eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782909640; x=1783514440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmSzVdEa1UXvtLbIOTxa13z7dKjtsC/eWWxTMv2p4tg=;
 b=F592Xknbbr1NBkWRWle3KODJdunx9Bg/xcnmcO3YBBSPs8qM3XawXVFVtQByKoEUVY
 TpmxScRGMc4AsnjBVP+1c+VLcio7XfIPY0e1PoP6uCPBp2worLMuy+kJs7Vpfni+ivXS
 QXYRpGIxL+8cabNUzSLsDCa2gUHwgN2D8CzYDf5ygj3ptivUFFyDvjF4prdAb9/IPt1H
 UftJ6Tmw8QQcaxUIQXOBSr6IO9MQQS0WWt+RYafn/xO4kx4WRkaeND4B2xEBKxaZhKi0
 PEfzCNOfaIZADfPCH56Z21xHJLIjiSxLJ7I1hXjJTkK5IUGKWqeqr7t6eeJIv9RulcoR
 X1kQ==
X-Gm-Message-State: AOJu0YykjaaOIe9Z6Nt0gFxh9VqfUvtcSwK65Phn+RxS4P75rECxjyGg
 9YxcUySrMogsgfbFLxM0I05XF3aZ4OzE1YseRemd2zLMDTBHIGpb5jU494gPR2LEecNySzso2RQ
 MUnO/sA35hVboy1pXe7MF3p4wW3l7bDQD4klKJWy/lBqhzwQlf64vEEFNYA==
X-Gm-Gg: AfdE7claXgyEj908Xc1Qm+A3NWyWFJWBi1Qw9VxBqMINOtyb0AHycLDakyr5sXGYmMH
 bvc8P7bnOqTZLnXR0PWCoFu5TZ/o/CEJdYRtQ491uGb94FoWsDoYobuOEtc8xLNzGUoK5zVi7dz
 rYs71fIC66+YUYFwnWnQvALwivfqDvVt090oTdOjw+EAC3q7dRsU7ofkpDwYKjx7I6ZMih4R80T
 u1VqsUcgGEhK9a+mwEggPfi6WWdpsSM0hC6U//43Gp1WV7YnyjEySVhk9JKK1pW+G2TQNGpUdXY
 0YJUOI1Qg7ZpilzdU3w2rpn+6IuO4uW8zuLsUbZAk/8EIAcXNZEsjJqvSKbZj3l6Kz55PZv/0D9
 YmakwwuEeAh0CvdWAnc2bUN4EiDOEeGiFFiYRRuP5qPyzcA==
X-Received: by 2002:ad4:559d:0:b0:8ef:5c5c:dbfc with SMTP id
 6a1803df08f44-8f3c8a20ca9mr12833916d6.43.1782909640333; 
 Wed, 01 Jul 2026 05:40:40 -0700 (PDT)
X-Received: by 2002:ad4:559d:0:b0:8ef:5c5c:dbfc with SMTP id
 6a1803df08f44-8f3c8a20ca9mr12833546d6.43.1782909639666; 
 Wed, 01 Jul 2026 05:40:39 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8f35e790097sm21406636d6.5.2026.07.01.05.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 05:40:39 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/riscv-iommu.c: fix fault type for spa_fetch() faults
Date: Wed,  1 Jul 2026 09:40:34 -0300
Message-ID: <20260701124034.552271-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZAyBOuFY0bPAfE9E70OLgwKFpaaSEZFQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNCBTYWx0ZWRfX5swmbZummqKd
 5gti1eCKitNc8OFFZHwa302vaMpzPjz5csnRqiMLWkQ2tRPX+SRK++kLIal0UlkXLFMVmWJMIPv
 21xPDqlZVChRQrr8wWjFcZAqngFIL/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNCBTYWx0ZWRfXwZ5A3HZ5oP+c
 qvMD/18/r2h27pA8uT5vsb69/ybYPIe5ZtQTwo1x1ImnWfU862fqmT3GNbBWLzFNe/kf42hfWQs
 MzltvyTNP2cUhJfg/nfVHD5jQvhrp/e7qRjTUmtzjJR+fwHxhjnoQgvKTXHZMUQFMS6YllRCKtX
 DSFpV35akAGjN992x+AjefaY5oe84SCJYO3CDjn3uMRKvJq543y5vtWOcAExHL08fGyBnHCcAV4
 8o2a7G04hTCvkO/uSZJQ0cBZ81Zl8bZsZ6s6TPWVQsjaxWwEUFFNgXPse/zqN7l9y6GOh3Aso+s
 Ke5L7flFh4Js6iNZBVF8BNhJFSzXz56iZUeX62sFzUhAYNh+mX0grh3dRIT0NoxuggxRJ4+bixb
 7HaonaIzIxgFic94qUdiJj1zVBfJ4r30eyucC/hbX338YHU7tyO2C0va8cGg14rFygviWvpabVG
 G+Hf/FDo1ALsbgwCs+g==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a450ac8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=LJELx49qBhIdHvJ-UO8A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ZAyBOuFY0bPAfE9E70OLgwKFpaaSEZFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010134
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

Under certain circunstances, like the one described in [1] and [2],
a read operation that faults will be logged as a write fault instead,
and vice-versa, if they happen after the translation phase in
riscv_iommu_spa_fetch().

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

[1] https://gitlab.com/qemu-project/qemu/-/work_items/3557
[2] https://gitlab.com/qemu-project/qemu/-/work_items/3577

Fixes: 69a9ae4836 ("hw/riscv/riscv-iommu: add ATS support")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3557
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3577
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 974042d017..7f94ce152e 100644
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
@@ -1727,7 +1736,8 @@ done:
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


