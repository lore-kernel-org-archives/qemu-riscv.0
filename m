Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A3ECA101F
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 12:55:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uwKM0-0007If-S7; Wed, 10 Sep 2025 08:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoyaxing@bosc.ac.cn>)
 id 1uwGy2-0008Gl-Rc
 for qemu-riscv@nongnu.org; Wed, 10 Sep 2025 05:18:18 -0400
Received: from [115.124.28.92] (helo=out28-92.mail.aliyun.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoyaxing@bosc.ac.cn>)
 id 1uwGxl-0005Pb-VL
 for qemu-riscv@nongnu.org; Wed, 10 Sep 2025 05:18:15 -0400
Received: from LAPTOP-2KT3QRS7.localdomain(mailfrom:guoyaxing@bosc.ac.cn
 fp:SMTPD_---.ebxwqBv_1757495403 cluster:ay29) by smtp.aliyun-inc.com;
 Wed, 10 Sep 2025 17:10:22 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 guoyaxing@bosc.ac.cn, wangran@bosc.ac.cn
Subject: [PATCH v1] hw/riscv/virt.c: Modify the riscv-iommu dts node
Date: Wed, 10 Sep 2025 17:10:02 +0800
Message-Id: <20250910091002.88140-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.124.28.92 (deferred)
Received-SPF: pass client-ip=115.124.28.92; envelope-from=guoyaxing@bosc.ac.cn;
 helo=out28-92.mail.aliyun.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Sep 2025 08:55:06 -0400
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

The current iommu dts node generated in virt machine is only
applicable to the case where using aia. If the parameter is
set to aia=none(that is, using plic) at startup, the iommu
driver in Linux will fail to initialize due to parsing interrupts
properties, causing the system to be unabled to use iommu properly.

So, when aia_type is VIRT_AIA_TYPE_NONE, generate interrupts
attributes applicable to plic.

Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
---
 hw/riscv/virt.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 47e573f85a..2d7a1f3ac6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1091,13 +1091,19 @@ static void create_fdt_iommu_sys(RISCVVirtState *s, uint32_t irq_chip,
     qemu_fdt_setprop_sized_cells(fdt, iommu_node, "reg", 2, addr, 2, size);
     qemu_fdt_setprop_cell(fdt, iommu_node, "interrupt-parent", irq_chip);
 
-    qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",
-        iommu_irq_map[0], FDT_IRQ_TYPE_EDGE_LOW,
-        iommu_irq_map[1], FDT_IRQ_TYPE_EDGE_LOW,
-        iommu_irq_map[2], FDT_IRQ_TYPE_EDGE_LOW,
-        iommu_irq_map[3], FDT_IRQ_TYPE_EDGE_LOW);
+    if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+        qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",
+            iommu_irq_map[0], iommu_irq_map[1],
+            iommu_irq_map[2], iommu_irq_map[3]);
+    } else {
+        qemu_fdt_setprop_cells(fdt, iommu_node, "interrupts",
+            iommu_irq_map[0], FDT_IRQ_TYPE_EDGE_LOW,
+            iommu_irq_map[1], FDT_IRQ_TYPE_EDGE_LOW,
+            iommu_irq_map[2], FDT_IRQ_TYPE_EDGE_LOW,
+            iommu_irq_map[3], FDT_IRQ_TYPE_EDGE_LOW);
 
-    qemu_fdt_setprop_cell(fdt, iommu_node, "msi-parent", msi_phandle);
+            qemu_fdt_setprop_cell(fdt, iommu_node, "msi-parent", msi_phandle);
+    }
 
     *iommu_sys_phandle = iommu_phandle;
 }
-- 
2.34.1


