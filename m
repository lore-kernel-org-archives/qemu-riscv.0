Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ADAD5E14C
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 09:58:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t9LlB-0003W8-Nq; Fri, 08 Nov 2024 04:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1t9Ll3-0003VZ-Dy
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2024 04:58:26 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1t9Ll0-0000YZ-Hr
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2024 04:58:24 -0500
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3e5fcf464ecso1359521b6e.0
 for <qemu-riscv@nongnu.org>; Fri, 08 Nov 2024 01:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1731059897; x=1731664697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0I8aoUlEkn+5l/C9mzxATF2jKl/Dppz12Ocsq4mXed8=;
 b=l78C+N9tmwxhHmR+duTtfRZnpcBUYm/VCYhH1m/FNKgfWzKXIPS5BNCW6o6bCeDrR7
 SK6NLsCdXeIfoZt52Epxp2ZwbmY6oKMSg/grXytN690lkId32dXmyPQDD5MFJQ6aMs8i
 kwCLlaqZpUnW6yp6xJaMosURGIQF1h47gYxlOOfysjiy5X3kNJIpxaq6rAsyW9zC18JG
 yDr4tK8mlmw7D+sCOvQwkPveuOuPF44vfS/fMNMCSdPPRq/6JdiHr74CYSB2j5r7Izmt
 2ktCKXJljmajhubRKMTf0MsttRgSsDiy1rAScVlVSFxONUIjfWzxdZdzDGoACNg+hQEZ
 RqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731059897; x=1731664697;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0I8aoUlEkn+5l/C9mzxATF2jKl/Dppz12Ocsq4mXed8=;
 b=H020ZZqrAFt94k7OaDXG19sJSHfP2Kw++HuP1ZYB3trQ1TxE3uh6jdmXQuZvgjh+E0
 yhn1u5cWpPD1jJqvXQEBI2djyoU3Zz82QzmVN6e2z40+hOHRqMQL/4ByjTeCeQrKklps
 riASGWGubWoH8fWVyf2bYQcYZNLQLaVSCQ6Yz1EOZRBYpsWp2UjySv+4GClF2Sd2D8rh
 pIJV4yPbNXzpHAr72SRsyEeQEfRpMglh1K+xJKabaDeQSYIKBuUF2vpkLtvP+lSUdGxn
 1+7R8MHMJ0lHpjBL9k+0cma/y379izbdJvnorxpVFsZ++FYlN7BVYVlpiAYR6ERIA+kU
 vvbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJNALeAa47HtL97dqR5NApHz8aRJfGeWY2sdR6OA3vgkWGJnT9cBpwJqg6seRqqWcNnb23pCcNF1T9@nongnu.org
X-Gm-Message-State: AOJu0YxD140AVJQISAiz+jQnbIOQj2rEAZvN0nNxNUIqGB6hTMUTnVEq
 +JqcadP4cIo7mgJ8JGKQFQCWSl7D3nWIMm4PFKdRt/HkBG2FukfIq4sjyuyWBEI=
X-Google-Smtp-Source: AGHT+IEMXftf5a3ldVzV0EMgSNrtvIIiTREVmf0fgdfdouQluiPW+3pjktiM4LlNZbwAdtwOCpz0Ug==
X-Received: by 2002:a05:6808:2117:b0:3e7:644e:3ca2 with SMTP id
 5614622812f47-3e794716b1amr2856614b6e.29.1731059897483; 
 Fri, 08 Nov 2024 01:58:17 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7f41f4890d2sm3014723a12.14.2024.11.08.01.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 01:58:16 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 1/1] hw/riscv/riscv-iommu.c: Correct the validness check of
 iova
Date: Fri,  8 Nov 2024 17:57:53 +0800
Message-ID: <20241108095753.12166-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=jason.chien@sifive.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From RISCV IOMMU spec section 2.1.3:
When SXL is 1, the following rules apply:
- If the first-stage is not Bare, then a page fault corresponding to the
riginal access type occurs if the IOVA has bits beyond bit 31 set to 1.
- If the second-stage is not Bare, then a guest page fault corresponding
o the original access type occurs if the incoming GPA has bits beyond bit
33 set to 1.

From RISCV IOMMU spec section 2.3 step 17:
Use the process specified in Section "Two-Stage Address Translation" of
the RISC-V Privileged specification to determine the GPA accessed by the
transaction.

From RISCV IOMMU spec section 2.3 step 19:
Use the second-stage address translation process specified in Section
"Two-Stage Address Translation" of the RISC-V Privileged specification
to translate the GPA A to determine the SPA accessed by the transaction.

This commit adds the iova check with the following rules:
- For Sv32, Sv32x4, Sv39x4, Sv48x4 and Sv57x4, the iova must be zero
extended.
- For Sv39, Sv48 and Sv57, the iova must be signed extended with most
significant bit.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/riscv/riscv-iommu.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index bbc95425b3..ff9deefe37 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -392,9 +392,26 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
 
         /* Address range check before first level lookup */
         if (!sc[pass].step) {
-            const uint64_t va_mask = (1ULL << (va_skip + va_bits)) - 1;
-            if ((addr & va_mask) != addr) {
-                return RISCV_IOMMU_FQ_CAUSE_DMA_DISABLED;
+            const uint64_t va_len = va_skip + va_bits;
+            const uint64_t va_mask = (1ULL << va_len) - 1;
+
+            if (pass == S_STAGE && va_len > 32) {
+                target_ulong mask, masked_msbs;
+
+                mask = (1L << (TARGET_LONG_BITS - (va_len - 1))) - 1;
+                masked_msbs = (addr >> (va_len - 1)) & mask;
+
+                if (masked_msbs != 0 && masked_msbs != mask) {
+                    return (iotlb->perm & IOMMU_WO) ?
+                                RISCV_IOMMU_FQ_CAUSE_WR_FAULT_S :
+                                RISCV_IOMMU_FQ_CAUSE_RD_FAULT_S;
+                }
+            } else {
+                if ((addr & va_mask) != addr) {
+                    return (iotlb->perm & IOMMU_WO) ?
+                                RISCV_IOMMU_FQ_CAUSE_WR_FAULT_VS :
+                                RISCV_IOMMU_FQ_CAUSE_RD_FAULT_VS;
+                }
             }
         }
 
-- 
2.43.2


