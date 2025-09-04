Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8252CA1002
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 13:28:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uuA0A-00018n-7w; Thu, 04 Sep 2025 09:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uuA04-00017t-O8
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 09:27:41 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uu9zu-0004GC-0E
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 09:27:39 -0400
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3f2da50ad46so6682905ab.3
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 06:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1756992445; x=1757597245; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g+Z6by8yj153dStYnaj/Rum+7G7Oqf9yATcM8/24AcA=;
 b=Ghq6kNxfU1szQUulPI4Qg1CAl84Vtl/ntfEQWUwN0Evd/CJL+8caSSJq5A7KzOjrWa
 H+ySBZm0Z+ZIGds+K5Z1fjCSpcC0Yi+HTmu6fAy5DPSw3J1mU7Cc6AQEzyL/pxuu0XFV
 CcQg7EkWEhDw2ssUfzozds7ss1yew5ZrYZ3bsaCfNJqfpEJVXfLhDyEGL27ErE5aFO6L
 rWlhxGluBRXKQzeYX5Q7FD2/6DWXlXCDx/C3f1cRvaTsSKgh1C+RCVk5Elaxi1MTg33h
 Y5D/oMcrW9lALKu8XEIlYKoOOcgp+Fh4DghWktUTGDNDDaGzgoUZGErv+3xWT0VZf51n
 42ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756992445; x=1757597245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g+Z6by8yj153dStYnaj/Rum+7G7Oqf9yATcM8/24AcA=;
 b=dVirMlkqLXzMQej8Lu1IKqVdexg0cIRy3Wl8zDisOTW8nlbTvskntUh8lqGHgpVsZJ
 csF5eeeNJvndehrftjIa8RK6Uv4cmDzX7t/9zSaAhofZl09i3NcpyiaVz6gBk2gjRls7
 MhjB0W51IWEwuqU/b8rhnYDKc+heWMEnGCShL0/V/MavTt+pcz+BjRvipmrfXYVfYBFT
 HR5YG8oomN8bUTeBS3n1skfGK6TdIQeqGXOKohmf3lTtmg2HwAbBoH1NbZtHFtuktXaZ
 hsZ5Is9aD6fUwEq2FwWiIDpdz4B06c6MoZsybSwCIDmSSJo2wwt32hIDhXJIhuPZEiOu
 sQ7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQH/cIMD8p+tWfWi+ZCZ/EwCtlRvtWkq0jL7XevQnCHxlA/9y5KwsRd4PV5ho46/UseYwM5m72ZbmG@nongnu.org
X-Gm-Message-State: AOJu0YzhaKx5mC3K9/tLxqmwKAv6R4I6KmUYYS2lfRHypavlIKph/oq8
 EUZwa8NJrdoRmQYk+i6Uf9AKBxSygFJFFpbPsVH3ktJCs4B+taQFwewUFvArIGWtQTM=
X-Gm-Gg: ASbGncsyhmH9nd9iZOUOGtb0MKejr0RHeEXhCXJdDuElzosM+Khtyqru5qe0r2ZQoK7
 EWIs3pTNXe060J6tFfKDhy/Q9MSe5tooIE7HuFHsLg38T96IEkmYiC20G73k6LsfIMKQ/TV6Q9d
 AJOn3Q86scVPl8JfisRxorKbyfSw5ghC2krgoyeBN8ueqISWXDaQ2/FfqC4YQdtcdt8o6AmgKeX
 Bxl0PxE7WjYKOqg0hGbupADxsLHRoula+E6aJ/O55EtKnNhOQEL8+/eD0VZjLWiuOa6ywyfQBbH
 nYVGnhYQxS2gvwcdlIUjdhvcy4LqUtFH7RrgWQdTgj3B9Qxuo49XrsNFx9+7mHdmEK8Aq/ZAikC
 nu4d3Vc9b0mdEla8TeV0Hiv7tuQzLot/5nhE=
X-Google-Smtp-Source: AGHT+IHeetYnpOzcl8+XrEPSiIS2VwZYvR6BTeXnZz8w/uHdiBgapf7uUhLxAXbewd882R8wqoZZ1w==
X-Received: by 2002:a05:6e02:4614:b0:3f6:546b:5c9a with SMTP id
 e9e14a558f8ab-3f6546b5d53mr152829605ab.19.1756992444706; 
 Thu, 04 Sep 2025 06:27:24 -0700 (PDT)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5104c5a4d0dsm679121173.0.2025.09.04.06.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 06:27:24 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, tjeznach@rivosinc.com
Subject: [PATCH] hw/riscv/riscv-iommu: Fix MSI table size limit
Date: Thu,  4 Sep 2025 08:27:24 -0500
Message-ID: <20250904132723.614507-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=ajones@ventanamicro.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

The MSI table is not limited to 4k. The only constraint the table has
is that its base address must be aligned to its size, ensuring no
offsets of the table size will overrun when added to the base address
(see "8.5. MSI page tables" of the AIA spec).

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/riscv-iommu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 96a7fbdefcf3..155190d032dd 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -558,6 +558,7 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
     MemTxResult res;
     dma_addr_t addr;
     uint64_t intn;
+    size_t offset;
     uint32_t n190;
     uint64_t pte[2];
     int fault_type = RISCV_IOMMU_FQ_TTYPE_UADDR_WR;
@@ -565,16 +566,18 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
 
     /* Interrupt File Number */
     intn = riscv_iommu_pext_u64(PPN_DOWN(gpa), ctx->msi_addr_mask);
-    if (intn >= 256) {
-        /* Interrupt file number out of range */
-        res = MEMTX_ACCESS_ERROR;
-        cause = RISCV_IOMMU_FQ_CAUSE_MSI_LOAD_FAULT;
-        goto err;
-    }
+    offset = intn * sizeof(pte);
 
     /* fetch MSI PTE */
     addr = PPN_PHYS(get_field(ctx->msiptp, RISCV_IOMMU_DC_MSIPTP_PPN));
-    addr = addr | (intn * sizeof(pte));
+    if (addr & offset) {
+        /* Interrupt file number out of range */
+        res = MEMTX_ACCESS_ERROR;
+        cause = RISCV_IOMMU_FQ_CAUSE_MSI_LOAD_FAULT;
+        goto err;
+    }
+
+    addr |= offset;
     res = dma_memory_read(s->target_as, addr, &pte, sizeof(pte),
             MEMTXATTRS_UNSPECIFIED);
     if (res != MEMTX_OK) {
-- 
2.49.0


