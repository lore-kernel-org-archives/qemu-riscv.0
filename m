Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CE0C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 22:06:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdEgE-0007yw-QH; Fri, 26 Jun 2026 18:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wdEgA-0007yT-Lr
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 18:05:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wdEg7-0000gS-Tl
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 18:05:41 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QJaVg22324693
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 22:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=aTqf8xcD/MoiE9hRqV47R3ykzFz8ag/WQc4
 bCET9NjI=; b=ZFwRLweH/DA/OHZrV9Zv6S7Fhl5CNpgTr/0MfALSinmJLRwk27H
 qSdnPd7cX6aMeLjkG0ZSNVbRLBxeIxH+gSMKGJgBBgUVxEeuPrPwo/CY4zXLEcZw
 t9BiPp73Fqm1Sf7rhYDkRQrG/SoolY9Wx7xlXGWskVfUNNCGlkjRBDXzp3sv6IM9
 l5e//lDMJeD97RIwWFlZpj4VimJlf9UlBGPIXhMXSBTZWEqwboWDXf7CByLoXzbG
 DYTE9JfaDwprWWkzpaEjbsTdkq2KMBF7O9iOYShguMpDr29ZN4BxgE0tp8qC89cz
 +v43i1J7g/4Rp/Nucw0tVNDQ7envfK+ZQ+Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1yqv0dq5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 22:05:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8ddad6183f9so28041386d6.3
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 15:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782511536; x=1783116336; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aTqf8xcD/MoiE9hRqV47R3ykzFz8ag/WQc4bCET9NjI=;
 b=MZBGYrJGfDcfWDQvptleAWQd4wzuCMjsILQHgEIDBk09l/0RXpQTVra4hZj1PALmU9
 gIziiNpxg6OFEPaic99xSTCGYstvikmg0UCTLD6r5khEdx4Pqh0AWc/VQibEJ34x8Sy9
 2ttEX/tO5tIunhIbou7xBczWcC6/WZuRuP87lS4hVfxXR3zULMcny9XwG9TuxuqvOgla
 dZs4RitQsUwhjysus3ZzxD8n83PQxT5nhLUmP/eoePNxni9WFmWk7gGJWXwIEUphhHLm
 WNw0T/Ax35lh4GYgWD0s4nwx93AHS3DGYsomyZdPkjgvHlQEBtUFvBLfUhm4KyF9a5zL
 MqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782511536; x=1783116336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aTqf8xcD/MoiE9hRqV47R3ykzFz8ag/WQc4bCET9NjI=;
 b=kNnAk29W3iYK1xRYGAllZNNNTLmnxdLAJ5vs9NxClAL1PdBFmrZW5Zbxvl7X1rtHX9
 eAoC8v+fYmiKEJcPoMCJC1tp8zu5+KLp/afB8AF89K51k3J7xvgRTxQElcVIkjKuOllh
 RtqTzmCR9GwdXb4St68oZEDUTMQytngudH+K2Fh53XKo1LjoCP+O90GqJAemjh5TKAPO
 th6SDu8dBb8Phwmmmu8LFiUlEPVSlPFdvcsPcBrJAJLIRGrXfqf0XcBAEX8XnhGQMYnT
 J6VVJHK2zucGP7tA/fZ18T1hp1E1NXbB61F+KUg6qEwScPH+N5FjvDpM7sJWeHFVSNZF
 oT4g==
X-Gm-Message-State: AOJu0Yw/KX1cw8U5hdtgQfFcP2NlO3aSXBO/oQu0ciBWDoNHpomNJ5dO
 6S03DH2z1eozWymbDFJp/C3pa1GHKIg6ERr+W583/GNeCDFxVkuUT3c3AjwhsLgV+TIfeF4jXE3
 5DK5SDMZaFx1GwxpgdfbD3JdoBy9Xx6g88cJZT0qZdKB+jvaOScGH7dFqPA==
X-Gm-Gg: AfdE7ck/KUdoId97W83QRxULeXwbeiN8TyGFFpx2oBu54NjbMQdCX6z13ev+Q/W5FfJ
 x/23cKd0K7Mb6dorFInNV3Vkpb601x9B8XzraSdLcZqzXE5KioZ1iFmGxS0PEaj0fM6qP17LxUJ
 5jUgRE7wmBKrU7J60Nk1SuRklFEoNK0GA3cSXM/JsHdgZre1geKCCG5OPlZ68/VMr68ODXY18IK
 RdIjrCxqj4+foBIxcrdChRi5j8jqIXfnGT9PWp6MYqI1GnWyjjZjLWvPmKDCJy/WBmJVFA9AXh4
 21idxnX/ZA6275tFAkdBltkWRLcfGW87//WtSOhEDxOe+q/BS7VmgkrWeSCm+WS5xZ3Mj/izU7K
 tSHPRv2rNTGXHk+X0w5jTihUjzQvcomyj8hA356A71VJbVw==
X-Received: by 2002:a05:6214:448f:b0:8d1:ae7a:7d79 with SMTP id
 6a1803df08f44-8e6d6684d38mr139260116d6.41.1782511535493; 
 Fri, 26 Jun 2026 15:05:35 -0700 (PDT)
X-Received: by 2002:a05:6214:448f:b0:8d1:ae7a:7d79 with SMTP id
 6a1803df08f44-8e6d6684d38mr139259696d6.41.1782511535049; 
 Fri, 26 Jun 2026 15:05:35 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df7fbdd5f1sm227461456d6.21.2026.06.26.15.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 15:05:34 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/riscv-iommu.c: fix MSI MRIF interrupt-pending offset
Date: Fri, 26 Jun 2026 19:05:29 -0300
Message-ID: <20260626220529.3800372-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aoiCzyZV c=1 sm=1 tr=0 ts=6a3ef7b0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=Z7ZtqlpJiFJe_yrWnE4A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ylQzgVBaruc2_3WbEnrAhv2SfiHAbseK
X-Proofpoint-ORIG-GUID: ylQzgVBaruc2_3WbEnrAhv2SfiHAbseK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE4MyBTYWx0ZWRfX+1rWVTbIpxwq
 j3CDPwDm5ooyB72/w/11PyXtjbbCeEqSfCW/BjqfpNbiErwwSD994FnsQN0Y7uzAH8q50kLnI5N
 +JbX4CaHCe6nSNKcDOoQA9Qb1VdZbpg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE4MyBTYWx0ZWRfXwqHdG5DG/ek3
 1G5+e4H3SEdNax/2LBIiqosc+LOu4Rio7j2KegRVU4txZWBWuR0aob4iOnt0gu/yux1QgZPpMhv
 QL9DPaFYSSMCUhHDj/AUASVD3PQkdLFG81ZuusDeR/qo6E3YQaKGA1QUNLUmeIlf3jrlrcvfPrq
 Ht+D3SgpZsC9QNmNEVmTGSGdsGo5w/U8SC6nvIqZkrHVIX0419sBwfBOWJ/ahjgzgFZQu9wbNwv
 1b4yH/9BQOZB/dsbkWbRvi8autWNDWeUoI7xW5dQ6nyMy57myQYhXKfgBI4BEBSmBTIfKnq1POg
 hX+pVPaxHDVetcw6dS9M6/t9Yx79qwQ0b6UH8qAQZcTl6BZ2UFV45AwNsw0j7jKH/5srNZWHtVh
 kPUaFGjOVaaKec2Lcz5rCWJm3M/Spvxe0kHujR9Sj7Hi/yDj+D1mXeU+xYQ3MtE9VYfd/S3bOMw
 kNChjTjejjLBI1JojoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260183
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

We're doing a wrong shift when calculating the offset for the
interrupt-pending bits, off by one right shift order.

This went undercover for awhile because the calculation works for
interrupt entities 1 to 63.  The math goes wrong when using interrupt
entities 64 or greater.

Instead of fixing the issue and running we're also adding some notes
on where this calc comes from.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3561
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 3ea9130860..792729cfd5 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -686,7 +686,26 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
 
     /* MRIF pending bit address */
     addr = get_field(pte[0], RISCV_IOMMU_MSI_PTE_MRIF_ADDR) << 9;
-    addr = addr | ((data & 0x7c0) >> 3);
+    /*
+     * AIA spec section "Format of a memory-resident interrupt file":
+     * address offset 0x000 contains interrupt-pending bits for
+     * identities 1-63, offfset 0x010 for identities 64-127, and
+     * so it goes up to 0x1F0 for identities 1984-2047.
+     *
+     * Hence each batch of identities advances offset by 16 (0x010)
+     * for every interrupt-pending bits.  This means that doing
+     * (data & 0x7c0) will filter out the first 6 bits, then
+     * a >> 2 will turn the result in the 0x10 steps we need.
+     *
+     * E.g:
+     *
+     * - (1-63 & 0x7c0) = 0, 0 >> 2 = 0, offset 0x000
+     * - (64-127 & 0x7c0) = 64, 64 >> 2 = 16, offset 0x010
+     * - (128-191 & 0x7c0) = 128, 128 >> 2 = 32, offset 0x020
+     *
+     * and so on.
+     */
+    addr = addr | ((data & 0x7c0) >> 2);
 
     trace_riscv_iommu_msi(s->parent_obj.id, PCI_BUS_NUM(ctx->devid),
                           PCI_SLOT(ctx->devid), PCI_FUNC(ctx->devid),
-- 
2.43.0


