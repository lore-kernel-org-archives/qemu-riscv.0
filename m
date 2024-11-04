Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B43D1CA05
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 22:23:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t85T1-0005qQ-Dv; Mon, 04 Nov 2024 17:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t85T0-0005mO-34
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 17:22:34 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t85Sx-0003pu-FU
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 17:22:33 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-720be27db27so3796267b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 04 Nov 2024 14:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730758950; x=1731363750; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xOcpy6BRgMc6xnewM0r89Ss5p3pXoDrbvOahXHbomVw=;
 b=TWyKs4EM8NagFJDajQJnqq+NeicVzn203yNvCWRNZYFkKCiysW1zIsIYFZqA+GvEA7
 yaQsF6XKCbzcPIp5Qd+Zu+XeXhKpEtT/NKcXzEDgDfn+VFXWsWEFAaJxxhsBUpaq276K
 ApBPdE6oqv1DEe82A3PD91M9Ds4bUozvD6vo7fYV0IgWT/yQ0HeCitvOiBcFwF6A1Xjz
 E6S52DyAzcCzM/wNi8a3JcpqsRXeuY2Tr9KC8YRnmHa0N0V8ezJXn5XBDJGtoRSsXBj0
 lDHgPCglfHmThlRBgew9nNgvJBvJQP83ea+3MnLAiSRoIZQkPnwh+B5WCZ7b6uFWFIf0
 J90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730758950; x=1731363750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xOcpy6BRgMc6xnewM0r89Ss5p3pXoDrbvOahXHbomVw=;
 b=An7ugyudKD7jMGPded0y/+A6IcSaSH2yd+HSVGyi9LsAxH43U+Mf+3V4Hafc/G1RqQ
 UDbs74iF/M1YXOlIgOf672MJc/5dBtJiP3fqwXAXuo4I2PX8n3j+QHrT+UDX749SXxRh
 cvDQTwCl1hCfCYerIWCewwOxoWN9s5f4K9D3QCOt0bHA/wbZgB5Cr4eD5AKixUE8dR7u
 pmPgdqE7KAndhfYqIsgnwwPo/1KM4D5Ro+1ITouJy54NFtx2WqjoOP5u3SU+Ow3HZXhN
 RnHdRiotQh5YE40q1aeEJB53kScFCazcQAordwZrqW4kaNQefFTvKwMkU08B1a6Nzoc+
 Xmcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgBqZkjTwVGMhAb9avvZXhQgzC3OnsAXfs6Fg+d/qHNfuYUF4IOF2QVAbhnc5xKNqNN1ORKpF5NfwZ@nongnu.org
X-Gm-Message-State: AOJu0YxQJ1BdWqXeu9txDZT2GC92uXESOk5eIgAH5qyc73OHEO/UGSI9
 UUAHAZQ330qRBozhfo+alJB/Tg1SbBJ7Tj4Tpo68nF/vv/Mn3Yhht6PThQ663G0=
X-Google-Smtp-Source: AGHT+IGutZwsUsx+khBWnYbs4LvGgFdZDrJ51/t0mm32rYPT2fxykQvhIlqKCKH53gkiH8x49k86Vg==
X-Received: by 2002:a05:6a00:2e93:b0:71e:41b3:a56b with SMTP id
 d2e1a72fcca58-720ab4c5d9bmr27670702b3a.24.1730758949707; 
 Mon, 04 Nov 2024 14:22:29 -0800 (PST)
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc2eb76esm8146465b3a.154.2024.11.04.14.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 14:22:29 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Bin Meng <bmeng.cn@gmail.com>,
 tjeznach@rivosinc.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, pbonzini@redhat.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 peter.maydell@linaro.org, Cameron Esfahani <dirty@apple.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2] hw/riscv: fix build error with clang
Date: Mon,  4 Nov 2024 14:22:25 -0800
Message-Id: <20241104222225.1523751-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Introduced in 0c54ac, "hw/riscv: add RISC-V IOMMU base emulation"

../hw/riscv/riscv-iommu.c:187:17: error: redefinition of '_pext_u64'

  187 | static uint64_t _pext_u64(uint64_t val, uint64_t ext)

      |                 ^

D:/a/_temp/msys64/clang64/lib/clang/18/include/bmi2intrin.h:217:1: note: previous definition is here

  217 | _pext_u64(unsigned long long __X, unsigned long long __Y)

      | ^

After a conversation on the mailing list, it was decided to rename and
add a comment for this function.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/riscv/riscv-iommu.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index feb650549ac..12f01a75f5d 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -183,8 +183,25 @@ static void riscv_iommu_pri(RISCVIOMMUState *s,
     }
 }
 
-/* Portable implementation of pext_u64, bit-mask extraction. */
-static uint64_t _pext_u64(uint64_t val, uint64_t ext)
+/*
+ * Discards all bits from 'val' whose matching bits in the same
+ * positions in the mask 'ext' are zeros, and packs the remaining
+ * bits from 'val' contiguously at the least-significant end of the
+ * result, keeping the same bit order as 'val' and filling any
+ * other bits at the most-significant end of the result with zeros.
+ *
+ * For example, for the following 'val' and 'ext', the return 'ret'
+ * will be:
+ *
+ * val = a b c d e f g h
+ * ext = 1 0 1 0 0 1 1 0
+ * ret = 0 0 0 0 a c f g
+ *
+ * This function, taken from the riscv-iommu 1.0 spec, section 2.3.3
+ * "Process to translate addresses of MSIs", is similar to bit manip
+ * function PEXT (Parallel bits extract) from x86.
+ */
+static uint64_t riscv_iommu_pext_u64(uint64_t val, uint64_t ext)
 {
     uint64_t ret = 0;
     uint64_t rot = 1;
@@ -528,7 +545,7 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
     int cause;
 
     /* Interrupt File Number */
-    intn = _pext_u64(PPN_DOWN(gpa), ctx->msi_addr_mask);
+    intn = riscv_iommu_pext_u64(PPN_DOWN(gpa), ctx->msi_addr_mask);
     if (intn >= 256) {
         /* Interrupt file number out of range */
         res = MEMTX_ACCESS_ERROR;
-- 
2.39.5


