Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113FACD8CA7
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 21:07:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wWhBZ-0007ZK-HV; Mon, 08 Jun 2026 17:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wWhBV-0007Ys-Oh
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2026 17:07:02 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wWhBU-0006yu-1f
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2026 17:07:01 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 658IwYwE276097
 for <qemu-riscv@nongnu.org>; Mon, 8 Jun 2026 21:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=A8pFO5uKfkU+vxdf6kK+BSxIjx20O3kZkXx
 4dTPB1Ws=; b=Q2hkjvVp2DZ29suFnbPdw6EGUDsCX4VAwTfqzVoPfkM81RuMbiu
 lVqA+8pwuMPNFHktbv1+wlAmhcZJxH3E1flx7h9U9HY+c/lMAFDbFobiaZsluPJq
 c32FuUijksBbQr3zjjv/NWriOHT9CMo39+BN/UeVel6dS0Jv4wooVI9LYnyVPOMI
 wa3IG+NHmCvOAAyoMrwKBHPjMUKvpg9SVxdMqUQneLzcH0AeIm6l5Cn1Dsym1hNq
 vD0fTXFT5LJWU1s6pKKtJu4wZiGfAEtOMZsRpLTm1copqqu1oXrzm8Ox3qn1Q2WZ
 hAG++u5X0Kvs21O+dNMezcyX+HG8Eg9jrLg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptjxhs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2026 21:06:53 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-1382f39e4b5so154437c88.1
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2026 14:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780952813; x=1781557613; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A8pFO5uKfkU+vxdf6kK+BSxIjx20O3kZkXx4dTPB1Ws=;
 b=iuz/5By+34fOq53zadSpTqzge6He1na7+c8IReytbxtTlA4y8atfyW8eotj1O0yMrM
 BWLCV3bmUDeWkgbM07OH/sTS22cVFTKmpFQzH/Qb0pWdrmucBWQaXWAp+NQGzzdZTDoq
 3qusXd0+eptkxBaayw2/SCFhmKDcTbw/514JovxxSKKt8yY7Qb5iIjC57Kt0sgcgnjB+
 Mh9bqTPCMkwOLEY+lyZfnDDvqyL9llVBo6WUhfNXvIaWQVSwF1O6L6e7x6tmvIHqbSSM
 +58beq3Du/Kt3ImdMtNXnc3uPTzZmNlExT6CW+EXTWTcg66xTqthssXHI4op6cYirKuo
 iA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780952813; x=1781557613;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8pFO5uKfkU+vxdf6kK+BSxIjx20O3kZkXx4dTPB1Ws=;
 b=TuPJ9B3WK8gRHtlpUiMTvxTHkdM6/to7ITjx+XTZkCdYeAQkKYx71hFf6oux7RxDId
 8i1aZGS267asYE0fVkrU8EV7jm/b2/ZzbVVXNdE3ZGUVALMdgxE6ZyQb08MfUEW49bKd
 0+zv8w20e8n13utCqbBS5IUtEiCYrxmgA/1ep0oaRjFhs+hPgB+I7DO5ye9jZIX5z0eS
 UrneiDYd/k17qByf8MjCsK4iIbNz5bbI7jrpuSoYdZjEuA2KI0Pv59ufxiezxbsw02J7
 YQWsd1oD7gcEpJENszxhVSKKznZ8QaGWWR0MDplisugy3cPCbNylm8zkpQrOnAEHXuDp
 IKrw==
X-Gm-Message-State: AOJu0YwkXLmuevKXOlZDNSHyK7o7Y9tdl+xxvwhgNgUgvR1BPL+ND5eU
 Cc4k59DxhDez1y+iCU/T5jMcuJSmPxu8OSIcClV3uL6KKPqgOOD4IuuYz1X0JfC+HGU+waBn1gR
 qScdXUjQljGevhFaBpoh+mOicX+w4b0qWKlR2zhtzX/WZYkY4YcLZh0nsoQ==
X-Gm-Gg: Acq92OG2Jl/Cnmd4L7/AY3V5yWewnXdVqOrJQTWSzUlTUSdOIrTAnmIK2IeiouXyGXt
 UHW8tp5eCu7Z4MFr8k9UW/EpjQFQ/b5W4bsmthehMjTtTN3unGSAJEwxW3eWPwKBO5ocgISTQwO
 OH4IntAAZokVGOvhu9jgVSuRxABjHM4gQkUg8+c0k6E+/+sKI96CdW/RtfdKGo3QM7T4MhvazcH
 H4y/0mSJdlOwcn0OxE7m6RZ+V9kNQi1KXSF0SekCEu5KqwLiF6GCVWstUp7M+r23RirFfesXFX8
 Iu8N0EimBqGaYhFqllQnckIMvnAJwS+Nz2EBy84sVNHHbYfxiiAT1Nr5KFISiatcMPWm5ZkM7bh
 wzik/bDKpajIAgtqNriMQBIGuFCxbTjO79b7PCfNTmI/et1WfBJ4+wBgn0wvagXL3PJRGVQ==
X-Received: by 2002:a05:7022:113:b0:12c:9037:5126 with SMTP id
 a92af1059eb24-13807d36f7bmr6837206c88.9.1780952812349; 
 Mon, 08 Jun 2026 14:06:52 -0700 (PDT)
X-Received: by 2002:a05:7022:113:b0:12c:9037:5126 with SMTP id
 a92af1059eb24-13807d36f7bmr6837171c88.9.1780952811842; 
 Mon, 08 Jun 2026 14:06:51 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5539432sm15822414c88.9.2026.06.08.14.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 14:06:51 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/virt.c: fix 'iommu-map' FDT entry
Date: Mon,  8 Jun 2026 18:06:42 -0300
Message-ID: <20260608210642.464131-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Nw-Z9cuaCho4fWrLefKmIqAmV0NcR27I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE5MSBTYWx0ZWRfXzmOzZd8/GxhQ
 dkk69SGHYaSQWmlMSaqTZHhrS0o7QiOkAd0x3qXptsBVtXYypt7oN1aoGOQjuLl3BRvwdpUDp0u
 BVXy89t3TW/QOYZZdqWAWc2RP7T0UkVkm6UsJf0uQEWenyZgZCfyNCCgApOgLlu63B/Sb4nSN0w
 BrqC7iULW/iBdMtrrljMpd96huqZO1NxAHa4ug7SDX3vfQK7akXcAMm8D8FPuEAHz6nVSMupG6/
 3KXpyC2z4M8lTRqQ34DM0FdKqU2ua+kE5H0u0qxCQWfrxN4PDTBbS5xKqvjTv2ls6YbiBhiDk5j
 g3Mm9SZPzK/lBXRTT7SDn+BAOVvgfHWAM48vlVS6fAfqpxHOFOGNWObWT1tYrqpvsXQ1H++0V8P
 3a0ST9hAsg899pBrbvPBOXMHKGKbwNtlDz0Iz7DbYJJQ6RCSi1bngpLlezTJCZOcI8TBISabjW6
 6V2ioEJkK/XeGp7hnzQ==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a272eed cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oNYACLWKlWMaaXUTyR8A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: Nw-Z9cuaCho4fWrLefKmIqAmV0NcR27I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080191
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

Based on the DT documentation of 'iommu-map':

https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

- iommu-map: Maps a Requester ID to an IOMMU and associated IOMMU specifier
  data.

  The property is an arbitrary number of tuples of
  (rid-base,iommu,iommu-base,length).

----------

We're adding a no-op entry (length = 0) in iommu-map:

         qemu_fdt_setprop_cells(ms->fdt, name, "iommu-map",
                                0, iommu_sys_phandle, 0, 0, 0,
                                iommu_sys_phandle, 0, 0xffff);

This is easily seen in the generated DT:

iommu-map = <0x00 0x8000 0x00 0x00 0x00 0x8000 0x00 0xffff>;

The tuple (0 0 0x8000 0) does nothing since it has length = 0.  The
information we want to advertise is in the second tuple only.  Thus
remove the empty tuple.

While we're at it, seems like we've mistaken the API and we're using
0xffff as 'last address', but in fact it is length.  This means that
we're telling the DT we're mapping 0x0 -> 0xfffe, which wasn't our
intention.  Therefore change size to '0x10000' to reflect the address
mapping we want (0x0 -> 0xffff).

Found while reviewing the RISC-V Server Platform DT generation, which
happens to copy a lot of code from the 'virt' board, and this nit is
also present there.

Fixes: 2c12de1460 ("hw/riscv/virt: Add IOMMU as platform device if the option is set")
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/virt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ce64eaaef7..0c489bb412 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -900,8 +900,7 @@ static void create_fdt_pcie(RISCVVirtState *s,
 
     if (virt_is_iommu_sys_enabled(s)) {
         qemu_fdt_setprop_cells(ms->fdt, name, "iommu-map",
-                               0, iommu_sys_phandle, 0, 0, 0,
-                               iommu_sys_phandle, 0, 0xffff);
+                               0, iommu_sys_phandle, 0, 0x10000);
     }
 
     create_pcie_irq_map(s, ms->fdt, name, irq_pcie_phandle);
-- 
2.43.0


