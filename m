Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB780C0015E
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:40:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJcsx-0003ld-TO; Wed, 12 Jul 2023 12:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsv-0003kA-Vz
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 12:40:14 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsu-0004px-2c
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 12:40:13 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b9e8e5b12dso22544945ad.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 09:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689180010; x=1691772010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YO6q94z1b55DMhCVDxdVi8lkeoDHIzdqcZLtLcOPdJs=;
 b=btUPRI8Khsv6HQrYeB6fzInd9HNRhJxxY1bxtWZlHdUb/UizeJnNLClGcJo2gsWwcE
 n6BFgJWYn5Scc04JJH/F867EjfHW/rlN2t9q2Yj4ytcKmg/uT2XEK1YFFn+IyjereWb6
 4+bP5bzflafFRBeH1t18AJcDcChOv75rKxpDxcncmK3XF/FIUgsGXXFJIaG6yMfG2uHf
 /3mFXp3ekEWq7+XhMeFVIAPFSxC6veajxN57D8HYL1N5xH7ziuQw3fbYAuSr5z3eG+Pf
 YSxXy7IYwJpkNGsCuU0uZYdVp5yGmBC1INmbdhrM42uxWsi2BWUB+5GyzHVJQCxPH5I9
 WS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689180010; x=1691772010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YO6q94z1b55DMhCVDxdVi8lkeoDHIzdqcZLtLcOPdJs=;
 b=aEJyUHC6X0YP0Lb7og0oy070kIHduYeTYK7zRJJXglS5uF+j0B6vGyiM/KZSStP5k9
 bPPp4gse87C5z0adEy1n0oFSTAP0vHjMRxn4W6ar4x9RZDg82sS5T+A8NqvsUr2D59VN
 QSrpUrsZyQUfJUTz2LU9Tc6x6ptOTKrr80kaTB7/WAT/vfFiKp9mvxZwW7KahRKmjb/Z
 ybzpJPmv7H8yMgYQFjgCT1NXdfZxp8azcbvwPkMtG5rVQritombD/toerNy34tg0Pt01
 RMVt4rreKUwWFpDFrjC0K9y6UCeNniJpIf3ZJTSwCx6y/4MEgM/s/32gBQ+2A3zjxDgW
 DXtw==
X-Gm-Message-State: ABy/qLa1IljBQkvGTce8A9+emPJ+UYJ7fb0YGXtGrs3YXwMCyf2TiMJi
 HOjf9KTtm9XarvOkdrBOgqAWoQ==
X-Google-Smtp-Source: APBJJlGtTb1WUENx3y5gSTRktRqt4I4GJCvB1moHi+UlBU9v2eQF1d9FmflK6ltxu0zDVDzRVRUpig==
X-Received: by 2002:a17:902:ecc2:b0:1b6:6e3a:77fb with SMTP id
 a2-20020a170902ecc200b001b66e3a77fbmr26321110plh.2.1689180010652; 
 Wed, 12 Jul 2023 09:40:10 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001ac7f583f72sm4172824plm.209.2023.07.12.09.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:40:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 04/10] hw/riscv: virt: Add PCIe HIGHMEM in memmap
Date: Wed, 12 Jul 2023 22:09:37 +0530
Message-Id: <20230712163943.98994-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712163943.98994-1-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

PCIe High MMIO base is actually dynamic and fixed at
run time based on the RAM configured. Currently, this is
not part of the memmap and kept in separate static variable
in virt.c. However, ACPI code also needs this information
to populate DSDT. So, once the base is discovered, merge
this into the final memmap which can be used to create
ACPI tables later.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c         | 31 ++++++++++++++++++++++++++++++-
 include/hw/riscv/virt.h |  9 +++++++--
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f6067db8ec..7aee06f021 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -84,6 +84,22 @@ static const MemMapEntry virt_memmap[] = {
 
 static MemMapEntry virt_high_pcie_memmap;
 
+/*
+ * virt_memmap doesn't include floating High Mem IO address entry. To enable
+ * code organization in multiple files (ex: ACPI), it is better to have single
+ * memmap which has complete information.
+ *
+ * VIRT_HIGH_PCIE_MMIO is always greater than the last memmap entry and hence
+ * full_virt_memmap is capable of holding both virt_memmap and
+ * VIRT_HIGH_PCIE_MMIO entry.
+ *
+ * The values for these floating entries will be updated when top of RAM is
+ * discovered.
+ */
+static MemMapEntry full_virt_memmap[] = {
+    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 0 },
+};
+
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
 
 static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
@@ -1444,7 +1460,20 @@ static void virt_machine_init(MachineState *machine)
             ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
     }
 
-    s->memmap = virt_memmap;
+    /*
+     * Initialize the floating values in full memory map
+     */
+    full_virt_memmap[VIRT_HIGH_PCIE_MMIO].base = virt_high_pcie_memmap.base;
+    full_virt_memmap[VIRT_HIGH_PCIE_MMIO].size = virt_high_pcie_memmap.size;
+
+    s->memmap = full_virt_memmap;
+    /*
+     * Copy the base virt_memmap entries to full memmap
+     */
+    for (i = 0; i < ARRAY_SIZE(virt_memmap); i++) {
+        s->memmap[i] = virt_memmap[i];
+    }
+
 
     /* register system main memory (actual RAM) */
     memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 00c22492a7..1d7ddf5df0 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -60,7 +60,7 @@ struct RISCVVirtState {
     char *oem_id;
     char *oem_table_id;
     OnOffAuto acpi;
-    const MemMapEntry *memmap;
+    MemMapEntry *memmap;
     PCIBus *bus;
 };
 
@@ -84,7 +84,12 @@ enum {
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
     VIRT_PLATFORM_BUS,
-    VIRT_PCIE_ECAM
+    VIRT_PCIE_ECAM,
+    VIRT_LAST_MEMMAP /* Keep this entry always last */
+};
+
+enum {
+    VIRT_HIGH_PCIE_MMIO = VIRT_LAST_MEMMAP,
 };
 
 enum {
-- 
2.39.2


