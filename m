Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02CBC43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 12:57:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weBYT-0008Mo-Bj; Mon, 29 Jun 2026 08:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1weBYI-0008LH-UH
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 08:57:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1weBYG-00075c-NP
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 08:57:30 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65TATBGu2647651
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 12:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=BCD+lbTTBcHnrhwfJPIkg0NgvOocxGOdwTv
 wqhDzvak=; b=NLeCEGKIu30niTYRuqYkYkOwWiWAYJL8eMqeBtdaszH+9npmUP1
 qYXAE9oj3lXt6/7X/kEkEaUh9yhOa5tdgwdtFmrdBLzuP3YBKeN13fKU9sa7ixT6
 83uRgjkGcm29DlelfUsDzffMdXt5UKH2PmGmuRM05CDgMeuqGIKXGPNS3DNtAHar
 tVHRZ9MDkYV1Gh+M7NT0rSwbIaTvWxjH3eI7BnBY9qnBz0BtAyd3+Ku+EzYP4G/u
 DtbOvQOKZPatgxlrRcbEwC7jpqymwSx/HFohPmmrMkAV+Nnb+Z2IjDElt002PKVz
 +GpZg7gUfHGLJVKHkVY2o3zsaKMFjZ6C6Rg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjhc1j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 12:57:26 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-9694e84752eso846886241.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782737846; x=1783342646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BCD+lbTTBcHnrhwfJPIkg0NgvOocxGOdwTvwqhDzvak=;
 b=UVYgHo89ZNVyA/wMmePVAV8m+YE5mvqCKuJhbcsEE11X6guZ/a5TNKg+zzhraPCA2E
 p2+OD+ql8BJHJrV/Oeyvvvx3Kl0p4Du3o2y6LQH1Be2wK1c7Y9V/5i1gWEfwGDtDQZoM
 uTt5ITkRcahNqU8ubBRn0V5/7/jrKsxeyDQ3raKAPTTt5PJGHD7pnVLwqqB9Dc1rStnH
 6cyjQfJPRhcCULYKMRAzUzVe9wDs+pEsS+X2JzX70Dqu8Qsx/wzymQuNlsCiJqecLWpZ
 XTmyfxCJXxbYObUbji5qpEjlZJZEnauYLOdmS4+V5g6yXExdgClXR1Nu9Xa/qiXZTWLQ
 3eAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782737846; x=1783342646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCD+lbTTBcHnrhwfJPIkg0NgvOocxGOdwTvwqhDzvak=;
 b=Ufw54YiYFXs016E/q0QVxOo5k8P18BkmL7ivUNW2IhDl2E9j3M38x5nhJaiAEM1gmc
 pYq5CfJQ3+uDZ89wqWNBE6nwJDcX8bMADBUWrjbRz9f4QvdloACX1NkE+6nRQylqFv6R
 tcJ1Vcr+EYF34UJOLLyXFTH5AiVySMYiLnOX9kStNIjuLtUZLFMqVDh5T1vdE9ZyMtdf
 ZFb7MII9sMmpcrU8YNh8W8ViXiCRARPfdQF2MdKk1iwLsU1cCLWRDWaU3+fBeC7o7m1h
 CG1oVHm6mEjz1Ysa33SyFs3oKxI0w05RxxIcdlBoA2JEfy5Y/3Svrnby0nV5cwxXLliG
 i9LQ==
X-Gm-Message-State: AOJu0Yw1X0xNsm/XMyVgQgoX+5epWcKAagqjW0Rh+kZaP0mRDNGtYwdc
 J0x0PkF3bNdULUiWj2qVIxZf1qOlPSb2TkpNM5PhITT8DclJp6c142ohAKojpIF2QrxuP9edAoy
 v0kqlQL3Rw1RR7E4AtOqRKz4BWYymKUla8KF90psv6edJsGqj9LVW6vCiSQ==
X-Gm-Gg: AfdE7ck6ztUu/tyuW9qhM8gbcjI1sXjlftyG4doN1TIA5qYcFhwXu4AbAeBs4RrEo1f
 SqNGkRvB8Trxoba+35vtnIkX0anMU0WrNsTlSbCiFItrPd8uUx3ontU80NwPit3vKr68eXzZeQ2
 HKtFI7IyqgZjMRSGefGfd+Ph7Dp7eCE5PbIvH8LFtksNfxCDF/btcj1o6zbM9mQsPUKrSyjy56U
 0b52IDQ0lPK3iDol5kHuE7n6cxzFUuooYBBWNsqarlvHFIMJ8485buR4LYIjOhWLQ+RwPwCP06I
 SSTgBufijTLZlOh8TWjuOpJXvBPLagP2So22q6UeEqoLAIP0hAAMRDmjEsChtKgD9ttHhOojk+h
 R7dtxx1U3P1srvzbgx2LfxQSRI/PwIUsIZ891wgD2qKpJ5w==
X-Received: by 2002:a05:6102:6d3:b0:738:6994:eb8 with SMTP id
 ada2fe7eead31-738699411c6mr1833397137.0.1782737845711; 
 Mon, 29 Jun 2026 05:57:25 -0700 (PDT)
X-Received: by 2002:a05:6102:6d3:b0:738:6994:eb8 with SMTP id
 ada2fe7eead31-738699411c6mr1833370137.0.1782737845214; 
 Mon, 29 Jun 2026 05:57:25 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7356657be2dsm5507595137.2.2026.06.29.05.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 05:57:24 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/riscv-iommu.c: check reserved MSI PTE basic bits
Date: Mon, 29 Jun 2026 09:57:19 -0300
Message-ID: <20260629125719.679626-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gkpiLYbyALR81t-kXzIE3biRlcZw9fk6
X-Proofpoint-ORIG-GUID: gkpiLYbyALR81t-kXzIE3biRlcZw9fk6
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a426bb6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=o8AJCCVMZl93uFZnl5wA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwNiBTYWx0ZWRfX3QAHrYfuu3ua
 y7/JkvTrfKvGLNkH+dsiFwTAjl8/HS6KJKnRA3RU9zTK07ZZvtwzwMHtlozRYfeu/1nr7itMyQu
 KXUULCUNNq/awxTei8OceHJ76+C2oRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwNiBTYWx0ZWRfX/U850WEGO5Ww
 VpM5OsfpupVE8+osI12j4sYQN+cQ446xuOjEdWqO0fAR3Z99NuDT7UkOOtTxOY5OG3XekPgm/Zz
 vVZMKDci8SMoHqVBaz3uScXFNII6OPt+hcxtcvgwW3KL1Oh240hcXDmZ0Mcuv+pI+q9DRHcAfjB
 rvglzpZ3NC/KhZoLGj1TsVgR4V0vUiRpTBWb/jU8TfDjMF5IMg6EShCZQoqcWal5nU9rouvPUax
 aEN3617QLXNy/H1EjQgBb7KkXfeMHuuoidmwIf5jOq5nkGqlPUyHcAMVUoWGGjWksNK7w2O0rzk
 G0rO09PZfOnsrnj69aHYujElmLMV5w5lRne2z85Pf+SB5ADzRffJ9UkVrSlAT3jRasHi7eaxNMK
 Qmd+cyWFuXyUZ7pxoeiIEXTVFqNnNX+7+qnCQ8jJ/F+916N5/BWiIBcxFZBEQyQuhFAH6wACK2e
 KMmv4+FCE10pnx/u7kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290106
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

We need to throw an MSI_MISCONFIGURED error when any of the reserved PTE
bits (first doubleword only) are set.

Fixes: Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3563
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index c9687e01a8..6828349fe3 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -648,6 +648,27 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
 
     switch (get_field(pte[0], RISCV_IOMMU_MSI_PTE_M)) {
     case RISCV_IOMMU_MSI_PTE_M_BASIC:
+        /*
+         * riscv-iommu spec MSI PTE basic translate mode:
+         * "When an MSI PTE has fields V = 1, C = 0, and M = 3
+         *  (basic translate mode), the PTE's complete format is:
+         *  First doubleword:  bit 63      C, = 0
+         *                     bits 53:10  PPN
+         *                     bits 2:1    M, = 3
+         *                     bit 0       V, = 1
+         *  All other bits of the first doubleword are reserved
+         *  and must be set to zeros by software.  The second
+         *  doubleword is ignored by an IOMMU so is free for
+         *  software to use."
+         *
+         * In other words, bits 62:54 and 9:3 of pte[0] are reserved.
+         */
+        if (pte[0] & (GENMASK_ULL(62, 54) | GENMASK_ULL(9, 3))) {
+            res = MEMTX_DECODE_ERROR;
+            cause = RISCV_IOMMU_FQ_CAUSE_MSI_MISCONFIGURED;
+            goto err;
+        }
+
         /* MSI Pass-through mode */
         addr = PPN_PHYS(get_field(pte[0], RISCV_IOMMU_MSI_PTE_PPN));
 
-- 
2.43.0


