Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C135C001DF
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 22:22:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQbGu-0006w3-RO; Mon, 31 Jul 2023 18:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fermium@anarchist.gay>)
 id 1qQb5s-0005jK-7Q; Mon, 31 Jul 2023 18:10:24 -0400
Received: from box.anarchist.gay ([178.62.216.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fermium@anarchist.gay>)
 id 1qQb5q-00023m-E9; Mon, 31 Jul 2023 18:10:23 -0400
Received: from authenticated-user (box.anarchist.gay [178.62.216.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.anarchist.gay (Postfix) with ESMTPSA id 9E8D97EA91;
 Mon, 31 Jul 2023 18:10:19 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anarchist.gay;
 s=mail; t=1690841420;
 bh=BE3TpyORXTw1UsQ1yvio3SF6Xv3TxE6hxvtplIC1q24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R26aK2pHRwmtmvYmn/EJ4gqWxL+zNlFIIQo4sBXRuVqGNrXx8fBaaCTM3WTby8Y9g
 R3tSyNmychKbrrvbkI1FuVtoFUH3MOKU+flVOm0Xc8/4RmWmUfyL0GdEkykLDU7ASt
 R+id1PMgpDxQgk+rNu24JixpW1wr3AwgRwGtbpfDzLeWHvcfnaXw4rsFxcbBNJW5zn
 t6KhlWr+SpGsv/AHiRJ225qnhC/DX9J/efHeyYeG7gqPjNZQ7VoFfpPLNULMdTnS3M
 /du4fvy6XY1cRGm+V7IVMj6LY6CYDmX6KqIh/6N5Xi2GolqlOcvqfh1KADsdlYtVmh
 +OcoD7SpMegrg==
From: Lilly Anderson <fermium@anarchist.gay>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Lilly Anderson <fermium@anarchist.gay>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 1/1] Added support for the MMU node in the RHCT
Date: Mon, 31 Jul 2023 18:09:59 -0400
Message-ID: <20230731220959.4142636-2-fermium@anarchist.gay>
In-Reply-To: <20230731220959.4142636-1-fermium@anarchist.gay>
References: <20230731220959.4142636-1-fermium@anarchist.gay>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.62.216.29; envelope-from=fermium@anarchist.gay;
 helo=box.anarchist.gay
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 31 Jul 2023 18:21:47 -0400
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

---
 hw/riscv/virt-acpi-build.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 7331248f59..cb36e52169 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -119,7 +119,8 @@ static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
 /*
  * ACPI spec, Revision 6.5+
  * 5.2.36 RISC-V Hart Capabilities Table (RHCT)
- * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/16
+ * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/18
+ *      https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view
  *      https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
  */
 static void build_rhct(GArray *table_data,
@@ -133,6 +134,7 @@ static void build_rhct(GArray *table_data,
     uint32_t isa_offset, num_rhct_nodes;
     RISCVCPU *cpu;
     char *isa;
+    uint8_t mmu_type;
 
     AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -145,8 +147,8 @@ static void build_rhct(GArray *table_data,
     build_append_int_noprefix(table_data,
                               RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, 8);
 
-    /* ISA + N hart info */
-    num_rhct_nodes = 1 + ms->smp.cpus;
+    /* ISA + MMU + N hart info */
+    num_rhct_nodes = 2 + ms->smp.cpus;
 
     /* Number of RHCT nodes*/
     build_append_int_noprefix(table_data, num_rhct_nodes, 4);
@@ -174,6 +176,15 @@ static void build_rhct(GArray *table_data,
         build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
     }
 
+    /* MMU Node */
+    build_append_int_noprefix(table_data, 2, 2); /* Type 2 */
+    build_append_int_noprefix(table_data, 8, 2); /* Length */
+    build_append_int_noprefix(table_data, 1, 2); /* Revision */
+    build_append_int_noprefix(table_data, 0, 1); /* Reserved */
+    
+    mmu_type = satp_mode_max_from_map(riscv_cpu_cfg(&cpu->env)->satp_mode.map) - 8;
+    build_append_int_noprefix(table_data, mmu_type, 1); /* MMU Type */
+
     /* Hart Info Node */
     for (int i = 0; i < arch_ids->len; i++) {
         build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
-- 
2.41.0

Signed-off-by: Lilly Anderson <fermium@anarchist.gay>

